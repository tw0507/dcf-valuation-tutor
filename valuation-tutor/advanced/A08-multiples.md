# Lesson A8: Valuation multiples

**Time:** about 35 min · **Needs:** lesson A7
**Goal:** the learner can compute EV/Revenue, EV/EBITDA, EV/EBIT and P/E, match numerator to denominator, build LTM figures, value a company from a multiple, and explain how leverage distorts P/E.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Maya's neighbour sells her flat and tells everyone the price: $600,000. Another neighbour's flat, a bit bigger, sold for $750,000. Which was the better deal? You can't tell from the prices alone. But per square metre, one was $6,000 and the other $5,000. Now you can compare.

Companies are the same. Taco Ridge's whole business is valued at $5.3 billion and Burrito Barn's at $1.3 billion. That tells you nothing about which is cheap. But divide each by what the business earns, and you get "how many years of earnings is the market paying?" That's comparable.

There's one rule, though. If you're pricing the *whole* business (owners and lenders together), divide by earnings that belong to everyone: earnings before interest. If you're pricing only the owners' slice, divide by earnings left for owners: net income. Mixing them is like dividing a flat's price by the size of the whole building.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Multiple" | a value divided by a measure of earnings or size |
| "EV / Revenue" | for low-profit or early-stage businesses |
| "EV / EBITDA" | the most-used multiple in banking; ignores capital structure, tax and D&A policy |
| "EV / EBIT" | like EV/EBITDA but charges for D&A; better for capital-heavy businesses |
| "P/E" (price / earnings) | equity value ÷ net income (or share price ÷ EPS) |
| "Matching" | EV ↔ pre-interest metrics (revenue, EBITDA, EBIT); equity value ↔ post-interest metrics (net income, EPS) |
| "LTM" / "TTM" | last twelve months: last fiscal year + this year-to-date − last year's same period |
| "NTM" / "forward" | next twelve months, from forecasts |

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson A8 · Worked example: Taco Ridge multiples","task":"EV multiples divide by pre-interest metrics; P/E divides equity value by net income. Figures from lesson A7.","cols":2,"rows":16,"width":{"A":300,"B":100},"cells":{
"A1":{"v":"Taco Ridge Inc. ($ millions)","b":1},
"A3":{"v":"Enterprise value (lesson A7)"},"B3":{"v":"5310"},
"A4":{"v":"Equity value (lesson A7)"},"B4":{"v":"5040"},
"A5":{"v":"LTM revenue"},"B5":{"v":"2400"},
"A6":{"v":"LTM EBITDA"},"B6":{"v":"420"},
"A7":{"v":"LTM EBIT"},"B7":{"v":"324"},
"A8":{"v":"LTM net income, excl. one-off gain"},"B8":{"v":"237.3"},
"A9":{"v":"NTM EBITDA (forecast)"},"B9":{"v":"465"},
"A11":{"v":"EV / Revenue"},"B11":{"v":"=B3/B5","f":"x"},
"A12":{"v":"EV / LTM EBITDA"},"B12":{"v":"=B3/B6","f":"x"},
"A13":{"v":"EV / LTM EBIT"},"B13":{"v":"=B3/B7","f":"x"},
"A14":{"v":"P / E (LTM)"},"B14":{"v":"=B4/B8","f":"x"},
"A15":{"v":"EV / NTM EBITDA"},"B15":{"v":"=B3/B9","f":"x"},
"A16":{"v":"EBITDA margin"},"B16":{"v":"=B6/B5","f":"pct"}}}
```
Expected: B11 → 2.2 · B12 → 12.6 · B13 → 16.4 · B14 → 21.2 · B15 → 11.4 · B16 → 17.5%.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: from scratch (value Maya's Tacos Co. with a multiple)
```json
{"tab":"Practice 1","title":"Practice 1 · Value Maya's Tacos Co. from a range","task":"Peers trade between 9.0x and 11.0x EBITDA. Value Maya's Tacos Co. at both ends.\nFacts: 2026E EBITDA $145,152. Today (end of 2025) it has debt of $80,000 and cash of $60,000. Maya owns 100,000 shares.\nShow implied EV, equity value and value per share for the low and the high multiple.","cols":3,"rows":14,"width":{"A":280,"B":110,"C":110},"cells":{"A1":{"v":"Maya's Tacos Co.: multiple-based value ($)","b":1}}}
```
```solution
{"tab":"Practice 1 solution","cells":{
"B3":{"v":"145152"},"B4":{"v":"80000"},"B5":{"v":"60000"},"B6":{"v":"100000"},
"B8":{"v":"9"},"C8":{"v":"11"},
"B9":{"v":"=$B$3*B8"},"C9":{"v":"=$B$3*C8"},
"B10":{"v":"=B9-($B$4-$B$5)"},"C10":{"v":"=C9-($B$4-$B$5)"},
"B11":{"v":"=B10/$B$6"},"C11":{"v":"=C10/$B$6"}}}
```
Answer key: EV low B9 → 1,306,368 · EV high C9 → 1,596,672 · equity low B10 → 1,286,368 · equity high C10 → 1,576,672 · per share low B11 → 12.86 · high C11 → 15.77.

### Practice 2: twist (leverage and P/E)
```json
{"tab":"Practice 2","title":"Practice 2 · Same business, different debt","task":"A and B run identical businesses and have the same EV. A has no debt; B borrowed $400M. Fill the yellow cells and compare EV/EBITDA with P/E.","cols":3,"rows":15,"width":{"A":260,"B":110,"C":110},"cells":{
"A1":{"v":"$ millions","b":1},
"B3":{"v":"Company A","b":1},"C3":{"v":"Company B","b":1},
"A4":{"v":"EBITDA"},"B4":{"v":"100"},"C4":{"v":"100"},
"A5":{"v":"D&A"},"B5":{"v":"20"},"C5":{"v":"20"},
"A6":{"v":"Debt"},"B6":{"v":"0"},"C6":{"v":"400"},
"A7":{"v":"Interest rate"},"B7":{"v":"6%"},"C7":{"v":"6%"},
"A8":{"v":"Tax rate"},"B8":{"v":"25%"},"C8":{"v":"25%"},
"A9":{"v":"Enterprise value"},"B9":{"v":"1000"},"C9":{"v":"1000"},
"A11":{"v":"Net income"},"B11":{"v":"","ans":1},"C11":{"v":"","ans":1},
"A12":{"v":"Equity value (no cash)"},"B12":{"v":"","ans":1},"C12":{"v":"","ans":1},
"A13":{"v":"EV / EBITDA"},"B13":{"v":"","ans":1,"f":"x"},"C13":{"v":"","ans":1,"f":"x"},
"A14":{"v":"P / E"},"B14":{"v":"","ans":1,"f":"x"},"C14":{"v":"","ans":1,"f":"x"}}}
```
Answer key: B11 `=(B4-B5-B6*B7)*(1-B8)` → 60 · C11 `=(C4-C5-C6*C7)*(1-C8)` → 42 · B12 `=B9-B6` → 1,000 · C12 `=C9-C6` → 600 · B13 `=B9/B4` → 10.0 · C13 `=C9/C4` → 10.0 · B14 `=B12/B11` → 16.7 · C14 `=C12/C11` → 14.3.
The lesson: same business, same EV/EBITDA, but different P/Es purely because of debt. That's why bankers prefer EV multiples to compare operating businesses.
