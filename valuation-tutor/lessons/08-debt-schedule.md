# Lesson 8: The debt schedule and interest

**Time:** about 35 min · **Needs:** lesson 7
**Goal:** the learner can model a term loan with mandatory repayments, a revolver that keeps cash above a minimum, interest on opening and average balances, and an optional cash sweep.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Maya's company owes the bank $80,000 on a loan. The deal: pay back $20,000 every year, and pay 7% interest each year on what was owed at the start of that year.

She also wants a safety net. The bank offers a credit line: she can borrow from it whenever cash runs low, and pay it back when cash comes in, paying 9% on whatever she's borrowed. Maya never wants less than $20,000 in the bank.

So she plans a tough three years. In the first year, after everything else, she'd only have $5,000. That's $15,000 short of her safety level, so she borrows $15,000 from the credit line. The next year she'd have $31,000: $11,000 more than she needs, so she pays $11,000 back. The year after, she'd have plenty, so she pays off the last $4,000 and keeps the rest.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Term loan" | a loan for a fixed term, repaid on a schedule |
| "Mandatory repayment" / "amortization" | the scheduled repayment ($20,000 a year) |
| "Revolver" (revolving credit facility, "RCF") | a credit line drawn and repaid as needed |
| "Minimum cash" | the cash balance the company wants to keep ($20,000) |
| "Draw" / "repay" | borrowing from / paying back the revolver |
| "Interest on opening balance" | simple and avoids circularity; slightly off when balances change a lot during the year |
| "Interest on average balance" | (opening + closing) ÷ 2 × rate: more accurate |
| "Cash sweep" | using spare cash to repay a loan early |
| "Net debt" | total debt − cash |

