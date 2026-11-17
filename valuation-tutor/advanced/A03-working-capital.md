# Lesson A3: The working capital schedule

**Time:** about 35 min · **Needs:** lesson A2
**Goal:** the learner can forecast receivables, inventory and payables with "days" drivers, compute net working capital and its change, and explain the cash effect.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Maya's biggest new customers are offices that order catering. They're great customers, but they pay about 30 days after the lunch. Her ingredient suppliers, on the other hand, give her about 20 days to pay. And ingredients sit in the freezer for about 10 days before they're used.

So at any moment, about a month of sales is "owed to her" and hasn't arrived yet. About 10 days of ingredients are sitting in the freezer, already paid for or owed. And about 20 days of ingredient bills are unpaid.

Here's the catch she discovers: when sales grow, the amount owed to her grows too. If sales are 12% higher, a month of sales is 12% bigger, so 12% more cash is stuck waiting for customers. Growing businesses keep feeding cash into this gap. The banker calls it "the cash you need just to stand still while you grow".

## 2. Reveal

| Term | Meaning |
|---|---|
| "Net working capital" ("NWC") | receivables + inventory − payables: cash tied up in day-to-day operations |
| "Days sales outstanding" ("DSO") | receivables ÷ revenue × 365: how long customers take to pay (30) |
| "Days inventory outstanding" ("DIO") | inventory ÷ COGS × 365: how long stock sits (10) |
| "Days payable outstanding" ("DPO") | payables ÷ COGS × 365: how long she takes to pay suppliers (20) |
| "Change in NWC" | this year's NWC − last year's. An increase uses cash; a decrease frees cash |
| "Cash conversion cycle" | DSO + DIO − DPO: days between paying for ingredients and getting paid by customers |

Note: inventory and payables are measured against **COGS**, not revenue, because they're held and owed at cost.

## 3. Worked example

Revenue and COGS come from the lesson A2 forecast.

