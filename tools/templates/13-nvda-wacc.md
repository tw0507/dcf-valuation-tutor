# Lesson 13: NVIDIA's WACC (a second sheet)

**Time:** about 35 min · **Needs:** lesson 12
**Goal:** the learner builds a separate WACC sheet: CAPM cost of equity with a Blume-adjusted beta, after-tax cost of debt, market-value weights, and links it back to the DCF sheet in green.

Adds to the DCF Sheet: the market data block on DCF (rows 8–17), the WACC link (row 67), and a new tab, WACC. If the Sheet exists, add only these. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson 11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story (no jargon)

Lesson 10 showed that future cash is worth less today, and the riskier it is, the more you shrink it. For NVIDIA, how risky is "risky"? Its shares swing about twice as much as the whole market (a beta of 2.2 over five years). Analysts pull that toward 1 a little, because extreme betas tend to drift back (the Blume adjustment): 1.84. Owners then want the safe government rate (4.98%) plus 1.84 times the extra return the market pays for risk (5%): about 14%.

NVIDIA's lenders want much less: about 5.4%, and less still after tax. But NVIDIA borrows very little compared with its $4 trillion share value, so the blend barely moves: about 14.1%. That's the rate for shrinking NVIDIA's future cash.

The WACC gets its own sheet, the way banks lay it out. Numbers that come from the DCF sheet (share price, debt, cash, tax rate) arrive as green links, so they're typed only once.

## 2. Terms

| Term | Meaning |
|---|---|
| "Risk-free rate" | the 10-year US Treasury yield (4.98% on 2026-11-11) |
| "Raw beta" / "Blume-adjusted beta" | measured beta (2.247); adjusted = 0.67 × raw + 0.33 |
| "Equity risk premium" ("ERP") | extra annual return the stock market pays over the risk-free rate (5.0% assumed) |
| "Cost of equity" (CAPM) | risk-free + beta × ERP |
| "After-tax cost of debt" | pre-tax rate × (1 − tax) |
| "Market-value weights" | equity at market cap, debt at its amount; NVIDIA uses gross debt because it holds more cash than debt |
| "Link" (green) | a formula pointing at another sheet, e.g. `=DCF!B9` |

## 3. Worked example

The WACC tab's cost-of-equity block (rows 4–9) is filled: walk through the Blume adjustment and CAPM. On the DCF tab, the market data block (blue inputs) is new.

```json
<<DCF>>
```
DCF tab key values: B11 → ? · B14 → ? · G67 → ?

```json
<<WACC>>
```
WACC tab key values: B7 → ? · B9 → ? · B15 → ? · B24 → ? · B27 → ? · B28 → ? · B30 → ?

## 4. Practice (in the Sheet)

Task:
1. DCF tab: market cap (B11 = price × shares) and net debt (B14 = debt − cash).
2. WACC tab: after-tax cost of debt (B15), market cap (B20), net debt (B23), total capital (B24 = market cap + gross debt), the weights, costs and contributions (B27:D28), and the WACC (B30).
3. DCF tab: the green link G67 = WACC!$B$30 + the case adjustment G66.

Every yellow cell carries its model formula (`sol`); the key values are under each tab's block above.

## Sources
Share price $168.89 (Yahoo Finance, close 2026-11-10); diluted shares 24,285M, debt 33,366, cash & debt securities 56,586, equity investments 93,940 (NVIDIA Q2 FY27 earnings release, 2026-08-26); risk-free 4.983% (Yahoo Finance ^TNX, 2026-11-11); raw beta 2.247 (Yahoo Finance, 5-year monthly); ERP 5.0% and pre-tax cost of debt 5.4% (analyst assumptions: market-standard ERP range; Treasury + AA spread); ratings AA- / Aa2 (verify before external use).
