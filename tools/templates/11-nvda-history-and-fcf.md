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
<<DCF>>
```
Key values: D77 → ? · E77 → ? · F77 → ? · F78 → ? · F81 → ? · E90 → ? · E91 → ? · F92 → ? · E72 → ? · E88 → ?

## 4. Practice (in the Sheet; Claude reads the cells to check)

Task: fill the yellow cells in columns D, E and F with the same formulas as column C (copy them right), plus growth, working capital % and FCF for FY25 and FY26.

Every yellow cell's model formula is stored with it (`sol`); any formula giving the same value is fine.

## Sources for the inputs
NVIDIA FY24 10-K (FYE 2024-01-28); NVIDIA Q4 & FY26 earnings release (2026-02-25); TTM = sum of the quarters Q3 FY26 to Q2 FY27 from the earnings releases (latest: Q2 FY27, 2026-08-26). Tax rates are income tax ÷ pre-tax income from the same documents. Figures as of the model date, 2026-11-11.
