# Lesson A16: Four sensitivity tables — the finished model

**Time:** about 75 min · **Needs:** lesson A15
**Goal:** build four full-revaluation sensitivity grids with `SUMPRODUCT` and mixed references: WACC × terminal growth, growth shift × margin shift (with a helper block of revenue paths), beta × risk-free rate (WACC rebuilt via CAPM from the WACC sheet), and WACC × exit multiple.

**Lessons A11–A16 build one model in one Sheet** (NVIDIA as the worked example, or the company the learner chose) (tabs `DCF` and `WACC`): the layout of a professional bank model. Each lesson adds a section; if the Sheet exists, write only that section, otherwise build the whole block. Advanced pace: brief story, the terms they may not know, then build. Adds rows 135–177. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson A11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story
One price is not an answer; a grid is. Each cell recomputes the whole DCF in one formula: `SUMPRODUCT(FCF row/(1+WACC)^period row)` for the ten years, plus the discounted terminal value, through the bridge, divided by shares. The centre of every grid must equal the model's own answer.

## 2. Terms
"Full-revaluation grid" · `SUMPRODUCT` with array maths · mixed references (`$B138`, `C$137`) · "helper rows" · "centre check".

## 3. Build
Axis cells are given. Yours: every grid cell in tables 1–4 (C:G of rows 138–142, 147–151, 156–160, 165–169) and the helper revenue paths (B and F–P of rows 173–177).
- Table 1: Gordon TV at that WACC and growth.
- Table 2: FCF rebuilt from the helper revenue path with the margin shift, at the model WACC: `(Rev×((margin+Δ)×(1−tax)+D&A%−capex%−NWC%)+PriorRev×NWC%)`.
- Table 3: WACC rebuilt as equity weight × (risk-free + beta × ERP) + debt weight × after-tax cost of debt + case adjustment.
- Table 4: exit TV = final EBITDA × multiple, discounted from the end of year 10.

```json
<<DCF>>
```
Key values: E140 → ? · C138 → ? · E149 → ? · C147 → ? · G151 → ? · E158 → ? · C156 → ? · E167 → ? · G169 → ? · P177 → ?

```json
<<WACC>>
```
Every yellow cell carries its model formula (`sol`). When done, this Sheet is the complete DCF; suggest downloading it as .xlsx.