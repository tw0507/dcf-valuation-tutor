# Lesson A9: A small comparable-companies set

**Time:** about 40 min · **Needs:** lesson A8
**Goal:** the learner can choose 4–6 peers with reasons, spread their multiples, summarise with median and quartiles, and turn a multiple range into an implied share-price range for a target.

Tabs: Worked Example, Practice 1, Practice 2.

---

## 1. Story (no jargon)

Taco Ridge's share price is $42. Is that expensive? Maya's banker says, "Look at what the market pays for businesses like it."

So they pick five listed restaurant chains that are as close as possible: Mexican-style fast-casual food, similar size, mostly in the US. For each one they work out its whole-business value and divide by its earnings, the same way for every company. The answers range from about 8.4 to 11.8 times earnings, with the middle one at 10.0.

Then they apply that range to Taco Ridge's own earnings. At the middle multiple, Taco Ridge would be worth about $33 a share. At the top of the usual range, about $37. But it trades at $42. So either the market thinks Taco Ridge is better than its peers (faster growth, better margins), or it's expensive. The comps don't tell you which. They tell you what question to ask.

## 2. Reveal

| Term | Meaning |
|---|---|
| "Comparable companies" ("comps", "trading comps") | valuing a company from how the market values similar listed companies |
| "Peer set" / "comp set" | the chosen 4–6 companies. Criteria: same industry and business model, similar size, growth, margins, geography |
| "Spreading comps" | putting every peer's figures on the same basis (same periods, same adjustments) |
| "Median" vs "mean" | middle value vs average; the median resists outliers |
| "25th / 75th percentile" ("interquartile range") | the range where the middle half of peers sit; a common valuation range |
| "Implied value" | target metric × peer multiple, then bridged to equity value and share price |
| "Football field" | a chart of value ranges from each method, side by side (built in the capstone) |

## 3. Worked example

```json
{"tab":"Worked Example","title":"Lesson A9 · Worked example: comps for Taco Ridge","task":"Rows 4-8: EV = equity value + net debt; multiples = EV / EBITDA. Rows 10-13 summarise. Rows 21-26 apply the range to Taco Ridge.","cols":9,"rows":26,"width":{"A":190,"B":90,"C":90,"D":90,"E":90,"F":90,"G":90,"H":90,"I":90},"cells":{
"A1":{"v":"Comparable companies ($ millions, made-up)","b":1},
"A3":{"v":"Company","b":1},"B3":{"v":"Equity value","b":1},"C3":{"v":"Net debt + MI","b":1},"D3":{"v":"EV","b":1},"E3":{"v":"LTM revenue","b":1},"F3":{"v":"LTM EBITDA","b":1},"G3":{"v":"NTM EBITDA","b":1},"H3":{"v":"EV / LTM EBITDA","b":1},"I3":{"v":"EV / NTM EBITDA","b":1},
"A4":{"v":"Burrito Barn"},"B4":{"v":"1225"},"C4":{"v":"110"},"D4":{"v":"=B4+C4"},"E4":{"v":"880"},"F4":{"v":"152"},"G4":{"v":"165"},"H4":{"v":"=D4/F4","f":"x"},"I4":{"v":"=D4/G4","f":"x"},
"A5":{"v":"Salsa Street"},"B5":{"v":"1500"},"C5":{"v":"250"},"D5":{"v":"=B5+C5"},"E5":{"v":"1250"},"F5":{"v":"208"},"G5":{"v":"225"},"H5":{"v":"=D5/F5","f":"x"},"I5":{"v":"=D5/G5","f":"x"},
"A6":{"v":"Nacho Nation"},"B6":{"v":"1800"},"C6":{"v":"-200"},"D6":{"v":"=B6+C6"},"E6":{"v":"900"},"F6":{"v":"160"},"G6":{"v":"180"},"H6":{"v":"=D6/F6","f":"x"},"I6":{"v":"=D6/G6","f":"x"},
"A7":{"v":"Quesadilla Co."},"B7":{"v":"2600"},"C7":{"v":"400"},"D7":{"v":"=B7+C7"},"E7":{"v":"1800"},"F7":{"v":"270"},"G7":{"v":"290"},"H7":{"v":"=D7/F7","f":"x"},"I7":{"v":"=D7/G7","f":"x"},
"A8":{"v":"Fiesta Grill"},"B8":{"v":"3900"},"C8":{"v":"600"},"D8":{"v":"=B8+C8"},"E8":{"v":"2700"},"F8":{"v":"380"},"G8":{"v":"410"},"H8":{"v":"=D8/F8","f":"x"},"I8":{"v":"=D8/G8","f":"x"},
"A10":{"v":"Median","b":1},"H10":{"v":"=MEDIAN(H4:H8)","f":"x"},"I10":{"v":"=MEDIAN(I4:I8)","f":"x"},
"A11":{"v":"Mean"},"H11":{"v":"=AVERAGE(H4:H8)","f":"x"},"I11":{"v":"=AVERAGE(I4:I8)","f":"x"},
"A12":{"v":"25th percentile"},"H12":{"v":"=QUARTILE(H4:H8,1)","f":"x"},"I12":{"v":"=QUARTILE(I4:I8,1)","f":"x"},
"A13":{"v":"75th percentile"},"H13":{"v":"=QUARTILE(H4:H8,3)","f":"x"},"I13":{"v":"=QUARTILE(I4:I8,3)","f":"x"},
"A15":{"v":"Target: Taco Ridge","b":1},
"A16":{"v":"LTM EBITDA"},"B16":{"v":"420"},
"A17":{"v":"Net debt + minority interest"},"B17":{"v":"270"},
"A18":{"v":"Diluted shares (millions)"},"B18":{"v":"120"},
"A19":{"v":"Current share price ($)"},"B19":{"v":"42","f":"dec"},
"B21":{"v":"25th pct","b":1},"C21":{"v":"Median","b":1},"D21":{"v":"75th pct","b":1},
"A22":{"v":"EV / LTM EBITDA used"},"B22":{"v":"=H12","f":"x"},"C22":{"v":"=H10","f":"x"},"D22":{"v":"=H13","f":"x"},
"A23":{"v":"Implied EV"},"B23":{"v":"=B22*$B$16"},"C23":{"v":"=C22*$B$16"},"D23":{"v":"=D22*$B$16"},
"A24":{"v":"Implied equity value"},"B24":{"v":"=B23-$B$17"},"C24":{"v":"=C23-$B$17"},"D24":{"v":"=D23-$B$17"},
"A25":{"v":"Implied share price ($)"},"B25":{"v":"=B24/$B$18","f":"dec"},"C25":{"v":"=C24/$B$18","f":"dec"},"D25":{"v":"=D24/$B$18","f":"dec"},
"A26":{"v":"vs current price"},"B26":{"v":"=B25/$B$19-1","f":"pct"},"C26":{"v":"=C25/$B$19-1","f":"pct"},"D26":{"v":"=D25/$B$19-1","f":"pct"}}}
```
Expected: H4 → 8.8 · H8 → 11.8 · H10 → 10.0 · H11 → 10.0 · H12 → 8.8 · H13 → 11.1 · I10 → 8.9 · B25 → 28.49 · C25 → 32.75 · D25 → 36.64 · C26 → −22.0%

