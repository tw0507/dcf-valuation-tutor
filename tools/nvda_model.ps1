# Dev tool: the full NVDA DCF model (port of NVDA DCF\build_nvda_dcf.py, plus an exit-multiple
# terminal value and a WACC x exit-multiple grid), as cell maps for the lesson JSON blocks.
# Cell spec keys: v (value/formula), b (bold), f (number format), st (style: in/link/hdr/sub/out), note (source).
function Get-NvdaModel {
  $PCT = '0.0%;(0.0%);"-"'; $PCT2 = '0.00%;(0.00%);"-"'; $MM = '#,##0;(#,##0);"-"'; $DMM = '$#,##0;($#,##0);"-"'
  $PS = '$#,##0.00;($#,##0.00);"-"'; $MULT = '0.00;(0.00);"-"'; $YRS = '0.00'; $XM = '0.0"x"'
  $Q2 = 'NVIDIA Q2 FY27 earnings release (8-K Ex.99.1), 2026-08-26'; $Q1 = 'NVIDIA Q1 FY27 earnings release, 2026-05'
  $Q4 = 'NVIDIA Q4 & FY26 earnings release, 2026-02-25'; $YF = 'Yahoo Finance quote NVDA, retrieved 2026-11-11'
  $D = [ordered]@{}; $Wc = [ordered]@{}
  function put($sheet, $ref, $v, $st = $null, $f = $null, $b = $false, $note = $null) {
    $c = [ordered]@{ v = [string]$v }; if ($b) { $c.b = 1 }; if ($f) { $c.f = $f }; if ($st) { $c.st = $st }; if ($note) { $c.note = $note }
    $sheet[$ref] = $c
  }
  function L([int]$n) { $s = ''; while ($n -gt 0) { $m = ($n - 1) % 26; $s = [char](65 + $m) + $s; $n = [math]::Floor(($n - 1) / 26) }; $s }
  $LAST = 16; $HIST = 'C','D','E','F'; $PROJ = 7..16 | % { L $_ }
  $HIST_LBL = 'FY24A','FY25A','FY26A','TTM Jul-26'; $PROJ_LBL = 0..9 | % { "Jul-$(27 + $_)E" }
  function section($sheet, $row, $text, $lastCol) { put $sheet "A$row" $text 'hdr' $null $true; for ($c = 2; $c -le $lastCol; $c++) { put $sheet "$(L $c)$row" '' 'hdr' } }
  function subhdr($sheet, $row, $c1, $c2) { for ($c = $c1; $c -le $c2; $c++) { $r = "$(L $c)$row"; if (-not $sheet.Contains($r)) { put $sheet $r '' }; $sheet[$r].st = 'sub'; $sheet[$r].b = 1 } }

  # ---------- row layout ----------
  $RX = @{ title = 1; sub = 2; note = 3; case = 5; casename = 6; mkt = 8 }
  'price','shares','mcap','debt','cash','netdebt','inv' | % -Begin { $i = 9 } -Process { $RX[$_] = $i; $i++ }
  $RX.ttmend = 16; $RX.valdate = 17; $RX.stub = 18
  $ASSUMP = 'growth','margin','tax','da','capex','nwc','tg','exit','wadj'
  $ALBL = @{ growth = 'Revenue Growth (%)'; margin = 'EBIT Margin (%)'; tax = 'Tax Rate (%)'; da = 'D&A (% of Revenue)'; capex = 'CapEx (% of Revenue)'
    nwc = 'Δ NWC (% of Δ Revenue)'; tg = 'Terminal Growth Rate'; exit = 'Exit EV / EBITDA Multiple (x)'; wadj = 'WACC Adjustment vs. CAPM' }
  $SINGLE = 'tg','exit','wadj'
  $blocks = @{}; $r = 20
  foreach ($case in 'Bear','Base','Bull') { $bk = @{ hdr = $r; cols = $r + 1 }; for ($i = 0; $i -lt $ASSUMP.Count; $i++) { $bk[$ASSUMP[$i]] = $r + 2 + $i }; $blocks[$case] = $bk; $r = $r + 2 + $ASSUMP.Count + 1 }
  $SEL = @{ hdr = $r; cols = $r + 1 }; for ($i = 0; $i -lt $ASSUMP.Count; $i++) { $SEL[$ASSUMP[$i]] = $r + 2 + $i }; $SEL.wacc = $r + 2 + $ASSUMP.Count
  $r = $SEL.wacc + 2; $RX.is = $r; $RX.iscols = $r + 1
  $names = 'rev','revg','gp','gpm','rd','sga','ebit','ebitm','taxr','taxes','nopat','b1','da','dap','capex','capexp','nwc','nwcp','b2','fcf','fcfm','ebitda'
  for ($i = 0; $i -lt $names.Count; $i++) { $RX[$names[$i]] = $r + 2 + $i }
  $r = $RX.ebitda + 2; $RX.disc = $r; $RX.disccols = $r + 1; $RX.yr = $r + 2; $RX.dfcf = $r + 3; $RX.per = $r + 4; $RX.df = $r + 5; $RX.pv = $r + 6
  $r = $RX.pv + 2; $RX.tvh = $r
  'tv_fcf','tv_g','tv_w','tv_tfcf','tv','tv_per','tv_pv','tvx_ebitda','tvx_mult','tvx','tvx_per','tvx_pv','tv_impl_mult','tvx_impl_g' | % -Begin { $i = $r + 1 } -Process { $RX[$_] = $i; $i++ }
  $r = $RX.tvx_impl_g + 2; $RX.vs = $r; $RX.vscols = $r + 1
  'sumpv','pvtv','ev','tvpct','v_debt','v_cash','v_inv','eqv','v_sh','px','v_cur','upside','impl_pe' | % -Begin { $i = $r + 2 } -Process { $RX[$_] = $i; $i++ }
  $r = $RX.impl_pe + 3; $SENS = @()
  for ($tt = 0; $tt -lt 4; $tt++) { $SENS += @{ hdr = $r; axis = $r + 1; colhdr = $r + 2; rows = @(($r + 3)..($r + 7)) }; $r += 9 }
  $RX.helper = $r; $RX.helper_cols = $r + 1; $RX.helper_rows = @(($r + 2)..($r + 6))

  # ---------- header ----------
  put $D 'A1' 'NVIDIA Corporation (NVDA) — Discounted Cash Flow Model' $null $null $true
  put $D 'A2' 'Ticker: NVDA (NasdaqGS) | Valuation date: 2026-11-11 | Fiscal year end: last Sunday of January | Base period: TTM to 2026-07-26 (Q2 FY27)'
  put $D 'A3' '$ in millions except per-share data. Blue on grey = input (with source), black = formula, green = link to the WACC sheet.'
  put $D "A$($RX.case)" 'Case Selector (1 = Bear, 2 = Base, 3 = Bull)' $null $null $true
  put $D "B$($RX.case)" 2 'in' '0' $true 'Scenario switch. Drives the Selected Case block via CHOOSE().'
  put $D "A$($RX.casename)" 'Active Case'
  put $D "B$($RX.casename)" ('=CHOOSE($B$' + $RX.case + ',"Bear","Base","Bull")') $null $null $true

  # ---------- market data ----------
  section $D $RX.mkt 'MARKET DATA & BALANCE SHEET INPUTS (not case-dependent)' 4
  put $D "A$($RX.price)" 'Current Share Price ($)'; put $D "B$($RX.price)" 168.89 'in' $PS $false "$YF. Close 2026-11-10."
  put $D "A$($RX.shares)" 'Diluted Shares Outstanding (M)'; put $D "B$($RX.shares)" 24285 'in' $MM $false "$Q2. Weighted avg diluted shares, quarter to 2026-07-26."
  put $D "A$($RX.mcap)" 'Market Capitalization ($M)'; put $D "B$($RX.mcap)" "=B$($RX.price)*B$($RX.shares)" $null $DMM
  put $D "A$($RX.debt)" 'Total Debt ($M)'; put $D "B$($RX.debt)" 33366 'in' $DMM $false "$Q2. Short-term debt 1,000 + long-term debt 32,366."
  put $D "A$($RX.cash)" 'Cash & Marketable Debt Securities ($M)'; put $D "B$($RX.cash)" 56586 'in' $DMM $false "$Q2. Cash & equivalents 22,443 + marketable debt securities 34,143."
  put $D "A$($RX.netdebt)" 'Net Debt / (Net Cash) ($M)'; put $D "B$($RX.netdebt)" "=B$($RX.debt)-B$($RX.cash)" $null $DMM
  put $D "A$($RX.inv)" 'Equity Investments (non-operating) ($M)'; put $D "B$($RX.inv)" 93940 'in' $DMM $false "$Q2. Marketable equity 42,783 + non-marketable 51,157. Gains sit below EBIT, so added in the bridge."
  put $D "A$($RX.ttmend)" 'TTM Period End (balance sheet date)'; put $D "B$($RX.ttmend)" '2026-07-26' 'in' 'yyyy-mm-dd' $false "$Q2. Q2 FY27 ended 2026-07-26."
  put $D "A$($RX.valdate)" 'Valuation Date'; put $D "B$($RX.valdate)" '2026-11-11' 'in' 'yyyy-mm-dd' $false 'Analyst input: model date.'
  put $D "A$($RX.stub)" 'Years Elapsed Since TTM End'; put $D "B$($RX.stub)" "=(B$($RX.valdate)-B$($RX.ttmend))/365" $null $YRS

  # ---------- scenario blocks ----------
  $DATA = @{
    Bear = @{ growth = 0.50,0.12,0.02,-0.03,0.03,0.04,0.04,0.03,0.03,0.025; margin = 0.63,0.60,0.55,0.50,0.46,0.43,0.41,0.40,0.40,0.40
              tax = @(0.18)*10; da = @(0.017)*10; capex = @(0.030)*10; nwc = @(0.20)*10; tg = 0.025; exit = 12; wadj = 0.010 }
    Base = @{ growth = 0.75,0.30,0.18,0.12,0.09,0.07,0.06,0.05,0.04,0.035; margin = 0.65,0.64,0.62,0.60,0.58,0.56,0.54,0.52,0.50,0.48
              tax = @(0.17)*10; da = @(0.015)*10; capex = @(0.025)*10; nwc = @(0.15)*10; tg = 0.035; exit = 16; wadj = 0.0 }
    Bull = @{ growth = 0.85,0.40,0.25,0.18,0.13,0.10,0.08,0.06,0.05,0.04; margin = 0.66,0.66,0.65,0.64,0.63,0.62,0.61,0.60,0.59,0.58
              tax = @(0.16)*10; da = @(0.015)*10; capex = @(0.022)*10; nwc = @(0.12)*10; tg = 0.040; exit = 20; wadj = -0.010 }
  }
  $NOTE = @{ growth = 'Analyst assumption: Y1 anchored to consensus (Base ~+75% NTM), fading to GDP-plus by Y10.'; margin = 'Analyst assumption: TTM GAAP EBIT margin 65.2%, fading with competition.'
    tax = 'TTM GAAP effective tax rate 16.0% (tax 36,864 / pretax 229,743).'; da = 'TTM D&A 3,688 = 1.2% of revenue, rising with PP&E.'; capex = 'TTM capex 7,355 = 2.4% of revenue.'
    nwc = 'FY26 ΔNWC 15,949 = 18.7% of Δrevenue; FY25 13.5%.'; tg = 'Terminal growth below the 10Y UST yield of 4.98%.'
    exit = 'Analyst assumption: NVDA trades near 20x TTM EBITDA today; a lower multiple by Y10 as growth matures (Bear 12x, Base 16x, Bull 20x).'; wadj = 'Risk adjustment vs. CAPM WACC: Bear +1.0%, Base 0, Bull -1.0%.' }
  foreach ($case in 'Bear','Base','Bull') {
    $bk = $blocks[$case]; section $D $bk.hdr "$($case.ToUpper()) CASE ASSUMPTIONS" $LAST
    put $D "A$($bk.cols)" 'Assumption'; for ($j = 0; $j -lt 10; $j++) { put $D "$($PROJ[$j])$($bk.cols)" $PROJ_LBL[$j] }; subhdr $D $bk.cols 1 $LAST
    foreach ($k in $ASSUMP) {
      put $D "A$($bk[$k])" $ALBL[$k]; $fmt = if ($k -eq 'exit') { $XM } else { $PCT }
      if ($SINGLE -contains $k) { put $D "G$($bk[$k])" $DATA[$case][$k] 'in' $fmt $false $NOTE[$k] }
      else { for ($j = 0; $j -lt 10; $j++) { put $D "$($PROJ[$j])$($bk[$k])" $DATA[$case][$k][$j] 'in' $fmt $false $NOTE[$k] } }
    }
  }
  section $D $SEL.hdr 'SELECTED CASE (consolidation — feeds the projections)' $LAST
  put $D "A$($SEL.cols)" 'Assumption'; put $D "B$($SEL.cols)" "=B$($RX.casename)"
  for ($j = 0; $j -lt 10; $j++) { put $D "$($PROJ[$j])$($SEL.cols)" $PROJ_LBL[$j] }; subhdr $D $SEL.cols 1 $LAST
  $cs = '$B$' + $RX.case
  foreach ($k in $ASSUMP) {
    put $D "A$($SEL[$k])" $ALBL[$k]; $fmt = if ($k -eq 'exit') { $XM } else { $PCT }
    $cols = if ($SINGLE -contains $k) { @('G') } else { $PROJ }
    foreach ($col in $cols) { put $D "$col$($SEL[$k])" "=CHOOSE($cs,$col$($blocks.Bear[$k]),$col$($blocks.Base[$k]),$col$($blocks.Bull[$k]))" $null $fmt }
  }
  $WX = @{ rf = 5; beta_raw = 6; beta = 7; erp = 8; coe = 9; rating = 12; kd = 13; tax = 14; kd_at = 15; px = 18; sh = 19; mcap = 20; debt = 21; cash = 22; netdebt = 23; cap = 24; wh = 26; we = 27; wd = 28; wacc = 30 }
  put $D "A$($SEL.wacc)" 'WACC (CAPM WACC + case adjustment)' $null $null $true
  put $D "G$($SEL.wacc)" "=WACC!`$B`$$($WX.wacc)+G$($SEL.wadj)" 'link' $PCT2 $true

  # ---------- financials & FCF ----------
  section $D $RX.is 'HISTORICAL & PROJECTED FINANCIALS / UNLEVERED FREE CASH FLOW ($M)' $LAST
  put $D "A$($RX.iscols)" 'Fiscal period'; for ($j = 0; $j -lt 4; $j++) { put $D "$($HIST[$j])$($RX.iscols)" $HIST_LBL[$j] }
  for ($j = 0; $j -lt 10; $j++) { put $D "$($PROJ[$j])$($RX.iscols)" $PROJ_LBL[$j] }; subhdr $D $RX.iscols 1 $LAST
  $hv = @{ rev = 60922,130497,215938,302969; gp = 44301,97858,153463,226241; rd = 8675,12914,18497,23592; sga = 2654,3491,4579,5070; da = 1508,1864,2843,3688; capex = 1069,3236,6042,7355 }
  $hsrc = @('NVIDIA FY24 10-K (FYE 2024-01-28)', $Q4, $Q4, 'Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)')
  $labels = [ordered]@{ rev = 'Revenue'; revg = '  % growth'; gp = 'Gross Profit (historical memo)'; gpm = '  % gross margin'; rd = 'Research & Development (historical memo)'
    sga = 'Sales, General & Admin (historical memo)'; ebit = 'EBIT (GAAP operating income)'; ebitm = '  % EBIT margin'; taxr = '  Tax rate'; taxes = '(-) Taxes on EBIT'; nopat = 'NOPAT'
    da = '(+) D&A'; dap = '  % of revenue'; capex = '(-) CapEx'; capexp = '  % of revenue'; nwc = '(-) Increase in NWC'; nwcp = '  % of Δ revenue'; fcf = 'Unlevered Free Cash Flow'; fcfm = '  % FCF margin'; ebitda = 'Memo: EBITDA (EBIT + D&A)' }
  foreach ($k in $labels.Keys) { put $D "A$($RX[$k])" $labels[$k] $null $null (@('rev','ebit','nopat','fcf') -contains $k) }
  $taxh = @('=4058/33818','=11146/84026','=21383/141450','=36864/229743')
  for ($j = 0; $j -lt 4; $j++) {
    $col = $HIST[$j]
    foreach ($k in 'rev','gp','rd','sga','da','capex') { put $D "$col$($RX[$k])" $hv[$k][$j] 'in' $MM $false $hsrc[$j] }
    put $D "$col$($RX.gpm)" "=$col$($RX.gp)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.ebit)" "=$col$($RX.gp)-$col$($RX.rd)-$col$($RX.sga)" $null $MM
    put $D "$col$($RX.ebitm)" "=$col$($RX.ebit)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.taxr)" $taxh[$j] 'in' $PCT $false "$($hsrc[$j]): income tax / pretax income."
    put $D "$col$($RX.taxes)" "=$col$($RX.ebit)*$col$($RX.taxr)" $null $MM
    put $D "$col$($RX.nopat)" "=$col$($RX.ebit)-$col$($RX.taxes)" $null $MM
    put $D "$col$($RX.dap)" "=$col$($RX.da)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.capexp)" "=$col$($RX.capex)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.ebitda)" "=$col$($RX.ebit)+$col$($RX.da)" $null $MM
  }
  put $D "C$($RX.revg)" "=C$($RX.rev)/26974-1" 'in' $PCT $false 'NVIDIA FY24 10-K: FY23 revenue 26,974 is the prior-year base.'
  put $D "D$($RX.revg)" "=D$($RX.rev)/C$($RX.rev)-1" $null $PCT
  put $D "E$($RX.revg)" "=E$($RX.rev)/D$($RX.rev)-1" $null $PCT
  put $D "F$($RX.revg)" "=F$($RX.rev)/165218-1" 'in' $PCT $false 'Prior-year TTM revenue 165,218 (Q3 FY25 to Q2 FY26, earnings releases).'
  foreach ($pair in @(@('D', 9383, "$Q4. FY25 change in operating assets & liabilities: net use 9,383."), @('E', 15949, "$Q4. FY26 change in operating assets & liabilities: net use 15,949."))) {
    $col = $pair[0]; $prev = [string][char]([int][char]$col - 1)
    put $D "$col$($RX.nwc)" $pair[1] 'in' $MM $false $pair[2]
    put $D "$col$($RX.nwcp)" "=$col$($RX.nwc)/($col$($RX.rev)-$prev$($RX.rev))" $null $PCT
    put $D "$col$($RX.fcf)" "=$col$($RX.nopat)+$col$($RX.da)-$col$($RX.capex)-$col$($RX.nwc)" $null $MM $true
    put $D "$col$($RX.fcfm)" "=$col$($RX.fcf)/$col$($RX.rev)" $null $PCT
  }
  foreach ($col in 'C','F') { put $D "$col$($RX.nwc)" 'n/a'; put $D "$col$($RX.fcf)" 'n/a' }
  for ($j = 0; $j -lt 10; $j++) {
    $col = $PROJ[$j]; $prev = if ($j -eq 0) { 'F' } else { $PROJ[$j - 1] }
    put $D "$col$($RX.rev)" "=$prev$($RX.rev)*(1+$col`$$($SEL.growth))" $null $MM $true
    put $D "$col$($RX.revg)" "=$col$($RX.rev)/$prev$($RX.rev)-1" $null $PCT
    put $D "$col$($RX.ebit)" "=$col$($RX.rev)*$col`$$($SEL.margin)" $null $MM $true
    put $D "$col$($RX.ebitm)" "=$col$($RX.ebit)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.taxr)" "=$col`$$($SEL.tax)" $null $PCT
    put $D "$col$($RX.taxes)" "=$col$($RX.ebit)*$col$($RX.taxr)" $null $MM
    put $D "$col$($RX.nopat)" "=$col$($RX.ebit)-$col$($RX.taxes)" $null $MM $true
    put $D "$col$($RX.da)" "=$col$($RX.rev)*$col`$$($SEL.da)" $null $MM
    put $D "$col$($RX.dap)" "=$col$($RX.da)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.capex)" "=$col$($RX.rev)*$col`$$($SEL.capex)" $null $MM
    put $D "$col$($RX.capexp)" "=$col$($RX.capex)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.nwc)" "=($col$($RX.rev)-$prev$($RX.rev))*$col`$$($SEL.nwc)" $null $MM
    put $D "$col$($RX.nwcp)" "=IF($col$($RX.rev)=$prev$($RX.rev),0,$col$($RX.nwc)/($col$($RX.rev)-$prev$($RX.rev)))" $null $PCT
    put $D "$col$($RX.fcf)" "=$col$($RX.nopat)+$col$($RX.da)-$col$($RX.capex)-$col$($RX.nwc)" $null $MM $true
    put $D "$col$($RX.fcfm)" "=$col$($RX.fcf)/$col$($RX.rev)" $null $PCT
    put $D "$col$($RX.ebitda)" "=$col$($RX.ebit)+$col$($RX.da)" $null $MM
  }

  # ---------- discounting ----------
  section $D $RX.disc 'DISCOUNTING (mid-year convention, adjusted for time elapsed since TTM end)' $LAST
  put $D "A$($RX.disccols)" 'Projection year'; for ($j = 0; $j -lt 10; $j++) { put $D "$($PROJ[$j])$($RX.disccols)" $PROJ_LBL[$j] }; subhdr $D $RX.disccols 1 $LAST
  put $D "A$($RX.yr)" 'Year #'; put $D "A$($RX.dfcf)" 'Unlevered FCF ($M)'; put $D "A$($RX.per)" 'Discount Period (years from valuation date)'; put $D "A$($RX.df)" 'Discount Factor'; put $D "A$($RX.pv)" 'PV of FCF ($M)' $null $null $true
  $wacc = '$G$' + $SEL.wacc
  for ($j = 0; $j -lt 10; $j++) {
    $col = $PROJ[$j]
    if ($j -eq 0) { put $D "G$($RX.yr)" 1 'in' '0' $false 'Structural: first projection year.' } else { put $D "$col$($RX.yr)" "=$($PROJ[$j-1])$($RX.yr)+1" $null '0' }
    put $D "$col$($RX.dfcf)" "=$col$($RX.fcf)" $null $MM
    put $D "$col$($RX.per)" "=$col$($RX.yr)-0.5-`$B`$$($RX.stub)" $null $YRS
    put $D "$col$($RX.df)" "=1/(1+$wacc)^$col$($RX.per)" $null '0.0000'
    put $D "$col$($RX.pv)" "=$col$($RX.dfcf)*$col$($RX.df)" $null $MM $true
  }

  # ---------- terminal value ----------
  section $D $RX.tvh 'TERMINAL VALUE (Gordon growth, cross-checked with an exit multiple)' 4
  $tvrows = @(
    @('tv_fcf','Final-Year Unlevered FCF ($M)',"=P$($RX.fcf)",$MM), @('tv_g','Terminal Growth Rate',"=G$($SEL.tg)",$PCT), @('tv_w','WACC',"=$wacc",$PCT2),
    @('tv_tfcf','Terminal-Year FCF ($M)',"=B$($RX.tv_fcf)*(1+B$($RX.tv_g))",$MM), @('tv','Terminal Value — Gordon ($M)',"=B$($RX.tv_tfcf)/(B$($RX.tv_w)-B$($RX.tv_g))",$MM),
    @('tv_per','Discount Period (final-year mid-point)',"=P$($RX.per)",$YRS), @('tv_pv','PV of Terminal Value — Gordon ($M)',"=B$($RX.tv)/(1+B$($RX.tv_w))^B$($RX.tv_per)",$MM),
    @('tvx_ebitda','Final-Year EBITDA ($M)',"=P$($RX.ebitda)",$MM), @('tvx_mult','Exit EV / EBITDA Multiple (x)',"=G$($SEL.exit)",$XM),
    @('tvx','Terminal Value — Exit Multiple ($M)',"=B$($RX.tvx_ebitda)*B$($RX.tvx_mult)",$MM), @('tvx_per','Discount Period (end of final year)',"=P$($RX.per)+0.5",$YRS),
    @('tvx_pv','PV of Terminal Value — Exit ($M)',"=B$($RX.tvx)/(1+B$($RX.tv_w))^B$($RX.tvx_per)",$MM),
    @('tv_impl_mult','Cross-check: exit multiple implied by Gordon TV (x)',"=B$($RX.tv)/B$($RX.tvx_ebitda)",$XM),
    @('tvx_impl_g','Cross-check: perpetual growth implied by exit TV',"=(B$($RX.tvx)*B$($RX.tv_w)-B$($RX.tv_fcf))/(B$($RX.tvx)+B$($RX.tv_fcf))",$PCT))
  foreach ($x in $tvrows) { $bb = @('tv_pv','tvx_pv') -contains $x[0]; put $D "A$($RX[$x[0]])" $x[1] $null $null $bb; put $D "B$($RX[$x[0]])" $x[2] $null $x[3] $bb }
  put $D "C$($RX.tv_g)" "=IF(B$($RX.tv_g)<B$($RX.tv_w),`"OK: g < WACC`",`"ERROR: g >= WACC`")"

  # ---------- valuation summary ----------
  section $D $RX.vs 'VALUATION SUMMARY' 4
  put $D "A$($RX.vscols)" 'Terminal value method'; put $D "B$($RX.vscols)" 'Gordon growth'; put $D "C$($RX.vscols)" 'Exit multiple'; subhdr $D $RX.vscols 1 3
  $vs = @(
    @('sumpv','Sum of PV of Projected FCF ($M)',"=SUM(G$($RX.pv):P$($RX.pv))","=SUM(G$($RX.pv):P$($RX.pv))",$DMM),
    @('pvtv','PV of Terminal Value ($M)',"=B$($RX.tv_pv)","=B$($RX.tvx_pv)",$DMM),
    @('ev','Enterprise Value ($M)',"=B$($RX.sumpv)+B$($RX.pvtv)","=C$($RX.sumpv)+C$($RX.pvtv)",$DMM),
    @('tvpct','  Terminal value as % of EV',"=B$($RX.pvtv)/B$($RX.ev)","=C$($RX.pvtv)/C$($RX.ev)",$PCT),
    @('v_debt','(-) Total Debt ($M)',"=-`$B`$$($RX.debt)","=-`$B`$$($RX.debt)",$DMM),
    @('v_cash','(+) Cash & Marketable Debt Securities ($M)',"=`$B`$$($RX.cash)","=`$B`$$($RX.cash)",$DMM),
    @('v_inv','(+) Equity Investments ($M)',"=`$B`$$($RX.inv)","=`$B`$$($RX.inv)",$DMM),
    @('eqv','Equity Value ($M)',"=B$($RX.ev)+B$($RX.v_debt)+B$($RX.v_cash)+B$($RX.v_inv)","=C$($RX.ev)+C$($RX.v_debt)+C$($RX.v_cash)+C$($RX.v_inv)",$DMM),
    @('v_sh','Diluted Shares Outstanding (M)',"=`$B`$$($RX.shares)","=`$B`$$($RX.shares)",$MM),
    @('px','IMPLIED PRICE PER SHARE',"=B$($RX.eqv)/B$($RX.v_sh)","=C$($RX.eqv)/C$($RX.v_sh)",$PS),
    @('v_cur','Current Share Price',"=`$B`$$($RX.price)","=`$B`$$($RX.price)",$PS),
    @('upside','Implied Upside / (Downside)',"=B$($RX.px)/B$($RX.v_cur)-1","=C$($RX.px)/C$($RX.v_cur)-1",$PCT),
    @('impl_pe','Implied EV / TTM EBIT (x)',"=B$($RX.ev)/`$F`$$($RX.ebit)","=C$($RX.ev)/`$F`$$($RX.ebit)",$XM))
  foreach ($x in $vs) { $bb = @('ev','eqv','px') -contains $x[0]; $st = if (@('ev','eqv','px','upside') -contains $x[0]) { 'out' } else { $null }
    put $D "A$($RX[$x[0]])" $x[1] $st $null $bb; put $D "B$($RX[$x[0]])" $x[2] $st $x[4] $bb; put $D "C$($RX[$x[0]])" $x[3] $st $x[4] $bb }
  put $D "D$($RX.tvpct)" "=IF(B$($RX.tvpct)>0.75,`"High TV reliance`",IF(B$($RX.tvpct)<0.4,`"Low TV share`",`"Within 40-75%`"))"

  # ---------- sensitivities ----------
  $fcfr = "`$G`$$($RX.dfcf):`$P`$$($RX.dfcf)"; $perr = "`$G`$$($RX.per):`$P`$$($RX.per)"
  $bridge = "-`$B`$$($RX.debt)+`$B`$$($RX.cash)+`$B`$$($RX.inv)"; $shares = "`$B`$$($RX.shares)"; $GRID = 'C','D','E','F','G'
  function pricef($w, $g) { "=(SUMPRODUCT($fcfr/(1+$w)^$perr)+`$P`$$($RX.dfcf)*(1+$g)/($w-$g)/(1+$w)^`$P`$$($RX.per)$bridge)/$shares" }
  function axis($base, $step) { 0..4 | % { $d = ($_ - 2) * $step; if ($d -eq 0) { "=$base" } elseif ($d -gt 0) { "=$base+$d" } else { "=$base-$([math]::Abs($d))" } } }
  function frame($t, $title, $axisLbl) { $s = $SENS[$t]; section $D $s.hdr $title 7; put $D "A$($s.axis)" $axisLbl $null $null $true; subhdr $D $s.colhdr 1 7; put $D "A$($s.colhdr)" 'Implied share price ($)'; $D["A$($s.colhdr)"].st = 'sub'; $s }
  # 1: WACC x terminal growth
  $s = frame 0 'SENSITIVITY 1: WACC (rows) vs. TERMINAL GROWTH (columns) — implied price per share' 'Rows: WACC | Columns: terminal growth'
  $ax = axis "`$G`$$($SEL.tg)" 0.005; for ($i = 0; $i -lt 5; $i++) { put $D "$($GRID[$i])$($s.colhdr)" $ax[$i] 'sub' $PCT $true }
  $ay = axis $wacc 0.01; for ($i = 0; $i -lt 5; $i++) { $rr = $s.rows[$i]; put $D "B$rr" $ay[$i] 'sub' $PCT2 $true; foreach ($col in $GRID) { put $D "$col$rr" (pricef "`$B$rr" "$col`$$($s.colhdr)") $null $PS } }
  $D["E$($s.rows[2])"].st = 'out'
  # 2: growth shift x margin shift
  $s = frame 1 'SENSITIVITY 2: REVENUE GROWTH (rows, +/- pp every year) vs. EBIT MARGIN (columns, +/- pp every year)' 'Rows: Δ growth | Columns: Δ EBIT margin'
  $steps = -0.10,-0.05,0.0,0.05,0.10
  for ($i = 0; $i -lt 5; $i++) { put $D "$($GRID[$i])$($s.colhdr)" $steps[$i] 'in' '+0.0%;-0.0%;0.0%' $true 'Sensitivity step: EBIT margin shift applied to every year.' }
  for ($i = 0; $i -lt 5; $i++) {
    $rr = $s.rows[$i]; put $D "B$rr" $steps[$i] 'in' '+0.0%;-0.0%;0.0%' $true 'Sensitivity step: revenue growth shift applied to every year.'
    $h = $RX.helper_rows[$i]; $RevR = "`$G`$$($h):`$P`$$h"; $RevP = "`$F`$$($h):`$O`$$h"
    $m = "`$G`$$($SEL.margin):`$P`$$($SEL.margin)"; $t_ = "`$G`$$($SEL.tax):`$P`$$($SEL.tax)"; $da = "`$G`$$($SEL.da):`$P`$$($SEL.da)"; $cx = "`$G`$$($SEL.capex):`$P`$$($SEL.capex)"; $nw = "`$G`$$($SEL.nwc):`$P`$$($SEL.nwc)"
    $tg = "`$G`$$($SEL.tg)"
    foreach ($col in $GRID) {
      $dm = "$col`$$($s.colhdr)"
      $arr = "($RevR*(($m+$dm)*(1-$t_)+$da-$cx-$nw)+$RevP*$nw)"
      $f10 = "(`$P`$$h*((`$P`$$($SEL.margin)+$dm)*(1-`$P`$$($SEL.tax))+`$P`$$($SEL.da)-`$P`$$($SEL.capex)-`$P`$$($SEL.nwc))+`$O`$$h*`$P`$$($SEL.nwc))"
      put $D "$col$rr" "=(SUMPRODUCT($arr/(1+$wacc)^$perr)+$f10*(1+$tg)/($wacc-$tg)/(1+$wacc)^`$P`$$($RX.per)$bridge)/$shares" $null $PS
    }
  }
  $D["E$($s.rows[2])"].st = 'out'
  # 3: beta x risk-free
  $s = frame 2 'SENSITIVITY 3: BETA (rows) vs. RISK-FREE RATE (columns) — WACC rebuilt via CAPM' 'Rows: adjusted beta | Columns: 10Y UST yield'
  $ax = axis "WACC!`$B`$$($WX.rf)" 0.005; for ($i = 0; $i -lt 5; $i++) { put $D "$($GRID[$i])$($s.colhdr)" $ax[$i] 'link' $PCT2 $true }
  $ay = axis "WACC!`$B`$$($WX.beta)" 0.2
  for ($i = 0; $i -lt 5; $i++) { $rr = $s.rows[$i]; put $D "B$rr" $ay[$i] 'link' $MULT $true
    foreach ($col in $GRID) { $wf = "(WACC!`$B`$$($WX.we)*($col`$$($s.colhdr)+`$B$rr*WACC!`$B`$$($WX.erp))+WACC!`$B`$$($WX.wd)*WACC!`$C`$$($WX.wd)+`$G`$$($SEL.wadj))"; put $D "$col$rr" (pricef $wf "`$G`$$($SEL.tg)") 'link' $PS } }
  $D["E$($s.rows[2])"].st = 'out'
  # 4: WACC x exit multiple
  $s = frame 3 'SENSITIVITY 4: WACC (rows) vs. EXIT EV/EBITDA MULTIPLE (columns) — implied price per share' 'Rows: WACC | Columns: exit multiple'
  $ax = axis "`$G`$$($SEL.exit)" 2; for ($i = 0; $i -lt 5; $i++) { put $D "$($GRID[$i])$($s.colhdr)" $ax[$i] 'sub' $XM $true }
  $ay = axis $wacc 0.01
  for ($i = 0; $i -lt 5; $i++) { $rr = $s.rows[$i]; put $D "B$rr" $ay[$i] 'sub' $PCT2 $true
    foreach ($col in $GRID) { put $D "$col$rr" "=(SUMPRODUCT($fcfr/(1+`$B$rr)^$perr)+`$P`$$($RX.ebitda)*$col`$$($s.colhdr)/(1+`$B$rr)^(`$P`$$($RX.per)+0.5)$bridge)/$shares" $null $PS } }
  $D["E$($s.rows[2])"].st = 'out'
  # helper
  section $D $RX.helper 'SENSITIVITY 2 HELPER — revenue paths under each growth shift ($M)' $LAST
  put $D "A$($RX.helper_cols)" 'Growth shift'; put $D "F$($RX.helper_cols)" 'TTM Jul-26'; for ($j = 0; $j -lt 10; $j++) { put $D "$($PROJ[$j])$($RX.helper_cols)" $PROJ_LBL[$j] }; subhdr $D $RX.helper_cols 1 $LAST
  $hl = '-10.0% growth shift','-5.0% growth shift','+0.0% growth shift','+5.0% growth shift','+10.0% growth shift'
  for ($i = 0; $i -lt 5; $i++) { $h = $RX.helper_rows[$i]; put $D "A$h" $hl[$i]; put $D "B$h" "=`$B`$$($SENS[1].rows[$i])" $null '+0.0%;-0.0%;0.0%'; put $D "F$h" "=`$F`$$($RX.rev)" $null $MM
    for ($j = 0; $j -lt 10; $j++) { $col = $PROJ[$j]; $prev = if ($j -eq 0) { 'F' } else { $PROJ[$j - 1] }; put $D "$col$h" "=$prev$h*(1+$col`$$($SEL.growth)+`$B$h)" $null $MM } }

  # ---------- WACC sheet ----------
  put $Wc 'A1' 'NVIDIA Corporation (NVDA) — Weighted Average Cost of Capital' $null $null $true
  put $Wc 'A2' 'Blue on grey = input, black = formula, green = link to the DCF sheet. Gross-debt weighting (NVDA is net cash).'
  section $Wc 4 'COST OF EQUITY (CAPM)' 4
  put $Wc "A$($WX.rf)" 'Risk-Free Rate (10Y UST yield)'; put $Wc "B$($WX.rf)" 0.0498 'in' $PCT2 $false 'Yahoo Finance ^TNX, retrieved 2026-11-11: 4.983%.'
  put $Wc "A$($WX.beta_raw)" 'Raw Beta (5Y monthly vs. S&P 500)'; put $Wc "B$($WX.beta_raw)" 2.247 'in' $MULT $false "$YF. 5-year monthly beta."
  put $Wc "A$($WX.beta)" 'Adjusted Beta (Blume: 0.67 x raw + 0.33)'; put $Wc "B$($WX.beta)" "=0.67*B$($WX.beta_raw)+0.33" $null $MULT
  put $Wc "A$($WX.erp)" 'Equity Risk Premium'; put $Wc "B$($WX.erp)" 0.05 'in' $PCT2 $false 'Analyst assumption: 5.0%, within the 5-6% market-standard range.'
  put $Wc "A$($WX.coe)" 'Cost of Equity' $null $null $true; put $Wc "B$($WX.coe)" "=B$($WX.rf)+B$($WX.beta)*B$($WX.erp)" $null $PCT2 $true
  section $Wc 11 'COST OF DEBT' 4
  put $Wc "A$($WX.rating)" "Senior Unsecured Rating (S&P / Moody's)"; put $Wc "B$($WX.rating)" 'AA- / Aa2' 'in' $null $false 'S&P / Moody''s issuer ratings as last reported (verify before external use).'
  put $Wc "A$($WX.kd)" 'Pre-Tax Cost of Debt'; put $Wc "B$($WX.kd)" 0.054 'in' $PCT2 $false 'Analyst estimate: 10Y UST 4.98% + ~40-50bp AA spread.'
  put $Wc "A$($WX.tax)" 'Tax Rate (selected case, Year 1)'; put $Wc "B$($WX.tax)" "=DCF!G$($SEL.tax)" 'link' $PCT
  put $Wc "A$($WX.kd_at)" 'After-Tax Cost of Debt' $null $null $true; put $Wc "B$($WX.kd_at)" "=B$($WX.kd)*(1-B$($WX.tax))" $null $PCT2 $true
  section $Wc 17 'CAPITAL STRUCTURE (market values, $M)' 4
  $csr = @(@('px','Current Share Price ($)',"=DCF!B$($RX.price)",'link',$PS), @('sh','Diluted Shares Outstanding (M)',"=DCF!B$($RX.shares)",'link',$MM),
    @('mcap','Market Capitalization',"=B$($WX.px)*B$($WX.sh)",$null,$DMM), @('debt','Total Debt',"=DCF!B$($RX.debt)",'link',$DMM),
    @('cash','Cash & Marketable Debt Securities',"=DCF!B$($RX.cash)",'link',$DMM), @('netdebt','Net Debt / (Net Cash)',"=B$($WX.debt)-B$($WX.cash)",$null,$DMM),
    @('cap','Total Capital (Equity + Gross Debt)',"=B$($WX.mcap)+B$($WX.debt)",$null,$DMM))
  foreach ($x in $csr) { put $Wc "A$($WX[$x[0]])" $x[1]; put $Wc "B$($WX[$x[0]])" $x[2] $x[3] $x[4] }
  section $Wc 25 'WACC CALCULATION' 4
  put $Wc "A$($WX.wh)" 'Component'; put $Wc "B$($WX.wh)" 'Weight'; put $Wc "C$($WX.wh)" 'Cost'; put $Wc "D$($WX.wh)" 'Contribution'; subhdr $Wc $WX.wh 1 4
  put $Wc "A$($WX.we)" 'Equity'; put $Wc "B$($WX.we)" "=B$($WX.mcap)/B$($WX.cap)" $null $PCT; put $Wc "C$($WX.we)" "=B$($WX.coe)" $null $PCT2; put $Wc "D$($WX.we)" "=B$($WX.we)*C$($WX.we)" $null $PCT2
  put $Wc "A$($WX.wd)" 'Debt'; put $Wc "B$($WX.wd)" "=B$($WX.debt)/B$($WX.cap)" $null $PCT; put $Wc "C$($WX.wd)" "=B$($WX.kd_at)" $null $PCT2; put $Wc "D$($WX.wd)" "=B$($WX.wd)*C$($WX.wd)" $null $PCT2
  put $Wc "A$($WX.wacc)" 'WEIGHTED AVERAGE COST OF CAPITAL' 'out' $null $true; put $Wc "B$($WX.wacc)" "=D$($WX.we)+D$($WX.wd)" 'out' $PCT2 $true
  put $Wc "A$($WX.wacc + 1)" 'Case adjustment applied on the DCF sheet (Bear +1.0% / Base 0 / Bull -1.0%)'

  return @{ DCF = $D; WACC = $Wc; R = $RX; SEL = $SEL; blocks = $blocks; SENS = $SENS; W = $WX; PROJ = $PROJ; HIST = $HIST; ASSUMP = $ASSUMP; SINGLE = $SINGLE }
}

