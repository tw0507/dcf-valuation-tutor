# Builds the advanced-track lessons (for learners who already know the three statements)
# from archive\v1-full-course lessons. Keeps the harder rungs (from scratch, twists, bug hunts),
# drops quiz questions and level guides, renames rungs to Practice 1..n and numbers lessons A1..A16.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$src = Join-Path $root 'archive\v1-full-course\lessons'
$dst = Join-Path $root 'valuation-tutor\advanced-track'
$enc = New-Object System.Text.UTF8Encoding($false)
$plan = @(
  @{ id='1a-04'; f='1a-04-linking-the-statements.md';      out='A01-linking-the-statements.md';    keep=3,4; min=60 },
  @{ id='1b-01'; f='1b-01-forecast-drivers.md';            out='A02-forecast-drivers.md';          keep=3,4; min=40 },
  @{ id='1b-02'; f='1b-02-working-capital.md';             out='A03-working-capital.md';           keep=3,4; min=35 },
  @{ id='1b-03'; f='1b-03-fixed-assets.md';                out='A04-fixed-assets.md';              keep=3,4; min=35 },
  @{ id='1b-04'; f='1b-04-debt-schedule.md';               out='A05-debt-schedule.md';             keep=3,4; min=40 },
  @{ id='1b-05'; f='1b-05-balancing-the-model.md';         out='A06-the-linked-model.md';          keep=3,4; min=120 },
  @{ id='2-01';  f='2-01-equity-vs-enterprise-value.md';   out='A07-equity-vs-enterprise-value.md'; keep=3,4; min=35 },
  @{ id='2-02';  f='2-02-multiples.md';                    out='A08-multiples.md';                 keep=3,4; min=35 },
  @{ id='2-03';  f='2-03-comps-set.md';                    out='A09-comps-set.md';                 keep=1,4; min=40 },
  @{ id='2-04';  f='2-04-peer-beta.md';                    out='A10-peer-beta.md';                 keep=1,4; min=35 },
  @{ id='3-02';  f='3-02-unlevered-fcf.md';                out='A11-unlevered-fcf.md';             keep=3,4; min=30 },
  @{ id='3-03';  f='3-03-wacc.md';                         out='A12-wacc.md';                      keep=3,4; min=35 },
  @{ id='3-04';  f='3-04-terminal-value.md';               out='A13-terminal-value.md';            keep=3,4; min=35 },
  @{ id='3-05';  f='3-05-mid-year-and-stub.md';            out='A14-mid-year-and-stub.md';         keep=2,3; min=35 },
  @{ id='3-06';  f='3-06-ev-to-share-price.md';            out='A15-ev-to-share-price.md';         keep=3,4; min=40 },
  @{ id='3-07';  f='3-07-scenarios-and-sensitivities.md';  out='A16-scenarios-and-sensitivities.md'; keep=3,4; min=60 }
)
# where each archive lesson lives now: advanced-track number, or the standard (10-hour) course's lesson
$idMap = [ordered]@{}
$i = 0; foreach ($p in $plan) { $i++; $idMap[$p.id] = "lesson A$i" }
$std = [ordered]@{ '1a-01'='standard lesson 1'; '1a-02'='standard lesson 2'; '1a-03'='standard lesson 3'; '3-01'='standard lesson 10'
  '1a-05'='@1a-05'; '1a-06'='@1a-06'; '1b-06'='@1b-06'; '2-05'='@2-05' }
# fixes for references to material the advanced track drops (applied after the id mapping)
$fix = [ordered]@{
  'This is the most important lesson in section 1a. ' = 'This is the most important lesson in the course. '
  'before the terminal value (section 3)' = 'before the terminal value (lesson A13)'
  'This is the payoff of section 1b:' = 'This is the payoff of lessons A2 to A5:'
  'Figures from @@1a-05 and lesson A7.' = 'Figures from lesson A7.'
  ' (@@2-05) |' = ' (built in the capstone) |'
  'Precedent deals (@@2-05) are where takeover prices belong.' = 'Precedent deals, which include a takeover premium, are where takeover prices belong.'
  'UFCF (from Rung 2)' = 'UFCF 2026E (from the Worked Example)'
  ', as in @@1a-06 |' = ' |'
  ' (lesson A7, Rung 2)' = ' (lesson A7)'
}
foreach ($k in $std.Keys) { $idMap[$k] = $std[$k] }
# A17-capstone.md is written by hand and is left alone
if (-not (Test-Path $dst)) { New-Item -ItemType Directory $dst | Out-Null }
foreach ($p in $plan) { $o = Join-Path $dst $p.out; if (Test-Path $o) { Remove-Item $o -Force } }
$n = 0
foreach ($p in $plan) {
  $n++
  $t = [IO.File]::ReadAllText((Join-Path $src $p.f), $enc).Replace("`r`n", "`n")
  $t = [regex]::Replace($t, '(?s)\n## 4\. Questions.*?(?=\n## 5\.)', "`n")
  $t = [regex]::Replace($t, '(?s)\n## 6\. Level guide.*$', "`n")
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
    $out += $part.Replace("Rung $rn", "Practice $k").TrimEnd() + "`n"
  }
  $t = $head.TrimEnd() + "`n" + $out
  $tabs = 'Worked Example' + ((1..$k | ForEach-Object { ", Practice $_" }) -join '')
  $t = [regex]::Replace($t, '\*\*Skill:\*\*[^\n]*?\*\*Time:\*\*[^·\n]*·\s*', "**Time:** about $($p.min) min · ")
  $t = [regex]::Replace($t, '\*\*Needs:\*\*[^\n]*', $(if ($n -eq 1) { '**Needs:** the three statements (standard lessons 1-3)' } else { "**Needs:** lesson A$($n - 1)" }))
  $t = [regex]::Replace($t, 'Follow the lesson loop[^\n]*', "Tabs: $tabs.")
  $t = [regex]::Replace($t, 'Tabs: (?!Worked Example\b(, Practice \d)*\.$)[^\n]*', "Tabs: $tabs.")
  $t = [regex]::Replace($t, '(?m)^(Ask|Then ask|Discuss|Follow-up question|Hint ladder|Point out)[^\n]*\n?', '')
  foreach ($id in $idMap.Keys) {
    $to = $idMap[$id]
    $t = $t.Replace("Lesson $id", ($to.Substring(0,1).ToUpper() + $to.Substring(1))).Replace("lesson $id", $to).Replace("lessons $id", $to)
    $t = $t.Replace("($id)", "($to)").Replace($id, $to)
  }
  $t = $t.Replace('lesson lesson', 'lesson').Replace('Lesson lesson', 'Lesson').Replace('lesson standard lesson', 'standard lesson').Replace('Lesson standard lesson', 'Standard lesson')
  foreach ($a in $fix.Keys) { $t = $t.Replace($a, $fix[$a]) }
  $t = [regex]::Replace($t, ' Ask: "The total is lower than Rung 1.s[^\n]*', '')
  $t = [regex]::Replace($t, '\n{3,}', "`n`n")
  $left = [regex]::Matches($t, '.{0,50}(@\d[ab]?-\d\d|Rung \d|[Ss]ection \d).{0,30}') | ForEach-Object { $_.Value }
  if ($left) { "  LEFTOVER in $($p.out): " + ($left -join ' || ') }
  [IO.File]::WriteAllText((Join-Path $dst $p.out), $t, $enc)
  "{0,-40} practices kept: {1}" -f $p.out, $k
}
