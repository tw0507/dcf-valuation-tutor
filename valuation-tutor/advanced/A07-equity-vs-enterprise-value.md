# Lesson A7: Equity value vs enterprise value

**Time:** about 35 min · **Needs:** lesson A6
**Goal:** the learner can compute equity value and enterprise value, bridge between them, count diluted shares with the treasury stock method, and explain why financing doesn't change enterprise value.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

A big restaurant group offers to buy Maya's Tacos Co. "How much is it worth?" Maya asks her banker. The banker answers with a question: "Worth to whom?"

Think of buying a house. The house costs $500,000. You pay the owner $200,000 for their share, and you take over their $300,000 mortgage. If there's $10,000 of cash hidden in a drawer, that comes with the house too. So the *house* is worth $500,000, but the *owner's share* is worth what's left after the mortgage, plus the cash.

A company is the same. The whole business, trucks and recipes and customers, has one value. The lenders have a claim on part of it (the loans). The owners get the rest, plus any spare cash. A buyer of the whole company pays the owners for their shares, takes on the loans, and gets the cash.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Equity value" ("market cap" for a listed company) | share price × diluted shares: the owners' slice |
| "Enterprise value" ("EV") | the value of the whole business, to all investors: equity value + debt − cash (+ preferred stock + minority interest) |
| "Net debt" | debt − cash |
| "Minority interest" ("non-controlling interest") | the part of a subsidiary owned by outsiders; added because EBITDA includes 100% of that subsidiary |
| "Preferred stock" | a claim that ranks ahead of common shares; added like debt |
| "Basic" vs "diluted shares" | shares outstanding vs shares including options, RSUs and convertibles that could become shares |
| "Treasury stock method" ("TSM") | for in-the-money options: new shares = options − (options × strike ÷ share price), because the exercise cash is assumed to buy back shares |

