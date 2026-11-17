# Lesson A10: Peer beta

**Time:** about 35 min · **Needs:** lesson A9
**Goal:** the learner can explain beta, unlever peer betas, take the median, relever at a target capital structure, estimate a raw beta from returns, and apply the Blume adjustment. This feeds the cost of equity in lesson A12.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

An investor thinking about Maya's Tacos Co. asks: "How risky is this, compared with just buying the whole stock market?" If the market rises 10% and taco shares tend to rise 12%, and fall 12% when the market falls 10%, then tacos are a bit riskier than the market: about 1.2 times as jumpy.

Maya's company isn't listed, so there's no share price to measure. But her listed peers are. The catch: some peers borrowed a lot and some borrowed nothing. Borrowing makes the owners' shares jumpier, because the lenders get paid first and the owners take every swing that's left.

So the banker does it in three steps. First, strip the effect of borrowing out of each peer's jumpiness, to get the jumpiness of the *business* alone. Second, take the middle value across peers. Third, add back the effect of the amount of borrowing Maya's company is expected to carry. That's the number used for Maya's shares.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Beta" (β) | how much a share moves relative to the market; 1.0 = moves with the market |
| "Levered beta" (βL, "equity beta") | the observed beta of the shares, including the effect of debt |
| "Unlevered beta" (βU, "asset beta") | the beta of the business alone, as if it had no debt |
| "Unlevering" | βU = βL ÷ (1 + (1 − tax) × D/E) |
| "Relevering" | βL = βU × (1 + (1 − tax) × D/E), at the *target* company's debt-to-equity |
| "Target capital structure" | the long-run debt / (debt + equity) the company is expected to keep |
| "Raw beta" (regression beta) | the slope of the share's returns against the market's: `=SLOPE(stock returns, market returns)` |
| "Blume adjustment" | adjusted β = 0.67 × raw β + 0.33: pulls betas towards 1.0, as they tend to drift there |

