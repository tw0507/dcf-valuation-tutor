# Lesson 5: Forecast drivers

**Time:** about 30 min · **Needs:** lesson 4
**Goal:** the learner can analyse history (growth, margins as % of revenue), choose defensible assumptions, and project an income statement to EBITDA with growth-based and unit-based drivers.

From here on, Maya's business is **Maya's Tacos Co.**: three trucks, with 2024 and 2025 actuals. Lessons 5 to 15 build one model of it, lesson by lesson. Tabs: Worked Example, Practice 1.

---

## 1. Story (no jargon)

Maya now runs three trucks and wants a bank loan for a fourth. The bank asks for a three-year plan. "Don't just guess the profit," the banker says. "Show me what drives it."

Maya looks back first. Sales went from $480,000 to $540,000 last year, up 12.5%. Ingredients have been about 30–31% of sales for two years. Wages and running costs were about 47–48% of sales.

Then she looks forward. She expects growth to slow as the city fills up with taco trucks: 12% next year, then 10%, then 8%. Ingredients should stay at 30% of sales. And as she grows, her fixed costs get spread over more sales, so running costs should fall a little as a share of sales: 46%, then 45%.

None of these numbers are facts. They're *assumptions*. But each one has a reason she can explain, and each one sits in one place. If the banker disagrees with "10%", they can change it and see what happens.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Forecast" / "projection" | the model's future years, marked "E" (estimate); past years are "A" (actual) |
| "Driver" | the assumption a line is calculated from: growth %, % of revenue, units × price |
| "Historical analysis" | computing past growth and ratios to anchor the assumptions |
| "% of revenue method" | costs forecast as a share of revenue (COGS 30%, OpEx 46%) |
| "Operating leverage" | fixed costs spread over more sales, so margins rise as you grow |
| "EBITDA margin" | EBITDA ÷ revenue |
| "CAGR" | compound annual growth rate: (end ÷ start)^(1 ÷ years) − 1 |
| "Base year" | the last actual year the forecast grows from |

