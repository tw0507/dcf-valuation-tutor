# Lesson 1: The income statement

**Time:** about 45 min · **Needs:** nothing (first lesson)
**Goal:** the learner can build an income statement from raw facts with formulas, explain each line, and handle a loss year.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 0. Colour code (tell the learner before the first build)

Every practice Sheet uses the colours bankers use, so anyone can see at a glance what's typed and what's calculated:
- **Blue text** = a number typed in (an input or assumption). Change these to test ideas.
- **Black text** = a formula. Never type a number over one.
- **Yellow fill** = your turn: type a formula here.
- **Pale blue fill** = your turn, but type a value (e.g. a scenario number), not a formula.

Later, in the NVIDIA model (Part 3), three more appear: **green** = a link to another sheet, a **dark blue bar** = a section header, and a **light blue fill** = a key output.
## 1. Story (no jargon)

Maya quit her office job to run a taco truck. At the end of her first year she wants to know one thing: *did the truck actually make me money?*

She starts with the easy number. She sold 20,000 tacos at $6 each, so $120,000 came in from customers.

But every taco cost her something to make: tortillas, meat, salsa. That's about $1.80 a taco, or $36,000 for the year. Take that away and she has $84,000 left. This tells her something useful on its own: each taco leaves her $4.20 to pay for everything else.

And there *is* everything else. She paid wages to a helper, rent for a parking spot, permits and insurance: $50,000, whether she sold 1 taco or 20,000.

Then there's the truck. She paid $40,000 for it and expects it to last 5 years. It would be unfair to count the whole $40,000 as a cost of year one, because the truck will keep earning for four more years. So she counts a fifth of it, $8,000, as this year's share of the truck wearing out.

After all that, the business itself earned $26,000. That's what the *operation* produced, before anything to do with how she paid for the truck.

But she borrowed money to buy the truck, and the bank charged her $2,000 for it this year. That leaves $24,000. Finally, the government takes 25% of that, $6,000, as tax.

What's left, **$18,000**, is what the truck really made her: $18,000 out of $120,000 in sales, or 15 cents of every dollar a customer handed over.

## 2. Reveal (quote each term, tie it to the story)

Write each term in quotes and point back to the moment in the story. Add each one to the learner's glossary in the progress record.

| Term | In Maya's story |
|---|---|
| "Revenue" (also "sales" or "top line") | the $120,000 customers paid |
| "Cost of goods sold" ("COGS") | the $36,000 of ingredients: costs that rise with every taco sold |
| "Gross profit" | the $84,000 left after ingredients |
| "Operating expenses" ("OpEx") | the $50,000 of wages, rent and permits: costs of running the business |
| "Depreciation" | the $8,000 share of the truck counted as this year's cost |
| "Operating income" or "EBIT" (Earnings Before Interest and Taxes) | the $26,000 the operation earned before financing and tax |
| "Interest expense" | the $2,000 the bank charged |
| "Pre-tax income" ("EBT") | the $24,000 after interest |
| "Income tax" | the $6,000 to the government |
| "Net income" (also "net profit" or "bottom line") | the $18,000 Maya actually kept |
| "Margin" | any line ÷ revenue: "net margin" is 18,000 ÷ 120,000 = 15% |
| "Income statement" ("P&L") | the whole top-to-bottom list: one period's money in, minus costs, down to net income |

Then make two points:
- **Why EBIT matters for valuation:** it shows what the business earns no matter how it was paid for. Two identical taco trucks, one bought with a loan and one with savings, have the same EBIT but different net income. Valuation (lesson 11 onward) starts from EBIT for this reason.
- **Depreciation is a cost, but no cash left this year.** The cash left when she bought the truck. Flag this; it comes back in the cash flow statement lesson.

## 3. Worked example (Claude builds it in the practice Sheet)

Build the lesson's practice Sheet (see SKILL.md, "The practice Sheet") and open the **Worked Example** tab. Walk the learner through it a few rows at a time: inputs at the top in blue, the formulas below in black. Point out a few formulas as you go.

