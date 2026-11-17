# Lesson 11: A real company — history and free cash flow (NVIDIA as the example)

**Time:** about 40 min · **Needs:** lesson 10
**Goal:** the learner reads NVIDIA's last three fiscal years and the trailing twelve months, and turns them into margins, NOPAT and unlevered free cash flow: the starting point of a professional 10-year DCF.

**Lessons 11–15 build one model in one Sheet** (tabs `DCF` and `WACC`), the same layout as a bank's model. Each lesson adds a section. Name the Sheet "<ticker> DCF" and keep using it; if the learner skipped here, build this lesson's block in full. Tabs: DCF.

---

## Choose the company (before anything else)

Offer two options in two lines: follow **NVIDIA**, the worked example with exact answer keys, or build this model for **any company the learner wants** (a listed company with public annual reports; US companies are easiest). If they pick their own, follow "Choosing the company" in SKILL.md: pull its history and market data, show the sources in chat, and build the same layout with their company's inputs. Tell this lesson's story with their company's numbers, and treat the key values below as NVIDIA's, for reference only.

## 0. Colour code (give this before the first build of Part 3)

Bankers colour every cell so anyone can audit a model at a glance. In this Sheet:
- **Blue text on grey** = an input typed from a source (a filing, a quote, or a stated assumption). Every one has a source (listed below each lesson).
- **Black** = a formula on this sheet.
- **Green** = a link to the other sheet (DCF ↔ WACC).
- **Dark blue bar** = section header. **Light blue-grey row** = column headings. **Light blue fill** = a key output (enterprise value, equity value, price).
- **Yellow** = your turn: type a formula.

## 1. Story (no jargon)

Maya's taco company was practice. Now a real one: NVIDIA, the chipmaker behind most AI computers. Its sales went from about $61 billion three years ago to about $303 billion over the last twelve months. A DCF of NVIDIA asks the same question as Maya's: how much cash will this business produce, and what is that worth today?

We start where every analyst starts: the history. We take what the company reported, and work out the same things as for Maya: how much of each sales dollar is left as operating profit, the tax on it, and the cash left after investing in equipment and working capital.

One new idea: the latest annual report is months old. So analysts also use the **last twelve months** (the four most recent quarters added up) to get the freshest picture.

## 2. Terms

| Term | Meaning |
|---|---|
| "Fiscal year" ("FY") | NVIDIA's year ends in late January: FY26 ended January 2026 |
| "TTM" (trailing twelve months, also "LTM") | the last four quarters added together: here to 26 July 2026 |
| "GAAP operating income" | EBIT as reported under US accounting rules |
| "Effective tax rate" | income tax ÷ pre-tax income, as reported |
| "Historical memo" lines | figures shown for reference (gross profit, R&D, SG&A); the forecast won't project them line by line |

## 3. Worked example

Build the Sheet with the block below. Column C (FY24A) is filled in as the worked example: walk down it — gross margin, EBIT = gross profit − R&D − SG&A, tax on EBIT, NOPAT, D&A and capex as % of revenue, EBITDA. Note FY24 and TTM have "n/a" for working capital and FCF: the matching prior-year balances aren't in the sheet.

