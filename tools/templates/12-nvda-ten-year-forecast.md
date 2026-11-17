# Lesson 12: A ten-year forecast with three cases

**Time:** about 55 min · **Needs:** lesson 11
**Goal:** the learner builds bear, base and bull assumption blocks, a case switch with `CHOOSE`, and a 10-year projection of revenue, EBIT, NOPAT, D&A, capex, working capital and unlevered free cash flow.

Adds to the DCF Sheet: the case selector (rows 5–6), the three case blocks (rows 20–54), the Selected Case block (rows 56–66), and the projection columns G–P of the financials (rows 71–92). If the Sheet from lesson 11 exists, write only these; otherwise build the whole block. Tabs: DCF.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson 11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story (no jargon)

Nobody knows how fast NVIDIA will grow. So instead of one guess, the analyst writes three stories. In the **base** case, growth follows what analysts expect next year (about +75%), then cools year by year to 3.5%, and margins slowly fall as competitors catch up. In the **bear** case, AI spending pauses, growth stalls for a couple of years and margins fall hard. In the **bull** case, growth stays strong for longer and margins hold up.

Why ten years, not five? Because NVIDIA is growing so fast now that after five years it's still far from "normal". The forecast has to run long enough for growth to settle down to something that could last forever — otherwise the terminal value does all the work.

One switch at the top picks the story. Every number below follows it.

## 2. Terms

| Term | Meaning |
|---|---|
| "Case" / "scenario" | a consistent set of assumptions: bear, base, bull |
| "Case selector" | one input cell (1, 2 or 3) that picks the case |
| `CHOOSE(n, a, b, c)` | returns a, b or c for n = 1, 2, 3 |
| "Selected case" block | the row the model actually uses, pulled from the chosen case |
| "Explicit forecast period" | the 10 projected years, before the terminal value |
| "Fade" | assumptions moving gradually toward a long-run level (growth to ~3.5%, margins down) |

## 3. Worked example

Already filled: the case blocks (inputs, each with its reasoning in the sources below), the **revenue growth** row of the Selected Case block (`=CHOOSE($B$5, G22, G34, G46)` in G58, copied right) and the **revenue** row of the projections (`=F71*(1+G$58)` in G71, copied right). Walk through these two rows: the `$` on `$B$5` and on row 58 is what lets one formula be copied across ten years. Then flip B5 to 1 and 3 to show revenue change.

```json
<<DCF>>
```
Key values (base case, B5 = 2): G59 → ? · G77 → ? · G81 → ? · G87 → ? · G90 → ? · P71 → ? · P77 → ? · P90 → ? · P92 → ? · G65 → ?

## 4. Practice (in the Sheet)

Task:
1. Fill the rest of the Selected Case block (rows 59–66) with `CHOOSE`, the same way as row 58. Rows 64–66 have one value only, in column G.
2. Fill the projections G–P for rows 72–92: growth, EBIT (= revenue × margin), tax rate (from the selected case), taxes on EBIT, NOPAT, D&A and capex (% of revenue), increase in NWC (= change in revenue × NWC %), unlevered FCF (NOPAT + D&A − capex − ΔNWC), FCF margin and EBITDA. Write each formula in G and copy right.

Every yellow cell carries its model formula (`sol`). Check with B5 = 2; then let the learner flip the case and watch row 90 move.

## Sources
Assumptions are the model author's (dated 2026-11-11), anchored on: consensus revenue trend (Yahoo Finance analyst estimates) for base-case Year 1; TTM GAAP EBIT margin 65.2%; TTM effective tax 16.0%; TTM D&A 1.2% and capex 2.4% of revenue; FY25–FY26 ΔNWC 13.5–18.7% of Δrevenue; terminal growth below the 10-year Treasury yield (4.98%); exit multiples below NVIDIA's current ~20x EBITDA.
