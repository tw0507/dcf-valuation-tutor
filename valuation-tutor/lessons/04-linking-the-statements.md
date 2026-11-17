# Lesson 4: How the three statements link

**Time:** about 50 min · **Needs:** lesson 3
**Goal:** the learner can link an income statement, cash flow statement and balance sheet with formulas so that the balance sheet balances, walk any change through all three, and find a broken link.

This is the most important lesson of the statements half. Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Maya now has three reports: how the year went, where the cash went, and the snapshot on the last day. Her accountant says, "These aren't three reports. They're one report seen three ways."

She tests it. Year 2's profit was $37,125. That profit is the first line of her cash trace. It's also what made the "kept profits" on her snapshot grow, after the $10,000 she took out.

The truck's wear, $8,000, cut her profit. It came back as an add-back in the cash trace. And it's why the truck is worth $8,000 less on the snapshot.

The cash trace ends with how much cash she has. That number *is* the cash on the snapshot.

The money customers owe, the freezer stock and the unpaid bills sit on the snapshot. How much each one *changed* during the year shows up in the cash trace.

So if she changes one number, say the truck wears out faster, all three reports move together, and the snapshot still balances. If it doesn't balance, one of these connections is broken.

## 2. Reveal

| Term | In Maya's story |
|---|---|
| "Three-statement model" / "linked model" | the three reports connected by formulas, so one change flows through all of them |
| "Opening" and "closing" balance | the snapshot at the start of the year (end of last year) and at the end |
| "Roll-forward" | opening + additions − reductions = closing (retained earnings, PP&E, debt) |
| "Balance check" | assets − liabilities − equity, which must be 0 |
| "Plug" | a number forced in to make it balance. Never allowed: it hides a mistake |

The five links to remember:
1. **Net income** → top of the cash flow statement, and into retained earnings (minus dividends).
2. **Depreciation** → added back on the cash flow statement, and taken off net PP&E.
3. **Working capital changes** on the cash flow statement = the change in AR, inventory and AP on the balance sheet.
4. **Capex** → investing cash flow, and added to PP&E. **Debt raised/repaid** → financing, and the debt balance.
5. **Closing cash** from the cash flow statement → cash on the balance sheet.

## 3. Worked example

One tab holds all three statements. Column B is the end of Year 1 (the opening balance sheet), column C is Year 2. Walk it top to bottom, and for each link, show which cell it points to.

