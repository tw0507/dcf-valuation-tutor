# Builds the 10-hour, build-only course from archive\v1-full-course lessons.
# Removes quiz questions and level guides, keeps chosen rungs (renamed Practice 1..n), renumbers lessons.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$src = Join-Path $root 'archive\v1-full-course\lessons'
$dst = Join-Path $root 'valuation-tutor\lessons'
$enc = New-Object System.Text.UTF8Encoding($false)
$plan = @(
  @{ f='1a-01-income-statement.md'; n=1; out='01-income-statement.md'; keep=1,3; min=45 },
  @{ f='1a-02-balance-sheet.md'; n=2; out='02-balance-sheet.md'; keep=1,2; min=35 },
  @{ f='1a-03-cash-flow-statement.md'; n=3; out='03-cash-flow-statement.md'; keep=1,2; min=35 },
  @{ f='1a-04-linking-the-statements.md'; n=4; out='04-linking-the-statements.md'; keep=1,2; min=50 },
  @{ f='1b-01-forecast-drivers.md'; n=5; out='05-forecast-drivers.md'; keep=,1; min=30 },
  @{ f='1b-02-working-capital.md'; n=6; out='06-working-capital.md'; keep=,1; min=30 },
  @{ f='1b-03-fixed-assets.md'; n=7; out='07-fixed-assets.md'; keep=1,2; min=35 },
  @{ f='1b-04-debt-schedule.md'; n=8; out='08-debt-schedule.md'; keep=1,2; min=35 },
  @{ f='1b-05-balancing-the-model.md'; n=9; out='09-the-linked-model.md'; keep=1,2; min=70 },
  @{ f='3-01-time-value.md'; n=10; out='10-time-value.md'; keep=1,2; min=30 },
  @{ f='3-02-unlevered-fcf.md'; n=11; out='11-unlevered-fcf.md'; keep=,1; min=30 },
  @{ f='3-03-wacc.md'; n=12; out='12-wacc.md'; keep=1,2; min=30 },
  @{ f='3-04-terminal-value.md'; n=13; out='13-terminal-value.md'; keep=1,2; min=35 },
  @{ f='3-06-ev-to-share-price.md'; n=14; out='14-dcf-to-share-price.md'; keep=1,2; min=50 },
  @{ f='3-07-scenarios-and-sensitivities.md'; n=15; out='15-scenarios-and-sensitivities.md'; keep=1,2; min=45 }
)
$idMap = [ordered]@{ '1a-01'=1; '1a-02'=2; '1a-03'=3; '1a-04'=4; '1b-01'=5; '1b-02'=6; '1b-03'=7; '1b-04'=8; '1b-05'=9; '3-01'=10; '3-02'=11; '3-03'=12; '3-04'=13; '3-05'=14; '3-06'=14; '3-07'=15 }
if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
New-Item -ItemType Directory $dst | Out-Null
foreach ($p in $plan) {
  $t = [IO.File]::ReadAllText((Join-Path $src $p.f), $enc).Replace("`r`n", "`n")
  # drop the Questions section and the Level guide
  $t = [regex]::Replace($t, '(?s)\n## 4\. Questions.*?(?=\n## 5\.)', "`n")
  $t = [regex]::Replace($t, '(?s)\n## 6\. Level guide.*$', "`n")
  # split the practice section into rung subsections and keep the chosen ones
  $i5 = $t.IndexOf("`n## 5.")
  $head = $t.Substring(0, $i5); $prac = $t.Substring($i5)
  $parts = [regex]::Split($prac, '(?=\n### )')
  $out = "`n## 4. Practice (in the Sheet; Claude reads the cells to check)`n"
  $k = 0
  foreach ($part in $parts) {
    $m = [regex]::Match($part, '^\n### Rung (\d)(.*)')
    if (-not $m.Success) { continue }
    $rn = [int]$m.Groups[1].Value
    if ($p.keep -notcontains $rn) { continue }
    $k++
    $part = $part.Replace("Rung $rn", "Practice $k")
    $out += $part.TrimEnd() + "`n"
  }
  $t = $head.TrimEnd() + "`n" + $out
  $tabs = 'Worked Example' + (1..$k | ForEach-Object { ", Practice $_" }) -join ''
  # header lines
  $t = [regex]::Replace($t, '\*\*Skill:\*\*[^\n]*?\*\*Time:\*\*[^·\n]*·\s*', "**Time:** about $($p.min) min · ")
  $t = [regex]::Replace($t, '\*\*Time:\*\*[^·\n]*·', "**Time:** about $($p.min) min ·")
  $t = [regex]::Replace($t, 'Follow the lesson loop[^\n]*', "Tabs: $tabs.")
  $t = [regex]::Replace($t, 'Tabs: (?!Worked Example\b(, Practice \d)*\.$)[^\n]*', "Tabs: $tabs.")
  # quiz prompts
  $t = [regex]::Replace($t, '(?m)^(Ask|Then ask|Discuss|Follow-up question|Hint ladder|Point out)[^\n]*\n?', '')
  # lesson ids
  foreach ($id in $idMap.Keys) {
    $n = $idMap[$id]
    $t = $t.Replace("Lesson $id", "Lesson $n").Replace("lesson $id", "lesson $n").Replace("lessons $id", "lessons $n")
    $t = $t.Replace("from $id", "from lesson $n").Replace("($id)", "(lesson $n)").Replace($id, "lesson $n")
  }
  $t = $t.Replace('lesson lesson', 'lesson').Replace('Lesson lesson', 'Lesson')
  $t = [regex]::Replace($t, '\n{3,}', "`n`n")
  [IO.File]::WriteAllText((Join-Path $dst $p.out), $t, $enc)
  "{0,-38} practices kept: {1}" -f $p.out, $k
}
