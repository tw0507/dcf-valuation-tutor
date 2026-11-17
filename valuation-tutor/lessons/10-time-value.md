# Lesson 10: Time value and discounting

**Time:** about 30 min · **Needs:** lesson 9
**Goal:** the learner can compute discount factors, present values and NPV (by hand and with `NPV()`), value annuities and perpetuities, and make an invest/don't-invest call.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

A customer offers Maya a deal: "I'll pay you $1,000 for catering, but in a year's time." Another says: "I'll pay $1,000 today." Maya takes today, obviously. With $1,000 today she could put it in the bank at 10% and have $1,100 in a year. So $1,000 in a year is worth *less* than $1,000 today.

How much less? Turn it around: what amount today grows to $1,000 in a year at 10%? $1,000 ÷ 1.10 = $909. That's what a year-away $1,000 is worth today. Two years away: $1,000 ÷ 1.10 ÷ 1.10 = $826. The further away the money, the less it's worth today.

This is how every valuation works. A business is worth the cash it will produce in the future, with each year's cash shrunk back to today. The rate you shrink by depends on how risky the cash is: riskier cash, bigger shrink.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Time value of money" | money today is worth more than the same money later |
| "Discount rate" | the yearly rate used to shrink future cash back to today (10%) |
| "Present value" ("PV") | future cash ÷ (1 + r)^t |
| "Discount factor" | 1 ÷ (1 + r)^t: what $1 in year t is worth today |
| "Net present value" ("NPV") | sum of PVs of all cash in and out, including today's cost. NPV > 0: worth doing |
| `NPV(rate, range)` | Excel/Sheets function: discounts a range assuming the first cash flow is one year away |
| "Annuity" | the same cash every year for n years: PV = C × (1 − (1 + r)^−n) ÷ r |
| "Perpetuity" | cash forever: PV = C ÷ r; growing at g: PV = next year's C ÷ (r − g) |