```json
{"tab":"Worked Example","title":"Lesson 4 · Worked example: Maya's Tacos, linked Year 2","task":"Everything in column C below the inputs is a formula. Change the depreciation in C7 and watch all three statements move while the check stays 0.","cols":3,"rows":54,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: linked model ($)","b":1},
"A3":{"v":"Inputs, Year 2","b":1},
"A4":{"v":"Revenue"},"C4":{"v":"169000"},
"A5":{"v":"Cost of goods sold"},"C5":{"v":"52000"},
"A6":{"v":"Operating expenses"},"C6":{"v":"58000"},
"A7":{"v":"Depreciation"},"C7":{"v":"8000"},
"A8":{"v":"Interest expense"},"C8":{"v":"1500"},
"A9":{"v":"Tax rate"},"C9":{"v":"25%"},
"A10":{"v":"Capex"},"C10":{"v":"0"},
"A11":{"v":"Loan repaid"},"C11":{"v":"5000"},
"A12":{"v":"Dividends to Maya"},"C12":{"v":"10000"},
"A13":{"v":"Accounts receivable at year end"},"C13":{"v":"6000"},
"A14":{"v":"Inventory at year end"},"C14":{"v":"4000"},
"A15":{"v":"Accounts payable at year end"},"C15":{"v":"3000"},
"A17":{"v":"Income statement","b":1},"C17":{"v":"Year 2","b":1},
"A18":{"v":"Revenue"},"C18":{"v":"=C4"},
"A19":{"v":"(-) Cost of goods sold"},"C19":{"v":"=C5"},
"A20":{"v":"Gross profit"},"C20":{"v":"=C18-C19"},
"A21":{"v":"(-) Operating expenses"},"C21":{"v":"=C6"},
"A22":{"v":"(-) Depreciation"},"C22":{"v":"=C7"},
"A23":{"v":"EBIT"},"C23":{"v":"=C20-C21-C22"},
"A24":{"v":"(-) Interest expense"},"C24":{"v":"=C8"},
"A25":{"v":"Pre-tax income"},"C25":{"v":"=C23-C24"},
"A26":{"v":"(-) Income tax"},"C26":{"v":"=C25*C9"},
"A27":{"v":"Net income","b":1},"C27":{"v":"=C25-C26","b":1},
"A29":{"v":"Cash flow statement","b":1},"C29":{"v":"Year 2","b":1},
"A30":{"v":"Net income"},"C30":{"v":"=C27"},
"A31":{"v":"(+) Depreciation"},"C31":{"v":"=C22"},
"A32":{"v":"(-) Increase in accounts receivable"},"C32":{"v":"=C44-B44"},
"A33":{"v":"(-) Increase in inventory"},"C33":{"v":"=C45-B45"},
"A34":{"v":"(+) Increase in accounts payable"},"C34":{"v":"=C49-B49"},
"A35":{"v":"Cash from operations","b":1},"C35":{"v":"=C30+C31-C32-C33+C34","b":1},
"A36":{"v":"(-) Capex"},"C36":{"v":"=C10"},
"A37":{"v":"Cash from investing","b":1},"C37":{"v":"=-C36","b":1},
"A38":{"v":"(-) Loan repaid"},"C38":{"v":"=C11"},
"A39":{"v":"(-) Dividends"},"C39":{"v":"=C12"},
"A40":{"v":"Cash from financing","b":1},"C40":{"v":"=-C38-C39","b":1},
"A41":{"v":"Net change in cash","b":1},"C41":{"v":"=C35+C37+C40","b":1},
"A42":{"v":"Balance sheet","b":1},"B42":{"v":"End Year 1","b":1},"C42":{"v":"End Year 2","b":1},
"A43":{"v":"Cash"},"B43":{"v":"21000"},"C43":{"v":"=B43+C41"},
"A44":{"v":"Accounts receivable"},"B44":{"v":"4000"},"C44":{"v":"=C13"},
"A45":{"v":"Inventory"},"B45":{"v":"3000"},"C45":{"v":"=C14"},
"A46":{"v":"Net PP&E"},"B46":{"v":"32000"},"C46":{"v":"=B46+C10-C22"},
"A47":{"v":"Total assets","b":1},"B47":{"v":"=SUM(B43:B46)","b":1},"C47":{"v":"=SUM(C43:C46)","b":1},
"A49":{"v":"Accounts payable"},"B49":{"v":"2000"},"C49":{"v":"=C15"},
"A50":{"v":"Bank loan"},"B50":{"v":"25000"},"C50":{"v":"=B50-C11"},
"A51":{"v":"Paid-in capital"},"B51":{"v":"15000"},"C51":{"v":"=B51"},
"A52":{"v":"Retained earnings"},"B52":{"v":"18000"},"C52":{"v":"=B52+C27-C12"},
"A53":{"v":"Total liabilities + equity","b":1},"B53":{"v":"=SUM(B49:B52)","b":1},"C53":{"v":"=SUM(C49:C52)","b":1},
"A54":{"v":"Check (should be 0)"},"B54":{"v":"=B47-B53"},"C54":{"v":"=C47-C53"}}}
```
Expected: C27 → 37,125 · C35 → 43,125 · C41 → 28,125 · C43 → 49,125 · C46 → 24,000 · C52 → 45,125 · C47 → 83,125 · C54 → 0.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: fill in the links
```json
{"tab":"Practice 1","title":"Practice 1 · Fill in the links","task":"The model is built, but six links are missing (yellow). Fill them with formulas. The check must show 0.","cols":3,"rows":54,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: linked model ($)","b":1},
"A3":{"v":"Inputs, Year 2","b":1},
"A4":{"v":"Revenue"},"C4":{"v":"169000"},
"A5":{"v":"Cost of goods sold"},"C5":{"v":"52000"},
"A6":{"v":"Operating expenses"},"C6":{"v":"58000"},
"A7":{"v":"Depreciation"},"C7":{"v":"8000"},
"A8":{"v":"Interest expense"},"C8":{"v":"1500"},
"A9":{"v":"Tax rate"},"C9":{"v":"25%"},
"A10":{"v":"Capex"},"C10":{"v":"0"},
"A11":{"v":"Loan repaid"},"C11":{"v":"5000"},
"A12":{"v":"Dividends to Maya"},"C12":{"v":"10000"},
"A13":{"v":"Accounts receivable at year end"},"C13":{"v":"6000"},
"A14":{"v":"Inventory at year end"},"C14":{"v":"4000"},
"A15":{"v":"Accounts payable at year end"},"C15":{"v":"3000"},
"A17":{"v":"Income statement","b":1},"C17":{"v":"Year 2","b":1},
"A18":{"v":"Revenue"},"C18":{"v":"=C4"},
"A19":{"v":"(-) Cost of goods sold"},"C19":{"v":"=C5"},
"A20":{"v":"Gross profit"},"C20":{"v":"=C18-C19"},
"A21":{"v":"(-) Operating expenses"},"C21":{"v":"=C6"},
"A22":{"v":"(-) Depreciation"},"C22":{"v":"=C7"},
"A23":{"v":"EBIT"},"C23":{"v":"=C20-C21-C22"},
"A24":{"v":"(-) Interest expense"},"C24":{"v":"=C8"},
"A25":{"v":"Pre-tax income"},"C25":{"v":"=C23-C24"},
"A26":{"v":"(-) Income tax"},"C26":{"v":"=C25*C9"},
"A27":{"v":"Net income","b":1},"C27":{"v":"=C25-C26","b":1},
"A29":{"v":"Cash flow statement","b":1},"C29":{"v":"Year 2","b":1},
"A30":{"v":"Net income"},"C30":{"v":"","ans":1},
"A31":{"v":"(+) Depreciation"},"C31":{"v":"=C22"},
"A32":{"v":"(-) Increase in accounts receivable"},"C32":{"v":"=C44-B44"},
"A33":{"v":"(-) Increase in inventory"},"C33":{"v":"=C45-B45"},
"A34":{"v":"(+) Increase in accounts payable"},"C34":{"v":"=C49-B49"},
"A35":{"v":"Cash from operations","b":1},"C35":{"v":"=C30+C31-C32-C33+C34","b":1},
"A36":{"v":"(-) Capex"},"C36":{"v":"=C10"},
"A37":{"v":"Cash from investing","b":1},"C37":{"v":"=-C36","b":1},
"A38":{"v":"(-) Loan repaid"},"C38":{"v":"=C11"},
"A39":{"v":"(-) Dividends"},"C39":{"v":"=C12"},
"A40":{"v":"Cash from financing","b":1},"C40":{"v":"=-C38-C39","b":1},
"A41":{"v":"Net change in cash","b":1},"C41":{"v":"=C35+C37+C40","b":1},
"A42":{"v":"Balance sheet","b":1},"B42":{"v":"End Year 1","b":1},"C42":{"v":"End Year 2","b":1},
"A43":{"v":"Cash"},"B43":{"v":"21000"},"C43":{"v":"","ans":1},
"A44":{"v":"Accounts receivable"},"B44":{"v":"4000"},"C44":{"v":"=C13"},
"A45":{"v":"Inventory"},"B45":{"v":"3000"},"C45":{"v":"=C14"},
"A46":{"v":"Net PP&E"},"B46":{"v":"32000"},"C46":{"v":"","ans":1},
"A47":{"v":"Total assets","b":1},"B47":{"v":"=SUM(B43:B46)","b":1},"C47":{"v":"=SUM(C43:C46)","b":1},
"A49":{"v":"Accounts payable"},"B49":{"v":"2000"},"C49":{"v":"=C15"},
"A50":{"v":"Bank loan"},"B50":{"v":"25000"},"C50":{"v":"","ans":1},
"A51":{"v":"Paid-in capital"},"B51":{"v":"15000"},"C51":{"v":"=B51"},
"A52":{"v":"Retained earnings"},"B52":{"v":"18000"},"C52":{"v":"","ans":1},
"A53":{"v":"Total liabilities + equity","b":1},"B53":{"v":"=SUM(B49:B52)","b":1},"C53":{"v":"=SUM(C49:C52)","b":1},
"A54":{"v":"Check (should be 0)"},"B54":{"v":"=B47-B53"},"C54":{"v":"","ans":1}}}
```
Answer key: C30 `=C27` → 37,125 · C43 `=B43+C41` → 49,125 · C46 `=B46+C10-C22` → 24,000 · C50 `=B50-C11` → 20,000 · C52 `=B52+C27-C12` → 45,125 · C54 `=C47-C53` → 0.

