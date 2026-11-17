# Builds standard lessons 11-15 and advanced A11-A16 (the NVDA DCF) from tools\templates and nvda_model.ps1.
. (Join-Path $PSScriptRoot 'nvda_model.ps1')
$M = Get-NvdaModel; $R = $M.R; $SEL = $M.SEL; $SENS = $M.SENS
$root = Join-Path (Split-Path $PSScriptRoot -Parent) 'valuation-tutor'
$tdir = Join-Path $PSScriptRoot 'templates'
$enc = New-Object System.Text.UTF8Encoding($false)
$WD = @{ A = 300; B = 95; C = 85; D = 85; E = 85; F = 85; G = 85; H = 85; I = 85; J = 85; K = 85; L = 85; M = 85; N = 85; O = 85; P = 85 }
$WW = @{ A = 300; B = 105; C = 95; D = 95 }

# row groups
$hdr = 1..3; $case = 5..6; $mkt = 8..17; $stub = ,18
$assump = 20..($SEL.hdr - 1); $selRg = $SEL.hdr..($SEL.wacc - 1); $selw = @($SEL.wacc)
$is = $R.is..$R.ebitda; $disc = $R.disc..$R.pv; $tv = $R.tvh..$R.tvx_impl_g; $vs = $R.vs..$R.impl_pe
$sensRg = $SENS[0].hdr..$R.helper_rows[-1]
$stage = @{
  1 = @($hdr + $is)
  2 = @($hdr + $case + $assump + $selRg + $is)
  3 = @($hdr + $case + $mkt + $assump + $selRg + $selw + $is)
  4 = @($hdr + $case + $mkt + $stub + $assump + $selRg + $selw + $is + $disc + $tv)
  5 = @($hdr + $case + $mkt + $stub + $assump + $selRg + $selw + $is + $disc + $tv + $vs)
  6 = @($hdr + $case + $mkt + $stub + $assump + $selRg + $selw + $is + $disc + $tv + $vs + $sensRg)
}
$histOnly = { param($ref, $rn, $cn) -not ($rn -ge $R.is -and $rn -le $R.ebitda -and $cn -ge 'G' -and $cn.Length -eq 1) }
function rows([string[]]$names, [string]$range) { $names | % { "row$($R[$_]):$range" } }
function selrows([string[]]$names, [string]$range) { $names | % { "row$($SEL[$_]):$range" } }
$projAll = 'rev','revg','ebit','ebitm','taxr','taxes','nopat','da','dap','capex','capexp','nwc','nwcp','fcf','fcfm','ebitda'