Trap to flag now: `NPV()` treats its first value as one year away. Cash paid *today* goes outside it: `=NPV(r, years 1–5) − cost today`.

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson 10 · Worked example: discounting five years of cash","task":"Discount factor = 1 / (1 + r)^year. PV = cash × discount factor. The NPV function gives the same total.","cols":6,"rows":12,"width":{"A":240,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
"A1":{"v":"Discounting ($)","b":1},
"A3":{"v":"Discount rate"},"B3":{"v":"10%"},
"A5":{"v":"Year"},"B5":{"v":"1"},"C5":{"v":"2"},"D5":{"v":"3"},"E5":{"v":"4"},"F5":{"v":"5"},
"A6":{"v":"Cash flow"},"B6":{"v":"1000"},"C6":{"v":"1000"},"D6":{"v":"1000"},"E6":{"v":"1000"},"F6":{"v":"1000"},
"A7":{"v":"Discount factor"},"B7":{"v":"=1/(1+$B$3)^B5","f":"0.0000"},"C7":{"v":"=1/(1+$B$3)^C5","f":"0.0000"},"D7":{"v":"=1/(1+$B$3)^D5","f":"0.0000"},"E7":{"v":"=1/(1+$B$3)^E5","f":"0.0000"},"F7":{"v":"=1/(1+$B$3)^F5","f":"0.0000"},
"A8":{"v":"Present value"},"B8":{"v":"=B6*B7","f":"dec"},"C8":{"v":"=C6*C7","f":"dec"},"D8":{"v":"=D6*D7","f":"dec"},"E8":{"v":"=E6*E7","f":"dec"},"F8":{"v":"=F6*F7","f":"dec"},
"A10":{"v":"Sum of present values"},"B10":{"v":"=SUM(B8:F8)","f":"dec"},
"A11":{"v":"Same with the NPV function"},"B11":{"v":"=NPV(B3,B6:F6)","f":"dec"},
"A12":{"v":"Same with the annuity formula"},"B12":{"v":"=B6*(1-(1+B3)^-5)/B3","f":"dec"}}}
```
Expected: B7 → 0.9091 · C7 → 0.8264 · F7 → 0.6209 · B8 → 909.09 · F8 → 620.92 · B10 → 3,790.79 · B11 → 3,790.79 · B12 → 3,790.79.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: discount factors and PVs
```json
{"tab":"Practice 1","title":"Practice 1 · Discount Maya's cash","task":"Fill the yellow cells with formulas. Write each in year 1 and copy right; anchor the rate with $.","cols":6,"rows":10,"width":{"A":240,"B":95,"C":95,"D":95,"E":95,"F":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: cash from a new catering contract ($)","b":1},
"A3":{"v":"Discount rate"},"B3":{"v":"12%"},
"A5":{"v":"Year"},"B5":{"v":"1"},"C5":{"v":"2"},"D5":{"v":"3"},"E5":{"v":"4"},"F5":{"v":"5"},
"A6":{"v":"Cash flow"},"B6":{"v":"20000"},"C6":{"v":"22000"},"D6":{"v":"24000"},"E6":{"v":"25000"},"F6":{"v":"26000"},
"A7":{"v":"Discount factor"},"B7":{"v":"","ans":1,"f":"0.0000"},"C7":{"v":"","ans":1,"f":"0.0000"},"D7":{"v":"","ans":1,"f":"0.0000"},"E7":{"v":"","ans":1,"f":"0.0000"},"F7":{"v":"","ans":1,"f":"0.0000"},
"A8":{"v":"Present value"},"B8":{"v":"","ans":1},"C8":{"v":"","ans":1},"D8":{"v":"","ans":1},"E8":{"v":"","ans":1},"F8":{"v":"","ans":1},
"A10":{"v":"Total present value"},"B10":{"v":"","ans":1}}}
```
Answer key: B7 `=1/(1+$B$3)^B5` → 0.8929 · C7 `=1/(1+$B$3)^C5` → 0.7972 · D7 `=1/(1+$B$3)^D5` → 0.7118 · E7 `=1/(1+$B$3)^E5` → 0.6355 · F7 `=1/(1+$B$3)^F5` → 0.5674 · B8 `=B6*B7` → 17,857 · C8 `=C6*C7` → 17,538 · D8 `=D6*D7` → 17,083 · E8 `=E6*E7` → 15,888 · F8 `=F6*F7` → 14,753 · B10 `=SUM(B8:F8)` → 83,119.

### Practice 2: NPV two ways
```json
{"tab":"Practice 2","title":"Practice 2 · NPV, two ways","task":"A fourth truck costs $60,000 today and brings in $18,000 of extra cash a year for 5 years. Discount rate 10%. Fill the yellow cells.\nHint: =NPV(rate, year 1 to year 5) assumes the first cash is one year away. The cost today goes outside it.","cols":7,"rows":10,"width":{"A":240,"B":90,"C":90,"D":90,"E":90,"F":90,"G":90},"cells":{
"A1":{"v":"Should Maya buy a fourth truck? ($)","b":1},
"A3":{"v":"Discount rate"},"B3":{"v":"10%"},
"A5":{"v":"Year"},"B5":{"v":"0"},"C5":{"v":"1"},"D5":{"v":"2"},"E5":{"v":"3"},"F5":{"v":"4"},"G5":{"v":"5"},
"A6":{"v":"Cash flow"},"B6":{"v":"-60000"},"C6":{"v":"18000"},"D6":{"v":"18000"},"E6":{"v":"18000"},"F6":{"v":"18000"},"G6":{"v":"18000"},
"A7":{"v":"Present value"},"B7":{"v":"","ans":1},"C7":{"v":"","ans":1},"D7":{"v":"","ans":1},"E7":{"v":"","ans":1},"F7":{"v":"","ans":1},"G7":{"v":"","ans":1},
"A9":{"v":"NPV: sum of present values"},"B9":{"v":"","ans":1},
"A10":{"v":"NPV: with the NPV function"},"B10":{"v":"","ans":1}}}
```
Answer key: B7 `=B6/(1+$B$3)^B5` → −60,000 · C7 `=C6/(1+$B$3)^C5` → 16,364 · D7 `=D6/(1+$B$3)^D5` → 14,876 · E7 `=E6/(1+$B$3)^E5` → 13,524 · F7 `=F6/(1+$B$3)^F5` → 12,294 · G7 `=G6/(1+$B$3)^G5` → 11,177 · B9 `=SUM(B7:G7)` → 8,234 · B10 `=NPV(B3,C6:G6)+B6` → 8,234.
If they write `=NPV(B3,B6:G6)` they get 7,486 (the cost wrongly discounted a year): hint: the $60,000 is paid today, so it sits outside NPV().
