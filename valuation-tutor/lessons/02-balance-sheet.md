# Lesson 2: The balance sheet

**Time:** about 35 min · **Needs:** lesson 1
**Goal:** the learner can sort items into assets, liabilities and equity, build a balance sheet with formulas, roll retained earnings forward, and show how a transaction moves both sides.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

The income statement told Maya how her *year* went. Now her bank asks a different question: *on the last day of the year, what does the business have, and who does it belong to?*

So Maya makes a list of everything the business has right now. $21,000 sits in the bank. Ingredients in the freezer are worth $3,000. A company she catered for still owes her $4,000. And there's the truck: she paid $40,000, but a fifth of it has been used up, so it's worth $32,000 on her books. Everything together: $60,000.

Then she lists what the business owes. A supplier sent ingredients she hasn't paid for yet: $2,000. She borrowed $30,000 from the bank and has paid back $5,000, so $25,000 is still owed. Together: $27,000.

Whatever is left belongs to Maya. She put in $15,000 of her savings at the start, and she kept all of this year's $18,000 profit in the business. That's $33,000.

And here's the neat part: $27,000 owed plus $33,000 that's hers is exactly $60,000, the same as everything the business has. It has to be. Every dollar the business holds came from somewhere: either someone lent it, or it belongs to the owner.

## 2. Reveal

| Term | In Maya's story |
|---|---|
| "Balance sheet" | the list on the last day of the year: what the business has, owes and what's left for the owner |
| "Assets" | everything it has: cash, ingredients, money owed to her, the truck ($60,000) |
| "Current assets" | assets that turn into cash within a year: cash, receivables, inventory |
| "Accounts receivable" ("AR") | the $4,000 the catering client still owes |
| "Inventory" | the $3,000 of ingredients in the freezer |
| "PP&E" (property, plant & equipment) | the truck. "Gross PP&E" is what it cost ($40,000) |
| "Accumulated depreciation" | all the wear counted so far ($8,000) |
| "Net PP&E" ("book value") | cost minus accumulated depreciation ($32,000) |
| "Liabilities" | what the business owes ($27,000) |
| "Accounts payable" ("AP") | the $2,000 supplier bill not yet paid |
| "Debt" | the $25,000 bank loan still owed |
| "Shareholders' equity" | what's left for the owner ($33,000) |
| "Paid-in capital" (or "common stock") | the $15,000 Maya put in |
| "Retained earnings" | profits kept in the business, not paid out ($18,000) |
| "Dividends" | profit paid out to the owner (none yet) |

Then make two points:
- **Assets = Liabilities + Equity, always.** If a model's balance sheet doesn't balance, something is broken. A "check" row (assets − liabilities − equity = 0) catches it.
- **A balance sheet is a photo of one day; an income statement is a video of a year.** Retained earnings is where they meet: each year's net income (less dividends) is added to it.

## 3. Worked example

Build the Sheet and walk through the Worked Example tab: assets at the top, then liabilities, then equity, then the check row.

