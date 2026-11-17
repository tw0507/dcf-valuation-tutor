# Lesson A14: Stub, mid-year discounting and terminal value two ways

**Time:** about 45 min · **Needs:** lesson A13
**Goal:** discount ten years with a stub and mid-year convention, compute terminal value by Gordon growth and by an exit multiple, and cross-check each against the other.

**Lessons A11–A16 build one model in one Sheet** (NVIDIA as the worked example, or the company the learner chose) (tabs `DCF` and `WACC`): the layout of a professional bank model. Each lesson adds a section; if the Sheet exists, write only that section, otherwise build the whole block. Advanced pace: brief story, the terms they may not know, then build. Adds row 18 and rows 94–116. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson A11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story
The valuation date is 0.30 years after the last balance sheet, and cash arrives through each year: discount year t by t − 0.5 − 0.30. After year 10, value the business forever two ways and test each against the other.

## 2. Terms
"Stub" (years elapsed since the TTM end) · "discount period" · "Gordon TV" · "exit multiple TV" · "implied exit multiple" · "implied perpetual growth".

### Quick tutorial: the exit multiple
- TV = final-year EBITDA × an EV/EBITDA multiple: what a buyer would pay at the end of year 10. The multiple comes from comparable companies or past deals, usually trimmed for slower growth by year 10. NVIDIA trades near 20x TTM EBITDA; cases use 12x / 16x / 20x.
- A sale happens on a date: discount the exit TV from the **end** of year 10 (period + 0.5). The Gordon TV, as in the original model, is discounted from the final year's mid-point.
- Cross-check: implied g = (exit TV × WACC − FCF) ÷ (exit TV + FCF); implied multiple = Gordon TV ÷ EBITDA. In the base case 16x implies ~8.8% growth forever and 3.5% growth implies ~7.6x: a gap the learner should flag and explain (today's market optimism carried into year 10).

## 3. Build
Yours: B18 (stub, from the two dates), the discounting rows 96–100 for G–P (year #, FCF link, period, factor, PV; G96 is given), and every terminal-value cell B103–B116 plus the g < WACC check in C104.

```json
<<DCF>>
```
Key values (base case): B18 → ? · G98 → ? · P99 → ? · G100 → ? · B107 → ? · B109 → ? · B112 → ? · B114 → ? · B115 → ? · B116 → ?

```json
<<WACC>>
```
Every yellow cell carries its model formula (`sol`).