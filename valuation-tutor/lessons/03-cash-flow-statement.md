# Lesson 3: The cash flow statement

**Time:** about 35 min · **Needs:** lesson 2
**Goal:** the learner can build a cash flow statement (indirect method) from net income and balance-sheet changes, explain why profit and cash differ, and spot a profitable business running out of cash.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Maya made $18,000 of profit in Year 1. Yet when she checks the bank, there's $21,000. And at one point in the middle of the year, the account nearly hit zero. Profit and cash clearly aren't the same thing. So she traces where every dollar of cash came from and went.

She starts with the $18,000 profit. But the $8,000 she counted for the truck wearing out never left her bank account this year, so she adds it back: $26,000.

Then the timing gaps. The catering client still owes her $4,000: that was counted as a sale, but the cash hasn't arrived, so take it off. She also has $3,000 of ingredients in the freezer, bought with cash but not yet used: take that off too. But she hasn't paid her $2,000 supplier bill, so that cash is still in her account: add it. Running the trucks gave her $21,000 of cash.

Separately, she spent $40,000 buying the truck. That's not a running cost; it's buying something that lasts.

And money came in from people funding her: $15,000 of her own savings and a $30,000 bank loan, minus the $5,000 she's already paid back. That's $40,000.

Add it up: +21,000 from running the business, −40,000 on the truck, +40,000 from funding. The bank balance went from $0 to $21,000. It matches.

## 2. Reveal

| Term | In Maya's story |
|---|---|
| "Cash flow statement" | the trace of where cash came from and went during the year |
| "Cash from operations" ("CFO") | the $21,000 cash from running the trucks |
| "Indirect method" | starting from net income and adjusting it to cash, as Maya did |
| "Non-cash expense" / "add-back" | the $8,000 depreciation: a cost with no cash leaving this year |
| "Working capital" | the timing items: receivables, inventory, payables |
| "Change in working capital" | an asset going up uses cash (−4,000, −3,000); a liability going up keeps cash (+2,000) |
| "Cash from investing" ("CFI") | the −$40,000 truck purchase |
| "Capital expenditure" ("capex") | spending on long-lasting assets like the truck |
| "Cash from financing" ("CFF") | the +$40,000 from owners and lenders, net of repayments |
| "Net change in cash" | +$21,000: CFO + CFI + CFF |
| "Free cash flow" ("FCF") | CFO − capex: cash the business generates after keeping its equipment going (Year 1: −19,000) |

