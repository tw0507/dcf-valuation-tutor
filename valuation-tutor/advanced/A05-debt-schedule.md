# Lesson A5: The debt schedule and interest

**Time:** about 40 min · **Needs:** lesson A4
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
{"tab":"Worked Example","title":"Lesson A5 · Worked example: term loan and revolver","task":"Row 9 is a given input here (in lesson A6 it comes from the cash flow statement). Follow the revolver formula in row 17: it draws when cash is short and repays when there's surplus.","cols":5,"rows":25,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
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

### Practice 1: from scratch (Leo's two loans, average balance)
```json
{"tab":"Practice 1","title":"Practice 1 · Leo's two loans","task":"Build Leo's debt schedule for 2026E-2028E with interest on the AVERAGE balance.\nFacts: Leo owes his uncle $4,000 at the end of 2025, repaid $2,000 a year, at 5%. In 2026 he takes a $10,000 equipment loan at 8%, repaid $2,000 a year from 2027.\nShow opening, draw, repayment and closing for each loan, the interest on each, and total interest.","cols":5,"rows":20,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{"A1":{"v":"Leo's Bike Repair: debt ($)","b":1}}}
```
```solution
{"tab":"Practice 1 solution","cells":{
"B3":{"v":"2000"},"B4":{"v":"5%"},"B5":{"v":"10000"},"B6":{"v":"2000"},"B7":{"v":"8%"},
"C9":{"v":"=B11"},"D9":{"v":"=C11"},"E9":{"v":"=D11"},
"C10":{"v":"=MIN($B$3,C9)"},"D10":{"v":"=MIN($B$3,D9)"},"E10":{"v":"=MIN($B$3,E9)"},
"B11":{"v":"4000"},"C11":{"v":"=C9-C10"},"D11":{"v":"=D9-D10"},"E11":{"v":"=E9-E10"},
"C13":{"v":"=B16"},"D13":{"v":"=C16"},"E13":{"v":"=D16"},
"C14":{"v":"=B5"},"D14":{"v":"0"},"E14":{"v":"0"},
"C15":{"v":"0"},"D15":{"v":"=MIN($B$6,D13)"},"E15":{"v":"=MIN($B$6,E13)"},
"B16":{"v":"0"},"C16":{"v":"=C13+C14-C15"},"D16":{"v":"=D13+D14-D15"},"E16":{"v":"=E13+E14-E15"},
"C18":{"v":"=(C9+C11)/2*$B$4"},"D18":{"v":"=(D9+D11)/2*$B$4"},"E18":{"v":"=(E9+E11)/2*$B$4"},
"C19":{"v":"=(C13+C16)/2*$B$7"},"D19":{"v":"=(D13+D16)/2*$B$7"},"E19":{"v":"=(E13+E16)/2*$B$7"},
"C20":{"v":"=C18+C19"},"D20":{"v":"=D18+D19"},"E20":{"v":"=E18+E19"}}}
```
Answer key: uncle's loan closing 2026E C11 → 2,000 · 2027E D11 → 0 · equipment loan closing 2026E C16 → 10,000 · 2027E D16 → 8,000 · 2028E E16 → 6,000 · uncle interest 2026E C18 → 150 · equipment interest 2026E C19 → 400 · 2027E D19 → 720 · total interest 2026E C20 → 550 · 2027E D20 → 770 · 2028E E20 → 560.

### Practice 2: twist (cash sweep)
```json
{"tab":"Practice 2","title":"Practice 2 · Cash sweep","task":"The bank lets Maya repay early with any cash above $20,000. Fill the yellow cells.\nHint: optional repayment = MIN(what's still owed after the mandatory repayment, MAX(0, spare cash - minimum cash)).","cols":5,"rows":13,"width":{"A":300,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: cash sweep ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Mandatory repayment"},"B4":{"v":"20000"},
"A5":{"v":"Minimum cash"},"B5":{"v":"20000"},
"A6":{"v":"Cash left after the mandatory repayment"},"C6":{"v":"35000"},"D6":{"v":"50000"},"E6":{"v":"60000"},
"A8":{"v":"Opening term loan"},"C8":{"v":"","ans":1},"D8":{"v":"","ans":1},"E8":{"v":"","ans":1},
"A9":{"v":"(-) Mandatory repayment"},"C9":{"v":"","ans":1},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},
"A10":{"v":"(-) Optional repayment (sweep)"},"C10":{"v":"","ans":1},"D10":{"v":"","ans":1},"E10":{"v":"","ans":1},
"A11":{"v":"Closing term loan"},"B11":{"v":"80000"},"C11":{"v":"","ans":1},"D11":{"v":"","ans":1},"E11":{"v":"","ans":1}}}
```
Answer key: C8 `=B11` → 80,000 · D8 `=C11` → 45,000 · E8 `=D11` → 0 · C9 `=MIN($B$4,C8)` → 20,000 · D9 `=MIN($B$4,D8)` → 20,000 · E9 `=MIN($B$4,E8)` → 0 · C10 `=MIN(C8-C9,MAX(0,C6-$B$5))` → 15,000 · D10 `=MIN(D8-D9,MAX(0,D6-$B$5))` → 25,000 · E10 `=MIN(E8-E9,MAX(0,E6-$B$5))` → 0 · C11 `=C8-C9-C10` → 45,000 · D11 `=D8-D9-D10` → 0 · E11 `=E8-E9-E10` → 0.
