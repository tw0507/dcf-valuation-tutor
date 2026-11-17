# Lesson A13: The WACC sheet

**Time:** about 40 min · **Needs:** lesson A12
**Goal:** build a separate WACC sheet from sourced inputs (CAPM with a Blume-adjusted beta, after-tax cost of debt, market-value weights) and link it to the DCF in green.

**Lessons A11–A16 build one model in one Sheet** (NVIDIA as the worked example, or the company the learner chose) (tabs `DCF` and `WACC`): the layout of a professional bank model. Each lesson adds a section; if the Sheet exists, write only that section, otherwise build the whole block. Advanced pace: brief story, the terms they may not know, then build. Adds the market data block (DCF rows 8–17), the WACC link (row 67) and the WACC tab. Tabs: DCF, WACC.

> **Your own company?** If the learner chose a company other than NVIDIA in lesson A11, build the same rows with that company's inputs (see "Choosing the company" in SKILL.md), tell the story with its numbers, and check yellow cells against `sol`; the key values below are NVIDIA's.

---

## 1. Story
NVIDIA's shares move about 2.2x the market (5-year beta); bankers pull extreme betas toward 1 (Blume). Its debt is tiny next to a $4 trillion market value, so WACC ≈ cost of equity. Inputs that live on the DCF sheet (price, shares, debt, cash, tax) reach the WACC sheet as green links, never retyped.

## 2. Terms
"Risk-free rate" (10Y Treasury) · "raw vs Blume-adjusted beta" (0.67 × raw + 0.33) · "ERP" · "CAPM" · "after-tax cost of debt" · "gross-debt weights" (NVIDIA is net cash, so net-debt weights would go negative) · "link" (`=DCF!B9`).

## 3. Build
Yours: DCF B11 (market cap) and B14 (net debt); on WACC every formula: adjusted beta, cost of equity, the tax link, after-tax cost of debt, the capital-structure links and totals, weights, costs, contributions and WACC; then DCF G67 = WACC + case adjustment.

```json
<<DCF>>
```
DCF tab key values: B11 → ? · B14 → ? · G67 → ?

```json
<<WACC>>
```
WACC tab key values: B7 → ? · B9 → ? · B14 → ? · B15 → ? · B24 → ? · B27 → ? · B28 → ? · B30 → ?
Every yellow cell carries its model formula (`sol`).

## Sources
Price $168.89 (Yahoo Finance, close 2026-11-10); shares, debt, cash, investments (NVIDIA Q2 FY27 earnings release, 2026-08-26); 10Y yield 4.983% (Yahoo ^TNX, 2026-11-11); raw beta 2.247 (Yahoo, 5Y monthly); ERP 5.0% and Kd 5.4% (analyst assumptions).