Note: D/E uses **market values** (equity value, not book equity).

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson A10 · Worked example: unlever, median, relever","task":"For each peer: D/E = debt / equity value; unlevered beta = levered / (1 + (1 - tax) × D/E). Then relever the median at Maya's target structure.","cols":6,"rows":19,"width":{"A":200,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
"A1":{"v":"Peer betas (made-up, $ millions)","b":1},
"A3":{"v":"Company","b":1},"B3":{"v":"Levered beta","b":1},"C3":{"v":"Debt","b":1},"D3":{"v":"Equity value","b":1},"E3":{"v":"D / E","b":1},"F3":{"v":"Unlevered beta","b":1},
"A4":{"v":"Burrito Barn"},"B4":{"v":"1.10","f":"dec"},"C4":{"v":"150"},"D4":{"v":"1225"},"E4":{"v":"=C4/D4","f":"pct"},"F4":{"v":"=B4/(1+(1-$B$11)*E4)","f":"dec"},
"A5":{"v":"Salsa Street"},"B5":{"v":"1.25","f":"dec"},"C5":{"v":"300"},"D5":{"v":"1500"},"E5":{"v":"=C5/D5","f":"pct"},"F5":{"v":"=B5/(1+(1-$B$11)*E5)","f":"dec"},
"A6":{"v":"Nacho Nation"},"B6":{"v":"0.95","f":"dec"},"C6":{"v":"0"},"D6":{"v":"1800"},"E6":{"v":"=C6/D6","f":"pct"},"F6":{"v":"=B6/(1+(1-$B$11)*E6)","f":"dec"},
"A7":{"v":"Quesadilla Co."},"B7":{"v":"1.20","f":"dec"},"C7":{"v":"500"},"D7":{"v":"2600"},"E7":{"v":"=C7/D7","f":"pct"},"F7":{"v":"=B7/(1+(1-$B$11)*E7)","f":"dec"},
"A8":{"v":"Fiesta Grill"},"B8":{"v":"1.15","f":"dec"},"C8":{"v":"800"},"D8":{"v":"3900"},"E8":{"v":"=C8/D8","f":"pct"},"F8":{"v":"=B8/(1+(1-$B$11)*E8)","f":"dec"},
"A9":{"v":"Median unlevered beta","b":1},"F9":{"v":"=MEDIAN(F4:F8)","f":"0.000","b":1},
"A11":{"v":"Tax rate"},"B11":{"v":"25%"},
"A13":{"v":"Relever for Maya's Tacos Co.","b":1},
"A14":{"v":"Target debt / (debt + equity)"},"B14":{"v":"20%"},
"A15":{"v":"Target D / E"},"B15":{"v":"=B14/(1-B14)","f":"pct"},
"A16":{"v":"Relevered beta"},"B16":{"v":"=F9*(1+(1-B11)*B15)","f":"0.000"},
"A18":{"v":"Check: unlever it again (should equal the median)"},"B18":{"v":"=B16/(1+(1-B11)*B15)","f":"0.000"}}}
```
Expected: E4 → 12.2% · F4 → 1.01 · F5 → 1.09 · F6 → 0.95 · F7 → 1.05 · F8 → 1.00 · F9 → 1.007 · B15 → 25.0% · B16 → 1.196 · B18 → 1.007.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: unlever the peers
```json
{"tab":"Practice 1","title":"Practice 1 · Unlever the peers","task":"Fill the yellow cells with formulas. Anchor the tax rate with $.","cols":6,"rows":11,"width":{"A":200,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
"A1":{"v":"Peer betas ($ millions)","b":1},
"A3":{"v":"Company","b":1},"B3":{"v":"Levered beta","b":1},"C3":{"v":"Debt","b":1},"D3":{"v":"Equity value","b":1},"E3":{"v":"D / E","b":1},"F3":{"v":"Unlevered beta","b":1},
"A4":{"v":"Burrito Barn"},"B4":{"v":"1.10","f":"dec"},"C4":{"v":"150"},"D4":{"v":"1225"},"E4":{"v":"","ans":1,"f":"pct"},"F4":{"v":"","ans":1,"f":"dec"},
"A5":{"v":"Salsa Street"},"B5":{"v":"1.25","f":"dec"},"C5":{"v":"300"},"D5":{"v":"1500"},"E5":{"v":"","ans":1,"f":"pct"},"F5":{"v":"","ans":1,"f":"dec"},
"A6":{"v":"Nacho Nation"},"B6":{"v":"0.95","f":"dec"},"C6":{"v":"0"},"D6":{"v":"1800"},"E6":{"v":"","ans":1,"f":"pct"},"F6":{"v":"","ans":1,"f":"dec"},
"A7":{"v":"Quesadilla Co."},"B7":{"v":"1.20","f":"dec"},"C7":{"v":"500"},"D7":{"v":"2600"},"E7":{"v":"","ans":1,"f":"pct"},"F7":{"v":"","ans":1,"f":"dec"},
"A8":{"v":"Fiesta Grill"},"B8":{"v":"1.15","f":"dec"},"C8":{"v":"800"},"D8":{"v":"3900"},"E8":{"v":"","ans":1,"f":"pct"},"F8":{"v":"","ans":1,"f":"dec"},
"A9":{"v":"Median unlevered beta","b":1},"F9":{"v":"","ans":1,"f":"0.000"},
"A11":{"v":"Tax rate"},"B11":{"v":"25%"}}}
```
Answer key: E4 `=C4/D4` → 12.2% · E5 `=C5/D5` → 20.0% · E6 `=C6/D6` → 0.0% · E7 `=C7/D7` → 19.2% · E8 `=C8/D8` → 20.5% · F4 `=B4/(1+(1-$B$11)*E4)` → 1.01 · F5 `=B5/(1+(1-$B$11)*E5)` → 1.09 · F6 `=B6/(1+(1-$B$11)*E6)` → 0.95 · F7 `=B7/(1+(1-$B$11)*E7)` → 1.05 · F8 `=B8/(1+(1-$B$11)*E8)` → 1.00 · F9 `=MEDIAN(F4:F8)` → 1.007.

### Practice 2: twist (estimate a beta yourself)
```json
{"tab":"Practice 2","title":"Practice 2 · Beta from returns","task":"Twelve months of returns for Taco Ridge and the market are below. Fill the yellow cells.\nHint: =SLOPE(stock returns, market returns). Blume-adjusted beta = 0.67 × raw + 0.33.","cols":3,"rows":20,"width":{"A":200,"B":110,"C":110},"cells":{
"A1":{"v":"Monthly returns","b":1},
"A3":{"v":"Month","b":1},"B3":{"v":"Taco Ridge","b":1},"C3":{"v":"Market","b":1},
"A4":{"v":"1"},"B4":{"v":"2.9%"},"C4":{"v":"2.0%"},
"A5":{"v":"2"},"B5":{"v":"-2.1%"},"C5":{"v":"-1.5%"},
"A6":{"v":"3"},"B6":{"v":"3.8%"},"C6":{"v":"3.0%"},
"A7":{"v":"4"},"B7":{"v":"0.2%"},"C7":{"v":"0.5%"},
"A8":{"v":"5"},"B8":{"v":"-1.8%"},"C8":{"v":"-2.0%"},
"A9":{"v":"6"},"B9":{"v":"1.6%"},"C9":{"v":"1.5%"},
"A10":{"v":"7"},"B10":{"v":"4.9%"},"C10":{"v":"4.0%"},
"A11":{"v":"8"},"B11":{"v":"-3.3%"},"C11":{"v":"-3.0%"},
"A12":{"v":"9"},"B12":{"v":"0.7%"},"C12":{"v":"1.0%"},
"A13":{"v":"10"},"B13":{"v":"3.4%"},"C13":{"v":"2.5%"},
"A14":{"v":"11"},"B14":{"v":"-0.8%"},"C14":{"v":"-0.5%"},
"A15":{"v":"12"},"B15":{"v":"1.3%"},"C15":{"v":"1.5%"},
"A17":{"v":"Raw beta"},"B17":{"v":"","ans":1,"f":"0.000"},
"A18":{"v":"Blume-adjusted beta"},"B18":{"v":"","ans":1,"f":"0.000"}}}
```
Answer key: B17 `=SLOPE(B4:B15,C4:C15)` → 1.194 · B18 `=0.67*B17+0.33` → 1.130