Make the point: **every assumption needs a one-line reason**: history, management guidance, industry data, or a stated judgement. "Because the spreadsheet said so" isn't one.

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson 5 · Worked example: Maya's Tacos Co. forecast","task":"Row 5-7: history is calculated (black); forecasts are typed assumptions (blue). Rows 9-14 run off the assumptions. Change any blue cell and watch EBITDA move.","cols":6,"rows":16,"width":{"A":240,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
"A1":{"v":"Maya's Tacos Co. ($)","b":1},
"B3":{"v":"2024A","b":1},"C3":{"v":"2025A","b":1},"D3":{"v":"2026E","b":1},"E3":{"v":"2027E","b":1},"F3":{"v":"2028E","b":1},
"A4":{"v":"Assumptions","b":1},
"A5":{"v":"Revenue growth"},"C5":{"v":"=C9/B9-1","f":"pct"},"D5":{"v":"12%"},"E5":{"v":"10%"},"F5":{"v":"8%"},
"A6":{"v":"COGS % of revenue"},"B6":{"v":"=B10/B9","f":"pct"},"C6":{"v":"=C10/C9","f":"pct"},"D6":{"v":"30%"},"E6":{"v":"30%"},"F6":{"v":"30%"},
"A7":{"v":"OpEx % of revenue"},"B7":{"v":"=B12/B9","f":"pct"},"C7":{"v":"=C12/C9","f":"pct"},"D7":{"v":"46%"},"E7":{"v":"45%"},"F7":{"v":"45%"},
"A8":{"v":"Income statement","b":1},
"A9":{"v":"Revenue"},"B9":{"v":"480000"},"C9":{"v":"540000"},"D9":{"v":"=C9*(1+D5)"},"E9":{"v":"=D9*(1+E5)"},"F9":{"v":"=E9*(1+F5)"},
"A10":{"v":"Cost of goods sold"},"B10":{"v":"148800"},"C10":{"v":"162000"},"D10":{"v":"=D9*D6"},"E10":{"v":"=E9*E6"},"F10":{"v":"=F9*F6"},
"A11":{"v":"Gross profit"},"B11":{"v":"=B9-B10"},"C11":{"v":"=C9-C10"},"D11":{"v":"=D9-D10"},"E11":{"v":"=E9-E10"},"F11":{"v":"=F9-F10"},
"A12":{"v":"Operating expenses"},"B12":{"v":"230000"},"C12":{"v":"253800"},"D12":{"v":"=D9*D7"},"E12":{"v":"=E9*E7"},"F12":{"v":"=F9*F7"},
"A13":{"v":"EBITDA","b":1},"B13":{"v":"=B11-B12","b":1},"C13":{"v":"=C11-C12","b":1},"D13":{"v":"=D11-D12","b":1},"E13":{"v":"=E11-E12","b":1},"F13":{"v":"=F11-F12","b":1},
"A14":{"v":"EBITDA margin"},"B14":{"v":"=B13/B9","f":"pct"},"C14":{"v":"=C13/C9","f":"pct"},"D14":{"v":"=D13/D9","f":"pct"},"E14":{"v":"=E13/E9","f":"pct"},"F14":{"v":"=F13/F9","f":"pct"},
"A16":{"v":"Revenue CAGR 2024A-2028E"},"B16":{"v":"=(F9/B9)^(1/4)-1","f":"pct"}}}
```
Expected: C5 → 12.5% · B6 → 31.0% · C6 → 30.0% · B7 → 47.9% · C7 → 47.0% · D9 → 604,800 · E9 → 665,280 · F9 → 718,502 · D13 → 145,152 · E13 → 166,320 · F13 → 179,626 · B14 → 21.1% · F14 → 25.0% · B16 → 10.6%.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: project the lines
```json
{"tab":"Practice 1","title":"Practice 1 · Project the income statement","task":"Fill the yellow cells with formulas that use the assumptions in rows 5-7. Write each formula once in 2026E and copy it right.","cols":6,"rows":14,"width":{"A":240,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
"A1":{"v":"Maya's Tacos Co. ($)","b":1},
"B3":{"v":"2024A","b":1},"C3":{"v":"2025A","b":1},"D3":{"v":"2026E","b":1},"E3":{"v":"2027E","b":1},"F3":{"v":"2028E","b":1},
"A4":{"v":"Assumptions","b":1},
"A5":{"v":"Revenue growth"},"D5":{"v":"12%"},"E5":{"v":"10%"},"F5":{"v":"8%"},
"A6":{"v":"COGS % of revenue"},"D6":{"v":"30%"},"E6":{"v":"30%"},"F6":{"v":"30%"},
"A7":{"v":"OpEx % of revenue"},"D7":{"v":"46%"},"E7":{"v":"45%"},"F7":{"v":"45%"},
"A8":{"v":"Income statement","b":1},
"A9":{"v":"Revenue"},"B9":{"v":"480000"},"C9":{"v":"540000"},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},"F9":{"v":"","ans":1},
"A10":{"v":"Cost of goods sold"},"B10":{"v":"148800"},"C10":{"v":"162000"},"D10":{"v":"","ans":1},"E10":{"v":"","ans":1},"F10":{"v":"","ans":1},
"A11":{"v":"Gross profit"},"B11":{"v":"=B9-B10"},"C11":{"v":"=C9-C10"},"D11":{"v":"=D9-D10"},"E11":{"v":"=E9-E10"},"F11":{"v":"=F9-F10"},
"A12":{"v":"Operating expenses"},"B12":{"v":"230000"},"C12":{"v":"253800"},"D12":{"v":"","ans":1},"E12":{"v":"","ans":1},"F12":{"v":"","ans":1},
"A13":{"v":"EBITDA","b":1},"B13":{"v":"=B11-B12","b":1},"C13":{"v":"=C11-C12","b":1},"D13":{"v":"=D11-D12","b":1},"E13":{"v":"=E11-E12","b":1},"F13":{"v":"=F11-F12","b":1},
"A14":{"v":"EBITDA margin"},"B14":{"v":"=B13/B9","f":"pct"},"C14":{"v":"=C13/C9","f":"pct"},"D14":{"v":"=D13/D9","f":"pct"},"E14":{"v":"=E13/E9","f":"pct"},"F14":{"v":"=F13/F9","f":"pct"}}}
```
Answer key: D9 `=C9*(1+D5)` → 604,800 · E9 `=D9*(1+E5)` → 665,280 · F9 `=E9*(1+F5)` → 718,502 · D10 `=D9*D6` → 181,440 · E10 `=E9*E6` → 199,584 · F10 `=F9*F6` → 215,551 · D12 `=D9*D7` → 278,208 · E12 `=E9*E7` → 299,376 · F12 `=F9*F7` → 323,326 · F13 → 179,626.