## 4. Practice (in the Sheet; Claude reads the cells to check)

### Practice 1: spread the comps
```json
{"tab":"Practice 1","title":"Practice 1 · Spread the comps","task":"Fill the yellow cells with formulas: EV, the two multiples for each peer, and the summary rows (MEDIAN, AVERAGE, QUARTILE(range,1) and QUARTILE(range,3)).","cols":9,"rows":13,"width":{"A":190,"B":90,"C":90,"D":90,"E":90,"F":90,"G":90,"H":90,"I":90},"cells":{
"A1":{"v":"Comparable companies ($ millions, made-up)","b":1},
"A3":{"v":"Company","b":1},"B3":{"v":"Equity value","b":1},"C3":{"v":"Net debt + MI","b":1},"D3":{"v":"EV","b":1},"E3":{"v":"LTM revenue","b":1},"F3":{"v":"LTM EBITDA","b":1},"G3":{"v":"NTM EBITDA","b":1},"H3":{"v":"EV / LTM EBITDA","b":1},"I3":{"v":"EV / NTM EBITDA","b":1},
"A4":{"v":"Burrito Barn"},"B4":{"v":"1225"},"C4":{"v":"110"},"D4":{"v":"","ans":1},"E4":{"v":"880"},"F4":{"v":"152"},"G4":{"v":"165"},"H4":{"v":"","ans":1,"f":"x"},"I4":{"v":"","ans":1,"f":"x"},
"A5":{"v":"Salsa Street"},"B5":{"v":"1500"},"C5":{"v":"250"},"D5":{"v":"","ans":1},"E5":{"v":"1250"},"F5":{"v":"208"},"G5":{"v":"225"},"H5":{"v":"","ans":1,"f":"x"},"I5":{"v":"","ans":1,"f":"x"},
"A6":{"v":"Nacho Nation"},"B6":{"v":"1800"},"C6":{"v":"-200"},"D6":{"v":"","ans":1},"E6":{"v":"900"},"F6":{"v":"160"},"G6":{"v":"180"},"H6":{"v":"","ans":1,"f":"x"},"I6":{"v":"","ans":1,"f":"x"},
"A7":{"v":"Quesadilla Co."},"B7":{"v":"2600"},"C7":{"v":"400"},"D7":{"v":"","ans":1},"E7":{"v":"1800"},"F7":{"v":"270"},"G7":{"v":"290"},"H7":{"v":"","ans":1,"f":"x"},"I7":{"v":"","ans":1,"f":"x"},
"A8":{"v":"Fiesta Grill"},"B8":{"v":"3900"},"C8":{"v":"600"},"D8":{"v":"","ans":1},"E8":{"v":"2700"},"F8":{"v":"380"},"G8":{"v":"410"},"H8":{"v":"","ans":1,"f":"x"},"I8":{"v":"","ans":1,"f":"x"},
"A10":{"v":"Median","b":1},"H10":{"v":"","ans":1,"f":"x"},"I10":{"v":"","ans":1,"f":"x"},
"A11":{"v":"Mean"},"H11":{"v":"","ans":1,"f":"x"},"I11":{"v":"","ans":1,"f":"x"},
"A12":{"v":"25th percentile"},"H12":{"v":"","ans":1,"f":"x"},"I12":{"v":"","ans":1,"f":"x"},
"A13":{"v":"75th percentile"},"H13":{"v":"","ans":1,"f":"x"},"I13":{"v":"","ans":1,"f":"x"}}}
```
Answer key: D4 `=B4+C4` → 1,335 · D5 `=B5+C5` → 1,750 · D6 `=B6+C6` → 1,600 · D7 `=B7+C7` → 3,000 · D8 `=B8+C8` → 4,500 · H4 `=D4/F4` → 8.8 · H5 `=D5/F5` → 8.4 · H6 `=D6/F6` → 10.0 · H7 `=D7/F7` → 11.1 · H8 `=D8/F8` → 11.8 · I4 `=D4/G4` → 8.1 · I5 `=D5/G5` → 7.8 · I6 `=D6/G6` → 8.9 · I7 `=D7/G7` → 10.3 · I8 `=D8/G8` → 11.0 · H10 `=MEDIAN(H4:H8)` → 10.0 · I10 `=MEDIAN(I4:I8)` → 8.9 · H11 `=AVERAGE(H4:H8)` → 10.0 · I11 `=AVERAGE(I4:I8)` → 9.2 · H12 `=QUARTILE(H4:H8,1)` → 8.8 · I12 `=QUARTILE(I4:I8,1)` → 8.1 · H13 `=QUARTILE(H4:H8,3)` → 11.1 · I13 `=QUARTILE(I4:I8,3)` → 10.3.

