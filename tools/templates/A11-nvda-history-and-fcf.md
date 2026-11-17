# Lesson A11: A real company — history and free cash flow (NVIDIA as the example)

**Time:** about 40 min · **Needs:** lesson A10
**Goal:** build NVIDIA's historical income statement memo, margins, NOPAT and unlevered FCF for FY24A–TTM from the reported figures.

**Lessons A11–A16 build one model in one Sheet** (NVIDIA as the worked example, or the company the learner chose) (tabs `DCF` and `WACC`): the layout of a professional bank model. Each lesson adds a section; if the Sheet exists, write only that section, otherwise build the whole block. Advanced pace: brief story, the terms they may not know, then build. Tabs: DCF.

---

## Choose the company (before anything else)

Offer two options in two lines: follow **NVIDIA**, the worked example with exact answer keys, or build this model for **any company the learner wants** (a listed company with public annual reports; US companies are easiest). If they pick their own, follow "Choosing the company" in SKILL.md: pull its history and market data, show the sources in chat, and build the same layout with their company's inputs. Tell this lesson's story with their company's numbers, and treat the key values below as NVIDIA's, for reference only.

## 0. Colour code (give this before the first build of this part)
- **Blue text on grey** = input typed from a source (every one is sourced below). **Black** = formula. **Green** = link to the other sheet.
- **Dark blue bar** = section header; **light blue-grey** = column headings; **light blue fill** = key outputs; **yellow** = your turn.

## 1. Story
The course company is now real: NVIDIA. Revenue went from $61B (FY24) to $303B over the last twelve months (TTM, the four latest quarters). Before forecasting, build the history: margins, tax on EBIT, NOPAT, reinvestment and unlevered FCF, so every forecast assumption can be anchored on it.

## 2. Terms
"TTM / LTM" (sum of the last four quarters) · "GAAP operating income" (reported EBIT) · "effective tax rate" (tax ÷ pre-tax income) · "historical memo" lines (gross profit, R&D, SG&A, shown for reference only).

## 3. Build
Every derived cell in columns C–F is yours: gross margin, EBIT (= gross profit − R&D − SG&A), EBIT margin, taxes on EBIT, NOPAT, D&A % and capex % of revenue, EBITDA, revenue growth (FY25, FY26), and ΔNWC % of Δrevenue, FCF and FCF margin (FY25, FY26). FY24 and TTM have "n/a" for working capital and FCF.

```json
<<DCF>>
```
Key values: C77 → ? · F77 → ? · F78 → ? · F81 → ? · D90 → ? · E90 → ? · E91 → ? · F92 → ? · E72 → ? · E88 → ?
Every yellow cell carries its model formula (`sol`).

## Sources
NVIDIA FY24 10-K; Q4 & FY26 earnings release (2026-02-25); TTM = Q3 FY26 to Q2 FY27 earnings releases (latest 2026-08-26). As of 2026-11-11.