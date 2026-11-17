# Lesson 14: Discounting, terminal value (Gordon and exit multiple) and the share price

**Time:** about 55 min · **Needs:** lesson 13
**Goal:** the learner discounts ten years of FCF with the mid-year convention and a stub, values everything after year 10 two ways (perpetual growth and an exit multiple) and cross-checks them, then bridges enterprise value to an implied share price.

Adds to the DCF Sheet: the stub (row 18), discounting (rows 94–100), terminal value (rows 102–116) and the valuation summary (rows 118–132). If the Sheet exists, add only these. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson 11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story (no jargon)

Three things turn NVIDIA's ten years of cash into a share price.

**Timing.** The forecast years end in late July, but we're valuing on 11 November 2026, about 0.3 years after the last reported quarter. And cash arrives through each year, not on its last day. So each year's cash is discounted (year number − 0.5 − 0.3) years: the mid-year convention, shifted by the time already gone.

**After year 10.** NVIDIA won't vanish in 2036. There are two ways to value the rest. One: assume the cash keeps growing slowly forever (3.5% in the base case) and use the growing-perpetuity formula. Two: imagine selling the business at the end of year 10 at a price investors typically pay — a multiple of that year's EBITDA (16x in the base case). Each method checks the other: the sale price implies some growth rate forever, and the growth rate implies some sale multiple. If one looks unbelievable, so is the answer it gives.

**From the business to one share.** Add the present values to get the value of the whole business. Then subtract the debt, add the cash and the stakes NVIDIA holds in other companies, and divide by the number of shares.

## 2. Terms

| Term | Meaning |
|---|---|
| "Stub" / "years elapsed since TTM end" | (valuation date − last balance-sheet date) ÷ 365 = 0.30 |
| "Discount period" | year # − 0.5 − stub |
| "Terminal value" ("TV") | the value at the end of year 10 of all cash after it |
| "Gordon growth" (perpetuity growth) | TV = final-year FCF × (1 + g) ÷ (WACC − g) |
| "Exit multiple method" | TV = final-year EBITDA × an EV/EBITDA multiple |
| "Implied multiple" / "implied growth" | the cross-checks: Gordon TV ÷ EBITDA, and g = (exit TV × WACC − FCF) ÷ (exit TV + FCF) |
| "Equity bridge" | EV − debt + cash + non-operating investments = equity value |
| "Implied upside" | implied price ÷ current price − 1 |

### Quick tutorial: the exit multiple
1. **What it is:** the price a buyer would pay for the whole business at the end of the forecast, expressed as a multiple of its EBITDA. If similar businesses sell for 16x EBITDA, a business with $1,000 of EBITDA is worth $16,000.
2. **Where the multiple comes from:** what comparable companies trade at today, or what buyers paid in past takeovers, usually trimmed because growth will be slower in year 10 than today. NVIDIA trades near 20x TTM EBITDA; the base case uses 16x, bear 12x, bull 20x.
3. **Timing:** a sale happens on a date, so the exit TV is discounted from the **end** of year 10 (discount period + 0.5), while the Gordon TV here is discounted from the final year's mid-point, as in the original model.
4. **The cross-check that matters:** at a 14% WACC, 16x EBITDA implies FCF growing about 8.8% a year forever — far above the 3.5% Gordon rate and the 4.98% risk-free rate. And the 3.5% Gordon value implies only about 7.6x. When the two disagree this much, say so: the exit multiple carries today's market optimism into year 10. Bankers show both and explain the gap.

## 3. Worked example

Filled: the stub (B18) and the discounting rows (96–100). Walk through G98 (= 1 − 0.5 − 0.30 = 0.20 years) and the discount factor. Then point at the two terminal-value blocks and the summary: those are the practice.

```json
<<DCF>>
```
Key values (base case): B18 → ? · G100 → ? · B106 → ? · B107 → ? · B109 → ? · B112 → ? · B114 → ? · B115 → ? · B116 → ? · B122 → ? · C122 → ? · B127 → ? · B129 → ? · C129 → ? · B131 → ? · C131 → ?

```json
<<WACC>>
```

## 4. Practice (in the Sheet)

Task:
1. Gordon block: terminal-year FCF (B106), TV (B107), PV of TV (B109).
2. Exit block: TV (B112 = EBITDA × multiple), PV (B114), and the two cross-checks (B115, B116).
3. Valuation summary, both columns: enterprise value, equity value, implied price per share and upside (rows 122, 127, 129, 131).

Every yellow cell carries its model formula (`sol`).

## Sources
As lessons 11–13. Exit multiples (12x / 16x / 20x) are the analyst's assumption, set below NVIDIA's current ~20x TTM EV/EBITDA (EV about $4.08 trillion ÷ TTM EBITDA about $201 billion, from the inputs in this Sheet).