The bridge, both ways: **EV = equity value + net debt + preferred + minority interest**, and **equity value = EV − net debt − preferred − minority interest.**

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson A7 · Worked example: Taco Ridge Inc. (made-up)","task":"Equity value = price × diluted shares. EV = equity value + debt - cash + minority interest + preferred.","cols":2,"rows":14,"width":{"A":300,"B":100},"cells":{
"A1":{"v":"Taco Ridge Inc. ($ millions, except per share)","b":1},
"A3":{"v":"Inputs","b":1},
"A4":{"v":"Share price ($)"},"B4":{"v":"42","f":"dec"},
"A5":{"v":"Diluted shares (millions)"},"B5":{"v":"120"},
"A6":{"v":"Total debt"},"B6":{"v":"400"},
"A7":{"v":"Cash"},"B7":{"v":"150"},
"A8":{"v":"Minority interest"},"B8":{"v":"20"},
"A9":{"v":"Preferred stock"},"B9":{"v":"0"},
"A11":{"v":"Equity value (market cap)","b":1},"B11":{"v":"=B4*B5","b":1},
"A12":{"v":"Net debt"},"B12":{"v":"=B6-B7"},
"A13":{"v":"Enterprise value","b":1},"B13":{"v":"=B11+B12+B8+B9","b":1},
"A14":{"v":"Back to equity: EV - net debt - MI - preferred"},"B14":{"v":"=B13-B12-B8-B9"}}}
```
Expected: B11 → 5,040 · B12 → 250 · B13 → 5,310 · B14 → 5,040.

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: from scratch (diluted shares)
```json
{"tab":"Practice 1","title":"Practice 1 · Counting the shares properly","task":"Build a diluted share count and equity value for Taco Ridge with the treasury stock method.\nFacts: share price $42. Basic shares 116 million. Employee options: 10 million with a strike price of $30, and 2 million with a strike price of $50. 1 million restricted stock units (RSUs), which count as shares in full.\nOptions only count if they're in the money (strike below the share price). Show new shares from each option tranche, diluted shares and equity value.","cols":2,"rows":16,"width":{"A":300,"B":110},"cells":{"A1":{"v":"Taco Ridge: diluted shares (millions)","b":1}}}
```
```solution
{"tab":"Practice 1 solution","cells":{
"B3":{"v":"42"},"B4":{"v":"116"},"B5":{"v":"10"},"B6":{"v":"30"},"B7":{"v":"2"},"B8":{"v":"50"},"B9":{"v":"1"},
"B11":{"v":"=IF(B6<B3,B5-B5*B6/B3,0)"},"B12":{"v":"=IF(B8<B3,B7-B7*B8/B3,0)"},"B13":{"v":"=B4+B11+B12+B9"},"B14":{"v":"=B13*B3"}}}
```
Answer key: new shares from the $30 options B11 → 2.86 · from the $50 options B12 → 0 · diluted shares B13 → 119.86 · equity value B14 → 5,034.
Watch for: counting all 12 million options as shares (no TSM) or including the out-of-the-money $50 tranche.

### Practice 2: twist (does financing change EV?)
```json
{"tab":"Practice 2","title":"Practice 2 · Does financing change EV?","task":"Three things Taco Ridge could do, each worth $100M. The new inputs are already worked out (black). Fill the yellow cells and compare EV across the columns.","cols":5,"rows":12,"width":{"A":240,"B":105,"C":105,"D":105,"E":105},"cells":{
"A1":{"v":"Taco Ridge ($ millions)","b":1},
"B3":{"v":"Today","b":1},"C3":{"v":"Borrow 100, keep cash","b":1},"D3":{"v":"Pay 100 dividend","b":1},"E3":{"v":"Sell 100 of new shares","b":1},
"A4":{"v":"Share price ($)"},"B4":{"v":"42","f":"dec"},"C4":{"v":"=B4","f":"dec"},"D4":{"v":"=B4-100/B5","f":"dec"},"E4":{"v":"=B4","f":"dec"},
"A5":{"v":"Diluted shares (millions)"},"B5":{"v":"120"},"C5":{"v":"=B5"},"D5":{"v":"=B5"},"E5":{"v":"=B5+100/B4","f":"dec"},
"A6":{"v":"Total debt"},"B6":{"v":"400"},"C6":{"v":"=B6+100"},"D6":{"v":"=B6"},"E6":{"v":"=B6"},
"A7":{"v":"Cash"},"B7":{"v":"150"},"C7":{"v":"=B7+100"},"D7":{"v":"=B7-100"},"E7":{"v":"=B7+100"},
"A9":{"v":"Equity value"},"B9":{"v":"","ans":1},"C9":{"v":"","ans":1},"D9":{"v":"","ans":1},"E9":{"v":"","ans":1},
"A10":{"v":"Net debt"},"B10":{"v":"","ans":1},"C10":{"v":"","ans":1},"D10":{"v":"","ans":1},"E10":{"v":"","ans":1},
"A11":{"v":"Enterprise value"},"B11":{"v":"","ans":1},"C11":{"v":"","ans":1},"D11":{"v":"","ans":1},"E11":{"v":"","ans":1}}}
```
Answer key: B9 `=B4*B5` → 5,040 · C9 `=C4*C5` → 5,040 · D9 `=D4*D5` → 4,940 · E9 `=E4*E5` → 5,140 · B10 `=B6-B7` → 250 · C10 `=C6-C7` → 250 · D10 `=D6-D7` → 350 · E10 `=E6-E7` → 150 · B11 `=B9+B10` → 5,290 · C11 `=C9+C10` → 5,290 · D11 `=D9+D10` → 5,290 · E11 `=E9+E10` → 5,290.
(Minority interest is left out here to keep it simple.) The lesson: **EV is the value of the business, and how it's financed doesn't change it.** Equity value moves with financing; EV doesn't. That's why EV multiples compare companies with different debt levels.