```json
{"tab":"DCF","title":"Lesson 11 · NVDA DCF: history and free cash flow","task":"Column C is the worked example. Fill the yellow cells in D-F with the same formulas (copy right).","cols":16,"rows":177,"width":{"A":300,"B":95,"C":85,"D":85,"E":85,"F":85,"G":85,"H":85,"I":85,"J":85,"K":85,"L":85,"M":85,"N":85,"O":85,"P":85},"cells":{"A1":{"v":"NVIDIA Corporation (NVDA) — Discounted Cash Flow Model","b":1},
"A2":{"v":"Ticker: NVDA (NasdaqGS) | Valuation date: 2026-11-11 | Fiscal year end: last Sunday of January | Base period: TTM to 2026-07-26 (Q2 FY27)"},
"A3":{"v":"$ in millions except per-share data. Blue on grey = input (with source), black = formula, green = link to the WACC sheet."},
"A69":{"v":"HISTORICAL & PROJECTED FINANCIALS / UNLEVERED FREE CASH FLOW ($M)","b":1,"st":"hdr"},
"B69":{"v":"","st":"hdr"},
"C69":{"v":"","st":"hdr"},
"D69":{"v":"","st":"hdr"},
"E69":{"v":"","st":"hdr"},
"F69":{"v":"","st":"hdr"},
"A70":{"v":"Fiscal period","st":"sub","b":1},
"C70":{"v":"FY24A","st":"sub","b":1},
"D70":{"v":"FY25A","st":"sub","b":1},
"E70":{"v":"FY26A","st":"sub","b":1},
"F70":{"v":"TTM Jul-26","st":"sub","b":1},
"B70":{"v":"","st":"sub","b":1},
"A71":{"v":"Revenue","b":1},
"A72":{"v":"  % growth"},
"A73":{"v":"Gross Profit (historical memo)"},
"A74":{"v":"  % gross margin"},
"A75":{"v":"Research & Development (historical memo)"},
"A76":{"v":"Sales, General & Admin (historical memo)"},
"A77":{"v":"EBIT (GAAP operating income)","b":1},
"A78":{"v":"  % EBIT margin"},
"A79":{"v":"  Tax rate"},
"A80":{"v":"(-) Taxes on EBIT"},
"A81":{"v":"NOPAT","b":1},
"A83":{"v":"(+) D&A"},
"A84":{"v":"  % of revenue"},
"A85":{"v":"(-) CapEx"},
"A86":{"v":"  % of revenue"},
"A87":{"v":"(-) Increase in NWC"},
"A88":{"v":"  % of Δ revenue"},
"A90":{"v":"Unlevered Free Cash Flow","b":1},
"A91":{"v":"  % FCF margin"},
"A92":{"v":"Memo: EBITDA (EBIT + D&A)"},
"C71":{"v":"60922","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28)"},
"C73":{"v":"44301","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28)"},
"C75":{"v":"8675","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28)"},
"C76":{"v":"2654","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28)"},
"C83":{"v":"1508","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28)"},
"C85":{"v":"1069","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28)"},
"C74":{"v":"=C73/C71","f":"0.0%;(0.0%);\"-\""},
"C77":{"v":"=C73-C75-C76","f":"#,##0;(#,##0);\"-\""},
"C78":{"v":"=C77/C71","f":"0.0%;(0.0%);\"-\""},
"C79":{"v":"=4058/33818","f":"0.0%;(0.0%);\"-\"","st":"in","note":"NVIDIA FY24 10-K (FYE 2024-01-28): income tax / pretax income."},
"C80":{"v":"=C77*C79","f":"#,##0;(#,##0);\"-\""},
"C81":{"v":"=C77-C80","f":"#,##0;(#,##0);\"-\""},
"C84":{"v":"=C83/C71","f":"0.0%;(0.0%);\"-\""},
"C86":{"v":"=C85/C71","f":"0.0%;(0.0%);\"-\""},
"C92":{"v":"=C77+C83","f":"#,##0;(#,##0);\"-\""},
"D71":{"v":"130497","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"D73":{"v":"97858","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"D75":{"v":"12914","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"D76":{"v":"3491","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"D83":{"v":"1864","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"D85":{"v":"3236","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"D74":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D73/D71","ans":1},
"D77":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=D73-D75-D76","ans":1},
"D78":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D77/D71","ans":1},
"D79":{"v":"=11146/84026","f":"0.0%;(0.0%);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25: income tax / pretax income."},
"D80":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=D77*D79","ans":1},
"D81":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=D77-D80","ans":1},
"D84":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D83/D71","ans":1},
"D86":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D85/D71","ans":1},
"D92":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=D77+D83","ans":1},
"E71":{"v":"215938","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"E73":{"v":"153463","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"E75":{"v":"18497","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"E76":{"v":"4579","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"E83":{"v":"2843","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"E85":{"v":"6042","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25"},
"E74":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E73/E71","ans":1},
"E77":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=E73-E75-E76","ans":1},
"E78":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E77/E71","ans":1},
"E79":{"v":"=21383/141450","f":"0.0%;(0.0%);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25: income tax / pretax income."},
"E80":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=E77*E79","ans":1},
"E81":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=E77-E80","ans":1},
"E84":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E83/E71","ans":1},
"E86":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E85/E71","ans":1},
"E92":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=E77+E83","ans":1},
"F71":{"v":"302969","f":"#,##0;(#,##0);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)"},
"F73":{"v":"226241","f":"#,##0;(#,##0);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)"},
"F75":{"v":"23592","f":"#,##0;(#,##0);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)"},
"F76":{"v":"5070","f":"#,##0;(#,##0);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)"},
"F83":{"v":"3688","f":"#,##0;(#,##0);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)"},
"F85":{"v":"7355","f":"#,##0;(#,##0);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27)"},
"F74":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=F73/F71","ans":1},
"F77":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=F73-F75-F76","ans":1},
"F78":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=F77/F71","ans":1},
"F79":{"v":"=36864/229743","f":"0.0%;(0.0%);\"-\"","st":"in","note":"Sum of the last four quarters (earnings releases Q3 FY26 to Q2 FY27): income tax / pretax income."},
"F80":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=F77*F79","ans":1},
"F81":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=F77-F80","ans":1},
"F84":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=F83/F71","ans":1},
"F86":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=F85/F71","ans":1},
"F92":{"v":"","f":"#,##0;(#,##0);\"-\"","sol":"=F77+F83","ans":1},
"C72":{"v":"=C71/26974-1","f":"0.0%;(0.0%);\"-\"","st":"in","note":"NVIDIA FY24 10-K: FY23 revenue 26,974 is the prior-year base."},
"D72":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D71/C71-1","ans":1},
"E72":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E71/D71-1","ans":1},
"F72":{"v":"=F71/165218-1","f":"0.0%;(0.0%);\"-\"","st":"in","note":"Prior-year TTM revenue 165,218 (Q3 FY25 to Q2 FY26, earnings releases)."},
"D87":{"v":"9383","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25. FY25 change in operating assets & liabilities: net use 9,383."},
"D88":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D87/(D71-C71)","ans":1},
"D90":{"v":"","b":1,"f":"#,##0;(#,##0);\"-\"","sol":"=D81+D83-D85-D87","ans":1},
"D91":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=D90/D71","ans":1},
"E87":{"v":"15949","f":"#,##0;(#,##0);\"-\"","st":"in","note":"NVIDIA Q4 & FY26 earnings release, 2026-02-25. FY26 change in operating assets & liabilities: net use 15,949."},
"E88":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E87/(E71-D71)","ans":1},
"E90":{"v":"","b":1,"f":"#,##0;(#,##0);\"-\"","sol":"=E81+E83-E85-E87","ans":1},
"E91":{"v":"","f":"0.0%;(0.0%);\"-\"","sol":"=E90/E71","ans":1},
"C87":{"v":"n/a"},
"C90":{"v":"n/a"},
"F87":{"v":"n/a"},
"F90":{"v":"n/a"}}}
```
Key values: D77 → 81,453 · E77 → 130,387 · F77 → 197,579 · F78 → 65.2% · F81 → 165,876 · E90 → 91,528 · E91 → 42.4% · F92 → 201,267 · E72 → 65.5% · E88 → 18.7%

## 4. Practice (in the Sheet; Claude reads the cells to check)

Task: fill the yellow cells in columns D, E and F with the same formulas as column C (copy them right), plus growth, working capital % and FCF for FY25 and FY26.

Every yellow cell's model formula is stored with it (`sol`); any formula giving the same value is fine.

## Sources for the inputs
NVIDIA FY24 10-K (FYE 2024-01-28); NVIDIA Q4 & FY26 earnings release (2026-02-25); TTM = sum of the quarters Q3 FY26 to Q2 FY27 from the earnings releases (latest: Q2 FY27, 2026-08-26). Tax rates are income tax ÷ pre-tax income from the same documents. Figures as of the model date, 2026-11-11.
