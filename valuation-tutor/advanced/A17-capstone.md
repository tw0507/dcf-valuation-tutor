# Lesson A17: Capstone: value a real company, end to end

**Time:** about 12–18 hours, over several sessions · **Needs:** lessons A1–A16
**Goal:** the learner builds, alone, a full valuation of a real US-listed company from its SEC filings (pulled by Claude): history, a linked five-year model, comps, WACC from peer betas, a DCF with scenarios and grids, a football field and a one-page memo.

The learner picks the company; **you pull every figure** from primary sources with your web tools, write it into the Sheet as a blue input, and give its source and date. The learner doesn't search filings: they build every formula. **Never supply a real company's figures from memory**: if you can't reach a source, say so and leave the cell empty.

---

## 1. Picking the company

Offer three US-listed candidates with one line each and let the learner choose. Ask what industries interest them first. A good pick:
- is profitable, has a simple business (one main product line) and clear listed peers (4–6);
- has at least three years of filings on EDGAR (sec.gov/edgar) and positive shareholders' equity;
- is a step harder than Maya's Tacos Co.: operating leases, share buybacks, an acquisition or two, or two segments.

Avoid banks, insurers and REITs (different methods), loss-making companies, conglomerates and companies being acquired.

## 2. Pulling the data (you do this, at the start of each stage)

