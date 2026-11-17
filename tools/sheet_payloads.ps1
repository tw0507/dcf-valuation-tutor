# Dev tool: turns the NVDA model into Claude Sheets applyEdits payload chunks (written to $env:TEMP\nvda_payload_N.json).
. (Join-Path $PSScriptRoot 'nvda_model.ps1')
$M = Get-NvdaModel
$enc = New-Object System.Text.UTF8Encoding($false)
function ColNum($s) { $n = 0; foreach ($ch in $s.ToCharArray()) { $n = $n * 26 + ([int]$ch - 64) }; $n }
function ColName([int]$n) { $s = ''; while ($n -gt 0) { $m = ($n - 1) % 26; $s = [char](65 + $m) + $s; $n = [math]::Floor(($n - 1) / 26) }; $s }
$STY = @{ in = @{ font = @{ color = @{ kind = 'rgb'; hex = '#0000ff' } }; fillColor = @{ kind = 'rgb'; hex = '#f2f2f2' } }
          link = @{ font = @{ color = @{ kind = 'rgb'; hex = '#008000' } } }
          hdr = @{ font = @{ bold = $true; color = @{ kind = 'rgb'; hex = '#ffffff' } }; fillColor = @{ kind = 'rgb'; hex = '#1f4e79' } }
          sub = @{ font = @{ bold = $true }; fillColor = @{ kind = 'rgb'; hex = '#d9e1f2' } }
          out = @{ font = @{ bold = $true }; fillColor = @{ kind = 'rgb'; hex = '#bdd7ee' } } }
function Edits($cells, $sheet, [int]$r1, [int]$r2, [int]$lastCol) {
  $rows = @(); $fmt = @{}; $st = @{}; $bold = @()
  for ($r = $r1; $r -le $r2; $r++) {
    $row = @()
    for ($c = 1; $c -le $lastCol; $c++) {
      $ref = "$(ColName $c)$r"; $x = $cells[$ref]
      if ($x) { $v = $x.v; if ($v -eq '') { $v = $null }
        # numbers stay numbers; typed percentages as numbers too (format applied below)
        $row += ,$v
        if ($x.f) { if (-not $fmt[$x.f]) { $fmt[$x.f] = New-Object System.Collections.ArrayList }; [void]$fmt[$x.f].Add($ref) }
        if ($x.st) { if (-not $st[$x.st]) { $st[$x.st] = New-Object System.Collections.ArrayList }; [void]$st[$x.st].Add($ref) }
        if ($x.b -and -not $x.st) { $bold += $ref } }
      else { $row += ,$null }
    }
    $rows += ,$row
  }
  $e = @(@{ kind = 'writeCells'; sheet = $sheet; topLeft = "A$r1"; rows = $rows })
  foreach ($k in $fmt.Keys) { $e += @{ kind = 'formatCells'; sheet = $sheet; ranges = @($fmt[$k]); format = @{ numberFormat = @{ pattern = $k } } } }
  foreach ($k in $st.Keys) { $e += @{ kind = 'formatCells'; sheet = $sheet; ranges = @($st[$k]); format = $STY[$k] } }
  if ($bold.Count) { $e += @{ kind = 'formatCells'; sheet = $sheet; ranges = $bold; format = @{ font = @{ bold = $true } } } }
  return $e
}
$chunks = New-Object System.Collections.ArrayList
$c0 = New-Object System.Collections.ArrayList
[void]$c0.Add(@{ kind = 'renameSheet'; sheet = 'Sheet1'; name = 'DCF' }); [void]$c0.Add(@{ kind = 'addSheet'; name = 'WACC' })
foreach ($e in (Edits $M.WACC 'WACC' 1 31 4)) { [void]$c0.Add($e) }
[void]$c0.Add(@{ kind = 'setColumnWidths'; sheet = 'WACC'; columns = 'A'; widthInPixels = 290 }); [void]$c0.Add(@{ kind = 'setColumnWidths'; sheet = 'WACC'; columns = 'B:D'; widthInPixels = 105 })
[void]$c0.Add(@{ kind = 'setSheetSettings'; sheet = 'WACC'; settings = @{ areGridlinesHidden = $true } })
[void]$chunks.Add($c0)
$c1 = New-Object System.Collections.ArrayList
foreach ($e in (Edits $M.DCF 'DCF' 1 67 16)) { [void]$c1.Add($e) }
[void]$c1.Add(@{ kind = 'setColumnWidths'; sheet = 'DCF'; columns = 'A'; widthInPixels = 290 }); [void]$c1.Add(@{ kind = 'setColumnWidths'; sheet = 'DCF'; columns = 'B:P'; widthInPixels = 88 })
[void]$c1.Add(@{ kind = 'setSheetSettings'; sheet = 'DCF'; settings = @{ areGridlinesHidden = $true; lastFrozenRow = 4; lastFrozenColumn = 'A' } })
[void]$chunks.Add($c1)
foreach ($rg in @(@(68, 92), @(93, 133), @(134, 151), @(152, 177))) { $cx = New-Object System.Collections.ArrayList; foreach ($e in (Edits $M.DCF 'DCF' $rg[0] $rg[1] 16)) { [void]$cx.Add($e) }; [void]$chunks.Add($cx) }
$bs = [string][char]92
for ($i = 0; $i -lt $chunks.Count; $i++) {
  $j = (ConvertTo-Json -InputObject @($chunks[$i]) -Depth 12 -Compress)
  $j = $j.Replace($bs + 'u0027', "'").Replace($bs + 'u0026', '&').Replace($bs + 'u003c', '<').Replace($bs + 'u003e', '>')
  $p = Join-Path $env:TEMP "nvda_payload_$i.json"; [IO.File]::WriteAllText($p, $j, $enc)
  "{0}: {1} KB, formulas {2}" -f $i, [math]::Round($j.Length / 1KB, 1), ([regex]::Matches($j, '"=')).Count
}