```json
{"tab":"Worked Example","title":"Lesson A3 · Worked example: working capital schedule","task":"2025A days are calculated from the balances (black). Forecast days are assumptions (blue). Forecast balances = revenue or COGS × days / 365.","cols":5,"rows":17,"width":{"A":260,"B":95,"C":95,"D":95,"E":95},"cells":{
"A1":{"v":"Maya's Tacos Co.: working capital ($)","b":1},
"B3":{"v":"2025A","b":1},"C3":{"v":"2026E","b":1},"D3":{"v":"2027E","b":1},"E3":{"v":"2028E","b":1},
"A4":{"v":"Revenue (from lesson A2)"},"B4":{"v":"540000"},"C4":{"v":"604800"},"D4":{"v":"665280"},"E4":{"v":"718502.4"},
"A5":{"v":"COGS (from lesson A2)"},"B5":{"v":"162000"},"C5":{"v":"181440"},"D5":{"v":"199584"},"E5":{"v":"215550.72"},
"A6":{"v":"Days in a year"},"B6":{"v":"365"},
"A8":{"v":"Days assumptions","b":1},
"A9":{"v":"Receivable days (DSO)"},"B9":{"v":"=B13/B4*$B$6","f":"0.0"},"C9":{"v":"30"},"D9":{"v":"30"},"E9":{"v":"30"},
"A10":{"v":"Inventory days (DIO)"},"B10":{"v":"=B14/B5*$B$6","f":"0.0"},"C10":{"v":"10"},"D10":{"v":"10"},"E10":{"v":"10"},
"A11":{"v":"Payable days (DPO)"},"B11":{"v":"=B15/B5*$B$6","f":"0.0"},"C11":{"v":"20"},"D11":{"v":"20"},"E11":{"v":"20"},
"A12":{"v":"Balances","b":1},
"A13":{"v":"Accounts receivable"},"B13":{"v":"44400"},"C13":{"v":"=C4*C9/$B$6"},"D13":{"v":"=D4*D9/$B$6"},"E13":{"v":"=E4*E9/$B$6"},
"A14":{"v":"Inventory"},"B14":{"v":"4500"},"C14":{"v":"=C5*C10/$B$6"},"D14":{"v":"=D5*D10/$B$6"},"E14":{"v":"=E5*E10/$B$6"},
"A15":{"v":"Accounts payable"},"B15":{"v":"8900"},"C15":{"v":"=C5*C11/$B$6"},"D15":{"v":"=D5*D11/$B$6"},"E15":{"v":"=E5*E11/$B$6"},
"A16":{"v":"Net working capital","b":1},"B16":{"v":"=B13+B14-B15","b":1},"C16":{"v":"=C13+C14-C15","b":1},"D16":{"v":"=D13+D14-D15","b":1},"E16":{"v":"=E13+E14-E15","b":1},
"A17":{"v":"Increase in NWC (cash used)"},"C17":{"v":"=C16-B16"},"D17":{"v":"=D16-C16"},"E17":{"v":"=E16-D16"}}}
```
Expected: B9 → 30.0 · B10 → 10.1 · B11 → 20.1 · B16 → 40,000 · C13 → 49,710 · C14 → 4,971 · C15 → 9,942 · C16 → 44,739 · C17 → 4,739 · D17 → 4,474 · E17 → 3,937 · E16 → 53,149.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: from scratch (Leo)
```json
{"tab":"Practice 1","title":"Practice 1 · Leo's working capital","task":"Build Leo's working capital schedule for 2026E-2028E with an inputs block.\nFacts: 2025A revenue $126,000, growing 8% a year. COGS (parts) is 30% of revenue in the forecast. Most customers pay on the spot: receivable days 5. Parts sit 30 days; Leo pays suppliers in 15 days. 2025A balances: receivables $1,500, inventory $2,600, payables $900.\nShow revenue, COGS, the three balances, NWC and the increase in NWC.","cols":5,"rows":20,"width":{"A":260,"B":95,"C":95,"D":95,"E":95},"cells":{"A1":{"v":"Leo's Bike Repair: working capital ($)","b":1}}}
```
```solution
{"tab":"Practice 1 solution","cells":{
"B3":{"v":"126000"},"B4":{"v":"8%"},"B5":{"v":"30%"},"B6":{"v":"5"},"B7":{"v":"30"},"B8":{"v":"15"},"B9":{"v":"365"},
"B11":{"v":"=B3"},"C11":{"v":"=B11*(1+$B$4)"},"D11":{"v":"=C11*(1+$B$4)"},"E11":{"v":"=D11*(1+$B$4)"},
"C12":{"v":"=C11*$B$5"},"D12":{"v":"=D11*$B$5"},"E12":{"v":"=E11*$B$5"},
"B13":{"v":"1500"},"C13":{"v":"=C11*$B$6/$B$9"},"D13":{"v":"=D11*$B$6/$B$9"},"E13":{"v":"=E11*$B$6/$B$9"},
"B14":{"v":"2600"},"C14":{"v":"=C12*$B$7/$B$9"},"D14":{"v":"=D12*$B$7/$B$9"},"E14":{"v":"=E12*$B$7/$B$9"},
"B15":{"v":"900"},"C15":{"v":"=C12*$B$8/$B$9"},"D15":{"v":"=D12*$B$8/$B$9"},"E15":{"v":"=E12*$B$8/$B$9"},
"B16":{"v":"=B13+B14-B15"},"C16":{"v":"=C13+C14-C15"},"D16":{"v":"=D13+D14-D15"},"E16":{"v":"=E13+E14-E15"},
"C17":{"v":"=C16-B16"},"D17":{"v":"=D16-C16"},"E17":{"v":"=E16-D16"}}}
```
Answer key: revenue 2026E C11 → 136,080 · 2028E E11 → 158,724 · receivables 2026E C13 → 1,864 · inventory 2026E C14 → 3,355 · payables 2026E C15 → 1,678 · NWC 2025A B16 → 3,200 · NWC 2026E C16 → 3,542 · increase 2026E C17 → 342 · increase 2028E E17 → 306.

### Practice 2: twist (better supplier terms)
```json
{"tab":"Practice 2","title":"Practice 2 · What if suppliers give 45 days?","task":"A new supplier offers Maya 45 days to pay instead of 20. Fill the yellow cells for 2026E.","cols":2,"rows":13,"width":{"A":300,"B":100},"cells":{
"A1":{"v":"Maya's Tacos Co., 2026E ($)","b":1},
"A3":{"v":"COGS"},"B3":{"v":"181440"},
"A4":{"v":"Receivable days"},"B4":{"v":"30"},
"A5":{"v":"Inventory days"},"B5":{"v":"10"},
"A6":{"v":"Payable days now"},"B6":{"v":"20"},
"A7":{"v":"Payable days offered"},"B7":{"v":"45"},
"A8":{"v":"Days in a year"},"B8":{"v":"365"},
"A10":{"v":"Cash conversion cycle now (days)"},"B10":{"v":"","ans":1},
"A11":{"v":"Cash conversion cycle with the offer (days)"},"B11":{"v":"","ans":1},
"A12":{"v":"Payables with the offer"},"B12":{"v":"","ans":1},
"A13":{"v":"Cash freed in 2026 (one-off)"},"B13":{"v":"","ans":1}}}
```
Answer key: B10 `=B4+B5-B6` → 20 · B11 `=B4+B5-B7` → −5 · B12 `=B3*B7/B8` → 22,369 · B13 `=B3*(B7-B6)/B8` → 12,427.