function ConvertTo-SheetBlock {
  # Cells -> one ```json block. $Rows: row numbers to include (null = all). $Blank: refs or 'rowN' or 'rowN:C-P' to make yellow.
  param($Cells, [string]$Tab, [string]$Title, [string]$Task, [int]$Cols, [int]$Rows, [hashtable]$Width, [int[]]$OnlyRows = $null, [string[]]$Blank = @(), [hashtable]$Override = @{}, [string[]]$ExcludeRefs = @(), [scriptblock]$Keep = $null)
  $out = [ordered]@{}
  foreach ($ref in $Cells.Keys) {
    $rn = [int]($ref -replace '^[A-Z]+', ''); $cn = $ref -replace '\d+$', ''
    if ($OnlyRows -and ($OnlyRows -notcontains $rn)) { continue }
    if ($ExcludeRefs -contains $ref) { continue }
    if ($Keep -and -not (& $Keep $ref $rn $cn)) { continue }
    $c = [ordered]@{}; foreach ($k in $Cells[$ref].Keys) { $c[$k] = $Cells[$ref][$k] }
    $isBlank = ($Blank -contains $ref)
    foreach ($bspec in $Blank) { if ($bspec -match '^row(\d+)(?::([A-Z])-([A-Z]))?$') { if ([int]$Matches[1] -eq $rn) { if (-not $Matches[2] -or ([int][char]$cn -ge [int][char]$Matches[2] -and [int][char]$cn -le [int][char]$Matches[3] -and $cn.Length -eq 1)) { $isBlank = $true } } } }
    if ($isBlank -and $c.v -like '=*') { $c.sol = $c.v; $c.v = ''; $c.ans = 1; $c.Remove('st'); $c.Remove('note') }
    if ($Override.ContainsKey($ref)) { $c.v = $Override[$ref] }
    $out[$ref] = $c
  }
  $w = [ordered]@{}; foreach ($k in ($Width.Keys | Sort-Object)) { $w[$k] = $Width[$k] }
  $obj = [ordered]@{ tab = $Tab; title = $Title; task = $Task; cols = $Cols; rows = $Rows; width = $w; cells = $out }
  $json = ($obj | ConvertTo-Json -Depth 6 -Compress)
  $bs = [string][char]92; $json = $json.Replace($bs + 'u0027', "'").Replace($bs + 'u0026', '&').Replace($bs + 'u003c', '<').Replace($bs + 'u003e', '>')
  $json = $json -replace '\},"([A-Z]+\d+)":', ("},`n" + '"$1":')
  return $json
}
