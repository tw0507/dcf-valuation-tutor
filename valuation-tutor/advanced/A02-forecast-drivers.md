# Lesson A2: Forecast drivers

**Time:** about 40 min · **Needs:** lesson A1
**Goal:** the learner can analyse history (growth, margins as % of revenue), choose defensible assumptions, and project an income statement to EBITDA with growth-based and unit-based drivers.

From here on, Maya's business is **Maya's Tacos Co.**: three trucks, with 2024 and 2025 actuals. Sections 1b and 3 build one model of it, lesson by lesson. Tabs: Worked Example, Practice 1, Practice 2.

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
{"tab":"Worked Example","title":"Lesson A2 · Worked example: Maya's Tacos Co. forecast","task":"Row 5-7: history is calculated (black); forecasts are typed assumptions (blue). Rows 9-14 run off the assumptions. Change any blue cell and watch EBITDA move.","cols":6,"rows":16,"width":{"A":240,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
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

### Practice 1: from scratch (unit drivers)
```json
{"tab":"Practice 1","title":"Practice 1 · Trucks × sales per truck","task":"Build a 2026E-2028E forecast to EBITDA using unit drivers, with an inputs block and years across.\nFacts: 2025A: 3 trucks, $180,000 revenue per truck. Plan: 4 trucks in 2026, 5 in 2027, 6 in 2028. Revenue per truck grows 3% a year. COGS is 30% of revenue. Each truck costs $80,000 a year to run, plus a head office costing $20,000 in 2025 that grows 5% a year.\nRows: trucks, revenue per truck, revenue, COGS, gross profit, truck running costs, head office, EBITDA, EBITDA margin.","cols":5,"rows":20,"width":{"A":240,"B":95,"C":95,"D":95,"E":95},"cells":{"A1":{"v":"Maya's Tacos Co.: unit-driven forecast ($)","b":1}}}
```
```solution
{"tab":"Practice 1 solution","cells":{
"B3":{"v":"180000"},"B4":{"v":"3%"},"B5":{"v":"30%"},"B6":{"v":"80000"},"B7":{"v":"20000"},"B8":{"v":"5%"},
"B10":{"v":"3"},"C10":{"v":"4"},"D10":{"v":"5"},"E10":{"v":"6"},
"B11":{"v":"=B3"},"C11":{"v":"=B11*(1+$B$4)"},"D11":{"v":"=C11*(1+$B$4)"},"E11":{"v":"=D11*(1+$B$4)"},
"C12":{"v":"=C10*C11"},"D12":{"v":"=D10*D11"},"E12":{"v":"=E10*E11"},
"C13":{"v":"=C12*$B$5"},"D13":{"v":"=D12*$B$5"},"E13":{"v":"=E12*$B$5"},
"C14":{"v":"=C12-C13"},"D14":{"v":"=D12-D13"},"E14":{"v":"=E12-E13"},
"C15":{"v":"=C10*$B$6"},"D15":{"v":"=D10*$B$6"},"E15":{"v":"=E10*$B$6"},
"B16":{"v":"=B7"},"C16":{"v":"=B16*(1+$B$8)"},"D16":{"v":"=C16*(1+$B$8)"},"E16":{"v":"=D16*(1+$B$8)"},
"C17":{"v":"=C14-C15-C16"},"D17":{"v":"=D14-D15-D16"},"E17":{"v":"=E14-E15-E16"},
"C18":{"v":"=C17/C12"},"D18":{"v":"=D17/D12"},"E18":{"v":"=E17/E12"}}}
```
Answer key: revenue 2026E C12 → 741,600 · 2027E D12 → 954,810 · 2028E E12 → 1,180,145 · EBITDA 2026E C17 → 178,120 · 2027E D17 → 246,317 · 2028E E17 → 322,949 · margin 2028E E18 → 27.4%.

### Practice 2: twist (growth that fades)
```json
{"tab":"Practice 2","title":"Practice 2 · Growth that fades","task":"Growth starts at 12% and falls by 3 points a year, but never below 4%. Fill the yellow cells: one formula for 2027E growth that you can copy right, using MAX.\nHint: =MAX(floor, last year's growth - fade)","cols":7,"rows":11,"width":{"A":240,"B":95,"C":95,"D":95,"E":95,"F":95,"G":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: fading growth ($)","b":1},
"A3":{"v":"Inputs","b":1},
"A4":{"v":"First-year growth"},"B4":{"v":"12%"},
"A5":{"v":"Fade per year"},"B5":{"v":"3%"},
"A6":{"v":"Floor"},"B6":{"v":"4%"},
"A7":{"v":"2025A revenue"},"B7":{"v":"540000"},
"B9":{"v":"2025A","b":1},"C9":{"v":"2026E","b":1},"D9":{"v":"2027E","b":1},"E9":{"v":"2028E","b":1},"F9":{"v":"2029E","b":1},"G9":{"v":"2030E","b":1},
"A10":{"v":"Revenue growth"},"C10":{"v":"=B4","f":"pct"},"D10":{"v":"","ans":1,"f":"pct"},"E10":{"v":"","ans":1,"f":"pct"},"F10":{"v":"","ans":1,"f":"pct"},"G10":{"v":"","ans":1,"f":"pct"},
"A11":{"v":"Revenue"},"B11":{"v":"=B7"},"C11":{"v":"","ans":1},"D11":{"v":"","ans":1},"E11":{"v":"","ans":1},"F11":{"v":"","ans":1},"G11":{"v":"","ans":1}}}
```
Answer key: D10 `=MAX($B$6,C10-$B$5)` → 9.0% · E10 `=MAX($B$6,D10-$B$5)` → 6.0% · F10 `=MAX($B$6,E10-$B$5)` → 4.0% · G10 `=MAX($B$6,F10-$B$5)` → 4.0% · C11 `=B11*(1+C10)` → 604,800 · D11 `=C11*(1+D10)` → 659,232 · E11 `=D11*(1+E10)` → 698,786 · F11 `=E11*(1+F10)` → 726,737 · G11 `=F11*(1+G10)` → 755,807.
Why it matters: in a DCF, growth has to settle down to a steady rate before the terminal value (lessons A12 and A14).
