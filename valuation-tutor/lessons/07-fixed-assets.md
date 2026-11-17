# Lesson 7: The fixed asset schedule

**Time:** about 35 min · **Needs:** lesson 6
**Goal:** the learner can forecast capex, build a depreciation waterfall and a PP&E roll-forward, and handle an asset sale.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Maya's three trucks are already on her books at $96,000, and they'll wear out at $24,000 a year for four more years. But she's growing, so she'll keep buying: new trucks, bigger ovens. She plans to spend about 8% of sales on equipment next year, then 7%, then 6% as growth slows.

Each new purchase lasts about 8 years, so each one adds an eighth of its cost to the wear-and-tear bill, every year, starting the year she buys it. The bill stacks up: next year it's the old trucks plus one eighth of next year's spending; the year after, the old trucks plus an eighth of *both* years' spending, and so on.

And the truck value on her books follows one simple rule every year: what she started with, plus what she bought, minus what wore out.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Capex" | capital expenditure: spending on long-lasting assets (trucks, ovens) |
| "Maintenance capex" vs "growth capex" | replacing what wears out vs adding capacity |
| "Useful life" | how many years an asset is depreciated over (8) |
| "Straight-line depreciation" | the same amount each year: cost ÷ useful life |
| "Depreciation waterfall" | a grid with one row per year's capex, showing its depreciation in each later year |
| "PP&E roll-forward" | opening net PP&E + capex − depreciation = closing net PP&E |
| "Capex / depreciation" | above 1x: growing the asset base; around 1x: just replacing it |
| "Gain (loss) on sale" | sale price − book value when an asset is sold |

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson 7 · Worked example: capex, depreciation and PP&E","task":"Capex = revenue × capex %. Each year's capex is depreciated over 8 years, starting the year it's bought. Closing PP&E = opening + capex - depreciation.","cols":5,"rows":26,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: fixed assets ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Revenue (from lesson 5)"},"B4":{"v":"540000"},"C4":{"v":"604800"},"D4":{"v":"665280"},"E4":{"v":"718502.4"},
"A6":{"v":"Assumptions","b":1},
"A7":{"v":"Capex % of revenue"},"C7":{"v":"8%"},"D7":{"v":"7%"},"E7":{"v":"6%"},
"A8":{"v":"Useful life of new equipment (years)"},"B8":{"v":"8"},
"A9":{"v":"Depreciation of existing trucks per year"},"B9":{"v":"24000"},
"A11":{"v":"Capex","b":1},"C11":{"v":"=C4*C7","b":1},"D11":{"v":"=D4*D7","b":1},"E11":{"v":"=E4*E7","b":1},
"A13":{"v":"Depreciation waterfall","b":1},
"A14":{"v":"Existing trucks"},"C14":{"v":"=$B$9"},"D14":{"v":"=$B$9"},"E14":{"v":"=$B$9"},
"A15":{"v":"2026 capex"},"C15":{"v":"=$C$11/$B$8"},"D15":{"v":"=$C$11/$B$8"},"E15":{"v":"=$C$11/$B$8"},
"A16":{"v":"2027 capex"},"D16":{"v":"=$D$11/$B$8"},"E16":{"v":"=$D$11/$B$8"},
"A17":{"v":"2028 capex"},"E17":{"v":"=$E$11/$B$8"},
"A18":{"v":"Total depreciation","b":1},"C18":{"v":"=SUM(C14:C17)","b":1},"D18":{"v":"=SUM(D14:D17)","b":1},"E18":{"v":"=SUM(E14:E17)","b":1},
"A20":{"v":"PP&E roll-forward","b":1},
"A21":{"v":"Opening net PP&E"},"C21":{"v":"=B24"},"D21":{"v":"=C24"},"E21":{"v":"=D24"},
"A22":{"v":"(+) Capex"},"C22":{"v":"=C11"},"D22":{"v":"=D11"},"E22":{"v":"=E11"},
"A23":{"v":"(-) Depreciation"},"C23":{"v":"=C18"},"D23":{"v":"=D18"},"E23":{"v":"=E18"},
"A24":{"v":"Closing net PP&E","b":1},"B24":{"v":"96000","b":1},"C24":{"v":"=C21+C22-C23","b":1},"D24":{"v":"=D21+D22-D23","b":1},"E24":{"v":"=E21+E22-E23","b":1},
"A26":{"v":"Capex / depreciation"},"C26":{"v":"=C22/C23","f":"x"},"D26":{"v":"=D22/D23","f":"x"},"E26":{"v":"=E22/E23","f":"x"}}}
```
Expected: C11 → 48,384 · D11 → 46,570 · E11 → 43,110 · C18 → 30,048 · D18 → 35,869 · E18 → 41,258 · C24 → 114,336 · D24 → 125,036 · E24 → 126,889 · C26 → 1.6x · E26 → 1.0x.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: the roll-forward
```json
{"tab":"Practice 1","title":"Practice 1 · PP&E roll-forward","task":"Capex and depreciation are done. Fill the roll-forward with formulas: opening = last year's closing.","cols":5,"rows":12,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: PP&E ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Capex"},"C4":{"v":"48384"},"D4":{"v":"46569.6"},"E4":{"v":"43110.144"},
"A5":{"v":"Depreciation"},"C5":{"v":"30048"},"D5":{"v":"35869.2"},"E5":{"v":"41257.968"},
"A7":{"v":"Opening net PP&E"},"C7":{"v":"","ans":1},"D7":{"v":"","ans":1},"E7":{"v":"","ans":1},
"A8":{"v":"(+) Capex"},"C8":{"v":"","ans":1},"D8":{"v":"","ans":1},"E8":{"v":"","ans":1},
"A9":{"v":"(-) Depreciation"},"C9":{"v":"","ans":1},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},
"A10":{"v":"Closing net PP&E","b":1},"B10":{"v":"96000","b":1},"C10":{"v":"","ans":1,"b":1},"D10":{"v":"","ans":1,"b":1},"E10":{"v":"","ans":1,"b":1}}}
```
Answer key: C7 `=B10` → 96,000 · D7 `=C10` → 114,336 · E7 `=D10` → 125,036 · C8 `=C4` → 48,384 · D8 `=D4` → 46,570 · E8 `=E4` → 43,110 · C9 `=C5` → 30,048 · D9 `=D5` → 35,869 · E9 `=E5` → 41,258 · C10 `=C7+C8-C9` → 114,336 · D10 `=D7+D8-D9` → 125,036 · E10 `=E7+E8-E9` → 126,889.

### Practice 2: build the waterfall
```json
{"tab":"Practice 2","title":"Practice 2 · Depreciation waterfall","task":"Fill the yellow cells with formulas.\nHint: each year's capex is depreciated by capex / useful life, from the year it's bought. Use $ so one formula per row can be copied right.","cols":5,"rows":14,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: depreciation ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Capex"},"C4":{"v":"48384"},"D4":{"v":"46569.6"},"E4":{"v":"43110.144"},
"A5":{"v":"Useful life (years)"},"B5":{"v":"8"},
"A6":{"v":"Existing trucks: depreciation per year"},"B6":{"v":"24000"},
"A8":{"v":"Existing trucks"},"C8":{"v":"","ans":1},"D8":{"v":"","ans":1},"E8":{"v":"","ans":1},
"A9":{"v":"2026 capex"},"C9":{"v":"","ans":1},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},
"A10":{"v":"2027 capex"},"D10":{"v":"","ans":1},"E10":{"v":"","ans":1},
"A11":{"v":"2028 capex"},"E11":{"v":"","ans":1},
"A12":{"v":"Total depreciation","b":1},"C12":{"v":"","ans":1,"b":1},"D12":{"v":"","ans":1,"b":1},"E12":{"v":"","ans":1,"b":1}}}
```
Answer key: C8 `=$B$6` → 24,000 · D8 `=$B$6` → 24,000 · E8 `=$B$6` → 24,000 · C9 `=$C$4/$B$5` → 6,048 · D9 `=$C$4/$B$5` → 6,048 · E9 `=$C$4/$B$5` → 6,048 · D10 `=$D$4/$B$5` → 5,821 · E10 `=$D$4/$B$5` → 5,821 · E11 `=$E$4/$B$5` → 5,389 · C12 `=SUM(C8:C11)` → 30,048 · D12 `=SUM(D8:D11)` → 35,869 · E12 `=SUM(E8:E11)` → 41,258.
