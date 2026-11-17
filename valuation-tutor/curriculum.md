# Course map

Two tracks. **Standard** (about 10 hours) is for beginners. **Advanced track** (about 25–30 hours) is for learners who already know the three statements: it skips the basics, keeps only the hard practice, adds comps and peer beta, and ends with a capstone on a company the learner picks.

Both tracks finish with the same professional model: a **10-year DCF of any company the learner chooses**, with NVIDIA (figures as of 2026-11-11) as the worked example, laid out like a bank's model: three cases with a `CHOOSE` switch, a separate WACC sheet, mid-year discounting with a stub, terminal value by Gordon growth **and** exit multiple (with cross-checks), a full equity bridge, and four sensitivity tables. It's built in one Sheet across five (standard) or six (advanced) lessons.

## Standard track (about 10 hours)

Maya's taco truck (lessons 1–4) grows into Maya's Tacos Co. and its linked model (lessons 5–9); Leo's Bike Repair appears in a couple of build-from-scratch tabs. Part 3 switches to a real company: NVIDIA as the worked example, or any company the learner picks (Claude pulls its data).

| # | Lesson | File | Time |
|---|---|---|---|
| **Part 1** | **The three statements** | | **2 h 45** |
| 1 | The income statement | `lessons/01-income-statement.md` | 45 min |
| 2 | The balance sheet | `lessons/02-balance-sheet.md` | 35 min |
| 3 | The cash flow statement | `lessons/03-cash-flow-statement.md` | 35 min |
| 4 | How the three link | `lessons/04-linking-the-statements.md` | 50 min |
| **Part 2** | **The linked model** | | **3 h 20** |
| 5 | Forecast drivers | `lessons/05-forecast-drivers.md` | 30 min |
| 6 | Working capital | `lessons/06-working-capital.md` | 30 min |
| 7 | Fixed assets | `lessons/07-fixed-assets.md` | 35 min |
| 8 | Debt and interest | `lessons/08-debt-schedule.md` | 35 min |
| 9 | The linked model that balances | `lessons/09-the-linked-model.md` | 70 min |
| **Part 3** | **The DCF: 10 years, your company (NVIDIA example)** | | **4 h 15** |
| 10 | Time value and discounting | `lessons/10-time-value.md` | 30 min |
| 11 | Choose the company; history and free cash flow (3 years + TTM) | `lessons/11-nvda-history-and-fcf.md` | 40 min |
| 12 | Ten-year forecast with bear / base / bull cases | `lessons/12-nvda-ten-year-forecast.md` | 55 min |
| 13 | Market data and the WACC sheet | `lessons/13-nvda-wacc.md` | 35 min |
| 14 | Discounting, terminal value (Gordon + exit multiple), share price | `lessons/14-nvda-terminal-value-and-price.md` | 55 min |
| 15 | Four sensitivity tables: the finished model | `lessons/15-nvda-sensitivities.md` | 40 min |
| | **Total** | | **about 10 h 20** |

Each lesson: story → terms → worked example → practice (Practice tabs in lessons 1–10; yellow cells inside the DCF model in 11–15). No quizzes.

## Advanced track (about 25–30 hours)

For learners who know the income statement, balance sheet and cash flow statement and are comfortable in Excel. Parts 1–2 use Maya's Tacos Co. and made-up listed peers, with builds from scratch, twists and bug hunts. Part 3 builds the NVIDIA DCF with most of each section left to the learner. The capstone repeats it on a company the learner picks.

