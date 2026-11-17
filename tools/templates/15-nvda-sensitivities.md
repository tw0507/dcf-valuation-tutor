# Lesson 15: Sensitivity tables — the finished model

**Time:** about 40 min · **Needs:** lesson 14
**Goal:** the learner reads three professional sensitivity grids (WACC × growth, growth × margin, beta × risk-free rate) and builds a fourth, WACC × exit multiple, with one formula copied across the grid. The Sheet is then the complete DCF.

Adds to the DCF Sheet: the four sensitivity tables (rows 135–169) and the helper block for table 2 (rows 171–177). If the Sheet exists, add only these. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson 11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story (no jargon)

The model says $158.69 a share using perpetual growth, and $215.83 using the exit multiple. A client's first question: "How sure are you?" The honest answer is a grid. Down the side, the discount rate a point lower or higher; across the top, the growth rate half a point lower or higher. Each box is a full revaluation. The client can see which assumptions move the answer most.

The model has four grids. Each box recomputes the whole DCF in one formula, using `SUMPRODUCT` to discount all ten years at once — no Excel "data table" needed, so it works in any spreadsheet.

## 2. Terms

| Term | Meaning |
|---|---|
| "Sensitivity table" | a grid of outputs for two inputs varied together |
| `SUMPRODUCT(FCF row / (1 + WACC) ^ period row)` | the PV of all ten years in one formula: divides each year's FCF by its own discount factor, then adds them up |
| Mixed references | `$B165` (WACC from column B of the same row), `C$164` (multiple from row 164 of the same column), so one formula fills the grid |
| Centre cell | the base case: must equal the model's own answer (a built-in check) |
| Colour scale | red-to-green shading (optional; add it from the Sheet's conditional formatting) |

## 3. Worked example

Filled: tables 1–3 and the helper. Walk through table 1's formula in C138: the `SUMPRODUCT` part, the Gordon TV part, the bridge, ÷ shares. Point out that E140 (the centre) equals B129. Table 2 shifts growth and margin in every year (its revenue paths are in the helper rows); table 3 rebuilds WACC from beta and the risk-free rate (green: it reads the WACC sheet).

```json
<<DCF>>
```
Key values: E140 → ? · C138 → ? · G142 → ? · E149 → ? · C147 → ? · E158 → ? · E167 → ? · C165 → ? · G169 → ? · C169 → ?

```json
<<WACC>>
```

## 4. Practice (in the Sheet)

Task: fill table 4 (C165:G169): implied price for each WACC (column B) and exit multiple (row 164). Write one formula in C165 and copy it to the whole grid:
`=(SUMPRODUCT(FCF row/(1+WACC)^period row) + final-year EBITDA × multiple / (1+WACC)^(final period + 0.5) − debt + cash + investments) / shares`, with `$` placed so it copies correctly. The centre (E167) must equal C129.

Every yellow cell carries its model formula (`sol`).

**Done:** this Sheet is now the full DCF — two sheets, three cases, ten years, terminal value two ways, and four sensitivity tables. Suggest the learner downloads it as .xlsx from the Sheet page.