```json
{"tab":"Worked Example","title":"Lesson 2 · Worked example: Maya's Tacos, end of Year 1","task":"Blue numbers are typed in. Totals are formulas. The check row must show 0.","cols":3,"rows":24,"width":{"A":280,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: balance sheet, end of Year 1 ($)","b":1},
"A3":{"v":"Assets","b":1},
"A4":{"v":"Cash"},"B4":{"v":"21000"},
"A5":{"v":"Accounts receivable"},"B5":{"v":"4000"},
"A6":{"v":"Inventory"},"B6":{"v":"3000"},
"A7":{"v":"Total current assets","b":1},"B7":{"v":"=SUM(B4:B6)","b":1},
"A8":{"v":"PP&E at cost (the truck)"},"B8":{"v":"40000"},
"A9":{"v":"(-) Accumulated depreciation"},"B9":{"v":"8000"},
"A10":{"v":"Net PP&E"},"B10":{"v":"=B8-B9"},
"A11":{"v":"Total assets","b":1},"B11":{"v":"=B7+B10","b":1},
"A13":{"v":"Liabilities","b":1},
"A14":{"v":"Accounts payable"},"B14":{"v":"2000"},
"A15":{"v":"Bank loan"},"B15":{"v":"25000"},
"A16":{"v":"Total liabilities","b":1},"B16":{"v":"=B14+B15","b":1},
"A18":{"v":"Shareholders' equity","b":1},
"A19":{"v":"Paid-in capital"},"B19":{"v":"15000"},
"A20":{"v":"Retained earnings"},"B20":{"v":"18000"},
"A21":{"v":"Total equity","b":1},"B21":{"v":"=B19+B20","b":1},
"A23":{"v":"Total liabilities + equity","b":1},"B23":{"v":"=B16+B21","b":1},
"A24":{"v":"Check (should be 0)"},"B24":{"v":"=B11-B23"}}}
```
Expected: B7 → 28,000 · B10 → 32,000 · B11 → 60,000 · B16 → 27,000 · B21 → 33,000 · B23 → 60,000 · B24 → 0.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: fill in the totals (end of Year 2)
```json
{"tab":"Practice 1","title":"Practice 1 · Maya's Tacos, end of Year 2","task":"Fill the yellow cells with formulas. The check must show 0. Then say \"check\" in the chat.","cols":3,"rows":24,"width":{"A":280,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: balance sheet, end of Year 2 ($)","b":1},
"A3":{"v":"Assets","b":1},
"A4":{"v":"Cash"},"B4":{"v":"49125"},
"A5":{"v":"Accounts receivable"},"B5":{"v":"6000"},
"A6":{"v":"Inventory"},"B6":{"v":"4000"},
"A7":{"v":"Total current assets","b":1},"B7":{"v":"","ans":1,"b":1},
"A8":{"v":"PP&E at cost (the truck)"},"B8":{"v":"40000"},
"A9":{"v":"(-) Accumulated depreciation"},"B9":{"v":"16000"},
"A10":{"v":"Net PP&E"},"B10":{"v":"","ans":1},
"A11":{"v":"Total assets","b":1},"B11":{"v":"","ans":1,"b":1},
"A13":{"v":"Liabilities","b":1},
"A14":{"v":"Accounts payable"},"B14":{"v":"3000"},
"A15":{"v":"Bank loan"},"B15":{"v":"20000"},
"A16":{"v":"Total liabilities","b":1},"B16":{"v":"","ans":1,"b":1},
"A18":{"v":"Shareholders' equity","b":1},
"A19":{"v":"Paid-in capital"},"B19":{"v":"15000"},
"A20":{"v":"Retained earnings"},"B20":{"v":"45125"},
"A21":{"v":"Total equity","b":1},"B21":{"v":"","ans":1,"b":1},
"A23":{"v":"Total liabilities + equity","b":1},"B23":{"v":"","ans":1,"b":1},
"A24":{"v":"Check (should be 0)"},"B24":{"v":"","ans":1}}}
```
Answer key: B7 `=SUM(B4:B6)` → 59,125 · B10 `=B8-B9` → 24,000 · B11 `=B7+B10` → 83,125 · B16 `=B14+B15` → 23,000 · B21 `=B19+B20` → 60,125 · B23 `=B16+B21` → 83,125 · B24 `=B11-B23` → 0.

### Practice 2: roll retained earnings forward and link it
```json
{"tab":"Practice 2","title":"Practice 2 · Retained earnings roll-forward","task":"Fill the yellow cells with formulas.\nHint: closing retained earnings = opening + net income − dividends. Then link the balance sheet's retained earnings to it instead of typing it.","cols":3,"rows":20,"width":{"A":280,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos, Year 2 ($)","b":1},
"A3":{"v":"Retained earnings roll-forward","b":1},
"A4":{"v":"Opening retained earnings"},"B4":{"v":"18000"},
"A5":{"v":"(+) Net income, Year 2"},"B5":{"v":"37125"},
"A6":{"v":"(-) Dividends paid to Maya"},"B6":{"v":"10000"},
"A7":{"v":"Closing retained earnings","b":1},"B7":{"v":"","ans":1,"b":1},
"A9":{"v":"Balance sheet, end of Year 2","b":1},
"A10":{"v":"Cash"},"B10":{"v":"49125"},
"A11":{"v":"Accounts receivable"},"B11":{"v":"6000"},
"A12":{"v":"Inventory"},"B12":{"v":"4000"},
"A13":{"v":"Net PP&E"},"B13":{"v":"24000"},
"A14":{"v":"Total assets","b":1},"B14":{"v":"","ans":1,"b":1},
"A15":{"v":"Accounts payable"},"B15":{"v":"3000"},
"A16":{"v":"Bank loan"},"B16":{"v":"20000"},
"A17":{"v":"Paid-in capital"},"B17":{"v":"15000"},
"A18":{"v":"Retained earnings"},"B18":{"v":"","ans":1},
"A19":{"v":"Total liabilities + equity","b":1},"B19":{"v":"","ans":1,"b":1},
"A20":{"v":"Check (should be 0)"},"B20":{"v":"","ans":1}}}
```
Answer key: B7 `=B4+B5-B6` → 45,125 · B14 `=SUM(B10:B13)` → 83,125 · B18 `=B7` → 45,125 · B19 `=SUM(B15:B18)` → 83,125 · B20 `=B14-B19` → 0.
If B18 is typed as 45125, it's right today but won't update if Year 2 profit changes: ask for `=B7`.