| # | Lesson | File | Time |
|---|---|---|---|
| **Part 1** | **Linking and the model** | | **5 h 30** |
| A1 | How the three link (from scratch, bug hunt) | `advanced/A01-linking-the-statements.md` | 60 min |
| A2 | Forecast drivers (unit drivers, fading growth) | `advanced/A02-forecast-drivers.md` | 40 min |
| A3 | Working capital (from scratch, supplier terms) | `advanced/A03-working-capital.md` | 35 min |
| A4 | Fixed assets (from scratch, asset sale) | `advanced/A04-fixed-assets.md` | 35 min |
| A5 | Debt (two loans on average balances, cash sweep) | `advanced/A05-debt-schedule.md` | 40 min |
| A6 | The linked model (three years from scratch, bug hunt) | `advanced/A06-the-linked-model.md` | 120 min |
| **Part 2** | **Comps and beta** | | **2 h 25** |
| A7 | Equity value vs EV (diluted shares by TSM, financing) | `advanced/A07-equity-vs-enterprise-value.md` | 35 min |
| A8 | Multiples (value with a multiple, leverage and P/E) | `advanced/A08-multiples.md` | 35 min |
| A9 | A comps set (spread, median and quartiles, an outlier) | `advanced/A09-comps-set.md` | 40 min |
| A10 | Peer beta (unlever, relever, regression and Blume) | `advanced/A10-peer-beta.md` | 35 min |
| **Part 3** | **The DCF: 10 years, your company (NVIDIA example)** | | **4 h 50** |
| A11 | Choose the company; history and free cash flow (all derived cells) | `advanced/A11-nvda-history-and-fcf.md` | 40 min |
| A12 | Ten-year forecast with three cases (whole projection) | `advanced/A12-nvda-ten-year-forecast.md` | 60 min |
| A13 | The WACC sheet (every formula, green links) | `advanced/A13-nvda-wacc.md` | 40 min |
| A14 | Stub, mid-year discounting, terminal value two ways | `advanced/A14-nvda-discounting-and-terminal-value.md` | 45 min |
| A15 | Valuation summary and the equity bridge | `advanced/A15-nvda-valuation-and-bridge.md` | 30 min |
| A16 | Four sensitivity tables (all grids and the helper) | `advanced/A16-nvda-sensitivities.md` | 75 min |
| **Part 4** | **Capstone** | | **12–18 h** |
| A17 | Value a real US company end to end | `advanced/A17-capstone.md` | 12–18 h |
| | **Total** | | **about 25–31 h** |

Moving between tracks: a standard learner who has done lessons 1–4 can join at A2. An advanced-track learner stuck on a topic can do the matching standard lesson first (A2–A6 ↔ 5–9, A11–A16 ↔ 11–15: the same DCF layout, with less left yellow in the standard version).

## Starting at a later part

Any learner can skip straight to a later part, on either track, at any time. There's no test: give the catch-up note below, mark the skipped lessons `skipped`, and start the part's first lesson. Every lesson builds its own Sheet with all the numbers it needs.

**Standard track**
- **Start at Part 2 (lesson 5):** "You're assumed to know the income statement, balance sheet and cash flow statement, and how they link: net income flows to retained earnings and the top of the cash flow; depreciation is added back and taken off PP&E; working-capital changes and capex hit cash; closing cash becomes balance-sheet cash. From here on the business is Maya's Tacos Co.: three trucks, $540,000 of revenue in 2025." *(Saves about 2 h 45.)*
- **Start at Part 3 (lesson 10):** "You're assumed to know the three statements and how a forecast drives free cash flow. Part 3 values a real company: NVIDIA as the worked example, or any company you pick, whose data Claude pulls and shows with sources. Nothing from Parts 1–2 is needed." *(Saves about 6 h 05; Part 3 alone is about 4 h 15. A strong learner can also start at lesson 11 if discounting is familiar.)*

**Advanced track**
- **Start at Part 2 (A7):** "You're assumed to be able to build and debug a linked three-statement model. Part 2 is about valuing a company from the market: enterprise value, multiples, a comps set and peer beta."
- **Start at Part 3 (A11):** "You're assumed to know the linked model, plus EV vs equity value, multiples and beta. Part 3 builds a 10-year DCF of NVIDIA (the worked example) or any company you pick; every input is pulled for you and shown with its source. The capstone (A17) still asks for comps and a peer beta for your own company; lessons A9 and A10 show how, if you need them then."

If a learner who skipped struggles with a topic later, name the skipped lesson that covers it in one line and carry on.