1. **Sources, in order of preference:** the company's 10-K and latest 10-Q on SEC EDGAR (the filing itself, or the XBRL "company facts" data at data.sec.gov for the same filing); the company's earnings release; for market data, a quote page on the valuation date (price, shares outstanding, beta), FRED series DGS10 for the 10-year Treasury yield, and a published equity risk premium (e.g. Damodaran's monthly implied ERP).
2. **Pull only what the stage needs.** History: three fiscal years of the three statements plus the latest quarter. Comps: each peer's price, diluted shares, debt, cash and LTM revenue/EBITDA/EBIT/net income. WACC: Treasury yield, ERP, each peer's beta and debt/equity, the company's borrowing rate.
3. **Show it in chat first** as a short table: item, value, units, source (document and page or URL), date. Flag anything odd (a restatement, a 53-week year, a one-off) in one line.
4. **Write it into the Sheet** as blue-on-grey inputs, one source note per input in the cell's row (column after the last year, or in the chat table). The learner then builds the formulas from those inputs.
5. **If the learner disagrees with a figure,** re-check the source together; never change a figure without a source.
6. **No web access?** Say the capstone needs web search turned on in claude.ai, and stop until it is. Don't fall back to memory.

## 3. What real filings add (teach each one when it first comes up, not all at once)

None of these appear in the made-up lessons. Give a two-line explanation when the learner meets one (once only: see "Show once" in SKILL.md), then let them decide how to treat it and note the choice in the Sheet.

| Issue | What to tell the learner |
|---|---|
| Operating leases | Since 2019 they sit on the balance sheet as a right-of-use asset and a lease liability. Pick one treatment and use it everywhere: either rent stays an operating cost inside UFCF and lease liabilities are **not** deducted in the bridge, or leases are debt and are deducted, with EBITDA before rent. Lease-inclusive multiples (EV incl. leases ÷ EBITDA) need the same care in comps and in the exit multiple. Mixing the two counts leases twice. |
| Share-based compensation | A real cost paid in shares. Don't add it back to UFCF; it already shows up as dilution if you do. |
| Noncontrolling interests | Net income may be split between the company and outside owners of subsidiaries. Use income to the company for EPS; subtract noncontrolling interests in the bridge. |
| 53-week years | Some retailers and restaurants have a 53-week year every 5–6 years. Growth into and out of it is distorted: put both years on a 52-week basis before choosing a growth rate. |
| Effective vs marginal tax | The effective rate (tax ÷ pre-tax income) can sit far below 21% because of credits. Use the effective rate for forecasting net income and NOPAT if it's stable and explained in the tax note; use the marginal rate (about 25% with state tax) to relever beta and for the debt tax shield. |
| Deferred revenue and gift cards | Customers paying in advance is a liability that grows with sales: working capital can be negative and a source of cash. |
| Seasonality | Quarter-end balance sheets can look very different from year-end (receivables, deferred revenue). Forecast from year-end balances. |
| Diluted shares | Start from the basic shares on the latest 10-Q cover. Add options with the treasury stock method and restricted/performance stock units in full (the share-based compensation note; or, as a shortcut, diluted minus basic weighted shares in the EPS note). |
| Valuation date | Usually today, mid-year. Use a stub period (lesson A14) and the latest balance sheet for the bridge. |
| One-offs | Impairments, litigation, gains on sale: strip them out only if they won't recur. A "one-off" that appears every year isn't one. |

Where these show up in the filings you pull: the 10-K (Item 7 MD&A, Item 8 statements and notes) and the latest 10-Q (cover page for shares, guidance in MD&A). Point the learner to the note you took a figure from when an issue comes up.

## 4. Brief (give this to the learner)

> You're preparing a valuation of [company] for a client meeting. In one Sheet, build these tabs:
> 1. **History:** Claude puts three years of the reported income statement, balance sheet and cash flow (plus the latest quarter) into the History tab as inputs. You build every total, ratio and check row that ties back to the filing (net income, total assets, cash from operations, EPS), and identify and adjust one-offs.
> 2. **Model:** five forecast years, all three statements, working capital, fixed asset and debt schedules, balancing every year with no plugs. Every assumption has a one-line reason (history, guidance, consensus or a stated judgement).
> 3. **Comps:** 4–6 peers with a reason each (Claude pulls their data); EV/EBITDA, EV/EBIT and P/E with median and quartiles; an implied share-price range.
> 4. **WACC:** CAPM with the Treasury yield and ERP Claude pulled (dated); peer betas unlevered and relevered at a target structure; after-tax cost of debt.
> 5. **DCF:** UFCF linked to the model (no retyped numbers); mid-year discounting with a stub; terminal value both ways with the implied multiple and implied growth shown; a full equity bridge at the valuation date; diluted shares; bear/base/bull from one `CHOOSE` switch; a WACC × growth grid and a WACC × exit multiple grid.
> 6. **Football field:** 52-week range, comps and DCF ranges side by side.
> 7. **Memo** (a tab or in the chat): your value range, your view versus the current price, the three assumptions that matter most, the biggest risk to your view, and the objections you expect.

Work in stages, one or two per session: History → Model → Comps and WACC → DCF and grids → Football field and memo. Check each stage before the next.

## 5. Building the Sheet

Make one Sheet called "Capstone – <ticker>" with seven tabs named as in the brief. On each tab write a bold title in A1, a units line in A2 ("$ thousands unless stated; blue on grey = pulled input, black = formula") and, for History and Model, year headers across row 4. Write the pulled inputs for that stage (section 2) as blue-on-grey cells. The learner builds every formula. If they ask for a layout, describe the one in lesson A6 (assumptions → income statement → schedules → cash flow → balance sheet → check) rather than building it.

## 6. How to check each stage

Read the tab fresh. There's no answer key: check method, consistency and plausibility, and raise problems as statements with the cell ("Model!F141 is −2,000: the first year that breaks, so the gap is in FY2027 links").

| Stage | Passes when |
|---|---|
| History | check rows are 0 (or a small rounding gap the learner explains); every total is a formula; units consistent |
| Model | balance check 0 in every year; links all there (net income, D&A, working capital, capex, debt, dividends, buybacks, cash); first forecast year opens from the last actual balance sheet; no assumption breaks sharply from history without a reason; cash and debt never go somewhere impossible |
| Comps | peers defensible; same price date; LTM figures; numerator matches denominator; lease treatment consistent |
| WACC | inputs sourced and dated; market-value weights; beta relevered at a stated structure |
| DCF | UFCF linked, not typed; tax on EBIT; stub and mid-year right; TV timing stated; g well below WACC; bridge at the valuation date and consistent with the lease choice; grid centres equal the base case |
| Memo | a range, a view against the price, and reasons that use the model's own numbers |

When the learner says the whole thing is done, give a short written review: what is solid, the two weakest assumptions, and anything that would embarrass them in front of a client. Then mark the course complete.

**Optional defence:** only if the learner asks to be grilled, play a managing director and ask 8–10 questions about their numbers, one at a time (e.g. "Your terminal value is 80% of EV: are you comfortable with that?", "Rates rise 1% tomorrow: which cells move, and by roughly how much?", "Which single input would you push back on as the buyer?"). Afterwards, name the two answers to tighten.
