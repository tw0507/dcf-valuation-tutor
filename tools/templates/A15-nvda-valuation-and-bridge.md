# Lesson A15: Valuation summary and the equity bridge

**Time:** about 30 min · **Needs:** lesson A14
**Goal:** build the valuation summary for both terminal-value methods: enterprise value, TV share, the full equity bridge (debt, cash and marketable debt securities, equity investments), implied price, upside and implied EV/EBIT.

**Lessons A11–A16 build one model in one Sheet** (NVIDIA as the worked example, or the company the learner chose) (tabs `DCF` and `WACC`): the layout of a professional bank model. Each lesson adds a section; if the Sheet exists, write only that section, otherwise build the whole block. Advanced pace: brief story, the terms they may not know, then build. Adds rows 118–132. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson A11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story
NVIDIA holds $94B of stakes in other companies whose gains sit below EBIT, so they're not in FCF: they're added in the bridge. Debt comes off, cash and debt securities go on. Then divide by diluted shares and compare with the market price, once for each terminal-value method.

## 2. Terms
"Equity bridge" · "non-operating assets" · "implied upside" · "TV as % of EV" (above ~75% means the answer leans heavily on the terminal value).

## 3. Build
Yours: every formula in rows 120–132, columns B (Gordon) and C (exit), plus the TV-reliance flag in D123.

```json
<<DCF>>
```
Key values: B120 → ? · B122 → ? · C122 → ? · B123 → ? · B127 → ? · B129 → ? · C129 → ? · B131 → ? · C131 → ? · B132 → ?

```json
<<WACC>>
```
Every yellow cell carries its model formula (`sol`).