# Dev tool: renders clips of the NVDA model (values computed by the checker engine) as SVG images for the README.
param([string]$OutDir = (Join-Path (Split-Path $PSScriptRoot -Parent) 'docs'))
. (Join-Path $PSScriptRoot 'nvda_model.ps1')
if (-not ('XlSheet' -as [type])) { Add-Type -Path (Join-Path $PSScriptRoot 'XlEval.cs') }
$M = Get-NvdaModel
$book = New-Object 'System.Collections.Generic.Dictionary[string,XlSheet]'
$S = @{}
foreach ($name in 'DCF', 'WACC') { $sh = New-Object XlSheet; $sh.Book = $book; foreach ($k in $M[$name].Keys) { $sh.Raw[$k] = [string]$M[$name][$k].v }; $book[$name] = $sh; $S[$name] = $sh }
$IC = [Globalization.CultureInfo]::InvariantCulture
function Fmt($v, [string]$p) {
  if ($null -eq $v) { return '' }
  if ($v -isnot [double]) { return [string]$v }
  if (-not $p) { $p = if ([math]::Abs($v) -ge 100) { '#,##0' } else { '0.00' } }
  if ($p -eq 'yyyy-mm-dd') { return ([datetime]'1899-12-30').AddDays($v).ToString('yyyy-MM-dd') }
  $sec = $p -split ';'; $neg = $v -lt 0; $first = $sec[0]
  if ($p.StartsWith('+')) { $first = $first.TrimStart('+') }
  $a = [math]::Abs($v); $pct = $first.Contains('%'); if ($pct) { $a = $a * 100 }
  $dd = 0; if ($first -match '\.(0+)') { $dd = $Matches[1].Length }
  $grp = $first.Contains(',')
  $s = $a.ToString(($(if ($grp) { '#,##0' } else { '0' }) + $(if ($dd) { '.' + ('0' * $dd) } else { '' })), $IC)
  if ($first.StartsWith('$')) { $s = '$' + $s }
  if ($pct) { $s += '%' }
  if ($first.Contains('"x"')) { $s += 'x' }
  if ($a -eq 0 -and $sec.Count -ge 3 -and $sec[2] -eq '"-"') { return '-' }
  if ($neg) { if ($sec.Count -ge 2 -and $sec[1].StartsWith('(')) { $s = "($s)" } else { $s = "-$s" } } elseif ($p.StartsWith('+') -and $a -gt 0) { $s = "+$s" }
  return $s
}
function Esc([string]$s) { $s.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;') }
function Render([string]$sheet, [int[]]$rows, [string[]]$cols, [hashtable]$widths, [string]$path, [string]$caption) {
  $cells = $M[$sheet]; $sh = $S[$sheet]
  $rh = 22; $pad = 6; $x0 = 10; $y0 = 40
  $xs = @{}; $x = $x0; foreach ($c in $cols) { $xs[$c] = $x; $x += $widths[$c] }; $W = $x + 10
  $H = $y0 + $rows.Count * $rh + 34
  $o = New-Object System.Text.StringBuilder
  [void]$o.Append("<svg xmlns='http://www.w3.org/2000/svg' width='$W' height='$H' viewBox='0 0 $W $H' font-family='Segoe UI, Calibri, Arial, sans-serif' font-size='12'>")
  [void]$o.Append("<rect width='100%' height='100%' fill='#ffffff'/>")
  [void]$o.Append("<text x='$x0' y='24' font-size='14' font-weight='bold' fill='#1f2937'>$(Esc $caption)</text>")
  $y = $y0
  foreach ($r in $rows) {
    foreach ($c in $cols) {
      $cell = $cells["$c$r"]; $st = if ($cell) { $cell.st } else { $null }
      $fill = switch ($st) { 'hdr' { '#1f4e79' } 'sub' { '#d9e1f2' } 'out' { '#bdd7ee' } 'in' { '#f2f2f2' } default { $null } }
      if ($fill) { [void]$o.Append("<rect x='$($xs[$c])' y='$y' width='$($widths[$c])' height='$rh' fill='$fill'/>") }
    }
    foreach ($c in $cols) {
      $ref = "$c$r"; $cell = $cells[$ref]; $st = if ($cell) { $cell.st } else { $null }
      if (-not $cell) { continue }
      $raw = [string]$cell.v
      $val = $null; try { $val = $sh.Get($ref) } catch { $val = '#ERR' }
      $txt = if ($raw -eq '') { '' } else { Fmt $val $cell.f }
      if ($txt -eq '') { continue }
      $color = switch ($st) { 'hdr' { '#ffffff' } 'in' { '#0000ff' } 'link' { '#008000' } default { '#000000' } }
      $bold = if ($cell.b -or @('hdr','sub','out') -contains $st) { " font-weight='bold'" } else { '' }
      $isNum = $val -is [double]
      if ($c -eq 'A' -or -not $isNum) { $tx = $xs[$c] + $pad; $anchor = 'start' } else { $tx = $xs[$c] + $widths[$c] - $pad; $anchor = 'end' }
      [void]$o.Append("<text x='$tx' y='$($y + 15)' text-anchor='$anchor' fill='$color'$bold>$(Esc $txt)</text>")
    }
    $y += $rh
  }
  [void]$o.Append("<text x='$x0' y='$($H - 10)' font-size='10' fill='#6b7280'>Blue on grey = sourced input · black = formula · green = link to the other sheet · light blue = key output. Values recomputed from the model's formulas.</text>")
  [void]$o.Append('</svg>')
  [IO.File]::WriteAllText($path, $o.ToString(), (New-Object System.Text.UTF8Encoding($false)))
  "wrote $path ($W x $H)"
}
New-Item -ItemType Directory -Force $OutDir | Out-Null
$R = $M.R
$all = 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'
$wA = @{ A = 300 }; foreach ($c in $all[1..15]) { $wA[$c] = 78 }
Render 'DCF' @(1..2 + 5..6 + 8..18) @('A','B') @{ A = 300; B = 110 } (Join-Path $OutDir 'dcf-inputs.svg') 'NVDA DCF · case switch and market data (DCF tab, rows 1-18)'
Render 'DCF' @($R.is..$R.ebitda) $all $wA (Join-Path $OutDir 'dcf-forecast.svg') 'NVDA DCF · history (FY24A-TTM) and 10-year forecast to unlevered FCF, base case'
Render 'DCF' @($R.tvh..$R.impl_pe) @('A','B','C','D') @{ A = 330; B = 120; C = 120; D = 130 } (Join-Path $OutDir 'dcf-valuation.svg') 'NVDA DCF · terminal value two ways and valuation summary'
$sens = @($M.SENS[0].hdr..$M.SENS[0].rows[-1]) + @($M.SENS[3].hdr..$M.SENS[3].rows[-1])
Render 'DCF' $sens @('A','B','C','D','E','F','G') @{ A = 250; B = 90; C = 90; D = 90; E = 90; F = 90; G = 90 } (Join-Path $OutDir 'dcf-sensitivity.svg') 'NVDA DCF · sensitivity tables 1 (WACC x growth) and 4 (WACC x exit multiple)'
Render 'WACC' @(1..31) @('A','B','C','D') @{ A = 330; B = 110; C = 100; D = 110 } (Join-Path $OutDir 'wacc.svg') 'NVDA WACC sheet'