### Practice 2: twist (an outlier)
```json
{"tab":"Practice 2","title":"Practice 2 · The takeover rumour","task":"A sixth peer, Takeover Tacos, trades at 25x EBITDA because of rumours of a bid. Fill the yellow cells, then decide whether to keep it in the set.","cols":3,"rows":13,"width":{"A":260,"B":110,"C":110},"cells":{
"A1":{"v":"EV / LTM EBITDA","b":1},
"A3":{"v":"Burrito Barn"},"B3":{"v":"8.7829","f":"x"},
"A4":{"v":"Salsa Street"},"B4":{"v":"8.4135","f":"x"},
"A5":{"v":"Nacho Nation"},"B5":{"v":"10","f":"x"},
"A6":{"v":"Quesadilla Co."},"B6":{"v":"11.1111","f":"x"},
"A7":{"v":"Fiesta Grill"},"B7":{"v":"11.8421","f":"x"},
"A8":{"v":"Takeover Tacos"},"B8":{"v":"25","f":"x"},
"B10":{"v":"5 peers","b":1},"C10":{"v":"6 peers","b":1},
"A11":{"v":"Mean"},"B11":{"v":"","ans":1,"f":"x"},"C11":{"v":"","ans":1,"f":"x"},
"A12":{"v":"Median"},"B12":{"v":"","ans":1,"f":"x"},"C12":{"v":"","ans":1,"f":"x"}}}
```
Answer key: B11 `=AVERAGE(B3:B7)` → 10.0 · C11 `=AVERAGE(B3:B8)` → 12.5 · B12 `=MEDIAN(B3:B7)` → 10.0 · C12 `=MEDIAN(B3:B8)` → 10.6.
A good answer: exclude it (its price reflects a possible takeover premium, not normal trading), and note that the median barely moved while the mean jumped. Precedent deals, which include a takeover premium, are where takeover prices belong.