$lessons = @(
  # ---------- standard ----------
  @{ t = '11-nvda-history-and-fcf.md'; out = 'lessons'; st = 1; keep = $histOnly; wacc = $false; title = 'Lesson 11 · NVDA DCF: history and free cash flow'
     task = 'Column C is the worked example. Fill the yellow cells in D-F with the same formulas (copy right).'
     blank = @(rows 'gpm','ebit','ebitm','taxes','nopat','dap','capexp','ebitda' 'D-F') + @(rows 'revg','nwcp','fcf','fcfm' 'D-E') }
  @{ t = '12-nvda-ten-year-forecast.md'; out = 'lessons'; st = 2; wacc = $false; title = 'Lesson 12 · NVDA DCF: ten-year forecast with three cases'
     task = 'Rows 58 and 71 are the worked example. Fill the yellow Selected Case rows with CHOOSE and the yellow projection rows G-P (write in G, copy right).'
     blank = @(selrows 'margin','tax','da','capex','nwc' 'G-P') + @(selrows 'tg','exit','wadj' 'G-G') + @(rows ($projAll | ? { $_ -ne 'rev' }) 'G-P') }
  @{ t = '13-nvda-wacc.md'; out = 'lessons'; st = 3; wacc = $true; title = 'Lesson 13 · NVDA DCF: market data and the WACC link'
     task = 'Fill market cap (B11), net debt (B14) and the green WACC link (G67).'
     blank = @("B$($R.mcap)", "B$($R.netdebt)", "G$($SEL.wacc)")
     wtitle = 'Lesson 13 · NVDA WACC'; wtask = 'Rows 4-9 are the worked example. Fill the yellow cells: after-tax cost of debt, capital structure, weights and WACC.'
     wblank = @('B15','B20','B23','B24','B27','C27','D27','B28','C28','D28','B30') }
  @{ t = '14-nvda-terminal-value-and-price.md'; out = 'lessons'; st = 5; wacc = $true; title = 'Lesson 14 · NVDA DCF: discounting, terminal value and price'
     task = 'Discounting is the worked example. Fill the yellow terminal-value cells (Gordon and exit multiple) and the valuation summary.'
     blank = @(rows 'tv_tfcf','tv','tv_pv','tvx','tvx_pv','tv_impl_mult','tvx_impl_g' 'B-B') + @(rows 'ev','eqv','px','upside' 'B-C')
     wtitle = 'NVDA WACC'; wtask = 'Built in lesson 13.'; wblank = @() }
  @{ t = '15-nvda-sensitivities.md'; out = 'lessons'; st = 6; wacc = $true; title = 'Lesson 15 · NVDA DCF: the finished model'
     task = 'Tables 1-3 are the worked example. Fill table 4 (C165:G169) with one formula copied across.'
     blank = @($SENS[3].rows | % { "row$($_):C-G" })
     wtitle = 'NVDA WACC'; wtask = 'Built in lesson 13.'; wblank = @() }
  # ---------- advanced ----------
  @{ t = 'A11-nvda-history-and-fcf.md'; out = 'advanced'; st = 1; keep = $histOnly; wacc = $false; title = 'Lesson A11 · NVDA DCF: history and free cash flow'
     task = 'Fill every yellow cell in C-F.'
     blank = @(rows 'gpm','ebit','ebitm','taxes','nopat','dap','capexp','ebitda' 'C-F') + @(rows 'revg','nwcp','fcf','fcfm' 'D-E') }
  @{ t = 'A12-nvda-ten-year-forecast.md'; out = 'advanced'; st = 2; wacc = $false; title = 'Lesson A12 · NVDA DCF: ten-year forecast with three cases'
     task = 'Fill B6, the Selected Case block and every projection cell G-P.'
     blank = @("B$($R.casename)") + @(selrows 'growth','margin','tax','da','capex','nwc' 'G-P') + @(selrows 'tg','exit','wadj' 'G-G') + @(rows $projAll 'G-P') }
  @{ t = 'A13-nvda-wacc.md'; out = 'advanced'; st = 3; wacc = $true; title = 'Lesson A13 · NVDA DCF: market data and the WACC link'
     task = 'Fill B11, B14 and the WACC link G67.'
     blank = @("B$($R.mcap)", "B$($R.netdebt)", "G$($SEL.wacc)")
     wtitle = 'Lesson A13 · NVDA WACC'; wtask = 'Fill every yellow cell.'
     wblank = @('B7','B9','B14','B15','B18','B19','B20','B21','B22','B23','B24','B27','C27','D27','B28','C28','D28','B30') }
  @{ t = 'A14-nvda-discounting-and-terminal-value.md'; out = 'advanced'; st = 4; wacc = $true; title = 'Lesson A14 · NVDA DCF: discounting and terminal value'
     task = 'Fill the stub, the discounting rows and every terminal-value cell.'
     blank = @('B18') + @(rows 'yr' 'H-P') + @(rows 'dfcf','per','df','pv' 'G-P') + @(rows 'tv_fcf','tv_g','tv_w','tv_tfcf','tv','tv_per','tv_pv','tvx_ebitda','tvx_mult','tvx','tvx_per','tvx_pv','tv_impl_mult','tvx_impl_g' 'B-B') + @("C$($R.tv_g)")
     wtitle = 'NVDA WACC'; wtask = 'Built in lesson A13.'; wblank = @() }
  @{ t = 'A15-nvda-valuation-and-bridge.md'; out = 'advanced'; st = 5; wacc = $true; title = 'Lesson A15 · NVDA DCF: valuation summary and bridge'
     task = 'Fill every formula in rows 120-132 (B and C) and D123.'
     blank = @(rows 'sumpv','pvtv','ev','tvpct','v_debt','v_cash','v_inv','eqv','v_sh','px','v_cur','upside','impl_pe' 'B-C') + @("D$($R.tvpct)")
     wtitle = 'NVDA WACC'; wtask = 'Built in lesson A13.'; wblank = @() }
  @{ t = 'A16-nvda-sensitivities.md'; out = 'advanced'; st = 6; wacc = $true; title = 'Lesson A16 · NVDA DCF: four sensitivity tables'
     task = 'Fill every grid cell in tables 1-4 and the helper revenue paths.'
     blank = @(0..3 | % { $SENS[$_].rows } | % { "row$($_):C-G" }) + @($R.helper_rows | % { "row$($_):F-P"; "B$_" })
     wtitle = 'NVDA WACC'; wtask = 'Built in lesson A13.'; wblank = @() }
)
foreach ($L in $lessons) {
  $dcf = ConvertTo-SheetBlock -Cells $M.DCF -Tab 'DCF' -Title $L.title -Task $L.task -Cols 16 -Rows 177 -Width $WD -OnlyRows $stage[$L.st] -Blank $L.blank -Keep $L.keep
  $t = [IO.File]::ReadAllText((Join-Path $tdir $L.t), $enc).Replace('<<DCF>>', $dcf)
  if ($L.wacc) { $w = ConvertTo-SheetBlock -Cells $M.WACC -Tab 'WACC' -Title $L.wtitle -Task $L.wtask -Cols 4 -Rows 31 -Width $WW -Blank $L.wblank; $t = $t.Replace('<<WACC>>', $w) }
  $dest = Join-Path (Join-Path $root $L.out) $L.t
  [IO.File]::WriteAllText($dest, $t, $enc)
  "{0,-46} DCF cells {1}" -f $L.t, ([regex]::Matches($dcf, '"v":')).Count
}