The revolver formula, in words: **draw = the shortfall below minimum cash, but if there's surplus, repay — never more than you owe.** In Excel: `=MAX(min cash − cash before revolver, −opening revolver)`.

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson 8 · Worked example: term loan and revolver","task":"Row 9 is a given input here (in lesson 9 it comes from the cash flow statement). Follow the revolver formula in row 17: it draws when cash is short and repays when there's surplus.","cols":5,"rows":25,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: debt ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Assumptions","b":1},
"A5":{"v":"Term loan repayment per year"},"B5":{"v":"20000"},
"A6":{"v":"Term loan interest rate"},"B6":{"v":"7%"},
"A7":{"v":"Revolver interest rate"},"B7":{"v":"9%"},
"A8":{"v":"Minimum cash"},"B8":{"v":"20000"},
"A9":{"v":"Cash before revolver (a tough plan)"},"C9":{"v":"5000"},"D9":{"v":"31000"},"E9":{"v":"60000"},
"A11":{"v":"Term loan","b":1},
"A12":{"v":"Opening balance"},"C12":{"v":"=B14"},"D12":{"v":"=C14"},"E12":{"v":"=D14"},
"A13":{"v":"(-) Repayment"},"C13":{"v":"=MIN($B$5,C12)"},"D13":{"v":"=MIN($B$5,D12)"},"E13":{"v":"=MIN($B$5,E12)"},
"A14":{"v":"Closing balance"},"B14":{"v":"80000"},"C14":{"v":"=C12-C13"},"D14":{"v":"=D12-D13"},"E14":{"v":"=E12-E13"},
"A15":{"v":"Revolver","b":1},
"A16":{"v":"Opening balance"},"C16":{"v":"=B18"},"D16":{"v":"=C18"},"E16":{"v":"=D18"},
"A17":{"v":"Draw / (repay)"},"C17":{"v":"=MAX($B$8-C9,-C16)"},"D17":{"v":"=MAX($B$8-D9,-D16)"},"E17":{"v":"=MAX($B$8-E9,-E16)"},
"A18":{"v":"Closing balance"},"B18":{"v":"0"},"C18":{"v":"=C16+C17"},"D18":{"v":"=D16+D17"},"E18":{"v":"=E16+E17"},
"A19":{"v":"Cash at year end"},"C19":{"v":"=C9+C17"},"D19":{"v":"=D9+D17"},"E19":{"v":"=E9+E17"},
"A21":{"v":"Interest","b":1},
"A22":{"v":"Term loan interest (on opening)"},"C22":{"v":"=C12*$B$6"},"D22":{"v":"=D12*$B$6"},"E22":{"v":"=E12*$B$6"},
"A23":{"v":"Revolver interest (on opening)"},"C23":{"v":"=C16*$B$7"},"D23":{"v":"=D16*$B$7"},"E23":{"v":"=E16*$B$7"},
"A24":{"v":"Total interest expense","b":1},"C24":{"v":"=C22+C23","b":1},"D24":{"v":"=D22+D23","b":1},"E24":{"v":"=E22+E23","b":1},
"A25":{"v":"Total debt at year end"},"B25":{"v":"=B14+B18"},"C25":{"v":"=C14+C18"},"D25":{"v":"=D14+D18"},"E25":{"v":"=E14+E18"}}}
```
Expected: C14 → 60,000 · E14 → 20,000 · C17 → 15,000 · D17 → −11,000 · E17 → −4,000 · E18 → 0 · C19 → 20,000 · E19 → 56,000 · C24 → 5,600 · D24 → 5,550 · E24 → 3,160 · C25 → 75,000.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: the term loan
```json
{"tab":"Practice 1","title":"Practice 1 · Term loan","task":"Fill the yellow cells with formulas. Use MIN so the model never repays more than is owed. Interest is on the opening balance.","cols":5,"rows":12,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: term loan ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Repayment per year"},"B4":{"v":"20000"},
"A5":{"v":"Interest rate"},"B5":{"v":"7%"},
"A7":{"v":"Opening balance"},"C7":{"v":"","ans":1},"D7":{"v":"","ans":1},"E7":{"v":"","ans":1},
"A8":{"v":"(-) Repayment"},"C8":{"v":"","ans":1},"D8":{"v":"","ans":1},"E8":{"v":"","ans":1},
"A9":{"v":"Closing balance"},"B9":{"v":"80000"},"C9":{"v":"","ans":1},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},
"A11":{"v":"Interest expense"},"C11":{"v":"","ans":1},"D11":{"v":"","ans":1},"E11":{"v":"","ans":1}}}
```
Answer key: C7 `=B9` → 80,000 · D7 `=C9` → 60,000 · E7 `=D9` → 40,000 · C8 `=MIN($B$4,C7)` → 20,000 · D8 `=MIN($B$4,D7)` → 20,000 · E8 `=MIN($B$4,E7)` → 20,000 · C9 `=C7-C8` → 60,000 · D9 `=D7-D8` → 40,000 · E9 `=E7-E8` → 20,000 · C11 `=C7*$B$5` → 5,600 · D11 `=D7*$B$5` → 4,200 · E11 `=E7*$B$5` → 2,800.

### Practice 2: the revolver
```json
{"tab":"Practice 2","title":"Practice 2 · The revolver","task":"Fill the yellow cells with formulas.\nHint: draw / (repay) = MAX(minimum cash - cash before revolver, -opening revolver). Cash at year end = cash before revolver + draw.","cols":5,"rows":13,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: revolver ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Minimum cash"},"B4":{"v":"20000"},
"A5":{"v":"Revolver interest rate"},"B5":{"v":"9%"},
"A6":{"v":"Cash before revolver"},"C6":{"v":"5000"},"D6":{"v":"31000"},"E6":{"v":"60000"},
"A8":{"v":"Opening revolver"},"C8":{"v":"","ans":1},"D8":{"v":"","ans":1},"E8":{"v":"","ans":1},
"A9":{"v":"Draw / (repay)"},"C9":{"v":"","ans":1},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},
"A10":{"v":"Closing revolver"},"B10":{"v":"0"},"C10":{"v":"","ans":1},"D10":{"v":"","ans":1},"E10":{"v":"","ans":1},
"A11":{"v":"Cash at year end"},"C11":{"v":"","ans":1},"D11":{"v":"","ans":1},"E11":{"v":"","ans":1},
"A12":{"v":"Revolver interest (on opening)"},"C12":{"v":"","ans":1},"D12":{"v":"","ans":1},"E12":{"v":"","ans":1}}}
```
Answer key: C8 `=B10` → 0 · D8 `=C10` → 15,000 · E8 `=D10` → 4,000 · C9 `=MAX($B$4-C6,-C8)` → 15,000 · D9 `=MAX($B$4-D6,-D8)` → −11,000 · E9 `=MAX($B$4-E6,-E8)` → −4,000 · C10 `=C8+C9` → 15,000 · D10 `=D8+D9` → 4,000 · E10 `=E8+E9` → 0 · C11 `=C6+C9` → 20,000 · D11 `=D6+D9` → 20,000 · E11 `=E6+E9` → 56,000 · C12 `=C8*$B$5` → 0 · D12 `=D8*$B$5` → 1,350 · E12 `=E8*$B$5` → 360.
If the learner uses IF instead of MAX and gets it right, accept it; then show the MAX version as the standard.