### Practice 2: the depreciation walk, in numbers
```json
{"tab":"Practice 2","title":"Practice 2 · Walk a change through all three","task":"Depreciation goes up by $10 and the tax rate is 25%. Fill each yellow cell with the change on that line, as a formula.\nHint: start on the income statement, then cash flow, then balance sheet. The check must be 0.","cols":3,"rows":22,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"What happens when depreciation rises by $10?","b":1},
"A3":{"v":"Inputs","b":1},
"A4":{"v":"Extra depreciation"},"B4":{"v":"10"},
"A5":{"v":"Tax rate"},"B5":{"v":"25%"},
"A7":{"v":"Income statement","b":1},
"A8":{"v":"Change in EBIT"},"B8":{"v":"","ans":1,"f":"dec"},
"A9":{"v":"Change in income tax"},"B9":{"v":"","ans":1,"f":"dec"},
"A10":{"v":"Change in net income"},"B10":{"v":"","ans":1,"f":"dec"},
"A12":{"v":"Cash flow statement","b":1},
"A13":{"v":"Change in net income"},"B13":{"v":"","ans":1,"f":"dec"},
"A14":{"v":"Change in depreciation add-back"},"B14":{"v":"","ans":1,"f":"dec"},
"A15":{"v":"Change in cash"},"B15":{"v":"","ans":1,"f":"dec"},
"A17":{"v":"Balance sheet","b":1},
"A18":{"v":"Change in cash"},"B18":{"v":"","ans":1,"f":"dec"},
"A19":{"v":"Change in net PP&E"},"B19":{"v":"","ans":1,"f":"dec"},
"A20":{"v":"Change in total assets"},"B20":{"v":"","ans":1,"f":"dec"},
"A21":{"v":"Change in retained earnings"},"B21":{"v":"","ans":1,"f":"dec"},
"A22":{"v":"Check (assets change - equity change)"},"B22":{"v":"","ans":1,"f":"dec"}}}
```
Answer key: B8 `=-B4` → −10 · B9 `=B8*B5` → −2.5 · B10 `=B8-B9` → −7.5 · B13 `=B10` → −7.5 · B14 `=B4` → 10 · B15 `=B13+B14` → 2.5 · B18 `=B15` → 2.5 · B19 `=-B4` → −10 · B20 `=B18+B19` → −7.5 · B21 `=B10` → −7.5 · B22 `=B20-B21` → 0.
This walk is a classic banking interview question.
