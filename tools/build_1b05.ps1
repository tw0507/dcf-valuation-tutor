# Generates the sheet blocks for lessons/1b-05-balancing-the-model.md
. (Join-Path $PSScriptRoot 'gen_model.ps1')
$lesson = Join-Path (Split-Path $PSScriptRoot -Parent) 'valuation-tutor\lessons\1b-05-balancing-the-model.md'

$spec = @(
  @{r=4; a='Assumptions'; bold=1; cols=''},
  @{r=5; a='Revenue growth'; fmt='pct'; v=@{C='12%';D='10%';E='8%'}},
  @{r=6; a='COGS % of revenue'; fmt='pct'; v=@{C='30%';D='30%';E='30%'}},
  @{r=7; a='OpEx % of revenue'; fmt='pct'; v=@{C='46%';D='45%';E='45%'}},
  @{r=8; a='Receivable days'; v=@{C='30';D='30';E='30'}},
  @{r=9; a='Inventory days'; v=@{C='10';D='10';E='10'}},
  @{r=10; a='Payable days'; v=@{C='20';D='20';E='20'}},
  @{r=11; a='Capex % of revenue'; fmt='pct'; v=@{C='8%';D='7%';E='6%'}},
  @{r=12; a='Depreciation of existing trucks per year'; B='24000'; cols=''},
  @{r=13; a='Useful life of new equipment (years)'; B='8'; cols=''},
  @{r=14; a='Term loan repayment per year'; B='20000'; cols=''},
  @{r=15; a='Term loan interest rate (on opening balance)'; B='7%'; cols=''},
  @{r=16; a='Tax rate'; B='25%'; cols=''},
  @{r=17; a='Dividends (% of net income)'; B='30%'; cols=''},
  @{r=18; a='Days in a year'; B='365'; cols=''},
  @{r=20; a='Income statement'; bold=1; cols=''},
  @{r=21; a='Revenue'; B='540000'; f='={p}21*(1+{c}5)'},
  @{r=22; a='(-) Cost of goods sold'; B='162000'; f='={c}21*{c}6'},
  @{r=23; a='Gross profit'; B='=B21-B22'; f='={c}21-{c}22'},
  @{r=24; a='(-) Operating expenses'; B='253800'; f='={c}21*{c}7'},
  @{r=25; a='EBITDA'; B='=B23-B24'; f='={c}23-{c}24'},
  @{r=26; a='(-) Depreciation'; f='={c}42'},
  @{r=27; a='EBIT'; f='={c}25-{c}26'},
  @{r=28; a='(-) Interest expense'; f='={c}49'},
  @{r=29; a='Pre-tax income'; f='={c}27-{c}28'},
  @{r=30; a='(-) Income tax'; f='={c}29*$B$16'},
  @{r=31; a='Net income'; bold=1; f='={c}29-{c}30'},
  @{r=33; a='Working capital'; bold=1; cols=''},
  @{r=34; a='Accounts receivable'; B='44400'; f='={c}21*{c}8/$B$18'},
  @{r=35; a='Inventory'; B='4500'; f='={c}22*{c}9/$B$18'},
  @{r=36; a='Accounts payable'; B='8900'; f='={c}22*{c}10/$B$18'},
  @{r=37; a='Net working capital'; B='=B34+B35-B36'; f='={c}34+{c}35-{c}36'},
  @{r=38; a='Increase in NWC'; f='={c}37-{p}37'},
  @{r=40; a='Fixed assets'; bold=1; cols=''},
  @{r=41; a='Capex'; f='={c}21*{c}11'},
  @{r=42; a='Depreciation (existing + all new capex / life)'; f='=$B$12+SUM($C$41:{c}41)/$B$13'},
  @{r=43; a='Net PP&E'; B='96000'; f='={p}43+{c}41-{c}42'},
  @{r=45; a='Debt'; bold=1; cols=''},
  @{r=46; a='Opening term loan'; f='={p}48'},
  @{r=47; a='(-) Repayment'; f='=MIN($B$14,{c}46)'},
  @{r=48; a='Closing term loan'; B='80000'; f='={c}46-{c}47'},
  @{r=49; a='Interest expense (on opening)'; f='={c}46*$B$15'},
  @{r=51; a='Cash flow statement'; bold=1; cols=''},
  @{r=52; a='Net income'; f='={c}31'},
  @{r=53; a='(+) Depreciation'; f='={c}26'},
  @{r=54; a='(-) Increase in NWC'; f='={c}38'},
  @{r=55; a='Cash from operations'; bold=1; f='={c}52+{c}53-{c}54'},
  @{r=56; a='(-) Capex'; f='={c}41'},
  @{r=57; a='Cash from investing'; bold=1; f='=-{c}56'},
  @{r=58; a='(-) Loan repaid'; f='={c}47'},
  @{r=59; a='(-) Dividends'; f='={c}31*$B$17'},
  @{r=60; a='Cash from financing'; bold=1; f='=-{c}58-{c}59'},
  @{r=61; a='Net change in cash'; bold=1; f='={c}55+{c}57+{c}60'},
  @{r=63; a='Balance sheet'; bold=1; cols=''},
  @{r=64; a='Cash'; B='60000'; f='={p}64+{c}61'},
  @{r=65; a='Accounts receivable'; B='=B34'; f='={c}34'},
  @{r=66; a='Inventory'; B='=B35'; f='={c}35'},
  @{r=67; a='Net PP&E'; B='=B43'; f='={c}43'},
  @{r=68; a='Total assets'; bold=1; B='=SUM(B64:B67)'; f='=SUM({c}64:{c}67)'},
  @{r=69; a='Accounts payable'; B='=B36'; f='={c}36'},
  @{r=70; a='Term loan'; B='=B48'; f='={c}48'},
  @{r=71; a='Common stock'; B='50000'; f='={p}71'},
  @{r=72; a='Retained earnings'; B='66000'; f='={p}72+{c}31-{c}59'},
  @{r=73; a='Total liabilities + equity'; bold=1; B='=SUM(B69:B72)'; f='=SUM({c}69:{c}72)'},
  @{r=74; a='Check (should be 0)'; B='=ROUND(B68-B73,2)'; f='=ROUND({c}68-{c}73,2)'}
)
$hdr = @{ B3 = '2025A'; C3 = '2026E'; D3 = '2027E'; E3 = '2028E' }
$w = @{ A = 300; B = 95; C = 95; D = 95; E = 95 }
$blocks = @{}
$blocks['WE'] = New-SheetJson -Tab 'Worked Example' -Title "Lesson 1b-05 · Worked example: Maya's Tacos Co. linked model" -Task "One tab, every schedule and all three statements, linked. Assumptions are blue; everything else is a formula. Change any assumption and the check row stays 0." -Rows 74 -Spec $spec -Header $hdr -Width $w -A1 "Maya's Tacos Co.: linked model ($)"
$links = foreach ($r in 26, 28, 52, 53, 54, 58, 59, 64, 67, 70, 72, 74) { foreach ($c in 'C', 'D', 'E') { "$c$r" } }
$blocks['R1'] = New-SheetJson -Tab 'Rung 1' -Title "Rung 1 · Wire up the links" -Task "Every schedule is built. Twelve links between them are missing (yellow). Fill them with formulas in 2026E and copy right. The check must be 0 in every year." -Rows 74 -Spec $spec -Header $hdr -Width $w -A1 "Maya's Tacos Co.: linked model ($)" -Blank $links
$cf = foreach ($r in 52..61) { foreach ($c in 'C', 'D', 'E') { "$c$r" } }
$cf += 'C64', 'D64', 'E64'
$blocks['R2'] = New-SheetJson -Tab 'Rung 2' -Title "Rung 2 · Build the cash flow statement" -Task "Build the cash flow statement (rows 52-61) and the cash line (row 64) with formulas.`nHints: start from net income; add back depreciation; subtract the increase in NWC; capex and loan repayment are outflows; dividends are 30% of net income. Cash = last year's cash + net change." -Rows 74 -Spec $spec -Header $hdr -Width $w -A1 "Maya's Tacos Co.: linked model ($)" -Blank $cf
$bugs = @{}
foreach ($c in 'C', 'D', 'E') { $bugs["${c}36"] = "=${c}21*${c}10/`$B`$18"; $bugs["${c}53"] = "=${c}41" }
$bugs['C72'] = '=B72+C31'; $bugs['D72'] = '=C72+D31'; $bugs['E72'] = '=D72+E31'
$blocks['R4'] = New-SheetJson -Tab 'Rung 4' -Title "Rung 4 · Bug hunt" -Task "This model has three bugs and no wrong inputs. Two of them break the balance check; one doesn't (a model can balance and still be wrong). Find and fix all three. No plugs." -Rows 74 -Spec $spec -Header $hdr -Width $w -A1 "Maya's Tacos Co.: linked model ($)" -Override $bugs
$leoSpec = @(
  @{r=3; a='Inputs'; bold=1},
  @{r=4; a='Revenue growth'; B='8%'}, @{r=5; a='COGS % of revenue'; B='30%'}, @{r=6; a='Rent & wages, 2025A'; B='50000'},
  @{r=7; a='Rent & wages growth'; B='4%'}, @{r=8; a='Receivable days'; B='5'}, @{r=9; a='Inventory days'; B='30'}, @{r=10; a='Payable days'; B='15'},
  @{r=11; a='Capex % of revenue'; B='5%'}, @{r=12; a='Depreciation % of opening net PP&E'; B='25%'},
  @{r=13; a="Uncle's loan repayment per year"; B='2000'}, @{r=14; a="Uncle's loan rate"; B='5%'},
  @{r=15; a='Equipment loan taken in 2026'; B='10000'}, @{r=16; a='Equipment loan repayment per year (from 2027)'; B='2000'}, @{r=17; a='Equipment loan rate'; B='8%'},
  @{r=18; a='Tax rate'; B='20%'}, @{r=19; a='Leo takes out each year'; B='8000'}, @{r=20; a='Days in a year'; B='365'},
  @{r=22; a='Revenue'; B='126000'; f='={p}22*(1+$B$4)'},
  @{r=23; a='(-) COGS'; f='={c}22*$B$5'},
  @{r=24; a='(-) Rent & wages'; B='=B6'; f='={p}24*(1+$B$7)'},
  @{r=25; a='(-) Depreciation'; f='={p}39*$B$12'},
  @{r=26; a='EBIT'; f='={c}22-{c}23-{c}24-{c}25'},
  @{r=27; a='(-) Interest'; f='={c}48+{c}49'},
  @{r=28; a='Pre-tax income'; f='={c}26-{c}27'},
  @{r=29; a='(-) Tax'; f='={c}28*$B$18'},
  @{r=30; a='Net income'; f='={c}28-{c}29'},
  @{r=32; a='Accounts receivable'; B='1500'; f='={c}22*$B$8/$B$20'},
  @{r=33; a='Inventory'; B='2600'; f='={c}23*$B$9/$B$20'},
  @{r=34; a='Accounts payable'; B='900'; f='={c}23*$B$10/$B$20'},
  @{r=35; a='Net working capital'; B='=B32+B33-B34'; f='={c}32+{c}33-{c}34'},
  @{r=36; a='Increase in NWC'; f='={c}35-{p}35'},
  @{r=38; a='Capex'; f='={c}22*$B$11'},
  @{r=39; a='Net PP&E'; B='6000'; f='={p}39+{c}38-{c}25'},
  @{r=41; a="Uncle's loan, closing"; B='4000'; f='={p}41-MIN($B$13,{p}41)'},
  @{r=42; a="Uncle's loan repaid"; f='={p}41-{c}41'},
  @{r=43; a='Equipment loan drawn'; v=@{C='=$B$15'; D='0'; E='0'}},
  @{r=44; a='Equipment loan repaid'; v=@{C='0'}; f='=MIN($B$16,{p}45)'},
  @{r=45; a='Equipment loan, closing'; B='0'; f='={p}45+{c}43-{c}44'},
  @{r=48; a="Uncle's loan interest (average)"; f='=({p}41+{c}41)/2*$B$14'},
  @{r=49; a='Equipment loan interest (average)'; f='=({p}45+{c}45)/2*$B$17'},
  @{r=51; a='Cash from operations'; f='={c}30+{c}25-{c}36'},
  @{r=52; a='Cash from investing'; f='=-{c}38'},
  @{r=53; a='Cash from financing'; f='={c}43-{c}42-{c}44-$B$19'},
  @{r=54; a='Net change in cash'; f='={c}51+{c}52+{c}53'},
  @{r=56; a='Cash'; B='39400'; f='={p}56+{c}54'},
  @{r=57; a='Total assets'; B='=B56+B32+B33+B39'; f='={c}56+{c}32+{c}33+{c}39'},
  @{r=58; a='Total liabilities + equity'; B='=B34+B41+B45+B60+B61'; f='={c}34+{c}41+{c}45+{c}60+{c}61'},
  @{r=59; a='Check'; B='=ROUND(B57-B58,2)'; f='=ROUND({c}57-{c}58,2)'},
  @{r=60; a='Paid-in capital'; B='10000'; f='={p}60'},
  @{r=61; a='Retained earnings'; B='34600'; f='={p}61+{c}30-$B$19'}
)
$blocks['R3S'] = New-SheetJson -Tab 'Rung 3 solution' -Title 'Rung 3 solution' -Task 'Reference solution' -Rows 61 -Spec $leoSpec -Header $hdr -Width $w
Set-LessonBlocks -Path $lesson -Blocks $blocks
"done"