Make two points:
- **Profit is an opinion, cash is a fact.** Profit depends on rules like spreading the truck's cost; cash is what's in the bank.
- **The rule of thumb for working capital:** an asset going up uses cash; a liability going up provides cash. In real filings, outflows are shown as negative numbers (in brackets).

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson 3 · Worked example: Maya's Tacos, Year 1 cash flow","task":"Blue numbers are typed in. Outflows are typed as positive numbers and subtracted in the formulas. Closing cash must match the balance sheet ($21,000).","cols":3,"rows":25,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: cash flow statement, Year 1 ($)","b":1},
"A3":{"v":"Operating","b":1},
"A4":{"v":"Net income"},"B4":{"v":"18000"},
"A5":{"v":"(+) Depreciation"},"B5":{"v":"8000"},
"A6":{"v":"(-) Increase in accounts receivable"},"B6":{"v":"4000"},
"A7":{"v":"(-) Increase in inventory"},"B7":{"v":"3000"},
"A8":{"v":"(+) Increase in accounts payable"},"B8":{"v":"2000"},
"A9":{"v":"Cash from operations","b":1},"B9":{"v":"=B4+B5-B6-B7+B8","b":1},
"A11":{"v":"Investing","b":1},
"A12":{"v":"(-) Truck bought (capex)"},"B12":{"v":"40000"},
"A13":{"v":"Cash from investing","b":1},"B13":{"v":"=-B12","b":1},
"A15":{"v":"Financing","b":1},
"A16":{"v":"(+) Owner's savings put in"},"B16":{"v":"15000"},
"A17":{"v":"(+) Bank loan taken"},"B17":{"v":"30000"},
"A18":{"v":"(-) Loan repaid"},"B18":{"v":"5000"},
"A19":{"v":"Cash from financing","b":1},"B19":{"v":"=B16+B17-B18","b":1},
"A21":{"v":"Net change in cash","b":1},"B21":{"v":"=B9+B13+B19","b":1},
"A22":{"v":"Opening cash"},"B22":{"v":"0"},
"A23":{"v":"Closing cash","b":1},"B23":{"v":"=B22+B21","b":1},
"A25":{"v":"Free cash flow (CFO - capex)"},"B25":{"v":"=B9-B12"}}}
```
Expected: B9 → 21,000 · B13 → −40,000 · B19 → 40,000 · B21 → 21,000 · B23 → 21,000 · B25 → −19,000.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: Year 2 (fill in the totals)
```json
{"tab":"Practice 1","title":"Practice 1 · Maya's Tacos, Year 2 cash flow","task":"Fill the yellow cells with formulas. Closing cash should match the Year 2 balance sheet from Lesson 2 ($49,125). Then say \"check\".","cols":3,"rows":22,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: cash flow statement, Year 2 ($)","b":1},
"A3":{"v":"Operating","b":1},
"A4":{"v":"Net income"},"B4":{"v":"37125"},
"A5":{"v":"(+) Depreciation"},"B5":{"v":"8000"},
"A6":{"v":"(-) Increase in accounts receivable"},"B6":{"v":"2000"},
"A7":{"v":"(-) Increase in inventory"},"B7":{"v":"1000"},
"A8":{"v":"(+) Increase in accounts payable"},"B8":{"v":"1000"},
"A9":{"v":"Cash from operations","b":1},"B9":{"v":"","ans":1,"b":1},
"A11":{"v":"Investing","b":1},
"A12":{"v":"(-) Capex"},"B12":{"v":"0"},
"A13":{"v":"Cash from investing","b":1},"B13":{"v":"=-B12","b":1},
"A15":{"v":"Financing","b":1},
"A16":{"v":"(-) Loan repaid"},"B16":{"v":"5000"},
"A17":{"v":"(-) Dividends paid to Maya"},"B17":{"v":"10000"},
"A18":{"v":"Cash from financing","b":1},"B18":{"v":"","ans":1,"b":1},
"A20":{"v":"Net change in cash","b":1},"B20":{"v":"","ans":1,"b":1},
"A21":{"v":"Opening cash"},"B21":{"v":"21000"},
"A22":{"v":"Closing cash","b":1},"B22":{"v":"","ans":1,"b":1}}}
```
Answer key: B9 `=B4+B5-B6-B7+B8` → 43,125 · B18 `=-B16-B17` → −15,000 · B20 `=B9+B13+B18` → 28,125 · B22 `=B21+B20` → 49,125.

### Practice 2: working capital from two balance sheets
```json
{"tab":"Practice 2","title":"Practice 2 · Working capital changes","task":"Fill the yellow cells with formulas that use the two balance sheets at the top.\nHint: an asset going up uses cash; a liability going up keeps cash.","cols":3,"rows":14,"width":{"A":300,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos, Year 2 ($)","b":1},
"B3":{"v":"End Year 1","b":1},"C3":{"v":"End Year 2","b":1},
"A4":{"v":"Accounts receivable"},"B4":{"v":"4000"},"C4":{"v":"6000"},
"A5":{"v":"Inventory"},"B5":{"v":"3000"},"C5":{"v":"4000"},
"A6":{"v":"Accounts payable"},"B6":{"v":"2000"},"C6":{"v":"3000"},
"A8":{"v":"Cash from operations, Year 2","b":1},
"A9":{"v":"Net income"},"B9":{"v":"37125"},
"A10":{"v":"(+) Depreciation"},"B10":{"v":"8000"},
"A11":{"v":"(-) Increase in accounts receivable"},"B11":{"v":"","ans":1},
"A12":{"v":"(-) Increase in inventory"},"B12":{"v":"","ans":1},
"A13":{"v":"(+) Increase in accounts payable"},"B13":{"v":"","ans":1},
"A14":{"v":"Cash from operations","b":1},"B14":{"v":"","ans":1,"b":1}}}
```
Answer key: B11 `=C4-B4` → 2,000 · B12 `=C5-B5` → 1,000 · B13 `=C6-B6` → 1,000 · B14 `=B9+B10-B11-B12+B13` → 43,125.
