# Lesson A12: Ten-year forecast with three cases

**Time:** about 60 min · **Needs:** lesson A11
**Goal:** build the case selector, the Selected Case block with `CHOOSE`, and the full 10-year projection to unlevered FCF and EBITDA.

**Lessons A11–A16 build one model in one Sheet** (NVIDIA as the worked example, or the company the learner chose) (tabs `DCF` and `WACC`): the layout of a professional bank model. Each lesson adds a section; if the Sheet exists, write only that section, otherwise build the whole block. Advanced pace: brief story, the terms they may not know, then build. Adds rows 5–6, 20–66 and columns G–P of rows 71–92. Tabs: DCF.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson A11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story
Three stories for NVIDIA: base (consensus +75% next year, fading to 3.5%; margins easing from 65% to 48%), bear (an AI-spending pause), bull (a longer boom). Ten years, because growth needs that long to settle before a terminal value is credible. One switch picks the story.

## 2. Terms
"Case selector" · `CHOOSE(n, bear, base, bull)` · "Selected case" block · "explicit forecast period" · "fade".

## 3. Build
The three case blocks are given (inputs). Yours: B6 (the active case's name, with `CHOOSE`), the whole Selected Case block (rows 58–66; rows 64–66 only in column G), and every projection cell G–P in rows 71–92: revenue = prior × (1 + growth), EBIT = revenue × margin, tax, NOPAT, D&A, capex, ΔNWC = Δrevenue × NWC %, unlevered FCF, FCF margin, EBITDA. One formula per row, copied right.

```json
<<DCF>>
```
Key values (base case, B5 = 2): G58 → ? · G71 → ? · G77 → ? · G87 → ? · G90 → ? · P71 → ? · P90 → ? · P92 → ? · G65 → ?
Every yellow cell carries its model formula (`sol`). Then flip B5 to 1 and 3.

## Sources
Analyst assumptions dated 2026-11-11, anchored on consensus Year-1 revenue (Yahoo Finance), TTM EBIT margin 65.2%, TTM tax 16.0%, TTM D&A 1.2% and capex 2.4% of revenue, FY25–FY26 ΔNWC 13.5–18.7% of Δrevenue; exit multiples below today's ~20x EBITDA.