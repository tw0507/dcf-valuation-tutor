# Lesson A1: How the three statements link

**Time:** about 60 min · **Needs:** the three statements (standard lessons 1-3)
**Goal:** the learner can link an income statement, cash flow statement and balance sheet with formulas so that the balance sheet balances, walk any change through all three, and find a broken link.

This is the most important lesson in the course. Tabs: Worked Example, Practice 1, Practice 2.

---

## 0. Colour code (tell the learner before the first build)

Every practice Sheet uses the colours bankers use, so anyone can see at a glance what's typed and what's calculated:
- **Blue text** = a number typed in (an input or assumption). Change these to test ideas.
- **Black text** = a formula. Never type a number over one.
- **Yellow fill** = your turn: type a formula here.
- **Pale blue fill** = your turn, but type a value (e.g. a scenario number), not a formula.

Later, in the NVIDIA model (Part 3), three more appear: **green** = a link to another sheet, a **dark blue bar** = a section header, and a **light blue fill** = a key output.
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

One tab holds all three statements. Column B is the end of Year 1 (the opening balance sheet), column C is Year 2. Walk it top to bottom, and for each link, ask the learner to click the cell and say where it points.

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

### Practice 1: from scratch (Leo, linked Year 2)
```json
{"tab":"Practice 1","title":"Practice 1 · Leo's Bike Repair, linked Year 2","task":"Build Leo's Year 2 income statement, cash flow statement and end-of-Year-2 balance sheet below the inputs, all as formulas, with a check row that shows 0.\nThe inputs and Leo's end-of-Year-1 balance sheet are given.","cols":3,"rows":55,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"Leo's Bike Repair: linked model ($)","b":1},
"A3":{"v":"Inputs, Year 2","b":1},
"A4":{"v":"Repairs"},"B4":{"v":"1400"},
"A5":{"v":"Price per repair"},"B5":{"v":"90"},
"A6":{"v":"Parts per repair"},"B6":{"v":"26"},
"A7":{"v":"Rent & wages"},"B7":{"v":"50000"},
"A8":{"v":"Depreciation"},"B8":{"v":"3000"},
"A9":{"v":"Interest expense"},"B9":{"v":"600"},
"A10":{"v":"Tax rate"},"B10":{"v":"20%"},
"A11":{"v":"Uncle's loan repaid"},"B11":{"v":"2000"},
"A12":{"v":"Leo takes out for himself"},"B12":{"v":"8000"},
"A13":{"v":"Receivables at year end"},"B13":{"v":"1500"},
"A14":{"v":"Parts inventory at year end"},"B14":{"v":"2600"},
"A15":{"v":"Payables at year end"},"B15":{"v":"900"},
"A17":{"v":"Balance sheet, end of Year 1","b":1},
"A18":{"v":"Cash"},"B18":{"v":"18100"},
"A19":{"v":"Accounts receivable"},"B19":{"v":"1200"},
"A20":{"v":"Inventory"},"B20":{"v":"2300"},
"A21":{"v":"Net tools (PP&E)"},"B21":{"v":"9000"},
"A22":{"v":"Accounts payable"},"B22":{"v":"800"},
"A23":{"v":"Uncle's loan"},"B23":{"v":"6000"},
"A24":{"v":"Paid-in capital"},"B24":{"v":"10000"},
"A25":{"v":"Retained earnings"},"B25":{"v":"13800"}}}
```
Reference solution (cells below the given block; the learner's layout can differ):
```solution
{"tab":"Practice 1 solution","cells":{
"B4":{"v":"1400"},"B5":{"v":"90"},"B6":{"v":"26"},"B7":{"v":"50000"},"B8":{"v":"3000"},"B9":{"v":"600"},"B10":{"v":"20%"},"B11":{"v":"2000"},"B12":{"v":"8000"},"B13":{"v":"1500"},"B14":{"v":"2600"},"B15":{"v":"900"},
"B18":{"v":"18100"},"B19":{"v":"1200"},"B20":{"v":"2300"},"B21":{"v":"9000"},"B22":{"v":"800"},"B23":{"v":"6000"},"B24":{"v":"10000"},"B25":{"v":"13800"},
"B28":{"v":"=B4*B5"},"B29":{"v":"=B4*B6"},"B30":{"v":"=B28-B29"},"B31":{"v":"=B30-B7-B8"},"B32":{"v":"=B31-B9"},"B33":{"v":"=B32*B10"},"B34":{"v":"=B32-B33"},
"B36":{"v":"=B34+B8-(B13-B19)-(B14-B20)+(B15-B22)"},"B37":{"v":"=-B11-B12"},"B38":{"v":"=B36+B37"},
"B40":{"v":"=B18+B38"},"B41":{"v":"=B13"},"B42":{"v":"=B14"},"B43":{"v":"=B21-B8"},"B44":{"v":"=SUM(B40:B43)"},
"B45":{"v":"=B15"},"B46":{"v":"=B23-B11"},"B47":{"v":"=B24"},"B48":{"v":"=B25+B34-B12"},"B49":{"v":"=SUM(B45:B48)"},"B50":{"v":"=B44-B49"}}}
```
Answer key: revenue B28 → 126,000 · COGS B29 → 36,400 · EBIT B31 → 36,600 · pre-tax B32 → 36,000 · tax B33 → 7,200 · net income B34 → 28,800 · CFO B36 → 31,300 · CFF B37 → −10,000 · net change B38 → 21,300 · cash B40 → 39,400 · net tools B43 → 6,000 · total assets B44 → 49,500 · loan B46 → 4,000 · retained earnings B48 → 34,600 · liabilities + equity B49 → 49,500 · check B50 → 0.
If the check isn't 0, don't point at the cell. Ask: "Which of the five links have you made?" and let them find it.

### Practice 2: twist (bug hunt)
```json
{"tab":"Practice 2","title":"Practice 2 · Bug hunt","task":"Someone broke this model: the check shows -12,000. There are two broken formulas and no wrong inputs. Find and fix them. Don't type a plug!","cols":3,"rows":54,"width":{"A":300,"B":110,"C":110},"cells":{
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
"A34":{"v":"(+) Increase in accounts payable"},"C34":{"v":"=B49-C49"},
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
"A52":{"v":"Retained earnings"},"B52":{"v":"18000"},"C52":{"v":"=B52+C27"},
"A53":{"v":"Total liabilities + equity","b":1},"B53":{"v":"=SUM(B49:B52)","b":1},"C53":{"v":"=SUM(C49:C52)","b":1},
"A54":{"v":"Check (should be 0)"},"B54":{"v":"=B47-B53"},"C54":{"v":"=C47-C53"}}}
```
Answer key (after the fixes): C34 `=C49-B49` → 1,000 · C52 `=B52+C27-C12` → 45,125 · C43 → 49,125 · C54 → 0.
The two bugs: payables change has its sign flipped (−1,000 instead of +1,000, a 2,000 gap in cash) and retained earnings forgets dividends (10,000 too high). Together: −12,000. Read C34 and C52 to check. Hint ladder if stuck: "Is the gap a round number you recognise?" → "10,000 is the dividend; where should dividends appear?" → "That leaves 2,000. Which line is worth 1,000 and could have its sign flipped?"