```json
{"tab":"Worked Example","title":"Lesson 1 · Worked example: Maya's Tacos, Year 1","task":"Inputs are at the top (blue). The income statement below is all formulas (black). Click any black number to see its formula.","cols":3,"rows":27,"width":{"A":260,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: income statement, Year 1 ($)","b":1},
"A3":{"v":"Inputs","b":1},
"A4":{"v":"Tacos sold"},"B4":{"v":"20000"},
"A5":{"v":"Price per taco"},"B5":{"v":"6"},
"A6":{"v":"Ingredients per taco"},"B6":{"v":"1.8"},
"A7":{"v":"Wages, rent & permits"},"B7":{"v":"50000"},
"A8":{"v":"Truck cost"},"B8":{"v":"40000"},
"A9":{"v":"Truck life (years)"},"B9":{"v":"5"},
"A10":{"v":"Interest paid"},"B10":{"v":"2000"},
"A11":{"v":"Tax rate"},"B11":{"v":"25%"},
"A13":{"v":"Income statement","b":1},
"A14":{"v":"Revenue","b":1},"B14":{"v":"=B4*B5","b":1},
"A15":{"v":"(-) Cost of goods sold"},"B15":{"v":"=B4*B6"},
"A16":{"v":"Gross profit","b":1},"B16":{"v":"=B14-B15","b":1},
"A17":{"v":"(-) Operating expenses"},"B17":{"v":"=B7"},
"A18":{"v":"(-) Depreciation"},"B18":{"v":"=B8/B9"},
"A19":{"v":"Operating income (EBIT)","b":1},"B19":{"v":"=B16-B17-B18","b":1},
"A20":{"v":"(-) Interest expense"},"B20":{"v":"=B10"},
"A21":{"v":"Pre-tax income","b":1},"B21":{"v":"=B19-B20","b":1},
"A22":{"v":"(-) Income tax"},"B22":{"v":"=B21*B11"},
"A23":{"v":"Net income","b":1},"B23":{"v":"=B21-B22","b":1},
"A25":{"v":"Gross margin"},"B25":{"v":"=B16/B14","f":"pct"},
"A26":{"v":"EBIT margin"},"B26":{"v":"=B19/B14","f":"pct"},
"A27":{"v":"Net margin"},"B27":{"v":"=B23/B14","f":"pct"}}}
```
Expected values: revenue 120,000 · COGS 36,000 · gross profit 84,000 · OpEx 50,000 · depreciation 8,000 · EBIT 26,000 · interest 2,000 · pre-tax 24,000 · tax 6,000 · net income 18,000 · margins 70.0% / 21.7% / 15.0%.

**Habit to name now:** every number is typed in exactly once, in the inputs block, and everything else is a formula pointing at it. Invite them to change B5 to 7 and watch every line update. This is why bankers never type a number into a formula row.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: fill in the gaps (Maya, Year 2)
```json
{"tab":"Practice 1","title":"Practice 1 · Maya's Tacos, Year 2","task":"Fill the yellow cells with formulas. Use the cells above, never typed numbers. Then say \"check\" in the chat.","cols":3,"rows":23,"width":{"A":260,"B":110,"C":110},"cells":{
"A1":{"v":"Maya's Tacos: income statement, Year 2 ($)","b":1},
"A3":{"v":"Inputs","b":1},
"A4":{"v":"Tacos sold"},"B4":{"v":"26000"},
"A5":{"v":"Price per taco"},"B5":{"v":"6.5"},
"A6":{"v":"Ingredients per taco"},"B6":{"v":"2"},
"A7":{"v":"Wages, rent & permits"},"B7":{"v":"58000"},
"A8":{"v":"Truck cost"},"B8":{"v":"40000"},
"A9":{"v":"Truck life (years)"},"B9":{"v":"5"},
"A10":{"v":"Interest paid"},"B10":{"v":"1500"},
"A11":{"v":"Tax rate"},"B11":{"v":"25%"},
"A13":{"v":"Income statement","b":1},
"A14":{"v":"Revenue","b":1},"B14":{"v":"=B4*B5","b":1},
"A15":{"v":"(-) Cost of goods sold"},"B15":{"v":"=B4*B6"},
"A16":{"v":"Gross profit","b":1},"B16":{"v":"","ans":1,"b":1},
"A17":{"v":"(-) Operating expenses"},"B17":{"v":"=B7"},
"A18":{"v":"(-) Depreciation"},"B18":{"v":"=B8/B9"},
"A19":{"v":"Operating income (EBIT)","b":1},"B19":{"v":"","ans":1,"b":1},
"A20":{"v":"(-) Interest expense"},"B20":{"v":"=B10"},
"A21":{"v":"Pre-tax income","b":1},"B21":{"v":"","ans":1,"b":1},
"A22":{"v":"(-) Income tax"},"B22":{"v":"","ans":1},
"A23":{"v":"Net income","b":1},"B23":{"v":"","ans":1,"b":1}}}
```
Answer key: B16 `=B14-B15` → 117,000 · B19 `=B16-B17-B18` → 51,000 · B21 `=B19-B20` → 49,500 · B22 `=B21*B11` → 12,375 · B23 `=B21-B22` → 37,125.

### Practice 2: from scratch (a new business)
```json
{"tab":"Practice 2","title":"Practice 2 · Leo's Bike Repair","task":"Build Leo's income statement yourself, with inputs at the top and formulas below.\nFacts: 1,200 repairs a year at $85 each. Parts cost $25 per repair. Rent and wages are $45,000. Tools cost $12,000 and last 4 years. Interest is $1,000. Tax rate is 20%.\nInclude gross, EBIT and net margins.","cols":3,"rows":30,"width":{"A":260,"B":110,"C":110},"cells":{"A1":{"v":"Leo's Bike Repair: income statement ($)","b":1}}}
```
Answer key: revenue 102,000 · COGS 30,000 · gross profit 72,000 · OpEx 45,000 · depreciation 3,000 · EBIT 24,000 · interest 1,000 · pre-tax 23,000 · tax 4,600 · net income 18,400 · margins 70.6% / 23.5% / 18.0%. Check that every input is typed once and every line below is a formula. Layout can differ from Maya's; the logic can't.
