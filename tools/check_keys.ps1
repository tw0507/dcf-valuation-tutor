# Dev tool: checks every lesson's answer keys by evaluating the sheet blocks.
# Usage: powershell -File tools\check_keys.ps1 [file-or-folder ...]
# For each ```json / ```solution block, key lines after it of the form  B16 `=B14-B15` → 117,000
# (formula optional) are evaluated; formulas are dropped into the block first.
param([string[]]$Paths, [switch]$Fill)
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not ('XlSheet' -as [type])) { Add-Type -Path (Join-Path $here 'XlEval.cs') }
$root = Join-Path (Split-Path -Parent $here) 'valuation-tutor'
if (-not $Paths) { $Paths = @((Join-Path $root 'lessons'), (Join-Path $root 'advanced'), (Join-Path $root 'checks'), (Join-Path $root 'projects')) }
$files = foreach ($p in $Paths) { if (Test-Path $p -PathType Container) { Get-ChildItem $p -Filter *.md | Sort-Object Name | ForEach-Object FullName } elseif (Test-Path $p) { (Resolve-Path $p).Path } }
$enc = New-Object System.Text.UTF8Encoding($false)
$AR = [string][char]0x2192; $MI = [string][char]0x2212
$keyRe = [regex]('(?<ref>\b[A-Z]{1,2}\d{1,3})(?:\s*`(?<f>=[^`]+)`)?\s*' + $AR + '\s*(?<v>[' + $MI + '-]?\$?\d[\d,]*(?:\.\d+)?%?|[' + $MI + '-]?\$?\.\d+|TRUE|FALSE|\?)')
$total = 0; $bad = 0
foreach ($f in $files) {
  $t = [IO.File]::ReadAllText($f, $enc); $edits = @()
  $blocks = [regex]::Matches($t, '```(json|solution)\s*\n(.*?)\n```', 'Singleline')
  # pass 1: every tab of the lesson, with key formulas dropped in, linked as one workbook
  $book = New-Object 'System.Collections.Generic.Dictionary[string,XlSheet]'; $pre = @{}
  for ($b = 0; $b -lt $blocks.Count; $b++) {
    $m = $blocks[$b]; $start = $m.Index + $m.Length
    $end = if ($b + 1 -lt $blocks.Count) { $blocks[$b + 1].Index } else { $t.Length }
    $region = $t.Substring($start, $end - $start); $cut = $region.IndexOf("`n## "); if ($cut -ge 0) { $region = $region.Substring(0, $cut) }
    try { $o = $m.Groups[2].Value | ConvertFrom-Json } catch { continue }
    $sh = New-Object XlSheet; $sh.Book = $book
    foreach ($p in $o.cells.PSObject.Properties) { $vv = [string]$p.Value.v; if ($vv -eq '' -and $p.Value.sol) { $vv = [string]$p.Value.sol }; $sh.Raw[$p.Name.ToUpper()] = $vv }
    foreach ($k in $keyRe.Matches($region)) { if ($k.Groups['f'].Success) { $sh.Raw[$k.Groups['ref'].Value] = $k.Groups['f'].Value } }
    $tabName = [string]$o.tab; if (-not $book.ContainsKey($tabName)) { $book[$tabName] = $sh }
    $pre[$b] = $sh
  }
  for ($b = 0; $b -lt $blocks.Count; $b++) {
    $m = $blocks[$b]
    $start = $m.Index + $m.Length
    $end = if ($b + 1 -lt $blocks.Count) { $blocks[$b + 1].Index } else { $t.Length }
    $region = $t.Substring($start, $end - $start)
    $cut = $region.IndexOf("`n## ")
    if ($cut -ge 0) { $region = $region.Substring(0, $cut) }
    try { $o = $m.Groups[2].Value | ConvertFrom-Json } catch { Write-Output "JSON FAIL $([IO.Path]::GetFileName($f)) block $b : $_"; $bad++; continue }
    $sh = $pre[$b]
    $keys = $keyRe.Matches($region)
    $label = "$([IO.Path]::GetFileName($f)) [$($m.Groups[1].Value)] $($o.tab)"
    $errs = @()
    foreach ($ref in @($sh.Raw.Keys)) { if ($sh.Raw[$ref] -like '=*') { try { [void]$sh.Get($ref) } catch { $errs += "$ref $($sh.Raw[$ref]) : $($_.Exception.InnerException.Message)" } } }
    $fails = @()
    foreach ($k in $keys) {
      $ref = $k.Groups['ref'].Value; $exp = $k.Groups['v'].Value -replace $MI, '-' -replace '[\$,]', ''
      $total++
      if ($exp -eq '?') { try { $g = $sh.Get($ref) } catch { $g = 'ERR ' + $_.Exception.InnerException.Message }; if ($Fill -and $g -is [double]) { $cf = $null; $cp = $o.cells.PSObject.Properties[$ref]; if ($cp) { $cf = $cp.Value.f }; $sfx = ''; $av = [math]::Abs($g); switch ($cf) { 'pct' { $av = $av * 100; $fmt = '0.0'; $sfx = '%' } '0.00%' { $av = $av * 100; $fmt = '0.00'; $sfx = '%' } 'dec' { $fmt = '#,##0.00' } 'x' { $fmt = '0.0' } '0.0' { $fmt = '0.0' } '0.000' { $fmt = '0.000' } '0.0000' { $fmt = '0.0000' } default { if ($cf -and $cf -match '0') { $first = ($cf -split ';')[0]; $dd = 0; if ($first -match '\.(0+)') { $dd = $Matches[1].Length }; $fmt = '#,##0'; if ($dd -gt 0) { $fmt = '#,##0.' + ('0' * $dd) }; if ($first.Contains('%')) { $av = $av * 100; $sfx = '%' } } else { $fmt = if ($av -lt 10 -and [math]::Abs($g - [math]::Round($g)) -gt 1e-9) { '0.00' } else { '#,##0' } } } }; $s = $av.ToString($fmt, [Globalization.CultureInfo]::InvariantCulture) + $sfx; if ($g -lt -1e-9 -and $s -ne '0') { $s = $MI + $s }; $edits += ,@(($start + $k.Groups['v'].Index), $s) } else { $fails += "$ref = $g" }; continue }
      try { $got = $sh.Get($ref) } catch { $fails += "$ref error: $($_.Exception.InnerException.Message)"; continue }
      if ($exp -eq 'TRUE' -or $exp -eq 'FALSE') { if ([string]$got -ne $exp -and -not ($got -is [bool] -and $got -eq ($exp -eq 'TRUE'))) { $fails += "$ref want $exp got $got" }; continue }
      $pct = $exp.EndsWith('%'); $num = [double]::Parse($exp.TrimEnd('%'), [Globalization.CultureInfo]::InvariantCulture)
      $dec = if ($exp -match '\.(\d+)') { $Matches[1].Length } else { 0 }
      $tol = 0.5 * [math]::Pow(10, -$dec) + 1e-9
      if ($pct) { $num = $num / 100; $tol = $tol / 100 }
      if ($got -isnot [double]) { $fails += "$ref want $($k.Groups['v'].Value) got '$got'"; continue }
      if ([math]::Abs($got - $num) -gt $tol) { $fails += "$ref want $($k.Groups['v'].Value) got $([math]::Round($got, 6))" }
    }
    $bad += $fails.Count + $errs.Count
    $status = if ($fails.Count + $errs.Count) { 'FAIL' } else { 'ok  ' }
    Write-Output "$status $label : $($keys.Count) keys"
    $errs + $fails | ForEach-Object { Write-Output "       $_" }
  }
  if ($Fill -and $edits.Count) { foreach ($e in ($edits | Sort-Object { $_[0] } -Descending)) { $t = $t.Remove($e[0], 1).Insert($e[0], $e[1]) }; [IO.File]::WriteAllText($f, $t, $enc); Write-Output "filled $($edits.Count) keys in $([IO.Path]::GetFileName($f))" }
}
Write-Output "--- $total keys checked, $bad problems"
