# Dev tool: generates the big multi-year sheet blocks for a lesson from a compact spec,
# and substitutes them for <<NAME>> placeholder lines in the lesson file.
# Spec rows: @{r=row; a='label'; bold=1; B='col B value'; f='formula template'; fmt='pct'; cols='CDE'}
# In f: {c} = this column, {p} = previous column, {B}..{Z} literal.
function New-SheetJson {
  param([string]$Tab, [string]$Title, [string]$Task, [int]$Rows, [object[]]$Spec, [string[]]$Blank = @(), [hashtable]$Override = @{}, [string]$Cols = 'CDE', [hashtable]$Header = @{}, [hashtable]$Width = @{A = 300 }, [string]$A1 = '')
  $cells = [ordered]@{}
  if ($A1) { $cells['A1'] = @{ v = $A1; b = 1 } }
  foreach ($k in $Header.Keys) { $cells[$k] = @{ v = $Header[$k]; b = 1 } }
  foreach ($s in $Spec) {
    $r = $s.r
    $cells["A$r"] = @{ v = $s.a }; if ($s.bold) { $cells["A$r"].b = 1 }
    if ($null -ne $s.B -and $s.B -ne '') { $cells["B$r"] = @{ v = [string]$s.B }; if ($s.bold) { $cells["B$r"].b = 1 }; if ($s.fmt) { $cells["B$r"].f = $s.fmt } }
    $vals = $s.v  # optional per-column typed values hashtable
    $useCols = if ($s.cols) { $s.cols } else { $Cols }
    foreach ($ch in $useCols.ToCharArray()) {
      $c = [string]$ch; $p = [string][char]([int]$ch - 1)
      $ref = "$c$r"
      $val = $null
      if ($vals -and $vals.ContainsKey($c)) { $val = [string]$vals[$c] }
      elseif ($s.f) { $val = $s.f.Replace('{c}', $c).Replace('{p}', $p) }
      if ($null -eq $val) { continue }
      if ($Override.ContainsKey($ref)) { $val = $Override[$ref] }
      $cell = @{ v = $val }
      if ($s.bold) { $cell.b = 1 }
      if ($s.fmt) { $cell.f = $s.fmt }
      if ($Blank -contains $ref -or $Blank -contains "row$r") { $cell.v = ''; $cell.ans = 1 }
      $cells[$ref] = $cell
    }
  }
  $w = [ordered]@{}; foreach ($k in ($Width.Keys | Sort-Object)) { $w[$k] = $Width[$k] }
  $obj = [ordered]@{ tab = $Tab; title = $Title; task = $Task; cols = (1 + $Cols.Length + 1); rows = $Rows; width = $w; cells = $cells }
  # one cell per line-ish for readability
  $json = ($obj | ConvertTo-Json -Depth 6 -Compress)
  $bs = [string][char]92; $json = $json.Replace($bs + 'u0027', [string][char]39).Replace($bs + 'u0026', '&').Replace($bs + 'u003c', '<').Replace($bs + 'u003e', '>')
  $json = $json -replace '\},"([A-Z]+\d+)":', ("},`n" + '"$1":')
  $bs = [string][char]92; $json = $json.Replace($bs + 'u0027', [string][char]39).Replace($bs + 'u0026', '&').Replace($bs + 'u003c', '<').Replace($bs + 'u003e', '>')
  return $json
}
function Set-LessonBlocks {
  param([string]$Path, [hashtable]$Blocks)
  $enc = New-Object System.Text.UTF8Encoding($false)
  $t = [IO.File]::ReadAllText($Path, $enc)
  foreach ($k in $Blocks.Keys) { $t = $t.Replace("<<$k>>", $Blocks[$k]) }
  [IO.File]::WriteAllText($Path, $t, $enc)
}
