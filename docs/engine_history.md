# Engine history

How the engine got to where `README.md` describes it. Each section here is a
change as it was made - what was wrong, what was tried and dropped, and what
the numbers did either side - and each is kept as it was written: a "now" or
a "before" is as of that section, and a figure a later section moved is left
standing. They were moved out of the README on 9 October 2026, in the order
it carried them, which is roughly by topic rather than by date.

**For how anything works today, read the README** - its *How the engine
plays* links each part to its sections here. Come here for why a constant
has the value it has, for what has been tried and did not work, and before
changing something that has been changed before. `config.py`'s comments
cite these sections by name.

Sections cited here and not found in this file - *Running it*, *Where the
data lives*, *The schedule*, *The tendency scale*, *The attribute scale*,
*Calibration*, *The advanced scores*, *Never validated against the current
sheet* - are in the README. *Known problems*, *Deferred: to come back to*
and *State of things* below are as they were last written; the README's
*State of things* and *Open problems* replace them.

**A new change adds a section at the end of *The engine, section by
section*,** written the same way, and the README's part is rewritten to
stay current.

## Contents

- [How the advanced scores got here](#how-the-advanced-scores-got-here)
- [State of things, as it was recorded](#state-of-things-as-it-was-recorded)
- [The engine, section by section](#the-engine-section-by-section)
  - [The touch](#the-touch)
  - [The recalibration](#the-recalibration)
  - [Who shoots, and who gets the ball](#who-shoots-and-who-gets-the-ball)
  - [Who dunks](#who-dunks)
  - [Who rebounds, and who blocks](#who-rebounds-and-who-blocks)
  - [Who gets the assists](#who-gets-the-assists)
  - [How long he keeps it, and what pass_willingness was](#how-long-he-keeps-it-and-what-pass_willingness-was)
  - [Where his shots come from, and the diet he plays to](#where-his-shots-come-from-and-the-diet-he-plays-to)
  - [Read the drive row carefully: it used to say something else](#read-the-drive-row-carefully-it-used-to-say-something-else)
  - [Why the half-court drive is short](#why-the-half-court-drive-is-short)
  - [Touch length, who shoots, and where the mid-range comes from](#touch-length-who-shoots-and-where-the-mid-range-comes-from)
  - [The drive, with the plays fixed](#the-drive-with-the-plays-fixed)
  - [The box score, kind by kind](#the-box-score-kind-by-kind)
  - [Two tendencies: one read wrong, one not read at all](#two-tendencies-one-read-wrong-one-not-read-at-all)
  - [What a play is worth in fouls](#what-a-play-is-worth-in-fouls)
  - [Where the free throws went, and the break](#where-the-free-throws-went-and-the-break)
  - [The threes off the screen and the handoff](#the-threes-off-the-screen-and-the-handoff)
  - [The roll man](#the-roll-man)
  - [Each man's shot mix, and where the extra rim shots came from](#each-mans-shot-mix-and-where-the-extra-rim-shots-came-from)
  - [Deferred: to come back to](#deferred-to-come-back-to)
  - [Fouling out](#fouling-out)
  - [The deep bench](#the-deep-bench)
  - [Timeouts](#timeouts)
  - [The last seconds](#the-last-seconds)
  - [The last minutes](#the-last-minutes)
  - [Momentum](#momentum)
  - [The hot hand](#the-hot-hand)
  - [The slingshot, and the close-game rate](#the-slingshot-and-the-close-game-rate)
  - [Ratings the engine never reads](#ratings-the-engine-never-reads)
  - [Catch-and-shoot against pull-up](#catch-and-shoot-against-pull-up)
  - [Standing and driving layups](#standing-and-driving-layups)
  - [Putbacks](#putbacks)
  - [The post-up](#the-post-up)
  - [Rivals](#rivals)
  - [Who guards whom](#who-guards-whom)
  - [The pick-and-roll](#the-pick-and-roll)
  - [Blocks: going up for it](#blocks-going-up-for-it)
  - [Rebounding: who goes, and the fight for the spot](#rebounding-who-goes-and-the-fight-for-the-spot)
  - [The deep three](#the-deep-three)
  - [The outlet](#the-outlet)
  - [Known problems, in the order they are worth fixing](#known-problems-in-the-order-they-are-worth-fixing)
  - [Why the drive rate only ever nudged: three gates, none of them the weights](#why-the-drive-rate-only-ever-nudged-three-gates-none-of-them-the-weights)
  - [The kick-out nobody shot](#the-kick-out-nobody-shot)
  - [Drives: the finish rate, and the double supply](#drives-the-finish-rate-and-the-double-supply)
  - [Help defence, and the constant that multiplied it by zero](#help-defence-and-the-constant-that-multiplied-it-by-zero)
  - [Defenders on the rim side](#defenders-on-the-rim-side)
  - [Gravity: a man is guarded by what leaving him costs](#gravity-a-man-is-guarded-by-what-leaving-him-costs)
  - [The closeout, and passing to the open man](#the-closeout-and-passing-to-the-open-man)
  - [Rotations and double teams](#rotations-and-double-teams)
  - [What the first look showed](#what-the-first-look-showed)
  - [Switches, the corner, the man on the drive, and box-outs counted right](#switches-the-corner-the-man-on-the-drive-and-box-outs-counted-right)
  - [Who stands in the corner, the contest's distance, and the mismatch](#who-stands-in-the-corner-the-contests-distance-and-the-mismatch)
  - [Who shoots, a read at a time, and the block](#who-shoots-a-read-at-a-time-and-the-block)
  - [The tendencies, against what they were built from](#the-tendencies-against-what-they-were-built-from)
  - [The hub bigs, and the pull-up](#the-hub-bigs-and-the-pull-up)
  - [Touches and shots, held to the tendency](#touches-and-shots-held-to-the-tendency)
  - [The drives: who drives, and why there are not enough of them](#the-drives-who-drives-and-why-there-are-not-enough-of-them)
  - [The touch, decided once - built, and left off](#the-touch-decided-once---built-and-left-off)
  - [Where the catches happen, and how the mid-range comes](#where-the-catches-happen-and-how-the-mid-range-comes)
  - [How the threes come, and the split under the diet](#how-the-threes-come-and-the-split-under-the-diet)
  - [The 8-9 ft pile, and the floater](#the-8-9-ft-pile-and-the-floater)
  - [Play types, credited to the play that was running](#play-types-credited-to-the-play-that-was-running)
  - [The play mix](#the-play-mix)
  - [The drive, per touch](#the-drive-per-touch)
  - [Where the scorers stand, and the isolation](#where-the-scorers-stand-and-the-isolation)
  - [Who brings it up, and what he does with it](#who-brings-it-up-and-what-he-does-with-it)
  - [The touches, in the front court](#the-touches-in-the-front-court)
  - [The touches, in the backcourt](#the-touches-in-the-backcourt)
  - [Ratings doing what they say](#ratings-doing-what-they-say)
  - [Fitting ratings to the real players](#fitting-ratings-to-the-real-players)
  - [The funnel, and why it took three failures to find](#the-funnel-and-why-it-took-three-failures-to-find)
  - [Shooting](#shooting)
  - [The rim, and where dunk data comes from](#the-rim-and-where-dunk-data-comes-from)
  - [Shot distance](#shot-distance)
  - [Spacing: two position systems that had never spoken to each other](#spacing-two-position-systems-that-had-never-spoken-to-each-other)
  - [The pacing lever was throttling the wrong thing](#the-pacing-lever-was-throttling-the-wrong-thing)
  - [The lateral angle, and the 4-out set](#the-lateral-angle-and-the-4-out-set)
  - [The plays, and why they were not firing](#the-plays-and-why-they-were-not-firing)
  - [The dead time in the middle of every touch](#the-dead-time-in-the-middle-of-every-touch)
  - [One field was answering two questions](#one-field-was-answering-two-questions)
  - [Still radial in one respect](#still-radial-in-one-respect)
  - [Fatigue](#fatigue)
  - [Stats that read zero for every player](#stats-that-read-zero-for-every-player)
  - [Turnovers happen in the play](#turnovers-happen-in-the-play)
  - [The handoff and the off-screen action, measured](#the-handoff-and-the-off-screen-action-measured)
  - [Drives, post-ups and isolations, start to finish](#drives-post-ups-and-isolations-start-to-finish)
  - [Found while chasing the drives, measured, and not yet fixed](#found-while-chasing-the-drives-measured-and-not-yet-fixed)
  - [Where the real play-type numbers come from](#where-the-real-play-type-numbers-come-from)
  - [A quarter that never ended](#a-quarter-that-never-ended)
  - [Ball security per touch, and the steals' levels](#ball-security-per-touch-and-the-steals-levels)
  - [Assists per pass, and vision's curve](#assists-per-pass-and-visions-curve)
  - [Who brings it up, without vision](#who-brings-it-up-without-vision)
  - [Vision beyond the role](#vision-beyond-the-role)
  - [Finishing by the kind of layup](#finishing-by-the-kind-of-layup)
  - [Who posts up, and the drive called](#who-posts-up-and-the-drive-called)
  - [The volume holds and the diet, checked](#the-volume-holds-and-the-diet-checked)
  - [Back on the league's percentages](#back-on-the-leagues-percentages)
  - [Where on the arc](#where-on-the-arc)
  - [Where a block goes](#where-a-block-goes)
  - [Taking turns](#taking-turns)
  - [Past the best real player](#past-the-best-real-player)

## How the advanced scores got here

**Rebuilt in October 2026** from a weighted mix of per-category z-scores,
which moved with the team around a man: the same two customs swapped between
the Kings and the Lakers shifted half a standard deviation each, one up and
one down. Valued event by event - and after the calibration below - they
move 0.18 and 0.10 and keep their places, third and fifth among the customs;
everyone else, playing other games, moves 0.04 on average. Game to game it
holds about as well as before (odd against even games r 0.94 before the
calibration, against 0.96).

**Then measured against Win Shares, VORP and PIE.** A 1,560-game season on
the real sheet gives each man the score and all three of those, computed off
the same games (`metrics.team_context`); per game, as z-scores, averaged,
they make a composite to hold the score against. The three agree with each
other at r 0.82 (WS and PIE) to 0.97 (WS and VORP); the score agreed with
their composite at 0.950 over NBA players, but its top was all passers -
Cade Cunningham first, Josh Giddey 12th against 27th. Split into its parts
(`PARTS`, summed through a season) and fitted to the composite, four things
were off, and each fix has its own reason besides the fit:

- **The assist was half the basket**, and the shooter kept all of his; 0.3
  of it, about 0.65 points an assist, is Dean Oliver's credit to the passer
  and where the composite agrees best (`PASS_MAKE_SHARE`).
- **The replacement line was too high.** At 0.52 TS against the league's
  0.57 a 30-shot night read as barely more than a bench man taking the same
  shots; carrying a load is worth more than that to all three. Agreement is
  flat from 0.65 to 0.85 of that line, and 0.8 of it is taken
  (`REPLACEMENT_SHARE`, a 0.42 TS).
- **A free throw was measured as if the replacement had drawn the same
  foul**, so drawing one earned next to nothing over taking the shot. It is
  measured against the shot the foul stopped now.
- **An offensive board earned the whole second chance**, where a defensive
  one earned only the share of it the offence was expected to get. Both are
  measured against that expectation now.

The score now agrees with the composite at **r 0.976** over NBA players,
0.971 with PIE alone, and its top eight are the composite's top eight; Giddey
is out of the top 20. What a box score cannot see - whom a man guarded,
help, deterrence, box-outs - stays at its points: fitted, those weights
would only fall toward what WS, BPM and PIE can count (box-outs came out at
-20), and seeing them is the point.

**Then the steal was cut to 0.4 of the possession** (the user's call,
2026-10-12, `STEAL_SHARE`). Reading a man's defence part by part
(project.py's `parts`) showed steals carrying it: the stealer took the
whole possession and the live ball's extra, about 1.4 points, while the
parts that read the other possessions - the matchup, help, deterrence - are
measured against what was expected and run near zero. On the last season
steals were 1.02 of the regular's 1.03 defensive points a game and 34% of
the spread between defenders (the matchup 57%), so a man whose matchups
came out even - Jay AT - was his steals, and Che's 4.7 points of them a game
(about 3.4 steals) were most of his. At 0.4 they are 12% of the spread; at
0.33, 9%. The scale was re-set from that season's parts, which steals enter
linearly: the defensive mean fell from 1.27 to 0.40 points and its spread
from 2.37 to 1.41. Che keeps 5.06 - his matchups are strong too - but falls
from sixth to outside the top twelve, where Ausar and Amen Thompson,
Derrick White and Alexander Lane rise; Jay AT, whose matchups, blocks and
charges his steals had hidden, goes from 2.80 to 3.08.

**What the score could not fix was the sim's usage.** Real life's lists put
Jokic, Gilgeous-Alexander and Wembanyama in the top five. In the sim
Gilgeous-Alexander led, and Jokic and Wembanyama were 13th and 14th - about
where the sim's own WS, VORP and PIE put them, 10th and 11th - because the
engine gave the ball to the wrong men: Jokic scored 16.5 a game at a 15.6%
usage against his real 27.7 and 28.9%, and Embiid 11.5 against 26.9, while
Brunson scored 42.5 against 26.0 and Maxey 37.4 against 28.3. That was the
engine, and it is fixed there - see *Who shoots, a read at a time, and the
block*. On the same sheet afterwards, with the baselines re-set twice (the
first pass held every defender to the old engine's scoring rates, and the
men guarding the bigs who now post up read as cooked), the sim's own
composite runs Gilgeous-Alexander, Antetokounmpo, Wembanyama - three of real
PIE's top four - and the score has them first, third and second, agreeing
with the composite at r 0.977. Jokic was 17th by the score and 11th by the
composite, his usage still 0.25 against 0.29; Embiid, at 0.22 against 0.34,
53rd. After *The tendencies, against what they were built from* the
composite runs Gilgeous-Alexander, Wembanyama, Antetokounmpo fourth and
Jokic eighth, and the score has them first, fifth, fourth and tenth (r
0.977); Jokic averages 22.6, 6.5 assists and 11.3 boards beside a custom
point guard. Embiid is 32nd. After *The hub bigs, and the pull-up* the
composite's top five are real PIE's - Gilgeous-Alexander, Wembanyama,
Jokic, Antetokounmpo, Doncic - but the score, whose weights were fitted
while the bigs had half the ball, has Jokic ninth and Antetokounmpo eighth
behind Cunningham, Brunson and Jaylen Brown (r 0.974 with the composite).
It trails the composite on the bigs generally - Towns 29th against 15th,
Duren 27th against 14th, Embiid 47th against 34th. Jokic averages 20.9,
8.6 assists and 12.1 boards.
After *Touches and shots, held to the tendency* the composite runs
Gilgeous-Alexander, Wembanyama, Antetokounmpo, Jokic and Cunningham, and the
score Gilgeous-Alexander, Cunningham, Curry, Leonard and Wembanyama, with
Antetokounmpo seventh and Jokic ninth (r 0.973 with the composite). The
score still trails it on the bigs - Towns 29th against 12th - which is the
score's own weights, not the engine's volume any more. After *Where the catches happen,
and how the mid-range comes* the composite runs Gilgeous-Alexander,
Wembanyama, Curry, Cunningham and Tatum, Jokic sixth, and the score
Gilgeous-Alexander, Cunningham, Curry, Leonard and Wembanyama, Antetokounmpo
eighth and Jokic ninth (r 0.973); Towns is 16th against the composite's
9th, Embiid 53rd against 41st. After *How the threes come, and the split
under the diet* the composite runs Gilgeous-Alexander, Wembanyama,
Antetokounmpo and Jokic - real PIE's top four - then Tatum, and the score
Gilgeous-Alexander, Cunningham, Wembanyama, Maxey and Brunson,
Antetokounmpo sixth and Jokic ninth (r 0.973); Towns 25th against 12th.

## State of things, as it was recorded

Where the engine currently lands, 240 league games, per team. **Read the
real-rosters column**: `--real-only` drops every non-NBA player and gives the
rest their real minutes per game, so it is the only column the NBA reference
actually describes.

240 games, because 30 is not enough: four separate 30-game blocks at
different seeds came out between 108.1 and 114.0 points, 43.4% and 45.7% FG.
**A three-point difference over 30 games is noise, and several conclusions
recorded further down this file rest on less than that.**

Four engines, `bench.py --games 240 --league --real-only` against rotating
opponents: after the September 2026 league recalibration, the second-chance
scramble, the two tendency fixes and the play-type foul rates (on the sheet
as it stood then); the engine of `46a3eca` - the usage, touch, drive and
catch-spot work of late September and early October - on the sheets of 4-5
October; and the engine of `b9622b9`, after *The 8-9 ft pile, and the
floater*, *Where the free throws went, and the break*, *The threes off the
screen and the handoff* and *The roll man*, against now, after *Each man's
shot mix, and where the extra rim shots came from*, both on the sheet of 7
October 2026. The NBA
column is 2025-26 - the stats cache, and pbpstats for possessions and the
foul and turnover splits - the season every anchor in config comes from;
the shot zones are its whole shot chart by the foot (they read 40.3 / 17.1 /
42.6 from an earlier pull until October).

| | September | `46a3eca` | `b9622b9` | now | NBA |
|---|---|---|---|---|---|
| points | 115.8 | 115.0 | 115.9 | 115.0 | 115.0 |
| possessions | 99.9 | 99.9 | 99.2 | 99.4 | 100.0 |
| field goal attempts | 89.4 | 91.8 | 90.6 | 91.0 | 88.6 |
| FG% | 47.3 | 46.8 | 47.8 | 46.7 | 47.1 |
| three-point attempts | 36.1 | 35.6 | 34.7 | **36.4** | 36.8 |
| 3P% | 36.1 | 36.2 | 35.2 | 35.5 | 36.0 |
| assists | 27.1 | 26.8 | 26.5 | 26.5 | 26.6 |
| % of made FGs assisted | 64.2% | 62.5% | 61.2% | 62.5% | 63.8% |
| turnovers | 13.8 | 13.5 | 13.0 | 13.1 | 13.7 |
| free throw attempts | 23.3 | 20.9 | 21.6 | 21.9 | 23.4 |
| FT% | 78.5% | 78.3% | 79.0% | 78.7% | 78.3% |
| personal fouls | 19.5 | 18.3 | 18.8 | 18.8 | 19.8 |
| offensive rebounds | 11.0 | 12.1 | 11.8 | 12.0 | 11.3 |
| defensive rebounds | 32.9 | 33.1 | 32.1 | 32.9 | 32.2 |
| blocks | 5.1 | 4.9 | 5.0 | 5.0 | 4.8 |
| steals | 8.5 | 8.9 | 8.7 | 8.8 | 8.4 |
| shots inside 8 ft | 39.4% | 38.8% | 43.5% | **39.8%** | 40.1% |
| shots 8–22 ft | 20.2% | 22.5% | 18.2% | **20.3%** | 18.4% |
| shots from three | 40.4% | 38.8% | 38.3% | **40.0%** | 41.5% |
| **drives, NBA definition** | 43.5 | 51.0 | 43.1 | **46.4** | **66.1** |
| drive field goal attempts | 21.4 | 24.4 | 20.4 | 22.6 | 27.0 |

(The bench reads the zones by `ShotZone`, so a shot from 7-8 ft counts in
the mid-range there.)

**Points, pace, rebounds and blocks are within 5% of the league, and now the
shot mix is close** - 39.8 / 20.3 / 40.0 against 40.1 / 18.4 / 41.5, the rim
the league's, the mid-range two points over and the threes one and a half
short, with 62.5% of the makes assisted against 63.8%. See *Each man's shot mix, and
where the extra rim shots came from*. The free throws run 6% short. What is
not close is **the drive**, still a third short (46.4 against 66.1, its
attempts 16%), and the play mix around it: over 600 real-roster games the
pick-and-roll handler runs 16.3 plays a team game against Synergy's 17.3, the
post-up 2.5 against 3.9, and the spot-up 34.8 against 27.6. Steals run 5% over
on the steals fit still to be run. See *The recalibration*, *Where his shots
come from, and the diet he plays to*, and *Who shoots, and who gets the
ball* for how the shots are shared out among the players.

And the play types, **each shot credited to the play its own shooter ran** —
which is how Synergy counts. Measured before the cut, pick-and-roll and break
fixes and not since:

| play type | before | sim FGA | NBA FGA | |
|---|---|---|---|---|
| transition | 12.2 | 14.9 | 14.2 | 105% |
| cut | 6.1 | 5.2 | 5.6 | 93% |
| off screen | 3.5 | 2.2 | 3.2 | 69% |
| P&R ball handler | 6.4 | 8.7 | 12.2 | 71% |
| handoff | 3.7 | 2.4 | 3.7 | 65% |
| post up | 0.4 | 1.4 | 2.6 | 54% |
| P&R roll man | 0.6 | 1.5 | 4.3 | 35% |
| isolation | 0.4 | 3.9 | 5.8 | 67% |
| putback | 0.0 | 4.2 | 4.2 | 100% |

Everything built on a man with the ball in his hands - the iso, the post, the
roll - used to almost never end in that man's own shot. It mostly does now;
the roll man is the one still well short.

The handoff and off-screen rows read `play_handoff` and `play_off_screen`,
which **need the Sheet pasted before `bench.py` sees them** — until then the
loader warns that both columns are blank and every player reads 50, so the
plays run at the same totals but evenly across the roster. See *The handoff
and the off-screen action, measured* below.

## The engine, section by section

### The touch

**Every touch is one decision, and the time it takes follows from the
decision.** It was the other way round, and that one inversion was the drive
gap.

A catch used to be a fixed 4.4-second setup in which the only thing that could
happen was a per-tick coin-flip swing pass. Then a deciding phase sent half of
what survived through three more gates - pass-first, attack suppression, reset
pass - none of which read `drive_frequency`. Measured on real rosters, per
team per game:

| touch ending | per game | seconds held first |
|---|---|---|
| swing during setup, no decision made | 207 | 1.9 |
| pass out of a deciding gate | 100 | 4.1 |
| shot | 94 | 3.2 |
| drive begins | 44 | 4.4 |

A drive could only start on a touch that survived all of that, after four
seconds of holding. **The pace was right only because the shot clock was
ending a third of the offence**: 34.6% of all shots went up with two seconds
or less, 37.2% carried the forced flag, and a forced shot skipped the rule that
turns a rim pick from 22 ft into a drive - 11.6 rim shots a game granted from
beyond 10 ft with no drive at all.

**Now.** A pass arrives; the catch-and-shoot goes at once if it is going
(`CATCH_SHOOT_TICKS`); otherwise `_read_the_floor` fires after
`CATCH_READ_TICKS` and weighs three appetites. *Pass* is willingness and
vision, higher while the set is young. *Hold* is a survey of 1.2 to 3.0
seconds, higher for the initiator and on the first touch, decaying each time
he holds again. *Attack* is his shots and drives per touch. An attack goes to
`_choose_attack`, where the screen call is one option among the rest rather
than a gate ahead of them. Clock pressure rises continuously from 12 seconds,
cutting the hold, then the pass, and raising the attack. A man catching a
kick-out has a closeout running at him, so he reads on the catch, with no
survey and his drive appetite trebled.

**It needed two anchors, and they are separate.** Everything before the shot
is set against when the NBA shoots, from stats.nba.com's own splits of every
attempt (`leaguedashteamptshot`, 2025-26):

| shot clock | 24-22 | 22-18 | 18-15 | 15-7 | 7-4 | 4-0 |
|---|---|---|---|---|---|---|
| NBA % | 3.2 | 14.6 | 17.2 | 47.8 | 9.3 | 8.0 |
| sim % | 1.4 | 14.2 | 17.3 | 53.6 | 8.0 | 5.5 |
| before (40 games) | 2.6 | 13.3 | 13.2 | 23.4 | 7.9 | **39.5** |

| touch time before the shot | under 2 s | 2-6 s | 6 s+ |
|---|---|---|---|
| NBA % | 55.7 | 31.3 | 13.0 |
| sim % | 61.4 | 22.7 | 15.9 |

Everything after the shot is set against the pace, and **it was missing
entirely**. The tick loop stopped when the shot resolved, so the ball was
never in the air, a miss was rebounded the instant it left his hand, and a
make was inbounded before it landed. None of that uses the shot clock. With
every decision already landing on the table above, the sim still ran 25% more
possessions than the league. `_clock_after_shot` charges a second of flight, a
second to rebound, and three and a half to inbound a make.

Two things that look like tuning and are not. A fast break was charged no time
to cover the floor and shot 1.7 seconds into the trip, putting 10% of shots in
the 24-22 bucket; it now pays a random run. And the catch-and-shoot two fired
as readily as the three, because `shot_mid_off_catch` and `shot_3_off_catch`
are each anchored on their own league mean and cannot say how rare one is
against the other. The league can: 26.3 catch-and-shoot threes a game to 1.6
twos. `CATCH_SHOOT_MID_MULT` carries that ratio, and it is what brought the
three-point share back from 36.7% to 41.3%.

**The play weights were all re-fitted**, because every one of them was set
against the old action roll, which fired about 80 times a team a game; the read
reaches the attack roll about 130. Handoffs and off-screen actions ran at
twice their Synergy rate and pull-up threes at 14.5 per 100 against 9.8. The
per-constant sweeps are recorded in `config.py`.

**Found and fixed on the way**, each in the same commit as the read:

- The **shot tendency gate** in `_resolve_shot` re-rolled the shooter's shot
  weight after the read and the attack roll had already used it, and called
  the resulting pass a kick-out, granting collapse openness when nothing had
  collapsed. At an effective shot weight of 10 - a low-usage big - it passed
  out of 77% of the cut layups and catch-and-finishes the read had chosen.
- **Forced shots** skip the drive conversion no longer: he drives if there is
  time, and the rim is off the table if there is not. Rim teleports went from
  4.1 a game to zero.
- The **contested pass-up** drew the defender's distance from `uniform(3, 10)`
  though every player has had a tracked position since the spacing pass.
- **The iso** drifted 0.3 ft a tick toward the rim, so an iso from the arc
  could never be a three, and its resolution drove only from inside 10 ft.
  It holds its spot, and a win drives or pulls up from there.
- **The post-up** read its double team once but still added interior
  deterrence to the bail-out every tick; only the first post-up of a trip
  ever read at all; and the fadeaway was rolled twice, the second time as a
  percentage, then re-rolled into a layup by `_take_shot`.
- **Help** counted every off-ball defender who shifted, so every drive drew
  3.45 helpers and 0.5% of kick-out reads saw none. The low man and the nail
  now rotate, and count once they are in the lane. Help flags were also never
  cleared except by a kick-out, so a helper could stand in the lane for the
  rest of the trip.
- **Drive whistles** fired from the first tick, so 4.9 of 5.2 drive fouls and
  charges a game landed at 10-20 ft on drives no tracker would count. They
  wait for the paint.
- **The kick-out read's neutrals** were anchored at confidence 100 and threat
  22 against real means of 76 and 33, with a -58 bias fitted to cancel them,
  and a +0.35 bonus split drives into a 39% and a 74% kick population.
- A handoff that went straight up never recorded the catch, handoffs, cuts,
  off-screen passes and the pass to the roller did not count toward the pass
  total the read uses, and the late-clock heave read the clock of the
  previous shot.

**What is still open.**

- **Drives: 44.9 against 66.1.** From 31.7. Raising the drive appetite in the
  read does add drives, but only by taking touches from the pass: at two and
  a half times the weight drives reached 54 while passes fell from 158 to 134
  per 100 and the rim share went to 50%. Shorter holds did not buy more touches either -
  they moved shots earlier. The closeout read is worth about two. The NBA
  fits 66 drives *and* about two front-court passes into a possession; the
  sim does not yet, and the next thing to look at is what a drive does to
  the touch it starts on rather than how often one is chosen. That is what
  it was - see *Why the half-court drive is short*.
- **Efficiency: 131.8 points.** Done - see *The recalibration*.
- **The drive's own split** had fouls high and turnovers low: 13.9% and 3.7%
  of tracked drives against 8.6% and 6.1%. Fouls are 7.8% now and
  turnovers 5.2% - see *Turnovers happen in the play* below.
- **`PACING_TEMPO_PER_POINT`**: done - see *The recalibration*.
- **Touch time** runs short in the middle - 22.7% of shots after a 2-6 second
  touch against 31.3% - and the roll man takes 1.7 attempts against 4.3.

### The recalibration

**Everything the scorer keeps was re-anchored after the touch was rebuilt,
because all of it had been fitted to an offence that forced a third of its
shots.** The targets are 2025-26, from the stats cache. The numbers are 240
league games on real rosters, measured with a probe that splits each rate
by where it comes from - which is what found that most of the gap was not
shooting at all.

**Free throws: most of the excess was the charge check.** It moved into the
paint with the touch, where every drive that gets there reaches it once, and
at its old rate it drew 2.25 charges and 3.7 blocking fouls a team a game -
each a two-shot foul, seven free throws from one check. The NBA draws 0.31
charges. And every foul on a driver was a shooting foul, 2.00 free throws
apiece against the league's 1.55 (8.8 `DRIVE_FTA` on 5.67 `DRIVE_PF`), so a
share of them are now common fouls: two shots in the penalty, a side-out with
the shot clock topped up to 14 otherwise. `DRIVE_FOUL_SHOOTING_SHARE`.

**Turnovers: the passing lane had closed.** Interceptions were fitted when a
possession held eight or nine passes and the read makes about two, so they
fell to 0.7 a game and steals to 6.1 against 8.4. The dead-ball turnover -
travels, three seconds, the ball thrown away - was 0.015 a game against a
league whose non-steal turnovers run 5.3. And a steal during a drive never
recorded the drive's turnover, so the drive split read 0.4 a game against the
NBA's 4.0 while the steals themselves were counted fine.

**Shooting: each curve's base was scaled by its own ratio.** Slopes and
anchors are untouched. The long two moved furthest because the forced shot
had landed on it hardest:

| shot | was | now | NBA |
|---|---|---|---|
| layup | 62.9% | 57.9% | 56.9% |
| floater | 56.6% | 46.2% | 46.5% |
| 8-16 ft | 49.7% | 45.0% | 44.4% |
| 16-24 ft | 54.8% | 39.8% | 39.2% |
| three | 37.0% | 36.0% | 36.0% |
| dunk | 85.8% | 89.1% | 88.5% |

**Assists** went 58% to 63.5% of made field goals against 63.8%, through one
scale on the chance a pass is credited into a shot the shooter still had to
make something of. The gather-by-gather chances were set when most assisted
shots were catch-and-shoot threes; the read moved assisted volume onto drives
and cuts.

**Pace came from after the shot, not before it.** Fixing turnovers shortened
enough trips to put pace at 106. A second on the bring-up reached 101 but
bent the shot-clock table - the 18-15 bucket went to 11.6% against a real
17.2 - so the time went to the rebound and the inbound instead, which the
shot clock never sees.

**And team tempo had stopped doing anything.** Ten points of pacing moved
pace by 1.3 possessions, because tempo only divided the pass and hold weights
and possession length is now set by clock pressure, the bring-up and the time
after the shot. Tempo reaches those too, and at a re-measured slope ten points
either way moves pace +9.2 and -11.1. Inside the NBA's 99-107 range a team
plays close to its rating; the Osverse's extremes compress a little - against
Test (105), Tentacles (132) play 114.9 where the average would be 118.5, and
BMI (74) play 85.7 against 89.5.

`advanced_scoring`'s league averages were re-measured from a full season
afterwards.

**Still open after it.**

- **Shot selection at the rim.** 43.4% of attempts inside 8 ft against 40.3%
  (44.5% at the recalibration itself; the usage change moved a point of it). Every drive that goes up finishes at 1
  to 4 feet, so the floater and the short pull-up off a drive - a real part of
  the NBA's 27 drive attempts - do not happen. This is the rest of the points.
- **FG% by shot clock is too flat.** 49.7% with 22+ seconds left against a
  real 58.2%, and 43.2% in the last four against 37.8%. Only a forced shot is
  penalised, and only under two seconds; the early shot is not easier and
  the late one not harder.
- **The drive's turnovers** were 0.7% of tracked drives against 6.1%. 5.2%
  now - see *Turnovers happen in the play* below.
- **A team cannot play itself, and now says so.** `load_matchup` handed back
  the same Team object for both sides and the game never finished, so
  `HOME_TEAM == AWAY_TEAM` in `main.py` hung. `GameEngine` refuses it with a
  ValueError. A copy would not have worked either: the score, the lineups
  and the box score are all keyed by team and player name.

### Who shoots, and who gets the ball

**`touches` and `shot` are volumes, and the engine now plays them as
volumes.** Both come from stats.nba.com per 36 minutes against the league
mean, so a 70 touches the ball twice as often as a 35 and a 70 takes twice
the attempts. Fitted over a 780-game season, per 75 possessions, with the
possession-weighted mean of his teammates' tendency held constant:

| | before | now | wanted |
|---|---|---|---|
| FGA | shot^0.66 × touches^-0.63 | shot^0.97 × touches^-0.06 | shot^1 × touches^0 |
| touches | touches^0.15 × shot^0.15 | touches^0.98 × shot^0.06 | touches^1 × shot^0 |

Before, nearly everyone caught the ball about 40 times per 75 whatever his
tendency, and the per-touch shot weight is shot over touches, so touches did
nothing except brake shooting. The low-touch specialist led the league in
attempts and the high-touch star shot like a role player:

| | shot | touches | FGA/75 before | now | touches/75 before | now |
|---|---|---|---|---|---|---|
| Andy Gibbs | 60 | 30 | 22.8 | 12.4 | 36.4 | 16.1 |
| Klay Thompson | 68 | 35 | 21.0 | 16.2 | 38.8 | 23.6 |
| Luka Doncic | 88 | 75 | 15.8 | 24.6 | 48.6 | 65.6 |
| Nikola Jokic | 69 | 88 | 11.3 | 15.2 | 52.8 | 76.8 |
| Jalen Brunson | 79 | 77 | 12.8 | 19.9 | 42.0 | 59.0 |

Three causes, none of them the tendencies:

- **The pass target** was a sum in which touches carried 40% of the weight,
  and the per-touch shot weight another 25% - so the ball went preferentially
  to the men with the fewest touches. It is his touches weight alone now,
  shaded by the floor: the paint penalty, chemistry, and the cutter and
  roller out of a collapse.
- **The attack was a share of a contest.** Pass, hold and attack were drawn
  as one three-way weight, and twice the appetite came out as about 1.6
  times the attacks. Attacking is a probability in proportion to the
  appetite now, and pass and hold split what is left.
- **A third of all attempts are catch-and-shoots, and a tenth cuts and
  putbacks**, which answer to their own tendencies. So the attacks that do
  answer to `shot` carry the whole spread, and the per-touch shot weight is
  shaped by exponents fitted to make the table above come out.

The league did not move: 118.3 points, 48.1% FG, 23.2 free throws and 13.8
turnovers against 118.4, 47.9, 23.8 and 13.6 before. What moved is who
takes the ball: stars take more of the attacks, so the plays role players
used to call run a little less - the P&R handler row went 9.5 to 8.5 and
tracked drives 42.0 to 40.2.

### Who dunks

**The league dunked about as often as the NBA and gave the dunks to the wrong
men.** 5.72 a team a game against 5.44, but Ja Morant dunked 16.6% of his
shots against a real 2.7% while Rudy Gobert dunked 21.4% against 43.5%. The
dunk window had been calibrated to the league's 15.2% of shots inside 8 ft
when the sim drove far less, and it was one window for every rim finish,
read off `driving_dunk` - the rating the league's guards carry.

The shot chart the rim data already comes from (see *The rim, and where dunk
data comes from*) names how every shot was taken, and a dunk is nothing like
as likely on one as another. `stats_fetch` keeps only each player's totals,
so the split below is a one-off pull of the same `shotchartdetail` request
(102,400 shots from 573 games), grouped by the start of `ACTION_TYPE`. Dunks
as a share of dunks and layups, sim over 1,440 league games on real rosters,
the same seeds either side:

| how he got there | shot chart | sim FGA | before | now | NBA |
|---|---|---|---|---|---|
| drive, break or not | "Driving" | 25.5 | **12.5%** (3.12 a game) | 7.3% (1.82) | 7.2% (0.85) |
| caught in stride on the break | "Running" | 2.6 | 27.8% | 25.3% | 23.0% |
| cut | "Cutting" | 3.1 | 24.4% | 35.5% | 36.4% |
| alley-oop | "Alley Oop" | 1.4 | 27.5% (0.36 thrown) | 69.2% (1.41) | 70.2% (1.40) |
| putback or tip | "Putback", "Tip" | 3.2 | 24.2% | 13.8% | 13.7% |
| any other catch | the rest | 3.5 | 29.1% | 21.2% | 21.9% |

**Each context has its own window now** - `_rim_context` names it and
`DUNK_WINDOW_SCALE` holds one scale per context, each calibrated onto its
share. **What goes into the window was fitted, not chosen:** the
likelihood of 370 real players' own per-context dunk counts given their sheet
ratings, over a grid of forms. A drive reads his driving dunk tendency and
`driving_dunk × standing_dunk` - `standing_dunk` predicts even a player's
*driving* dunks better than `driving_dunk` does (0.52 against 0.42), because
it carries the size to get it up over a set defence. Everywhere else it is
the standing tendency and `driving_dunk`. The old form scored 12,906 on that
likelihood and this one 12,528; adding height took it to 12,498 and was left
out.

Two things around the lob were broken outright. A caught alley-oop went
through the ordinary zone roll, so **27% of lobs came out as floaters and
jumpers**; it finishes at the rim now, dunked or laid in. And it asked the
dunk tendency question on top of the lob roll that had already asked it,
which capped lobs near a coin flip. `ALLEY_OOP_BASE_CHANCE` 0.25 threw 0.44
a game against 1.40, and those are nearly all a big's dunks; at 0.75 it
throws 1.41. A lob is only thrown to a cutter or roller already near the
rim, so it mostly moves finishes: a cutter was going to shoot anyway, and a
roller's catch becomes a shot a little more often - roll-man attempts went
1.4 to 1.5 and cut attempts 5.4 to 5.2.

Dunks as a share of each player's shots, same games:

| | before | now | real |
|---|---|---|---|
| Ja Morant | 16.6% | 4.4% | 2.7% |
| Donovan Mitchell | 11.9% | 6.9% | 1.8% |
| Anthony Edwards | 9.4% | 4.5% | 4.6% |
| De'Aaron Fox | 6.2% | 2.3% | 0.9% |
| Jalen Johnson | 15.5% | 8.9% | 8.5% |
| Jalen Duren | 30.5% | 23.7% | 26.7% |
| Nic Claxton | 17.4% | 22.5% | 25.9% |
| Rudy Gobert | 21.4% | 29.0% | 43.5% |
| Chet Holmgren | 6.7% | 6.8% | 18.9% |
| Zion Williamson | 35.9% | 26.7% | 10.4% |

Across the 134 players with 700 attempts, the correlation with their real
dunk rate went from 0.70 to 0.84 and the mean miss from 3.5 points to 2.5.
The league did not move: 118.9 points, 48.1% FG and 23.3 free throws, and
rim FG% is 61.6, the league's exactly. Turnovers are 13.9 against 13.8; over
480 games the lobs that are not caught add about a quarter of one.

Over the full 1,560-game season, fictional players included, the correlation
for the 179 real players went from 0.73 to 0.81. The sheet's own high-flyers
came down with the guards: Julio Soto from 51.8% of his shots to 30.8%,
Charlie Moor from 41.2% to 29.7%. `advanced_scoring`'s averages were
re-measured from that season.

#### Real rates

That left the bigs short because of the sheet: Chet Holmgren carried 75
driving dunk and 75 standing dunk, a wing's, and the dunk tendencies were a
blend of `shot_close` and those ratings. **`tend_driving_dunk` and
`tend_standing_dunk` are now each player's real dunk rate** - of his dunks
and layups off the dribble, and of everything else he caught but a lob, how
many he dunked, shrunk toward the league on a small sample. `pull` and
`build` produce them with everything else, and a player with no stat line
gets them from the archetype prediction. See *Dunks* in
`ratings_build/README.md`.

Two things fell out of building them. **The shot chart had only ever been
half a season**: `shotchartdetail` stops at 102,400 rows without saying so,
so the first pull held 573 of 1,230 games. It is fetched a month at a time
now; the full season reads 5.47 dunks a team a game at 88.7%, and by
context drives 7.7%, the break 23.7%, cuts 34.8%, lobs 70.1%, putbacks 13.6%
and other catches 21.9%. And **the ratings stopped earning their place in the
window.** Refitted on those counts against the new tendencies, `driving_dunk`
and `standing_dunk` both made the fit worse - within the season and out of it,
with 2024-25 rates predicting 2025-26 dunks. The window is the context's scale
alone, the look is `tendency / 150` rather than `/ 100` so the bigs are not
capped at twice the league's rate, and a rating only decides whether he can
dunk at all.

1,440 league games on real rosters, same seeds, against the full season:

| | before | now | real |
|---|---|---|---|
| Donovan Mitchell | 6.9% | 2.1% | 1.4% |
| Luka Doncic | 2.5% | 0.8% | 0.3% |
| Zion Williamson | 26.7% | 11.4% | 10.3% |
| Giannis Antetokounmpo | 22.0% | 24.7% | 24.6% |
| Nic Claxton | 22.5% | 22.2% | 23.8% |
| Evan Mobley | 11.5% | 17.1% | 25.3% |
| Victor Wembanyama | 8.3% | 12.1% | 18.0% |
| Rudy Gobert | 29.0% | 27.9% | 43.0% |

The correlation with each player's real rate goes 0.85 to 0.93 and the mean
miss 2.4 points to 1.7; over a full season, 0.81 to 0.90. The league is where
it was: 119.2 points, 48.2% FG, 23.2 free throws, 14.0 turnovers. Custom
players keep the dunk tendencies typed for them, which now read against the
league's real rate - Julio Soto's 93 is nearly twice it - and the pivot moved
them too: Soto dunks 21.5% of his shots, Charlie Moor 19.2%.

**The sheet has to follow.** `players.csv` carries the new values, but it is
what `csv_merger.py` writes from the Google Sheet, so the next merge puts the
blends back unless the Sheet has them. `ratings_build/output/paste_dunk_tendencies.csv`
is the two columns in sheet order, ready to paste.

#### On the Sheet as the rates they are, and a custom's from his build

**October 2026.** Read on the Sheet's 1-100 the two rates said nothing a man
could check - a 77 on a drive is 1.9 times the league's average player -
and they were the hardest thing to set on a custom: a dunk goes in 88.6% of
the time and a layup 57.2%, so a big's rate from 30% to 50% of his finishes
is two or three points of his FG%. And they read as backwards against 2K,
because they are how often a man dunks and 2K's dunk ratings are how well:
Ja Morant's 96 driving dunk sits on 4 dunks in 65 drive finishes, Mitchell
Robinson's 3 in 4 read 92 off a sample that small.

**They are written as percentages now** (`tendency_scale` version 4): of his
drive finishes, and of everything else he finished but a lob, how many he
dunked - Wembanyama 31.2 / 41.6, Mobley 27.0 / 57.0, Gobert 19.7 / 42.1, Ja
Morant 4.7 / 13.5, Doncic 1.6 / 8.4, the league's average player 8.5 / 21.1.
The engine reads them exactly as before (its 50 is that average player), so a
rebuilt sheet plays as the old one did, to within the old whole-number
rounding; a row from before version 4 is read on its old tops. The engine's
look still tops out at three times the average player's rate, 25.5% on drives
and 63% on the rest.

**A custom's blank cell is filled by the ratings build** with what real
players built like him do (`ratings_build/dunk_model.py`, refitted every
build): his length (height and wingspan together) and his driving and
standing dunk ratings, in a logistic fit on every real player's own dunk
counts. Fitted freely, length carries most of it - 2K's dunk ratings predict
how often a man dunks less well than his size does (`driving_dunk` alone r
0.39 with real drive dunk rates, height 0.62, vertical 0.05) - and at the
extremes it ran away: a 7'6" custom with ordinary dunk ratings was handed
35% of his drive finishes as dunks, a 6'1" high flyer 4.6%. So by the user's
call length is held at 70% of its fitted slope and bends flat past one
standard deviation (`HEIGHT_WEIGHT`, `HEIGHT_SOFTEN`), and the dunk ratings
are refitted to take up what it gives away: that 6'1" high flyer now dunks
8.7% of his drive finishes and 31.7% of the rest, the 7'6" giant 11.0% and
21.5%, a 7'0" big with big dunk ratings 19.3% and 38.1%. Held out of the fit
it misses a real player's rate by 4.18 points on drives and 8.02 on the rest
(4.02 and 7.96 fitted freely, 5.6 and 10.8 for the league's average). No
suggestion passes the real players' 99th percentile, 28.3% and 48.7%. A
typed value still wins, and `output/custom_tendencies.csv` lists every
custom's suggestion beside it; a real player with no stat line gets the same
fit. A blank the build has not filled - a custom without his attributes yet -
plays the league's average player.

**`tend_dunk_in_traffic` is gone.** It was never measured - a blend of
`shot_close` and the `dunk_in_traffic` rating - and the engine multiplied it
by that same rating again. A drive through moderate contact or worse now
dunks on the rating alone, times `DUNK_IN_TRAFFIC_LOOK` 0.50 - the
league's 50 a blank cell meant, which every player read once the Sheet
dropped the column.

**Still open.**

- **5.00 dunks a game against 5.47, with drive dunks at twice the league's
  count.** Both are the sim's rim attempts rather than the dunk: it has 25.5
  drive finishes inside 8 ft against 16.0, because a drive that goes up
  finishes at 1-4 ft (see *The recalibration*), and 2.6 catches in stride on
  the break against 5.5.
- **The bigs who live at the rim are still short** - Gobert 27.9% against 43.0,
  Mobley 17.1 against 25.3. Their dunk rates per finish are now theirs, so
  what is missing is the finishes: the lob, the putback and the catch in
  stride all run below the league's volume.

### Who rebounds, and who blocks

**Size was counted twice.** 2K builds its rebounding and block ratings from
real rebound and block rates, so a tall rim protector's 90 already carries
his height. The engine multiplied size in on top: a rebound weight of
`rating^1.5 × (height/78)^2.5 × (wingspan/82)^1.8`, and a block chance times
4% an inch of height over the shooter, 5% an inch of wingspan, and
`vertical / 70`.

Across 318 real players with 600+ minutes, the sheet's rating alone explains
log OREB% at R² 0.961, log DREB% at 0.984 and log blocks per 36 at 0.967.
Adding height, wingspan and vertical changes none of them in the third
decimal. Held against each player's real self, every inch of height was
worth 5.8% more rebounds than he really gets, and Vince Stephens - 6'7",
rated 100 on both ends - was 31st in the league on the boards.

**Rebounds are claims now.** Every man on the floor claims the miss at his
own real rate - the share of available rebounds a real player with his
rating takes on that end - and the board goes to one of the ten in
proportion. The offence's chance is its part of the ten claims, so there is
no team rate to tune, and a player's share comes out as his own rate
whoever he shares the floor with. The claim curve is anchored so the
league's mean claim is its measured rate, 4.5% offensive and 13.1%
defensive, which holds the offensive share of a miss at the real 26%.

**Blocks are the rating, the shot and the distance.** The curve is anchored
on the league's real mean block rating, 55.7 - it was 74 - and the
chase-down reads the same curve after its speed check. It used to give every
defender a flat 1.5% plus his block and his vertical, five rolls on every
missed drive: 43% of all blocks, 73% of those by men 6'4" and under. 21% now.

Each real player's sim rate against his real one, over a 1,560-game season:

| | slope before | now | r before | now | extra per inch of height, before | now |
|---|---|---|---|---|---|---|
| defensive rebounds | 1.16 | 0.98 | 0.92 | 0.96 | +5.8% | +1.3% |
| offensive rebounds | 0.77 | 0.98 | 0.93 | 0.95 | +5.7% | +1.6% |
| blocks | 0.78 | 0.99 | 0.86 | 0.94 | +1.0% | +0.8% |

| | before | now |
|---|---|---|
| Jalen Brunson, blocks against his real rate | 3.6× | 1.4× |
| Mitchell Robinson, offensive boards against his real rate | 0.59× | 0.91× |
| Vince Stephens, rebounds per 75 | 12.3, 31st | 16.6, 5th |

The league on real rosters, 240 games and the same seeds either side:
offensive rebounds 12.1 → 12.5, defensive 35.0 → 34.9, a 25.7% → 26.4%
offensive share against the NBA's 26.0%, and blocks 5.2 → 4.9 against 4.8.
Both rebound counts run 8-11% over the NBA mostly because there are about 2%
more misses to rebound. Points went 117.3 → 116.5 and FG% 47.4 → 47.2, both
inside noise; free throws 24.1 → 22.9 against 23.4 is a little more than
that, and was not traced.

**Found on the way.** `_weighted_select` floors every weight at 1.0. That
was harmless while rebound weights were in the hundreds, and would have
handed a claim of 0.04 the same chance as a claim of 0.30 - every player
on the floor equally likely to get the board. The rebound pick reads its
weights unfloored.

**Still open.** Height still enters the contest - the defender's height and
wingspan over the shooter's - and the rim-presence blend that shuts a dunk
window, at 15% of it. The contest is a matchup, the defender against this
shooter, which a player's rating cannot carry; the rim presence is a
smaller case of what was fixed here. Neither was measured.

### Who gets the assists

**A player's assists are four numbers multiplied together**: how much of the
ball he gets (touches), how often a touch ends in a pass, how often his pass
becomes a shot (stats.nba.com's `POTENTIAL_AST`), and how often that shot is
made and credited. All four are tracked for every real player, so each can be
checked on its own. Log of each player's rate in the sim against his real
one, 1,440 league games on real rosters, 109 players:

| slope, sim on real | before | now |
|---|---|---|
| passes per touch | 0.88 | 0.83 |
| **shots off his passes, per pass** | **0.25** | **0.66** |
| assists per shot off his passes | -0.02 | 0.07 |
| **assists per touch** | **0.59** | **0.88** |

The third link was flat, and should be: in the league's numbers the passer
has no bearing on whether a shot he set up is credited. The second is where
playmakers are made, and the sim had almost none of it. Across 300 real
players it follows `pass_vision` more closely than anything else on the sheet
(r = 0.77; drive frequency 0.68, P&R ball-handler share 0.66) - each point of
vision is 1.7% more shots per pass. **The sim gave vision 0.5% a point**, as a
flat 0.003 on the catch-and-shoot chance, and spent the rest of it on the
assist credit, where it multiplied by up to 1.8.

Now the passer's vision multiplies the receiver's first chance to shoot - the
catch-and-shoot and the first read on the catch - anchored at the league's
pass-weighted vision (63), and the credit is the shot's alone. See config's
THE PASSER MAKES THE SHOT. Assists a game, same games, real minutes:

| | before | now | real |
|---|---|---|---|
| Nikola Jokic | 8.4 | 10.0 | 10.7 |
| Josh Giddey | 8.2 | 9.4 | 9.1 |
| Luka Doncic | 7.1 | 9.0 | 8.3 |
| James Harden | 5.7 | 6.2 | 8.0 |
| LeBron James | 4.1 | 4.2 | 7.2 |
| Shai Gilgeous-Alexander | 3.0 | 3.7 | 6.6 |
| Cade Cunningham | 11.6 | 13.7 | 9.9 |
| Draymond Green | 5.7 | 5.3 | 5.5 |

The flat 0.003 had one more effect. An addition is worth far more to a rare
shot than a common one, and the rare catch-and-shoot was the long two: shots
from 16-24 ft ran 6.3% of attempts against the league's 4.9. As a multiple
they are 4.9. The catch scales were re-levelled to hold threes at 41.4%, and
the league otherwise did not move: 89.8 attempts, 48.4% FG, 28.1 assists and
64.6% assisted over 240 games.

#### What moves a player's assists

The sheet's 76ers put LeBron beside Maxey, Embiid and Jaylen Brown, and he
reads 5.2 a game there against a real 7.2 as a Laker. Each change alone, 290
games of that roster against the league:

| LeBron | assists | touches | passes |
|---|---|---|---|
| as he is: touches 64, vision 81, dominance 54 | 5.2 | 42.0 | 27.6 |
| `touches` 74 | 6.6 | 48.9 | 33.7 |
| `touches` 84 | 7.5 | 55.4 | 39.1 |
| `touches` 74 and `ball_dominance` 74 | 6.8 | 47.0 | 32.0 |
| `ball_dominance` 74 | 5.6 | 41.1 | 26.8 |
| `pass_vision` 91 | 5.7 | 41.7 | 28.1 |
| `pass_out_frequency` 65 | 5.3 | 42.2 | 27.7 |
| Maxey's `touches` 75 to 65 | 5.5 | 42.9 | 28.4 |

- **`touches` is the lever**, and it is a share: the ball goes to the five on
  the floor by the square of their touches, so a playmaker next to other
  high-touch players needs more of it than his real number to keep his real
  share.
- **`pass_vision`** decides how much each pass is worth - whether it finds a
  shot or a reset.
- **`ball_dominance`** is the third: a man who keeps it longer passes later
  in the clock, to a man who shoots rather than swings it on.
- **`pass_out_frequency` is not a playmaking dial.** It decides whether his
  own isolation or post-up ends in a pass, and nothing else.
- **`play_initiators` and `call_play`** in the team config are loaded and
  never read by the engine.

**The passing part of an archetype**, as the league's own players read (sheet
medians by role):

| role | touches | shot | ball_dominance | pass_vision | pass_out_frequency | drive_frequency | drive_and_kick |
|---|---|---|---|---|---|---|---|
| ball-dominant creator | 71 | 70 | 85 | 88 | 48 | 60 | 46 |
| pass-first guard | 86 | 58 | 78 | 86 | 62 | 65 | 62 |
| hub big (Jokic, Sabonis, Draymond) | 71 | 66 | 42 | 74 | 48 | 45 | 44 |
| scorer who passes | 63 | 80 | 90 | 75 | 46 | 70 | 46 |
| shoot-first scorer | 56 | 66 | 78 | 61 | 43 | 56 | 42 |
| spot-up / 3-and-D | 39 | 44 | 42 | 43 | 58 | 48 | 60 |
| rim runner | 42 | 32 | 32 | 33 | 38 | 22 | 32 |

The hub big is the one worth staring at. Jokic leads the league in assists on
`ball_dominance` 44 - he gets the ball a great deal (touches 88) and gives it
up in three seconds, and his 99 vision is what makes those three seconds
count. The ball-dominant creator does the opposite: fewer touches, each one
held twice as long. Both are playmakers; nothing about "how willing to pass"
tells them apart.

**Still open.**

- **The drivers' passes.** Gilgeous-Alexander, Morant and Jalen Williams still
  make shots of about three quarters of the passes they really do. Theirs come
  out of drives, and the sim drives 40 times a game against 66 - see *The
  recalibration*.
- **Team context is not a bug and reads like one.** Cunningham is the only
  creator on the sheet's Pistons and gets 16 a game over a season; LeBron is
  one of four on its 76ers.

### How long he keeps it, and what pass_willingness was

`pass_willingness` was passes per touch, and it could not do the job its name
promised. **A touch ends in a pass or in an attack, and the attack is rolled
first**, so the pass-or-hold split underneath it only ever decided *when* the
ball moved. Raising LeBron's from 46 to 61 moved his passes by 0.4 a game and
his assists by none.

It was not measuring playmaking either. Across 340 real players, passes per
touch is the other side of shooting - r = -0.81 against his own shots,
turnovers and free throws per touch - and r = 0.07 with assists. What does go
with assists is **how long he holds it**: seconds per touch, r = 0.73.

So the two jobs were split, and both now come from tracking data:

- **`ball_dominance`** = his real seconds per touch (`AVG_SEC_PER_TOUCH`),
  50 = the league's 3.5. It stretches the read on the catch and every hold by
  `(dominance / 58) ** 2`. The time only, never the number of reads - each
  read is a chance to attack, and more of them would hand a dominant man shots
  his `shot` tendency never asked for. Measured either side over a season, FGA
  still follows `shot` at 0.89 against 0.92 before, and touches follow
  `touches` at 0.90 against 0.94.
- **`pass_out_frequency`** = the share of his post touches and drives that
  ended in a pass, which is what the engine actually used the old tendency
  for: the isolation and the post-up that end in a pass instead of a shot.

The sim had almost no ball dominance in it: every player kept a touch 3 to 5
seconds, a slope of 0.16 against his real seconds per touch. Now, over 1,440
league games on real rosters:

| | before | now | real |
|---|---|---|---|
| Shai Gilgeous-Alexander | 4.3 | 6.2 | 7.0 |
| James Harden | 4.3 | 6.7 | 6.8 |
| Jalen Brunson | 4.5 | 6.9 | 6.9 |
| Jakob Poeltl | 3.5 | 2.1 | 1.7 |
| Isaiah Hartenstein | 3.3 | 2.0 | 1.7 |
| slope against real | 0.16 | **0.86** | 1.00 |

It carries passing with it, because a man who holds it longer passes later in
the clock, to a man who shoots rather than resets. That overlaps what the
passer's vision was already doing, so `PASS_VISION_SHOT_ELASTICITY` came down
from 0.024 to 0.017 - which is what keeps the sim's 1.6% a point of vision on
the league's own figure. Together: shots per pass go from a slope of 0.67
against each player's real rate to 0.74, and assists per touch from 0.89 to
0.99.

The league is where it was: 118.9 points, 102.6 possessions, 89.9 attempts,
63.6% of makes assisted. Two constants moved to keep it there - the pass
appetite is a flat 62 rather than a tendency plus a vision term, and
`ALLEY_OOP_BASE_CHANCE` 0.75 to 0.68, because `alley_oop_pass` is blended off
the new tendency and lobs had gone to 1.53 a game against the league's 1.39.

### Where his shots come from, and the diet he plays to

`shot_close`, `shot_mid_range` and `shot_3_pointer` are not weights. They are
the **exact split** of where a player's attempts came from last season, taken
straight off the shot-location tables by `share()`, and checked against the
source: over the 311 real players with 150+ attempts, the sheet is within
**0.3 points** of the real share on every one of the three. So the engine owes
him that split.

It was not paying it. Over 200 games the league landed on it — close 44.4%
against 40.9% asked — but individual players were **8.6 points out** on close
and 7.1 on the three, all in the same direction:

| | asked for | shot |
|---|---|---|
| Joel Embiid | 33 / 44 / 23 | 54 / 42 / **4** |
| Brandon Ingram | 23 / 49 / 28 | 44 / 49 / **7** |
| Edwin Reed | 62 / 19 / 19 | 81 / 16 / **3** |
| Kevin Durant | 15 / **52** / 33 | 33 / **36** / 31 |
| Jalen Brunson | 26 / 38 / 36 | 42 / 26 / 33 |

Nothing was wrong with the roll in `_select_shot`. The trouble is that **only
about a third of shots come from it**. Measured by gather: 25% of all shots
were driving and 100% of those were close, 36% were catch-and-shoot and 76% of
those were threes, 5% were cuts and 74% of those were close. A lob is a lob and
a putback is whatever the miss left. So a man's zone mix came out of *how* he
gets his shots — on the ball or off it — and not out of the mix he is supposed
to have. The ball-dominant players drowned in rim attempts; the spot-up players
in threes.

Three things were wrong, and they are fixed in that order.

**The floor never put him in mid-range.** `_assign_slots` sends the men whose
profile points at the arc out to the perimeter and hands the rest interior
slots *in list order* — dunker, dunker, elbow, elbow — and a team rarely has
more than two men inside, so the first one in always took a dunker spot
whatever kind of player he was. Over 120 games that left a player's mid-range
share with **no relationship at all** to how often he was standing in
mid-range: r = 0.03, every man in that band for about 8% of his shot decisions
whether he shot a quarter of his attempts from there or none of them. He now
takes the free spot nearest where his own rim-against-mid pull asks to be.

**The drive always got there.** Every drive that produced a shot produced a rim
attempt — 100% of 9,004 of them. The drive that is cut off at nine feet and
ends in a runner did not exist, and it is the same event as both halves of the
Durant and Brunson rows above: the close surplus and the mid deficit are one
missing shot. `_decide_drive_pull_up` adds it, on his own
`shot_mid_off_dribble` — real pull-up twos per touch then, the share of his
mid-range off the dribble since October 2026, read through the same chain — shaded by how
many helpers have arrived. It is read **after** the kick-out and from inside
ten feet: reading it first, at fourteen, cost 4.7 tracked drives and 2.3
assists a team a game, because the drives it took were the ones that were about
to become passes.

**And the shares are a diet, not a roll.** The floor decides what each look is;
he decides which looks to take. Every shot is counted by zone, and his appetite
for a zone is what he wanted there over what the night has given him, so a game
full of rim attempts makes the next catch at the arc the one he shoots. It is
applied where he chooses — the zone roll and the catch-and-shoot gate — and
never where the play has already decided, because a cutter cannot pull up from
the elbow because his diet says so. See config's *THE SHOT DIET* for the
exponent, which is a swept number and not a guess.

Per player, over 120 games, against his own sheet:

| zone | mean abs error | slope | r |
|---|---|---|---|
| close | 8.6 → **4.1** | 0.89 → 0.89 | 0.86 → **0.96** |
| mid | 5.1 → **2.7** | 0.77 → **0.88** | 0.81 → **0.96** |
| three | 7.1 → **3.7** | 1.05 → **0.97** | 0.90 → **0.96** |

The league moved with it: close 47.5% → **42.0%** against a real 40.3%, mid
15.3% → 21.4% against 17.1%, and points 119.1 → 117.1 against 115.0, FG% 48.5%
→ 47.5% against 47.1%. Drives are untouched at 38.5, assists 26.3 → 25.8.

**The mid row is the honest one, and it is not this.** Ask the question
separately — *what would the league shoot if every man shot exactly his own
sheet mix, with the sim's own distribution of attempts?* — and the answer is
close 41.7 / mid 20.0 / three 38.3, not the real league's 40.4 / 16.8 / 42.8.
Three points of mid and three of three are **already lost before the zone roll
is reached**, because the sim gives too many of its attempts to mid-range
players and too few to shooters. Against *that* target the engine is now 0.4
under on close, 1.2 over on mid and 0.9 under on the three. The rest is a usage
problem, and it belongs with the drive and bench-minutes work below rather than
here.

**Measured again in October 2026** it had drifted back - every man's close
share 3.4 points over his own, the most for the men who want the rim least -
because the shots the diet never sees had grown: the drive, which ended at
the rim, the break and the cut. The diet speaks at all three now, and counts
its zones by the Sheet's own 8 ft line. See *Each man's shot mix, and where
the extra rim shots came from*.

### Read the drive row carefully: it used to say something else

This file quoted 46.8 drives against 68.7 and called the gap a third. Both
halves were wrong. `bench.py` now reports **the NBA's own definition** — a
touch that starts at least 20 ft from the hoop and is dribbled to within 10 ft
of it, fast breaks excluded — because that is what the 66.1 counts and the
engine's own word for a drive is much wider. Measured both ways at once, 50.5
engine drives a game contained 37.2 that a tracker would have counted.

So the real gap was never a third; it was closer to four fifths, and every
previous attempt to close it was aiming at a number that had already been
flattered. `stat_tracker` keeps both counts; `events.is_tracked_drive` is the
one definition of the narrower one.

Per-zone, against 84 real players measured on their own real selves:

| zone | sim share | real | sim FG% | real |
|---|---|---|---|---|
| under 8 ft | 41.3% | 39.8% | 58.4% | 61.0% |
| 8–16 ft | 12.5% | 15.8% | **38.8%** | 45.6% |
| 16–24 ft | 7.7% | 6.0% | 45.2% | 41.8% |
| 24+ ft | 38.5% | 38.4% | 35.2% | 36.3% |

### Why the half-court drive is short

Diagnosed September 2026, on real rosters, with the engine unchanged - every
experiment below patched it in memory.

**The engine starts about as many drives as the NBA.** 61 a team game against
66.1. But 18 of them come while the possession is flagged transition, and the
NBA's count leaves fast breaks out; 13 of those 18 start within three seconds
of the possession, so the exclusion is honest. Another 3 start inside 20 ft.
That leaves **40 half-court drives against 66**.

**It is not the touches.** The sim has more of them per possession than the
NBA, 2.3 first reads against 2.05 front-court touches. What it does with a
perimeter touch is the difference: 0.23 drives per touch from 20 ft or more
against the NBA's 0.40 per perimeter front-court touch (`track_possessions`,
`track_drives`). Of 317 reads a team game, 119 pass straight on, 85 hold and
survey, and 45 drive.

**The sim's drive is a rim attack, not a probe.** That is why every attempt to
raise the count failed:

| per team game | sim, 40 tracked drives | NBA, 66 |
|---|---|---|
| drives ending in his shot / in a pass | 49% / 38% | 41% / 44% |
| layups and dunks off drives, every drive incl. the break | **23.6** | **12.2** |
| floaters and hooks off drives | **0** | **7.4** |

The NBA column is the full 2025-26 shot chart by `ACTION_TYPE`: 19.6
"Driving" shots a team game, 12.2 of them layups, finger rolls, reverses and
dunks, 6.5 floaters and 0.9 hooks. (The 16.0 quoted under *Who dunks* is
every "Driving" shot inside 8 ft, floaters included.)

Forty drives produced twice the NBA's layups and dunks off sixty-six. The
reason was in `_tick_driving`: every drive that went up was carried to
`uniform(1.0, 4.0)` ft, and the floater branches in the finish ask for more
than 4 or 5 ft, so they could not fire. A drive either finished at the rim or
pulled up at 8-10 ft (`_decide_drive_pull_up`); the zone between them, where
38% of the NBA's drive shots are taken, did not exist for it.

**What each lever does**, 80 real-roster games apiece, same seeds:

| | base | drive appetite x1.6 | + kick bias 6 | drive in place of 30% of read passes, + kick bias | NBA |
|---|---|---|---|---|---|
| tracked drives | 40.1 | 44.3 | 45.6 | 58.9 | 66.1 |
| drives: shot / pass | 49 / 38% | 49 / 38% | 45 / 42% | 46 / 42% | 41 / 44% |
| points | 116.5 | 117.7 | 116.7 | 121.6 | 115.0 |
| possessions | 101.1 | 103.4 | 102.4 | 106.3 | 101.3 |
| shots inside 8 ft | 41.6% | 42.9% | 42.5% | 44.5% | 40.3% |
| shots from three | 38.4% | 37.7% | 38.0% | 35.4% | 42.6% |
| makes assisted | 60.7% | 61.0% | 61.5% | 55.8% | 63.8% |

Appetite barely moves it - the drive already wins 41% of the attack roll. The
kick bias puts the split near the NBA's and moves nothing else. Driving in
place of the pass reaches 59, and it is the failure recorded under *The
touch*: pace, points and rim share up, threes and assists down.

**The order a fix has to go in:** let a drive stop short - into a floater or
runner from 5-9 ft - so its shots split like the NBA's; bring the kick share
to 44%; and only then raise drives per touch, with a drive and kick replacing
a direct pass. The pace in the last column also says a drive and kick takes
less time than the hold and swing it replaced, and that wants checking first.

**Step one is done: a drive can stop short.** It decides as it begins
whether it is going all the way or stopping to float it, on his
`tend_floater`, and one that stops is carried to 5-10 ft and floats it. A
break always goes all the way - the NBA's are the "Running" layups and
dunks. See config's WHERE A DRIVE STOPS.

`tend_floater` is each player's real share now: of the "Driving" shots in
his own shot chart, how many were floaters or hooks - Immanuel Quickley 96,
Giannis 10, where the old blend had Giannis at 64. See *Floaters* in
`ratings_build/README.md`. The engine reads it in proportion, so each man
stops as often as he really does. Over 100 real-roster games, half-court
drive finishes are 60% layups and dunks and 40% floaters against the NBA's
62% and 38% - the sim's drives lean on the guards who float most - and the
floaters go in 38% of the time against 43-50%.

On its own it moves the league away from the NBA, which is what the
diagnosis says it should. Each drive now finishes like the NBA's, but there
are still 40 of them, so the rim attempts the old drives were inflated to
cover are gone: over 240 games, points 116.3 -> 113.4, FG% 47.7% -> 46.6%,
shots inside 8 ft 41.0% -> 38.9% against 40.3%, and 8-22 ft 20.4% -> 22.7%
against 17.1% - 2.5 floaters a game from 8 ft and out, on top of the
mid-range surplus *Known problems* already puts down to usage.

With it in place, the same levers again, 80 games each:

| | step one | + kick bias 6 | + drive for 30% of read passes | + for 45% | NBA |
|---|---|---|---|---|---|
| tracked drives | 40.2 | 41.6 | 59.6 | **67.4** | 66.1 |
| shots inside 8 ft | 38.6% | 37.9% | 41.8% | 43.3% | 40.3% |
| possessions | 101.1 | 101.2 | 107.5 | **107.9** | 101.3 |
| points | 115.1 | 112.7 | 119.7 | 121.3 | 115.0 |
| shots from three | 39.2% | 39.1% | 35.0% | **33.5%** | 42.6% |
| makes assisted | 62.1% | 62.4% | 56.8% | 54.7% | 63.8% |

The NBA's drive count is reachable now with the rim share three points high,
where before this change the same lever put it four high at 59 drives. What
still breaks is time and the three: a drive and kick that replaces a hold and
swing takes less of the clock, so pace jumps six or seven possessions, and
fewer swings mean fewer catch-and-shoot threes. That is the next thing.

**Step two is done: a drive kicks it out as often as the NBA's.**
`DRIVE_KICK_BIAS` 0 -> 10 takes tracked drives from 38% ending in a pass to
44.0% against the NBA's 43.9%. Over 240 games on real rosters: makes
assisted 62.0% -> 63.7% against 63.8%, threes 38.6% -> 39.2%, shots inside
8 ft 38.6% -> 37.8% against 40.3%, points 114.4 -> 113.2. The drive's shot
share stops at 45% rather than 41% because its fouls run 6-7% against 8.6%.
The same in-between state as step one: each drive now ends like the NBA's,
and there are still 42 of them.

**Step three is not one change.** Measured in memory, 100 games each, with
the kick in place:

| drives in place of... | drives | possessions | shots from three | makes assisted | inside 8 ft |
|---|---|---|---|---|---|
| nothing (step two) | 42.1 | 100.8 | 39.5% | 63.9% | 37.7% |
| 45% of the read's passes, by `drive_frequency` | 68.0 | 108.2 | 34.2% | 55.3% | 42.9% |
| the same, catch reads 1.5 -> 2.25 s | 63.3 | **102.0** | 33.8% | 53.5% | 43.1% |
| 50% of the read's holds | 65.1 | 110.1 | 36.0% | 58.6% | 41.4% |
| the attack roll's "shoot", from 20 ft+ | 45.3 | 100.5 | 38.2% | 65.0% | 39.2% |
| both of those and 15% of passes | 54.9 | 103.1 | 36.5% | 61.6% | 40.7% |

Time can be put back: longer catch reads restore the pace and put the shot
clock on the NBA's own distribution (15-7 s 52.5% against 47.8%, 4-0 7.5%
against 8.0%). What cannot be had yet is the three. Drives that replace
passes replace swings, and each swing was a chance at a catch-and-shoot
three - 24.6 a game falls to 21.1 against the NBA's 26.3 - while the
kick-out receiver is not the leak: he takes the catch-and-shoot three 24% of
the time, re-drives 5-7%, and removing the closeout's drive bonus changes
nothing. The NBA fits more drives *and* its swings into a possession. (This
said the NBA's touches last about four seconds against the sim's two and a
bit. They do not: 3.84 seconds a touch against 3.85 - see *Touch length, who
shoots, and where the mid-range comes from*.)

**Tried: a drive that resets.** Every pass out of a drive is a kick-out -
`kick_out=True`, a closeout on the catch, the collapse's openness - and there
is no "that went nowhere, swing it back". Made a reset whenever nobody had
helped (27% of drive passes), it changed nothing that matters: with drives
in place of 45% of passes, 106.7 possessions against 108.2 without it, threes
33.2% against 34.2%. Nor were the kicks over-producing: 20.2% of drive passes
become assists against the NBA's 21.9% (`DRIVE_AST` / `DRIVE_PASSES`).

What every variant shares is shots per possession, 0.88 whatever happens
before the shot. A drive ends in a shot 44% of the time, so one added on top
of the shots already there ends possessions sooner. For drives to rise, shots
have to become drive shots - and the sim takes 6.9 mid-range pull-ups a team
game with no drive at all, from wherever the handler stood, most often 10-20
ft where a drive would not count anyway. Its pull-up-style twos come to 15.1
against the NBA's 11.0 pull-up twos (`track_pullupshot`), and its mid-range
to 20.4 attempts against 15.2. That is the next place to look.

### Touch length, who shoots, and where the mid-range comes from

Diagnosed September 2026, on real rosters, engine unchanged. The question was
whether the drive, the three and the mid-range gaps share one root in how
long touches last or in who gets the ball. Neither is it.

**Touch length is right.** 3.84 seconds a touch, bring-up included, against
the NBA's 3.85 (`TIME_OF_POSS` over `TOUCHES`). Per real player, 264 of them
over 160 games: slope 0.86 on his real seconds per touch, r 0.90, median
0.96 of it. Touches per player run 0.72 of the real count for everyone
alike - the NBA counts the inbounder and the backcourt, which the sim does
not model as touches.

**Who shoots is right.** Attempts per player: slope 0.84 on his real rate,
r 0.81, median 0.97. Each ten points of mid-range share on his sheet go with
3% *fewer* attempts than his real self, not more. If every man shot his own
sheet mix, the sim's attempts would make the league 19.1% mid and 40.9% three
and his real attempts 19.4% and 40.5%. Across all 378 real players the
sheet's shares, weighted by real attempts, come to 40.2 / 18.4 / 41.4 - a
point from `bench.py`'s reference, which counts the zones slightly
differently. So the sim's own target is about 18.4% mid-range, and it takes
21-23%.

**The surplus comes from the shots that never ask his mix.** The zone roll
and the catch-and-shoot gate read a player's shares and his diet; nothing
else does. Every shot traced to the decisions that made it, 60 games:

| mid-range, per team game | |
|---|---|
| a drive's floater stopping 8-10 ft out | 4.1 |
| a drive's pull-up, half court / on the break | 2.3 / 1.0 |
| the read's own shot, half court / **on the break** | 1.8 / **1.6** |
| the pick-and-roll handler's shot | 1.6 |
| catch-and-shoot long twos, just inside the arc | 1.6 |
| **a cut** | **1.3** |
| isolation, post-up | 1.1, 1.1 |
| forced, clock running out | 1.4 |

A man whose sheet says under 10% mid-range takes 12% of his attempts there -
twice his share - and most of it is the drive's floater and pull-up, the long
catch-and-shoot two, the post finish and the cut, none of which consult him.
Two are wrong outright. **A cut was placed 3-8 ft out and then handed a zone
by his shares**, which could make it a 15-footer he never moved to: 1.3 a
game. **The break pulls up from mid-range 2.6 times a game**, where the
modern NBA's breaks end at the rim or the arc.

**Fixed: a cut is a finish.** It goes through the same close-range finish
the catch-and-finish uses, on the cut's own dunk context. 4.5 cut shots a
team game, all inside 8 ft and made 70%: 2.2 layups and 1.2 dunks against
the NBA's 2.4 and 1.3 "Cutting" shots (99% inside 7 ft), and 1.2 short
floaters and jumpers of the kind Synergy's 5.6 cut attempts also carry.
240 games on real rosters: 8-22 ft 22.9% -> 22.2%, inside 8 ft 37.8% ->
38.5%, FG% 46.4 -> 46.7, and free throws 22.2 -> 21.2 - a little more than
noise, not traced.

**Fixed: the break ends at the rim or the arc.** Synergy's transition shots,
14.2 a team game, make 54.3% at an eFG of 61.5% - about 40% threes, twos
going in 66.5% with room for about one mid-range shot - and the shot chart's
"Running" jumpers are 74-87% threes. The sim's break took 3.3 mid-range
shots and 3.2 threes: its shot was a zone roll on half-court shares, and a
break drive could still pull up at 8-10 ft though it could no longer float
it. A break drive now goes all the way; the break's shot is never
mid-range, and from behind the arc it is a pull-up from where he is,
weighted up because drive outweighed it five to one once the half-court
plays are off the table (`TRANSITION_SHOOT_MULT`, swept). Break shots now:
rim 9.2, mid 0.6, three 5.3 against about 7.4, 1 and 5.7 - the rim is high
because the sim's breaks make 15.0 attempts to the NBA's 14.2. Over 240
games: 8-22 ft 22.2% -> 20.6%, threes 39.0% -> 40.3% (35.5 attempts
against 36.8), inside 8 ft 38.8% -> 39.1%, points 111.6 -> 111.4.

**And the pick-and-roll ignores the man with the ball.** After an effective
screen every handler drives 35%, shoots 30% and passes 35%
(`SCREEN_EFF_DRIVE_PROB`, `SCREEN_EFF_SHOOT_PROB`); after one that fails, 30%
take a contested shot anyway. 25.3 screens a team game make 4.5 drives and
4.0 contested shots off screens that did not work. The pick-and-roll is
where most of the NBA's drives come from.

**Fixed: the handler reads the screen.** Off one that worked he weighs his
`drive_frequency` against his pull-up rate from where he stands - the way
the isolation already did - each against the league's 50, so a man at the
league's rates keeps 35 / 30 / 35. Handlers under 40 drive 31% of the time
and pass 53%; over 60 they drive 39% and pull up 31%. The spread is modest
because the league's best drivers are also its busiest pull-up shooters.
(It read `drive_frequency` then; it reads `drive_off_screen` now - see *The
pick-and-roll*.) A screen that failed
sends him back to read the floor - no more contested shot, 4.0 a game gone.
Over 240 games on real rosters: attempts 89.4 -> 87.9, turnovers 14.5 ->
14.8, makes assisted 63.9% -> 65.0%, points 112.9 -> 111.6, the zone mix
unchanged. Tracked drives stay at 41: the split is his now, and the count is
the next job.

**What that means for the drive.** Shots per possession hold at 0.88 whatever
comes before them, so drives rise only by becoming other shots. The ones that
should become drives are the ones that do not ask who has the ball: the
pick-and-roll's flat choice and its contested shot off a failed screen. The
cut and the break pull-up are separate, smaller fixes.

### The drive, with the plays fixed

With the floater, the kick, the cut, the pick-and-roll read and the break in
place, the levers again - 100 real-roster games each:

| | tracked drives | points | threes | makes assisted | inside 8 ft |
|---|---|---|---|---|---|
| as it stood | 41.7 | 112.0 | 40.3% | 64.5% | 39.1% |
| pick-and-roll turns the corner 60% | 43.3 | 111.8 | 39.5% | 63.6% | 39.5% |
| more screens called, x1.6 | **38.4** | 110.3 | 40.4% | 64.3% | 39.1% |
| attack the closeout, x6 | 43.2 | 112.3 | 40.0% | 65.0% | 39.2% |
| drive weighted over the pull-up | 45.5 | 114.2 | 38.9% | 64.5% | 41.0% |
| drive for 30% of passes, reads x1.3 | 56.7 | 112.4 | 36.5% | 58.7% | 42.4% |

Stacked, the small ones reach about 50 with the league mostly in shape, but
by constants chosen for the count rather than for anything they measure. So
each was anchored on its own number instead:

- **`PLAY_WEIGHT_SHOOT` 0.45 -> 0.315**, on the pull-up three: 10.9 a team game
  against the NBA's 9.8, now 9.6.
- **`SCREEN_QUALITY_BASE` 0.50 -> 0.70**, on Synergy's pick-and-roll: the
  handler's attempts 6.3 -> 7.3 against 12.2, the roll man's 1.4 -> 2.1
  against 4.3. 0.85 reads the same.

240 games on real rosters: points 111.4 -> 113.2, FG% 46.4 -> 46.9, inside
8 ft 39.1% -> 40.1% against 40.3%, threes 40.3% -> 39.4%, **tracked drives
42.1**.

**What that says.** More screens mean *fewer* drives, because calling a
screen is an alternative to driving in the attack roll, and a screen becomes
a drive about one time in six. In the NBA the pick-and-roll is mostly how a
handler drives, and it is where the sim is furthest short - 7.3 handler
attempts against 12.2 however good the screens are. The drive count waits on
the pick-and-roll being rebuilt as the way the handler attacks, not as one
option beside it.

### The box score, kind by kind

With the drive count left where it is, the rest of the box score was set
against the league - and where possible against the league's own split of
each number, not its total. pbpstats publishes 2025-26 by kind: shooting
fouls two-point and three, and-ones, loose-ball and offensive fouls, penalty
trips, technical free throws, dead-ball turnovers by type, team rebounds, and
possessions counted from the play-by-play. So each engine source was set on
its own number, per team game:

| | before | now | NBA |
|---|---|---|---|
| technicals | 2.28 | 0.44 | 0.44 |
| offensive fouls, not charges | 0 as fouls (1.5 as turnovers) | 1.22 | 1.16 |
| shooting fouls | 8.65 | 10.3 | 10.42 |
| and-ones | 0.90 | 2.29 | 2.38 |
| non-shooting fouls | 3.64 | 6.5 | 6.54 |
| loose-ball fouls | 1.99 | 1.41 | 1.42 |
| turnovers | 14.5 | 13.7-14.0 | 13.73 |
| boards the offence keeps | 26.3% | 29.7% | 30.2% |

What each took:

- **Technicals** ran at five times the league, every one shot by the best
  free-throw shooter on the floor, and counted in PF, which the NBA's box
  score does not. That was two phantom free throws a game and a point of FT%.
  Who picks them up is becoming each man's real rate:
  `technical_foul_tendency` comes from TeamRankings through the pull (see
  *Technical fouls* in `ratings_build/README.md`), 50 times his multiple of
  the league's rate, which `_tech_multiple` reads back as tendency / 50.
  With that in, the rates aim at players' technicals alone - 0.265 a team
  game in 2025-26 - since the defensive three seconds and the bench and
  coach technicals in the 0.44 are not modelled yet. On the real tendencies
  the old rate called 0.56; both rates were cut by 0.473, and 240 league
  games read 0.270. FT% went 78.7 to 78.1 against the league's 78.3, the
  best shooter on the floor taking half as many technical free throws.
- **The drive's and post-up's dead-ball turnovers** called half of themselves
  offensive fouls by a coin flip, with no foul behind them. They are a real
  `OFFENSIVE` foul now at the share that puts non-charge offensive fouls on
  the league's, and none of the offensive fouls - that, the charge, the
  illegal screen - is a team foul any more (NBA Rule 12B). Charging them had
  brought the penalty on early.
- **And-ones** can only come from the shot's own foul roll - the drive's
  contact in the paint, the failed charge, the iso and the post-up all foul
  before the shot - so that roll carries all 2.38: 40% of its fouls go in.
  The three keeps its own multiplier on 0.50.
- **The common foul away from the shot** - the hold on a cutter, the grab
  through a screen - never existed; every foul the engine called followed
  the ball, and bigs fouled at 72% of their real rate. It is a per-tick roll
  in the phases with no contact foul of their own, committed in proportion to
  `foul_tendency`, which is real fouls per 36 read as a ratio. Fouls per 36 by
  height now run 1.07 / 0.98 / 0.98 / 0.92 of real, from 0.92 to 0.72, and
  the per-player correlation is 0.79.
- **Team rebounds.** The NBA credits 11.6% of rebounded misses to a team -
  out of bounds off a hand or a block - and the sim gave every one to a man.
  They go out at that rate, back to the offence 56% of the time as a sideline
  inbound on 14 seconds. **Missed free throws** were never rebounded at all;
  they are, the offence taking its 13%.
- **Blocks** had drifted to 4.3 and the slope of sim on real to 0.91 as the
  rim changed hands; the exponent went 2.75 -> 3.0 and the slope is 0.99.

Found on the way and fixed: **a loose-ball foul on a defensive rebounder in
the bonus scored his free throws for the other team** and then gave his
team the ball too - 15 of 60 final scores disagreed with the box score. And
the take foul was two shots, the rule before 2022-23; it is one.

**Where the mid-range is.** Bucketed by distance against the full 2025-26
shot chart, per team game:

| | 0-3 ft | 4-7 | 8-13 | 14-22 | 23+ |
|---|---|---|---|---|---|
| sim | 26.6 | 9.8 | 11.3 | 13.3 | 27.0 |
| NBA | 25.3 | 10.4 | 9.8 | 9.4 | 34.2 |

Floaters from 8-13 ft (4.0 against about 3.8) and long twos (5.4 against
about 5) are on the league. The surplus is **jumpers from 8-13 ft, 7.4
against about 5.3**, spread thin over nine paths - the drive's pull-up 1.5,
the read's shot 1.3, the post-up's jumper 1.2, the screen 0.8 and on down -
and the shortfall is **catch-and-shoot threes, 23.4 against 26.4** (NBA
tracking), with too many of them from 22 ft. No one constant moves it.

**Where possessions went.** The sim's first trips take 13.5 seconds and its
second chances 8.0; pbpstats' split puts the league's at 13.9 and about 4-5
after an offensive board. A miss that is not put back runs a whole half-court
set again rather than the scramble that follows a real one, so the right
number of second chances cost 1.3 possessions a game.

**The scramble** (`bd20880`): with the board in his hands under the rim, the
rebounder gathers in 0.4 s instead of the 1.5-second catch read, never
holds, and his pass out is a kick-out onto a defence still getting back - a
live closeout. A second chance is 3.7 s of play, 4.6 s from a player's board
to the end of the trip and 8.0 from a team rebound's sideline inbound, 5.3
together against the league's 4.2; the rest is the kick-out's receiver, who
can still reset into a set. Putbacks held on 4.2 with PUTBACK_ATTACK_MULT
1.8 -> 2.1. Possessions 98.7 -> **100.0**, threes 34.9 -> 36.0, points 114.6
-> 116.3. The shot clock after an offensive rebound was already 14, and no
tick of any second chance has ever read above it.

### Two tendencies: one read wrong, one not read at all

(`attempt_draw_foul_on_drive` has since been retired: `draw_foul` became the
foul chance itself - see "Fitting ratings to the real players".)

**`attempt_draw_foul_on_drive` is `DRIVE_PF_PCT`** - the share of a man's
own drives that drew a foul, which is the measurement itself. The engine
barely used it. The drive's foul was a per-tick roll of
`0.25 + draw_foul * 0.40 + draw_tend * 0.20`, where 2K's rating - built from
the same behaviour - carried twice the weight of the measurement, and the
sum was then multiplied by his `driving_aggressiveness` and again by the
contact that aggression had just rolled. The foul on the finish was a second
channel on top, scaled by the rating once more at 7% a point.

So the spread came from strength, not from the measurement:

| | real | sim, before |
|---|---|---|
| LeBron James | 9.3% | 22.3% |
| Wembanyama | 14.7% | 32.4% |
| Jamal Shead | 4.7% | 0.7% |

Slope 1.00 on a correlation of 0.53: the right average, the wrong men.

It is now **one roll a drive, as it sets off**, at his measured rate - which
is the NBA's own denominator - times his defender's foul rate.
`DRIVE_FOUL_SHOOTING_SHARE` decides whether the whistle comes on the shot,
where the ball can still go in for the and-one, or before he goes up with
it. A drive that passes out of it is fouled as he passes if the whistle was
coming early, and not fouled at all if it was coming on the shot: the pass
beat the contact. And no shot taken on a drive rolls a foul of its own.
Each real player's rate now sits on his own at **r 0.75-0.81**.

Three things were learned setting the level. Per tick was opportunity, not
rate - a drive that went all the way and sat in the paint got four reads
where one that stopped for a floater got none, which is why the bigs ran at
twice their real rate. The NBA's denominator is *every* drive, so rolling it
in the paint measured only the drives that got there without kicking out,
and that is a bigger share of a big man's drives than of a guard's. And the
rate cannot match the league's 8.6% a drive *and* the league's free throws:
the engine is 22 tracked drives a game short and its other fouls are about
2.6 short as well - the NBA draws them on cuts, putbacks and post-ups at
12-15% of plays (Synergy's `SF_POSS_PCT`), which the engine has never been
set against. Holding the box score wins, as it does for drive turnovers:
10.7% of tracked drives draw one against the league's 8.6%.

**Shrunk toward the league for small samples, September 2026.** Read raw, a
big with one or two drives read whatever those drives did: Zach Edey was the
league's top foul-drawer at 125 on the Sheet, Ryan Kalkbrenner second at 120
on no drives at all, and the bottom of the column was bigs at 0. It is a
shrunk ratio now like the others, with the fouls rebuilt from `DRIVE_PF_PCT`
(three decimals) rather than `DRIVE_PF` (per game, to a tenth), and a prior
of 87 drives the season estimates. On the engine's scale Edey went from 322
to 52 - the league's rate, which is all two drives can say - Gobert from 89
to 70 on his 76, and a volume driver barely moved (Gilgeous-Alexander,
Harden, Edwards, Doncic within a point or two). The league mean it is anchored on dropped from
8.69% to 8.45%, so `DRIVE_FOUL_DRAW_BASE` came down 3% to keep every real
player's rate where it was. And the column's `tendency_scale` top, fitted on
the raw spread, came down from 173 to 87.2, refitted on the 376 NBA players
with a drive line; the whole column was re-encoded on it, customs included,
so each custom's number changed and what he plays did not (within 0.7%, the
rounding of a whole number). On the new scale Towns reads 120, Embiid 100,
Giannis 98, Doncic and Edwards 87, Gilgeous-Alexander 68.

**`pressure_ball_handler` was read by nothing at all.** The on-ball defender
played the same 2-4 ft off whoever he was, and a drive went past him at the
same 1-3 ft whoever he was. It is his deflections per 36 against the
league's - hands in the ball, the closest thing published to how close a man
plays the one with it.

It now buys a trade. Pressing up closes the cushion, so every shot that man
takes over him is contested tighter; and it costs the step when he does go,
through a blow-by roll as the drive sets off. What the defender is worth on
the ball pays part of that back, and a beaten man trails 3-5.5 ft behind
instead of 0.5-1.8, so he contests the finish with nothing and cannot step
in front to take a charge. Over 240 games, 231 defenders:

| | beaten on drives | opponent FG% |
|---|---|---|
| presses hard, good defender | 27.2% | 44.8% |
| presses hard, poor defender | 31.0% | 48.4% |
| plays off, good defender | 25.0% | 45.5% |
| plays off, poor defender | 28.4% | 47.3% |

It also costs both men wind. Fatigue was charged by what the ball handler
was doing - driving, posting, standing - and by nothing about the man on
him; keeping it against somebody in your chest is work, and so is being the
one in his chest, so both now scale with the pressure. Standing with the
ball, with his own stamina taken out of it, a handler drains 14.4 a tick
against a man who presses hard and 12.6 against one who plays off.

Pressing costs blow-bys; a good defender who presses is still beaten less
often than a poor one playing off; and pressing pays for the good defender
while it costs the poor one, who is better off sitting back. The base and
both trails are set so a league-average defender against a league-average
handler plays the cushion and trails at the distance he always did, so the
league's shooting does not move - only who concedes it.

### What a play is worth in fouls

One foul rate covered every shot, so where a foul came from was whatever the
shot type and the shooter's rating happened to give. Synergy publishes the
share of each play type's possessions that end in a shooting foul
(`SF_POSS_PCT`), which is the measurement that was never used:

| | before | now | NBA |
|---|---|---|---|
| spot-up | 2.5% | 4.4% | 5.0% |
| cut | 9.0% | 13.8% | 15.4% |
| putback | 7.5% | 12.1% | 11.9% |
| roll man | 7.9% | 9.1% | 10.9% |
| handoff | 7.5% | 6.2% | 8.5% |
| off screen | 6.5% | 6.4% | 7.1% |
| transition | 11.3% | 10.9% | 11.8% |
| P&R handler | 11.2% | 9.7% | 9.3% |
| isolation | 19.4% | 15.7% | 13.0% |
| post-up | 20.5% | 12.9% | 14.1% |

The pattern was the same one twice over: the plays that end with a man going
up inside against a defence already moving - the cut, the putback, the roll -
drew half the fouls they should, and the two where a man works on his own
drew half again too many. `PLAYTYPE_FOUL_MULT` carries the ratios on the
shot's own foul roll, and because the isolation and the post-up also draw
fouls per tick before the shot, those rates came down with them.

**The pick-and-roll handler fixed itself.** His fouls are his drives, and the
drive's own rate had been inflated to hold the league's free throws up by
itself - 10.7% of tracked drives against the league's 8.6%. With the other
plays carrying their share it came down to 9.7%, and the handler's rate with
it, from 11.2% to 9.7% against Synergy's 9.3%. Two anchors that had been
fighting each other now agree, which is the sign the fouls are landing in the
right places rather than being made up somewhere convenient.

### Where the free throws went, and the break

**The free throws were 23.4 a team game in September and 20.5 by October**,
and no one change took them. Measured on 240 real-roster games a commit,
each on its own sheet: 23.1-23.9 from the play-type foul pass to
`02bcc70`, 22.4 after the usage fix (`c4f08b6`), 22.0 after the tendency
round (`7a33923`), 20.0 after the volume clamp (`c7e354b`) - whose elbow
pull-up could not be fouled until `9fbef84` - and 20.5 after it. Each moved
shots away from what draws fouls, and the drive's own rate, which had been
raised to hold the total twice in September, was not raised again.

**Split the way pbpstats splits them**, nearly all of what was missing was
two-shot trips - 6.33 a team game against 7.62 - and **by play against
Synergy one play carried most of it: transition**, with the right number of
possessions (21.2 against 21.0) drawing shooting fouls on 5.9 of every 100
against 11.9. The foul rate on its shots was fine. Its shots were not:

| on the break, a team game | September | October | now | Synergy |
|---|---|---|---|---|
| threes | 4.4 | 11.1 | 6.8 | 6.6 (2.39 made) |
| shots inside 8 ft | | 6.2 | 9.2 | about 8.8 |
| FG% | | 48.3% | 54.3% | 54.1% |
| shooting fouls per 100 plays | 11.7 | 5.9 | 12.2 | 11.9 |
| free-throw trips per 100 plays | | 7.6 | 13.2 | 12.9 |

The gravity and spacing work of late September opened the break's catches,
and a break drive passed out 57% of the time - more than the half-court
drive's 44%, which is the NBA's own: the break compresses everyone toward
the rim, and the defenders getting back read as help in the paint. Three of
the break's shots in five were threes, and almost none of its finishes came
off a pass. Four things went back:

- **The break drive's pass-out read** is taken down on the break
  (`TRANSITION_KICK_MULT` 0.3): it passes out 20% of the time.
- **The break's own pull-up** comes down with it (`TRANSITION_SHOOT_MULT`
  5.0 -> 2.0). Together, 300 games swept: 6.9 threes and 9.9 inside 8 ft.
- **A drive on the break has its own whistle** (`DRIVE_FOUL_DRAW_BASE_BREAK`
  0.28). It read the short drives' rate, "no measurement covers them" -
  Synergy's transition plays are that measurement, and 0.28 is its 11.9.
- **The three and the and-one**, set again on their own pbpstats counts:
  `THREE_POINT_FOUL_MULT` 0.58 -> 0.41 (0.77 fouled threes a team game
  against 0.50) and `SHOOTING_FOUL_DISRUPTION` 0.53 -> 0.59 (2.74 and-ones,
  27% of shooting fouls, against 2.36 and 23%). The disruption was set when
  only the shot's own roll could make an and-one; the drive's whistle on the
  shot comes through it too now.

600 real-roster games on the same seeds, a team game:

| | before | now | NBA |
|---|---|---|---|
| **free throw attempts** | **20.57** | **22.45** | **23.37** |
| two-shot trips | 6.33 | 7.41 | 7.62 |
| three-shot trips | 0.66 | 0.42 | 0.40 |
| and-ones | 2.33 | 2.31 | 2.36 |
| penalty free throws | 3.35 | 3.75 | about 4.1 |
| technical free throws | 0.23 | 0.26 | 0.44 |
| shooting fouls | 9.32 | 10.14 | 10.32 |
| personal fouls | 17.9 | 18.8 | 19.7 |
| tracked drives | 48.2 | 46.0 | 66.1 |

**What is left is the play mix, not the fouls.** At Synergy's own rate for
each play, the sim's mix of plays would draw 10.06 shooting fouls a team
game; it draws 10.14. The league draws 10.5 because it runs 17.3
pick-and-roll handlers, 6.1 rolls and 6.0 putbacks a team game where the sim
runs 13.9, 2.6 and 4.5, and 27.6 spot-ups where the sim runs 36.8. That is
the drives and the trip's structure. Of the rest, 0.2 a team game is the
technicals the engine leaves out (defensive three seconds, the bench and the
coach), and the bonus follows the fouls.

**What it cost: two tracked drives, and the threes the break was hiding.**
A break that kicked out used to reset into a half-court set, where a
tracked drive could come; now it ends on the break, as the league's do. The
break's possessions are still Synergy's (20.7 against 21.0), and transition
scores 1.19 a play against its 1.14 - on threes at 39.8%, which no constant
here sets. And the four-odd threes a team game the break gave back were
covering the half court's shortfall: on `bench.py` (240 real-roster games)
the league's threes went 35.4 -> 32.7 against 36.8, the shots inside 8 ft
41.9% -> 44.7%, FG% 47.3 -> 48.3 and the assisted share of makes 62.1% ->
59.8% - the break's kick-out threes were assisted, its finishes are not -
with free throws 20.5 -> 22.3 and fouls 17.7 -> 18.8. The threes are the
half court's to find: see *State of things*.

### The threes off the screen and the handoff

**The half court's missing threes were pull-ups, in two plays.** Against
tracking, catch-and-shoot threes were close (25.5 a team game against
26.3) and pull-ups were not (7.6 against 9.8); against Synergy, by play,
nearly all of the shortfall was the pick-and-roll handler (2.1 threes a
team game against 3.9) and the handoff (0.8 against 1.9), with spot-ups and
the break on the league's. Man by man the low-volume shooters were exact
and the volume shooters short - the men who take nine threes a 36 took 8.3
- because those are the men who take them off a screen.

- **The pick-and-roll read** happens at the arc 90% of the time, and there
  the handler drove half the time, pulled up for two 31% and shot the three
  18%: threes were 19% of his pick-and-roll shots against Synergy's 30%,
  with his twos already the league's. `SCREEN_EFF_THREE_PROB` 0.7 -> 1.9
  is the league's 30% (29.8%). 2.3 matched the threes' count instead, but
  the sim runs three fewer pick-and-rolls a team game than the league
  (14.3 against 17.3), so that put a third of them beyond the arc; the
  count belongs to the play's volume.
- **The handoff** chose its receiver's shot on his catch-and-shoot rate
  from where he caught it, then rolled where the shot came from again off
  his whole shot mix - the same thing the pick-and-roll read was rebuilt to
  stop - so a shooter coming off a handoff at the arc took a two or went
  to the rim as often as not. His shot is the one its weight was for now:
  his three within a step-back of the arc, his two inside it. With that,
  `HANDOFF_DRIVE_W` 1.0 -> 0.5 puts it at Synergy's 45% threes (44.9%).

600 real-roster games on the same seeds, a team game:

| | before | now | NBA |
|---|---|---|---|
| three-point attempts | 33.1 | 34.8 | 36.8 |
| pull-up threes | 7.6 | 8.9 | 9.8 |
| catch-and-shoot threes | 25.5 | 25.9 | 26.3 |
| pick-and-roll handler threes (share of its shots) | 2.1 (19%) | 3.5 (30%) | 3.9 (30%) |
| handoff threes (share) | 0.8 (19%) | 2.0 (45%) | 1.9 (45%) |
| men with 9+ real threes a 36 | 8.3 | 8.8 | 10.0 |
| free throw attempts | 22.45 | 22.17 | 23.37 |
| tracked drives | 46.0 | 43.8 | 66.1 |

**What it cost, and what is left.** The pick-and-roll and handoff drives
that became threes were drives the engine was already short of: two
tracked drives and a quarter of a free throw. And the league's threes stay
two short however the handoff is set - a man's handoff threes up, his
spot-up threes down, the shot diet holding his whole three share - because
what is left is not where his threes come from but how many plays there
are to come from: three pick-and-rolls a team game short, and the roll man
at 2.6 plays against the league's 6.1, the pop's threes with it. That is
the next thing: see *The roll man*.

### The roll man

**It was where the pick-and-roll had been, at 4.4 attempts a team game, in
September, and 2.5 in October**, with the men who live on it - the bigs
whose rolls are a quarter or more of their points - scoring 1.8 roll points
a 36 against 4.6. Measured a commit at a time, a roll man's shots per screen
held near 11% throughout; what fell was the screens, 39 a team game to 24,
most of it in the volume clamp and after, and inside the read the pass to
the screener, which stood at 0.30 while the drive, the pull-up two and the
three beside it were raised one after another. When a screen worked the
handler passed to the screener 5% of the time, and the roll man finished
15% of the pick-and-rolls against Synergy's 26%.

**`screener_frequency` is the roll man now.** It was screen assists a 36,
which counts the screens that freed somebody else's basket, and the engine
both chose its screeners on it and threw to them on a fit of it - his shot
volume ** 0.42 and his screen assists ** 0.6, r 0.75 against how often the
NBA's roll men really finish - which flattened the men who live on it:
Embiid 1.7 roll-man plays a 36 against 5.9, Vucevic 0.6 against 5.1. It is
Synergy's roll-man frequency itself now (`ratings_build`, the roll and the
pop both), screens go to men on its square as before, and the pass is the
same for every screener, so each man's rolls are his own. A man who is
never the roll man reads 0. Its top on the Sheet's scale was refitted to
the new column's 99th percentile, 89.1 (it was 107); customs keep the
numbers typed for them, 100 being the league's most frequent either way.

**The read and the volume, set again:**

- `SCREEN_EFF_PASS_SCREENER_PROB` 0.30 -> 1.3, with **the pop thrown to as
  readily as the roll** (`POP_PASS_MULT` 3.5). A roller is thrown to at 4.0
  times the base when open and 1.3 covered, 2.2 on average, and the pop was
  at the base - under half the passes per screen, and a pop catch is his
  own shot 45% of the time against the roll's 60% - so the rim-runners ran
  a third over and the poppers at half. 3.5 brings the poppers most of the
  way.
- `SCREEN_CALL_WEIGHT` 110 -> 280, for Synergy's pick-and-roll volume.
- What the screens took from the other plays, put back on Synergy's own:
  `PLAY_WEIGHT_OFF_SCREEN` 0.9 -> 1.65 (off-screen plays had fallen to
  2.5 against 4.2), and `PLAY_WEIGHT_HANDOFF` 1.6 -> 3.4 - the handoff call
  is shaded by the giver's `screener_frequency`, the big who rolls now, so a
  guard who is never the roll man no longer calls them, and they had fallen
  to 2.9 against 5.1.
- **The elbow** was fitted on the old column; refitted on the new one,
  read from a floor of 20 since a guard who never rolls still catches there
  (`SPACING_ELBOW_*`: 0.86 and 0.29 on post_up, r 0.79 against 0.78 for the
  old). Elbow touches follow each man's real ones at r 0.83.

600 real-roster games on the rebuilt sheet, a team game:

| | before | now | Synergy / NBA |
|---|---|---|---|
| roll-man plays | 2.6 | 6.0 | 6.1 |
| pick-and-roll handler plays | 14.3 | 15.7 | 17.3 |
| each man's roll-man plays on his real (log-slope, r) | 0.52, 0.73 | 1.00, 0.93 | |
| the roll-dependent bigs' roll points a 36 | 1.8 | 3.8 | 4.6 |
| ...and their points a 36 | 14.0 | 15.1 | 17.0 |
| % of made shots assisted | 59.3% | 61.0% | 63.8% |
| three-point attempts | 34.8 | 34.8 | 36.8 |
| free throw attempts | 22.2 | 21.5 | 23.4 |
| tracked drives | 43.8 | 42.8 | 66.1 |

| roll-man plays a 36 | before | now | real |
|---|---|---|---|
| Embiid | 1.7 | 3.7 | 5.9 |
| Vucevic | 0.6 | 2.9 | 5.1 |
| Sabonis | 1.0 | 2.4 | 4.8 |
| Lopez | 0.8 | 3.5 | 3.6 |
| Duren | 1.7 | 3.7 | 3.1 |
| Gafford | 2.1 | 4.1 | 2.8 |

**What is left.** The rim-runners still run a little over and the poppers
under - Sabonis most, whose rolls are short rolls and handoffs at the
elbow. And the free throws gave back seven tenths: more of the handler's
plays end in the pass now, and the handler draws shooting fouls on 6.9 of
every 100 plays against Synergy's 9.4, the roll man on 8.7 against 10.6.

### Each man's shot mix, and where the extra rim shots came from

**Checked man by man in October 2026**: 1,200 real-roster games, every man
with 250 shots against his own `shot_close` / `shot_mid_range` /
`shot_3_pointer`. The order was right (r 0.93-0.96) and the spread squeezed
(slopes 0.72-0.83), and the misses ran one way: each man's close share 3.4
points over his own on average and his threes 2.5 under, worst for the men
who want the rim least - 13 points over for those who want under 15% of their
shots there, 9.5 for 15-25%, 6.5 for 25-35%. A.J. Green asked for 4/6/90 and
shot 19/5/76, DeRozan 22/63/15 and 48/38/14, Durant 15/52/33 and 31/37/32.
The league is the same thing added up: its catch-and-shoot threes were the
NBA's (26.3 a team game against 26.5), and it took 40.0 rim shots against
35.5.

**First, counting the way the Sheet counts.** The diet counted a shot's zone
by `ShotZone`, whose close zones end a foot short of the "Less Than 8 ft." line
`shot_close` is a share of - a 7-8 ft floater was spent from his mid-range
(`DIET_CLOSE_FEET`). And the split under the mid-range counts a floater from
10 ft out as a pull-up, as tracking does: its catch-and-shoot and pull-up twos,
12.6 a team game, are every two the NBA takes from 10 ft (12.9), 2.2 of them
"Floating Jump Shots". Measured that way the pull-up share of each man's
mid-range was 4.9 points under his own, not 17. `metrics.py`'s pull-ups still
leave the floater out.

**Tried and not kept: the diet on the drive's kick-out.** His close appetite on
the odds of finishing took the close miss from 5.8 to 3.7 - by passing: drives
ended in a pass 54% of the time against the NBA's 44% (the sim's had been
44%), in the driver's shot 34% against 41%, the break's threes went 6.7 to 8.7
against Synergy's 6.6 and the free throws fell 1.4. Holding the kick-out at the
league's rate took the gain away (5.9 to 5.3): the diet's appetite is steep
enough that the read goes nearly all one way or the other, whatever the
constant beside it. Real drivers do not give the ball up more; they end
their drives somewhere else.

**Where their rim shots really came from**, per 100 of his shots, against the
real man's own (tracking's drives, Synergy's transition and cuts):

| | sim: rim shots off drives | real: shots off drives, any distance | sim: break layups | real: break shots, any kind |
|---|---|---|---|---|
| Booker | 31.6 | 48.1 | 9.4 | 15.3 |
| DeRozan | 33.3 | 41.2 | 9.6 | 6.6 |
| Durant | 18.8 | 40.3 | 9.2 | 13.3 |
| A.J. Green | 5.9 | 5.1 | 5.7 | 14.6 |
| Klay Thompson | 10.7 | 11.3 | 4.8 | 16.9 |

The creators drive more than the sim has them, and a quarter of their shots or
fewer are close, so most of their drive shots are not at the rim: the NBA's
tracked drives end in 27.0 shots a team game and its shot chart calls 19.6 of
them "Driving" - layups, dunks, floaters, hooks. The rest are jumpers off a
drive that got into the paint, and the engine's drive had none (2.8% of its
tracked drives' shots). The shooters' drives are about right; their rim shots
came from the break, where everyone got the same 9 layups a hundred shots,
and from cuts.

**Three changes, each where he chooses between his zones:**

- **The pull-back** (`_decide_drive_pull_back`, config's THE PULL-BACK). In
  the paint, after the kick-out read, he can rise from outside it instead of
  finishing - pull-back, step-back, fadeaway, from where the league's
  off-the-dribble twos go up between 10 and 16 ft - on his pull-up twos and
  his mid-range appetite against his close one. Not on the break, and not on a
  drive whose whistle is coming. The drive is still a tracked drive.
- **The break, on the diet** (`BREAK_ATTACK_DIET_EXPONENT`). Inside the arc on
  the break every attack is a run at the rim, so his close appetite is on the
  attack there: a shooter who has had his rim shots gives it up.
- **Cuts, on the diet** (`CUT_DIET_EXPONENT`). A cut answered to whether he
  was owed shots and not where; it answers to his close appetite too.

And the pull-up that stops short of the paint, which no one counts as a drive,
comes down (`DRIVE_MID_PULL_UP_BASE` 0.035 -> 0.01): the pull-back makes those
jumpers now, and the drives that used to stop out there go on into the paint.
Each was swept on its own and together (config has the tables); a stronger
diet on the break or the cut did no better, and weighting the break's pull-up
down to hold its threes took the men's own three splits further from theirs.

Per man, 1,200 real-roster games on the same seeds and sheet:

| a man against his own tendency | before | now |
|---|---|---|
| close: mean miss / bias / slope | 5.8 / +3.4 / 0.80 | 3.7 / 0.0 / 0.88 |
| mid-range | 3.1 / -0.9 / 0.72 | 2.8 / +1.0 / 0.86 |
| three | 4.8 / -2.5 / 0.83 | 3.9 / -1.0 / 0.86 |
| pull-up share of his mid-range, bias | -4.9 | -1.1 |
| catch-and-shoot share of his threes, mean miss / slope | 8.7 / 0.56 | 7.7 / 0.60 |
| customs (45, full rosters), close / mid / three mean miss | 5.1 / 2.8 / 3.7 | 3.8 / 2.2 / 3.6 |

| close / mid / three | wants | before | now |
|---|---|---|---|
| DeMar DeRozan | 22 / 63 / 15 | 48 / 38 / 14 | 30 / 54 / 16 |
| Kevin Durant | 15 / 52 / 33 | 31 / 37 / 32 | 21 / 45 / 34 |
| Devin Booker | 26 / 43 / 31 | 43 / 34 / 23 | 29 / 44 / 27 |
| Luka Doncic | 21 / 31 / 48 | 36 / 27 / 36 | 24 / 33 / 43 |
| Stephen Curry | 24 / 15 / 61 | 37 / 14 / 49 | 28 / 17 / 55 |
| Luguentz Dort | 15 / 13 / 72 | 37 / 10 / 53 | 27 / 15 / 58 |
| Joel Embiid | 33 / 44 / 23 | 40 / 33 / 27 | 32 / 39 / 29 |
| Nikola Jokic | 52 / 22 / 26 | 56 / 17 / 28 | 52 / 18 / 30 |

`bench.py --games 240 --league --real-only`, before / now, same sheet (NBA):
points 115.9 / 115.0 (115.0), attempts 90.6 / 91.0 at 47.8 / 46.7% (88.6 at
47.1%), threes 34.7 / 36.4 (36.8), shots inside 8 ft, 8-22 ft and from three
43.5 / 18.2 / 38.3% -> 39.8 / 20.3 / 40.0% (40.1 / 18.4 / 41.5), assisted
61.2 / 62.5% (63.8%), free throws 21.6 / 21.9 (23.4) - the drives that now get
into the paint draw their own whistles - and tracked drives 43.1 / 46.4
(66.1), drive shots 20.4 / 22.6 (27.0). The kick-out holds at 43%, the break's
own at 20%.

**What is left.**
- **A point too much mid-range for everyone** (+1.0 a man, the league's 8-22
  ft 20.3% against 18.4%, pull-up twos 12.1 a team game against 11.0): the
  pull-back reads "over on close" as "wants mid", and for a man who is short
  of threes it is not - A.J. Green is still 18 / 8 / 74 against 4 / 6 / 90. A
  drive that ends in a three for the men who want threes would be the other
  half of it.
- **The break's threes**, 7.9 a team game against Synergy's 6.6, and its
  shooting fouls 11.2 a hundred plays against 11.9.
- **The catch-and-shoot split of the threes is still squeezed** (slope 0.60):
  the pull-up shooters take too many on the catch.
- The men who want 50-70% of their shots at the rim come out 4.2 points under
  there, where they were 2.3 under: the role players among them who take
  almost no mid-range (Leonard Miller, Moritz Wagner, Keldon Johnson) pick up
  a point and a half of the league's spare mid-range each.

### Deferred: to come back to

Measured, understood, and left for when the rest is settled - in roughly the
order they matter.

- **The drive count, 42 against 66.** Waits on the pick-and-roll being the
  way a handler attacks rather than an option beside the drive - see *The
  drive, with the plays fixed*. The floater, the kick share, the cut, the
  pick-and-roll read and the break are done.
- **Floaters went in 38%** against the NBA's 43-50%, and **half-court drive
  finishes were 40% floaters against 38%**. Both done in *The 8-9 ft pile,
  and the floater*: floaters go in at 45.2% against 45.1%, at every
  distance, and the stop-short is the league's share inside 10 ft.
- **Drive turnovers are 3.8% against 6.1%**, set to hold the league total
  because the engine's drives include short ones the NBA does not count, and
  its drives and post-ups carry every dead-ball turnover the NBA spreads
  over the whole floor. See *Turnovers happen in the play*.
- **Short jumpers and catch-and-shoot threes** - 7.4 jumpers from 8-13 ft
  against about 5.3, and 23.4 catch-and-shoot threes against 26.4. Nine
  paths each carry a little. See *The box score, kind by kind*.
- **A second chance runs 5.3 s against 4.2.** The scramble brought
  possessions onto the league; what is left is the kick-out's receiver
  resetting into a full set.
- **Flagrants are unanchored**: 2.5% of shooting fouls, about 0.25 a team a
  game. No league-wide count turned up.
- **The isolation still draws 15.7% against Synergy's 13.0%**, and the
  handoff 6.2% against 8.5% - the two the play-type pass left furthest out,
  on 0.8 and 0.2 fouls a team game.
- **Blocks run 6% over**, since the drive began carrying its own fouls: more
  drives finish at the rim, so there is more to block.
- **Nothing measures on-ball pressure.** `pressure_ball_handler` reads
  deflections per 36, which is a hand in the ball rather than a body in the
  chest, and it shares that column with `pass_interception_attempt`. The
  matchup endpoint (`leagueseasonmatchups`: partial possessions, turnovers
  forced, how the man he guarded shot) is the one public source that would
  separate them, and the build does not fetch it.
- **Illegal screens against other offensive fouls** is not published; only
  their total (1.16) is anchored.
- **The matchup gate cannot always hold for all five** on natural
  positions - 41% of possessions at 3.0 - because lineups play men out of
  them. A failsafe that also counts the position he is playing now gets all
  five through on 89%; the rest are real coverage holes the rotation leaves.
  See *Who guards whom*.
- **Size still enters the contest** - the defender's height and wingspan over
  the shooter's - and 15% of the rim presence that shuts a dunk window. Not
  measured.
- **The Sheet.** Position gaps the rotation now plays through rather than
  around - the Blazers at PF and C, the Wizards at SG, the Lakers at SF and
  PF, the Mavericks at SG. And two columns built here that the Sheet does not
  have yet, `driving_aggressiveness` and `tend_floater`: paste
  `ratings_build/output/paste_driving_aggressiveness.csv` and
  `paste_tend_floater.csv` into it before the next `csv_merger.py`, or the
  merge puts the old values back.

The long-standing ones - who shoots and who gets the ball, the roll man, FG%
by shot clock, the called-play system - are under *Known problems* and
*Still open* above.

### Fouling out

**Six fouls, as in the NBA, except in the NSL, which plays to eight.** The
whole league used to play to eight. The NSL keeps it because its customs are
built handsy and play heavy minutes, and six would sit them for quarters at a
time. The limit comes from the sheet's `League` column
(`config.LEAGUE_FOUL_LIMITS`, read through `Player.foul_limit`), so an NSL
player keeps his eight whoever he plays for.

Foul-trouble benching follows each player's own limit
(`FOUL_TROUBLE_TIERS_BY_LIMIT`). At six it is the NBA's habit: two fouls in
the first, three in the second, four in the third. At eight it is what the
league played before: three, five, seven. Nothing in the fourth. The
technical foul-trouble multiplier fires one foul from fouling out. It read
`fouls >= 6` against a limit of 8, which was never the intent, and at six it
could not fire at all, because a man on six was already gone.

On real rosters, 120 games and the same seeds either side (every NBA player
at six against everyone at eight): free throws 23.8 → 24.6, fouls 19.8 →
20.4, turnovers 13.6 → 14.1, points 117.0 → 116.7. That is more
foul-trouble benching putting worse defenders on the floor, and at 120 games
it is close to noise. Nothing was retuned for it.

**Ejections follow the same split: two technicals and flagrants between
them, three in the NSL** (`LEAGUE_EJECTION_LIMITS`, read through
`Player.ejection_limit`), and **a flagrant 2 is an ejection on its own**, as
in the NBA. Flagrants themselves are still unanchored - see *Known problems*
- so with 15% of them flagrant 2s, the sim throws out about one player
every 15 games.

**Fouling out and being thrown out used to be temporary.** Both only
substituted the man off, and nothing kept him on the bench: the rotation's
replacement picks read every bench player, so a fouled-out starter with
minutes still owed was one of the likeliest to come back. Over 30 games, 23
players fouled out and were sent back in 63 times - Big Boi to his seventh
foul. The injured had the same hole. `Player.can_enter` - not hurt, not
fouled out, not ejected - now decides every choice of who comes on: the
rotation, the closing lineup, and the replacement for a foul-out, an
ejection or an injury. Over 60 games afterwards, nobody came back. The
foul-out numbers above were measured with the hole open; closing it moved
240 league games by under 0.3 of anything (points 117.1 → 116.8).

### The deep bench

**Nobody is a full benchwarmer** (the user's call, October 2026). The Sheet
used to give every man at least a minute; the rotation builder gives everyone
outside the 9-to-11-man rotation 0, and a 0-minute man never saw the floor
outside garbage time - the rotation's replacement pick refuses him while
anyone else is on the bench, and pacing pulls him on sight. Over 300
real-roster games with today's 1-minute men set to 0, they got in 27% of
games, 0.83 minutes a game, nearly all of it garbage time. The settings are
config's THE DEEP BENCH.

**Spurts.** In about one game in six (`SPURT_CHANCE`) each man with no
projected minutes gets a spurt of 2 to 4 minutes (`SPURT_MINUTES`), due at a
moment drawn mostly from the second quarter's bench stretch
(`SPURT_QUARTER_WEIGHTS`, `SPURT_WINDOW`) - never the fourth, and one not
started by then is skipped. At the first dead ball once he is due he comes in
for the man whose place he can take without leaving a position bare, at a
position he is rated 5+ at where there is one, and of those the most tired.
Pacing leaves him alone until his time is up, and then he comes off like
anyone else (`Team._spurt_sub`, `_spurt_over`).

**Garbage time is the deep bench's.** It used to pull the starters alone,
one a dead ball, and bring on whoever scored best for position and
freshness - the second unit, mostly, with the starters drifting off one at a
time. Now (`Team._get_garbage_time_sub`):

- **Everyone above the deep bench comes off for a deeper man**, starters
  first, up to five at a dead ball (`GARBAGE_SUBS_AT_ONCE`) - the bench is
  emptied together.
- **The deep bench** - under `DEEP_BENCH_MINUTES`, 5 projected - **is drawn
  at even weight**, whatever their ratings, ahead of the rest of the bench
  and far ahead of the starters (`GARBAGE_TIER_COST`).
- **Position sense is a cost, not a rule** (`GARBAGE_GAP_COST`, by how many
  positions the floor would be left without someone rated 5+): a deep man
  who leaves one position open still goes in, one who would leave two does
  not if anyone else can help it - so no five guards.
- **More than five deep men take turns**: one who has had
  `GARBAGE_SHIFT_SECONDS` (2:30) makes way for one who has had none.
- **A starter stays out there now and then**: in `GARBAGE_STARTER_STAYS`
  (about one blowout in seven) one starter plays 2 to 4 more minutes.
- **Once it has come it holds** while the lead stays 13 or more
  (`GARBAGE_TIME_HOLD_DIFF`) - the regulars come back inside the closing
  lineup's window, not the moment a 25-point lead dips to 19.

300 real-roster games either side, the 1-minute men set to 0, minutes a man a
game by projected minutes:

| | before | now |
|---|---|---|
| 0 projected: games played in | 27% | 56% |
| 0 projected: minutes a game | 0.83 | 2.48 |
| of them, garbage time / quarters 1-3 | 0.77 / 0.02 | 1.85 / 0.55 |
| 2-5 projected: minutes a game | 1.97 | 3.10 |
| starters (24+): garbage-time minutes | 0.52 | 0.26 |
| garbage time with 4-5 deep men on | 7% | 78% |
| garbage time with two positions open | 1% | 2% (3% the rest of the game) |
| garbage time with one position open | 9% | 65% (21% the rest of the game) |

One position open is the price of the deep bench being drawn at random: a
team's men outside the rotation are rarely a balanced five. Two open - five
guards, five bigs - is no commoner than in the rest of the game.

**What it does to results.** A spurt takes minutes from a better man, and it
cannot be measured doing anything: over 1,500 games a side that got one
spurt more than its roster made likely did 0.75 points of margin better
(standard error 0.51) - nothing, within the noise, and under a point either
way. Measured naively it looked worth +1.8, because the sides with the most
0-minute men are the ones with tight rotations, which on this sheet are the
better teams (each 0-minute man more on a roster went with 3.4 points of
margin).

Garbage time comes with the game decided, and it decides nothing: one game
in about 280 that reached it was lost by the side ahead, against none. What
it moves is the margin, and the reason is worth knowing. **The old garbage
time shrank leads** - by 1.8 points a game on the sheet's own rotations,
because pulling the starters alone costs a tight rotation, the better side
mostly, more than a deep one. The deep bench against the deep bench is close
to even (-0.2), so on those rotations decided games now end about a point
wider (margin 16.0 to 16.9, by twenty points 30% to 37%, 300 games). On real
rosters, where calibration is measured, it does not move outside the noise:
600 games each, with *The last seconds* as well, margin 15.49 to 15.70,
within five 20.2% to 23.3%, by twenty 31.7% to 32.3% (the NBA's 14.53, 24.0%,
30.5% - see *The slingshot*), and
garbage time leaves the leader where it found him either way (+0.39, -0.18).

### Timeouts

Wired in September 2026. `Team.timeouts_remaining`, `Team.call_timeout()` and
`TimeoutEvent` had all been sitting there since Layer 1 with nothing calling
any of them, and `recover_fatigue`'s `is_timeout` branch had never once run.

**The rules are not what they look like.** Seven a game, but a team is capped
at four in the fourth quarter, and at two inside the last three minutes of it -
a team holding more than two when the clock reaches 3:00 simply loses the
rest. Overtime gives two, and nothing carries into it or between overtimes.

**The mandatory ones are the part that changes the pacing problem.** Every
quarter carries two television timeouts: if neither side has called one before
6:59 the scorer charges one to the home team, and if fewer than two have gone
before 2:59 another is charged to whoever is not already carrying one. They
come out of the same seven. So a team never freely allocates its whole budget -
the broadcast spends part of it - and pacing is a budget with mandatory
withdrawals rather than a free choice.

**A called timeout and a television timeout are not the same event.** Both
stop the clock, rest the floor and halve the hot hands standing on it. Only
the called one kills momentum outright; a mandatory one halves it. A coach
stopping a run is making a point, where the 6:59 break is the schedule - and
without the distinction, eight scheduled resets a game would have flattened
momentum by themselves and the called timeout would have stopped being the
counter to a run that it is for.

**The bar falls with the clock, and that term is what paces it.** The first
cut gated calling one on the budget alone, and it failed in a way worth
keeping: at tip-off every team is exactly on schedule, so the gate is wide
open and nothing holds anyone back. It called twelve discretionary timeouts a
game against one mandatory, with eight of thirteen gone by half time. A budget
gate cannot pace anything on its own. The bar now starts high enough that only
a real run moves a coach early and comes down by `TIMEOUT_LATE_URGENCY` across
the game, because a timeout unspent at the buzzer is worth nothing; the budget
term only adds relief on top when a team is holding more than the schedule
says it should.

| per game | Q1 | Q2 | Q3 | Q4 | total |
|---|---|---|---|---|---|
| timeouts | 2.13 | 2.37 | 2.80 | **4.17** | 11.6 |

Usage rises through the game and survives into the fourth, which is what was
wanted. Teams finish with 0.87 unspent, the rest having been taken off them by
the 3:00 rule.

**What it costs, over 240 real-roster games, off against on.** The box score
does not move - points 117.17 to 116.99, FG% 47.63 to 47.60, steals 8.45 to
8.52, turnovers 13.70 to 13.77, fouls 19.80 to 19.59 - and neither does the
run distribution, with the longest run landing on 11.85 against the league's
11.85. Two things do move:

- **Fatigue falls 42%** for men playing 30 minutes or more, 0.065 to 0.038 at
  the buzzer. Absolute levels are low either way because the rotation already
  does most of the resting, but the fatigue model was calibrated in a world
  with no timeouts in it and eleven stoppages now hand back about 0.9% of a
  tank each. `TIMEOUT_REST_SECONDS` is the dial. There is no public figure for
  how tired an NBA player is at the buzzer, so this one is unanchored and
  known to be.
- **Momentum is damped 28%**, mean `|m|` 0.202 to 0.145. That is the timeout
  doing its job.

**The margin distribution does not move, which took 600 games a side to
establish.** At 240 it read as close games falling 21.7% to 18.8%, which would
have been the worst possible regression since that is the number the slingshot
is held to. At 600 it is 22.3% to 23.2% - a rise, not a fall, and z = +0.34.
The mechanism said so in advance: the side that calls a timeout is the side
momentum is running against, so if it did anything it would make games closer.
Blowouts 29.0% to 29.3% and margin 14.60 to 14.81, against the league's 24.0%,
30.5% and 14.53.

**Advancing the ball** - a timeout in the last two minutes of the fourth or
an overtime to inbound in the frontcourt - is built, and with it a close
game's last timeout is kept for it: see *The last seconds*.

**Inert when switched off.** `TIMEOUTS_ENABLED = False`, alongside the hot
hand and momentum off, reproduces the pre-Layer-7 hash exactly over 24 seeded
games.

### The last seconds

**Three periods in four used to end with no shot.** Every decision in a trip
read the shot clock and none read the period's, so a trip with six seconds of
the quarter left was played as if it had twenty-four: over 200 real-roster
games 74% of periods ended with the buzzer going mid-possession and nothing
up, and not one shot in them came from 40 feet. The settings are config's
THE LAST SECONDS.

- **The period's clock is the shot clock when it is the shorter** (the tick
  loop). Every late-clock read - the pressure on his shot selection, the
  forced shot at `SHOT_CLOCK_URGENCY_SECONDS` - now reads it, and the buzzer
  ends the trip rather than a shot-clock violation.
- **A trip with less left than the walk up and a look take sprints it** -
  an inbound and a run the length of the floor in 2.5 to 4 seconds
  (`LATE_PUSH_ADVANCE_TICKS`), not the set's walk.
- **A forced shot with the ball still 36 ft out is a heave**
  (`GameEngine._heave`), from wherever the ball is - a man still on his way
  up is between the backcourt and the frontcourt, as far as the time spent
  says. No read, no contest, no foul, and the period is over before anyone
  can rebound it. It goes in 8% of the time from 36 ft, 3.8% from half court,
  1.9% from 60 and 1.2% from 80 (`HEAVE_AT_LINE`, `HEAVE_FLOOR`,
  `HEAVE_DECAY_FEET`). Under half a second left there is no catching it and
  getting one off (`HEAVE_MIN_SECONDS`).
- **A miss from beyond half court is not a field goal attempt** - the NBA's
  rule, and the user's: it is a `HeaveEvent`, in the play-by-play and the
  website's feed ("Missed 62' heave at the buzzer - Beyond half court - not
  a field goal attempt") and in nobody's shooting. One that goes in, and any
  heave from inside half court, is a shot like any other with `heave` set -
  in his box score as the NBA counts it - and the advanced score values it
  at its own chance (`_shot_worth`), so a 40-footer at the buzzer costs his
  score next to nothing.
- **A missed shot that drew a foul is told as the shot it was**, though it
  is no attempt either: "Smith fouled on a 14-ft hook shot - FOUL ..." in
  the play-by-play, "Smith: Fouled on 14' hook shot" on the site.
  `FoulEvent.shot_distance_fouled` carries the distance, for the record only.
- **Ahead at the end of the game, he dribbles it out** (`_game_won`): in the
  fourth or an overtime, with the shot clock off and his side ahead, the
  forced shot is not taken.
- **A dead ball's lines say what they were**: the advance timeout is "TIMEOUT
  Pacers - to advance the ball for the last shot" in the play-by-play, with
  the same caption on the site.

**The last timeout.** In the last two minutes of the fourth or an overtime a
team that gets the ball may take a timeout and inbound it in the frontcourt,
and in a close game that is what the last one is kept for (the user's call):

- from the fourth on, within 10 (`FINAL_TIMEOUT_RESERVE_MARGIN`), a team does
  not spend its last timeout (`FINAL_TIMEOUT_RESERVE`) on a run or tired
  legs (`_holding_the_last`);
- with the shot clock off - 24 seconds or less (`ADVANCE_TIMEOUT_SECONDS`) -
  tied or down 3 or fewer (`ADVANCE_TIMEOUT_MAX_BEHIND`), it takes it to
  advance the ball (`_advance_with_timeout`): the clock stops, the walk up is
  skipped, and the last shot comes off a set inbound rather than a scramble
  against the clock;
- and the ones it has to spare, above that last one, a side behind by 10 or
  fewer spends in the last minute (`ADVANCE_SPARE_SECONDS`) to advance the
  ball as soon as it has it - every walk up it skips is a trip more before
  the end (added with *The press*, below).

**What it does**, 400 real-roster games. The last trip of a period ends in a
shot 58% of the time (21% made, 37% missed), against 26%. Of the other 42%,
26% of periods end on a missed heave from beyond half court - 1.03 a game,
in the log and nobody's attempts - and 12% are a fourth quarter dribbled out
by the side ahead; 4% end with the ball simply not getting up.
Shots in a period's last three seconds went from 0.77 a game to 2.18. A heave
that counts comes 0.14 times a game and 0.01 go in, against the NBA's 0.026
makes from 36 ft and beyond - low, because he throws it from where the
inbound found him (85 ft, often) where a real one dribbles toward half court
first, and rare enough that 400 games hold four. The last timeout to advance
the ball is taken 0.10 times a game.

League totals, 240 real-roster games against the last commit (with *The deep
bench*, which barely reaches them): points 114.4 to 116.1 (NBA 115.0), field
goal attempts 91.2 to 91.9, free throws 21.5 to 21.9, possessions 99.9 either
way - the shots the buzzer used to swallow. Margins are under *The deep
bench*.

The last minutes before them - the three, the foul, the clock - are *The
last minutes*.

### The last minutes

**Down the stretch the side behind plays for the comeback and the side ahead
for the clock** (the user's call, October 2026). Before this neither did: a
side down three took whatever the trip turned up - a dunk as easily as a
three - nobody fouled to stop the clock, and the side ahead shot when it
would have in the first quarter. The settings are config's THE LAST MINUTES.

**The three, by the odds.** At the start of each of its trips in the fourth
or an overtime, a side behind asks how often it would make up the deficit in
the trips it has left on twos alone, at its own two-point percentage tonight,
against on threes alone at its own three-point percentage tonight - each
shrunk toward the league's by 20 shots of its own, so a 1-for-2 night is not
a hot one; a tie counts half, for the overtime. It counts what it has to
make up, as a bench counts possessions, not what the side ahead adds at the
line. Its urgency is how much more often threes come back than twos,
`(threes - twos) / (threes + twos)`, and 0 when twos do as well
(`GameEngine._three_urgency`):

| behind, time left | trips left | urgency |
|---|---|---|
| 9, 6:00 or 3:00 | 14, 8 | 0 |
| 9, 1:10 | 4.6 | **0.62** - trigger happy |
| 5, 1:10 | 4.1 | **0.06** - patient, a two will do |
| 6, 0:30 | 2.1 | 0.76 |
| 3, one trip | 1 | 1 |
| 2, one trip | 1 | 0.13 - the three wins it, the two only ties |
| 1, one trip | 1 | 0 |

The trips left are the clock over an exchange of its own trip and the other
side's - a milked one, or a fouled one once it will be fouling. Then, as far
as the urgency says, its men want the three (the shot diet's three appetite,
up to five times: `THREE_URGENCY_MAX`), play as if the shot clock were running
out (`SHOT_CLOCK_PRESSURE` on the read: fewer passes, fewer holds, more
attacks, and no extra swing), push the ball up faster, drive and post less
(`URGENCY_TWO_CUT`), and step back to the arc for a two they were about to
take from 10 ft or further out - a pull-up, a long two, a drive
(`URGENCY_THREE_SWAP`). Past 0.6 a catch at 16 ft is taken a step behind the
line and the forced shot is a three. None of it in garbage time.

The diet alone was not enough, and the reason is worth keeping: it moved a
side that needed threes from 41% of its shots to 47%, because the drive is
read ahead of it, plays and breaks end at the rim, and a man inside the arc
cannot shoot a three from where he stands. With the drive cut and the step
back, by urgency: under 0.2, 40% threes; 0.2 to 0.6, 61%; 0.6 to 0.9, 73%;
0.9 and over, 79%. There is no public figure for how a trailing side's shot
mix moves with the clock, so `THREE_URGENCY_MAX` is the user's "heavily" and
unanchored - and its scoring holds up: a side behind in the last five
minutes scores 1.01 points a trip at urgency 0.6 and over, 1.03 at 0.2 to
0.6, against 0.96 in the same spots before.

**Fouling to stop the clock.** A side behind by 10 or fewer fouls the man
with the ball as soon as he has it once waiting cannot work
(`_foul_to_stop_clock`): down one possession (1-3), when the side ahead could
run the clock out - the shot clock off; down k possessions, with 24 + 16 x (k
- 1) seconds left - 40 down 4-6, 56 down 7-9, 72 down 10. The man guarding
him does it unless he is one from fouling out. Out of the penalty it is a
side-out, and they foul again. In the log it is "FOUL Brown (to stop the
clock) on Mitchell", "Foul to stop the clock" on the site, and a personal
foul in the box score.

**The press.** A side about to foul presses the inbound full court, and the
side ahead wants it in its best free-throw shooter's hands - the plan, not a
guarantee (the user's call): the press denies him, and the plan works half
the time (`PRESS_PLAN_WORKS`); otherwise it goes to whoever got open, by the
ordinary inbound weights. Whoever catches it keeps it - he is fouled where he
caught it - and the inbound itself is contested: the pass interception check
runs on it at three times its attempt rate (`PRESS_INTERCEPT_MULT`). It
first went to the best free-throw shooter by his FT% to the sixth power,
nearly every time, and was never contested.

**The penalty, as the NBA has it.** The fifth team foul of a quarter puts the
other side on the line, the fourth of an overtime - and in a period's last
two minutes a side gets one foul to give: its second there is a penalty
whatever it had before. The engine had the fifth foul alone, which would
have handed a side fouling at the end up to five free fouls, seconds off the
clock it was fouling to save. It reaches every quarter's last two minutes, a
few more free throws a game.

**Milking the clock.** With two minutes or less of the fourth or an overtime
left, the side ahead does not attack until the shot clock is down to 10: no
break, no catch-and-shoot, no cut, no drive or post-up on the catch, no drive
off a beaten reach. It moves the ball and holds. With the shot clock off it
does not attack at all, and dribbles the game out (*The last seconds*).
**Never in garbage time** (the user's call): the game is out of reach and the
bench out there is playing for a place in the rotation. It milked there for
a while, and leads of 21 drifted under 20 - the share of games won by 20 or
more fell from 28.2% to 26.3%.

**What it does**, real rosters, against the last commit. The side behind's
share of threes, by how far behind and how long left (600 games each):

| behind | last 0:30 | 0:30-1:30 | 1:30-3:00 | 3:00-5:00 | quarters 1-3 |
|---|---|---|---|---|---|
| 1-3 | 46% -> 57% | 43% -> 32% | 40% -> 40% | 42% -> 44% | 39% |
| 4-6 | 49% -> 76% | 40% -> 49% | 35% -> 41% | 42% -> 43% | 41% |
| 7-10 | 39% -> 83% | 36% -> 59% | 42% -> 46% | 43% -> 43% | 41% |
| 11+ | 45% -> 61% | 39% -> 57% | 42% -> 57% | 42% -> 57% | 41% |

Down one to three with a minute left it is as patient as ever - a two and a
stop will do. The side ahead, in the last two minutes and not being fouled,
takes 14.8 seconds to its shot against 9.1, and 1% of its shots come with 10
or more on the shot clock against 76%. A side fouls to stop the clock 0.94
times a game, each one worth 1.65 points to the side ahead; free throws in
the last two minutes of the fourth go from 2.5 a game to 3.6.

How close games finish (1,000 games each): within three with 30 seconds left
14.1% to 17.0% of games; tied there, 33% go to overtime against 20%; up one,
the leader wins 64% (70%), the trailer 27% (21%); up three, the leader 85%
(90%). Overtime 2.2% to 2.9% - the NBA's is about 6%, and that gap was there
before.

**The margins**, 3000 real-roster games a version, the same games each
(`margin_check.py`, run by the user):

| | before the endgame (`b85cfde`) | the first cut (`0da0916`) | now | NBA |
|---|---|---|---|---|
| within 5 | 23.5% | 22.3% | 22.6% | 24.0% |
| within 3 | 14.4% | 12.3% | 13.1% | |
| won by 1 | 5.0% | 3.3% | 3.4% | |
| by 20 or more | 29.7% | 26.3% | 28.2% | 30.5% |
| margin | 14.97 | 14.49 | 14.87 | 14.53 |
| overtime | 2.1% | 3.0% | 2.9% | about 6% |

"Now" is the first cut with the press, the spare timeouts and no milking in
garbage time. Within five is good to 0.8 of a point either way at this many
games, and the NBA's 24.0% and 30.5% are from 200 games, good to 3. What
the endgame took was the one-point finish - a side up one or two with the
ball is fouled now, not left to play it out and give the other side a last
shot - and a point and a half of blowouts. Two other cuts were tried and
dropped: fouling only down 8 or fewer, later (games then pile up at exactly
9 - 7.7% of them - where the fouling stops), and no three urgency past 10
down (within five fell to 21.5%). *The slingshot* was set on the
close-game rate as a stand-in for this endgame, so it is the one to look at
again when the calibration is next run.

League totals, 240 real-roster games: points 116.1 to 116.0, possessions 99.9
to 100.3, three-point attempts 36.8 to 37.8 (40.0% of shots to 41.2%, the
NBA's 41.5%), FG% 46.8 to 46.3, free throws 21.9 to 22.6, fouls 18.7 to 19.1,
turnovers 13.3 to 13.6, interceptions 5.5 to 5.8 - the ball moved around
while the clock runs.

**Not built.** A side up three does not foul to stop the tying three.

### Momentum

One meter for both teams, not one each: it runs -1 to +1 and a team's gain is
the other's loss by construction. That is the whole reason the design is safe.
Two independent meters would have added, and a hot team on a rolling team
would have compounded; a shared one is close to self-financing over a season.

**What feeds it**, read off the possession's own events rather than hooked at
each site that can emit one: a made field goal, a steal and a block for the
team that did it, a turnover against the team that gave it away, and a **miss
only for the team currently holding it** - missing while you are rolling is
what stops a run, and missing while you are not is just basketball.

**Both halves of "hard to hold".** A move against the holder is amplified by
`1 + 2.0 * |m|`, and a move *toward* the holder is damped by `(1 - |m|)`, so
the meter saturates asymptotically rather than being clamped and the last of
it is the hardest to get. With only the amplification the anchor below sat at
0.334 and an answering 6-0 run moved the meter from 1.00 to 0.150, which is
neither close to even nor easy to swing.

**The anchor is behavioural, not a box-score rate.** From full momentum, if
both teams make three shots over the next five possessions it should come back
close to even. Fitted over all 20 orderings of three makes each:

| make | 0.10 | 0.12 | 0.14 | 0.16 | 0.18 |
|---|---|---|---|---|---|
| \|m\| after, want ~0 | 0.312 | 0.245 | 0.189 | 0.151 | **0.140** |
| 6-0 build from even | 0.241 | 0.283 | 0.323 | 0.362 | **0.399** |

At `MOMENTUM_MAKE` 0.18 and `MOMENTUM_LOSS_AMPLIFY` 2.0 the anchor lands at
0.140, a 6-0 run from even reaches 0.399, and a 6-0 answer from full takes it
to **-0.104** - an answering three baskets takes it off you and starts turning
it the other way. In play the meter changes sign about every three possessions
and tops out near 0.80.

**The effects are a different channel from the hot hand, on purpose.** The
side holding it gets a small lift on everything, which is where its extra
steal comes from; the side without gives up `ball_security`, which is where
its extra turnover comes from. If both systems landed on shooting ratings
they would multiply. The two magnitudes were swept against the box score,
because the steal roll is `STEAL_SUCCESS_BASE * (steal_skill / security)` and
lifting one side's skill while cutting the other's security compounds - with a
feedback loop on top, since a steal raises the meter which raises the steal
rate:

| global / security | 1.00/2.50 | 0.65/1.75 | **0.40/1.10** | NBA |
|---|---|---|---|---|
| steals | 8.84 | 8.59 | **8.46** | 8.40 |
| blocks | 5.05 | 5.01 | **4.93** | 4.80 |
| turnovers | 14.18 | 13.86 | **13.76** | 13.70 |

0.40/1.10 puts all three inside tolerance, so the base steal and block rates
did not have to be re-anchored to absorb this.

**The run distribution does not move, which was the hard constraint.** Over
240 real-roster games, momentum off against on: runs of 6+ 9.06 -> 9.10
against the league's 9.03, runs of 8+ 3.86 -> 3.67 against 3.75, longest run
11.87 -> 11.68 against 11.85. It is not here to manufacture runs - the sim
already makes them at the league's own rate - but to tie the ones that happen
to who is playing well, and to give a timeout something to stop.

**What it does not do is move scoring, and that is measured rather than
assumed.** Points per possession for the side holding the meter rises cleanly
with `|m|`, from 1.025 to 1.095 - and **the whole of that gradient survives
with the effects switched off**, 1.049 to 1.095. It is selection: a team at
high `|m|` is a team that has been scoring, which usually means it is the
better team, or has a hot man, or is facing a poor defence. Run with the meter
live and its effects zeroed, against the meter live and its effects on, the
difference per bucket is -0.025, -0.019, +0.008, -0.002 - inconsistent in sign
and inside a standard error of 0.017 to 0.028. **The causal effect is under
about 0.02 points per possession and 200 games cannot separate it from zero.**

That is what "a very miniscule impact on just about everything" produces, and
it is the specification working rather than failing. It does mean the meter,
not the booster, is what this system actually contributes today. Raising
`MOMENTUM_GLOBAL_AT_FULL` and `MOMENTUM_SECURITY_AT_FULL` until the effect is
detectable pushes steals and blocks past tolerance and would need
`STEAL_SUCCESS_BASE` re-anchored to absorb it; that trade is open and has not
been taken.

**Inert when switched off.** With `MOMENTUM_ENABLED = False` - and with the
hot hand off beside it - 24 seeded games reproduce the pre-momentum hash
exactly.

### The hot hand

A man who has just made three hard shots shoots a little better and looks for
his shot a little more; a man who has missed four shoots a little worse and
handles it a little worse. The pre-game consistency roll still decides what
kind of night he is having - this is the excursion inside the night.

**The meter is fed surprise, not makes.** A make adds `1 - p` and a miss
subtracts `p`, where `p` is the engine's own `final_probability` for that
shot: the number it was about to roll against. A 92% dunk that drops is worth
0.08 and a 33% contested three is worth 0.67, and missing the dunk costs 0.92.
That is difficulty weighting for nothing, off a quantity already in hand, and
it is why a rim-runner cannot go hot by doing his job - three makes in a row
mean nothing from a man who shoots 70%. It is also a martingale,
`E[delta] = p(1-p) - (1-p)p = 0` at every `p`, so the meter has no drift of
its own and no rating or position is favoured.

**The asymmetry is a knockdown, not a weight.** "A miss hurts more than a make
helps" could be had by weighting the miss term, but the drift would then be
`p(1-p)(1-w)`, largest at `p = 0.5`: jump shooters would go cold faster than
bigs, a positional bias smuggled in through the back door. Instead a miss
multiplies a *positive* meter by `HEAT_MISS_KNOCKDOWN`, and a make does the
same to a negative one. Streaks are fragile both ways; the walk underneath
stays unbiased.

**Cold does not stop him shooting.** Hot lifts the shooting ratings and the
appetite to attack; cold lowers the shooting ratings and `ball_security` and
leaves the appetite alone, because a slump from the outside is a man who keeps
shooting. Consistency shades the cold meter only slightly - a 10 takes 0.90 of
what a 5 takes - because `roll_consistency_modifier` already moves the cold
bucket from 40% of nights to 5%, and reading it hard here would count it
twice.

**The ball goes to the hot man.** Without this the appetite was the whole of
it, and an appetite only decides what he does with the touches he was getting
anyway - so a hot man shot a larger share of the same touches and his attempts
did not move. `_select_pass_target` weights a teammate by his touches tendency
in proportion, twice the tendency for twice the passes, so `HEAT_FEED_AT_CAP`
is read the same way: 1.00 is twice the passes while he is at full heat. Hot
only. A cold man is not frozen out, for the same reason he is not talked out
of shooting - that would cut his attempts, which is the one thing cold must
not do.

**The decay was ending spells on the clock rather than on a miss.** At 0.97 a
possession, a man who shoots about every 5.5 possessions lost 15% of his meter
between his own touches - enough to drop him back under the threshold without
ever missing, which is not what a streak is. Spells lasted 1.94 shots, a hot
man was on the floor for 1.0% of pass-target decisions, and shots taken while
hot came to 0.28% of possessions: the system was very nearly inert and
anything built on top of it had nothing to act on. At 0.99 the gap between his
touches costs 5% and a spell fades over a quarter instead.

**Every anchor had to be re-measured when that moved**, which is the lesson
worth keeping. A slower decay leaves a man sitting nearer the threshold
between shots, so a single make tips him over far more often: at the old
constants the same engine gave 1.91 hot spells a team game and a latch every
28, against targets of 1 and 60. Re-measured with the effects switched off, at
decay 0.99, 400 team-games:

| heat | 1.20 | 1.40 | 1.60 | 1.80 | 2.00 | 2.20 | 2.40 | 2.60 |
|---|---|---|---|---|---|---|---|---|
| hot | 3.15 | 1.94 | 1.20 | 0.75 | 0.48 | 0.25 | 0.15 | 0.08 |
| cold | 3.56 | 2.39 | 1.66 | 1.02 | 0.59 | 0.36 | 0.22 | 0.14 |
| reached in Q1 | .488 | .218 | .090 | .058 | .030 | .015 | .008 | .003 |

`HEAT_THRESHOLD` is 1.70, `HEAT_FULL_EFFECT` 2.50, `HEAT_CAP` 4.0 as a clamp
only, and `HOT_LATCH_HEAT` 2.15 on the Q1 column. **Cold runs about a third
more often than hot at every level, and that is right rather than a fault:**
makes are 47% of shots, so runs of misses are commoner than runs of makes and
the meter spends more of its life below zero. It falls out of the martingale
rather than being imposed.

**It is inert when switched off, and that is tested.** With
`HOT_HAND_ENABLED = False`, 24 seeded games reproduce the pre-hot-hand hash
exactly - every score, shot, free throw, turnover and rebound in order. That
test earned its place immediately: it caught a string replace that had matched
a prefix of a longer line and silently dropped `PLAY_WEIGHT_SHOOT` out of the
shot weight. Without it, that would have shipped as a hot hand.

240 real-roster games, against the same games with it off:

| | off | on | NBA |
|---|---|---|---|
| hot spells a team game | - | 0.94 | aimed at 1 |
| cold spells a team game | - | 1.36 | |
| first-quarter latches | - | 1 per 69 team games | aimed at 1 per 60 |
| shots taken while hot, a game | - | 1.43 | |
| 40-point games a game | 0.067 | 0.062 | 0.108 |
| points | 117.34 | 117.22 | 115.0 |
| FG% | 48.12 | 47.91 | 47.1 |
| runs of 6+ | 9.01 | 9.06 | 9.03 |
| longest run | 11.73 | 11.87 | 11.85 |

**It does not fatten the scoring tail, and it cannot.** That was the
acceptance test this section was first written against, and it was the wrong
test. Two sweeps falsified it independently: four times the feed moved
40-point games 0.060 to 0.070, and eight times the volume of shots taken while
hot (through the decay, 0.70 a game to 5.69) moved them not at all. A spell is
a two-shot event - `HEAT_MISS_KNOCKDOWN` 0.55 against a 47% make rate gives
`1/(1-0.47)` shots before it dies - and a two-shot event that happens once a
team game cannot move a season rate whatever multiplier sits on it. The
fragility is the specification working, not a defect.

The gap is somewhere else, and it is worth naming so nobody tunes this at it
again. A 40-point game is high volume *and* good efficiency across a whole
game, which is a game-level property. `roll_consistency_modifier` already
decides how *well* a man shoots on a given night, across a range of 0.72 to
1.25, and nothing anywhere decides how *much* - so a great night and a busy
night are uncorrelated in this engine, where in the league they are the same
night. The ceiling is not usage: the top scorer's attempts already reach 33 at
the 99th percentile and 35 at most, and the sim produces Luka at 50 on 29
attempts. Letting the pre-game roll shade volume as well as accuracy is the
change that would close it, and it belongs to that system rather than this
one.

### The slingshot, and the close-game rate

The trailing team's boost was three things wrong at once, and fixing them
moved the margin distribution onto the league.

**It was not a comeback, it was a stop.** `_booster` is added to every 1-99
attribute, so boosting the team behind also sharpened its block, steal,
deterrence and defensive rebounding - and the leading team's offence came
down with it. No rating on the leading team was ever cut; it did not need to
be. It reaches `player.OFFENSIVE_ATTRIBUTES` only now, 33 ratings a man uses
with the ball. The physicals are out, because speed, agility, strength,
vertical, reaction time and hands are read by both ends.

The defensive half had been most of the effect, and it had been inflating
three counting stats. All three fell onto their anchors without it: blocks
5.09 to 4.83 against 4.8, steals 8.53 to 8.36 against 8.4, defensive rebounds
32.92 to 32.35 against 32.2.

**The ceiling bounded nothing.** `_update_boosters` re-applies the slingshot
every possession, it added, and `clear_boosters` only runs on a substitution,
so it accumulated between subs - 4.80 delivered against a `SLINGSHOT_MAX_BOOST`
of 2.50. It is assigned to its own field now. The median non-zero delivery was
0.90, so the overrun was the tail rather than the rule.

**A point of offence is not a point of everything**, so the ceiling was
re-anchored rather than kept. A flat boost assigned all game with no deficit
gate, 120 games an arm, mean margin over a control: global 2.5 moved it +6.65,
scoped 3.0 +5.82, scoped 5.0 +11.12, scoped 7.0 +14.81. So 3.3 scoped is where
global 2.5 was, and a team 30 down gets what it always got.

**The onset is set on the close-game rate.** The NBA ends 24.0% of games
within five points and 30.5% by twenty or more (200 games of 2025-26
play-by-play). Help only makes a close game where the deficit is already
small - a boost at 25 down turns a 28-point loss into a 22-point one and never
reaches the bucket - so the onset, not the ceiling, is what that number
answers to. 240 real-roster games an arm, ceiling pinned throughout:

| onset | 14 | 10 | 6 | 3 | **0** | off | NBA |
|---|---|---|---|---|---|---|---|
| games <= 5 pts | 15.8% | 16.2% | 18.8% | 21.2% | **22.9%** | 17.9% | 24.0% |
| games >= 20 pts | 27.1% | 30.6% | 25.0% | 26.7% | **22.5%** | 33.8% | 30.5% |
| final margin | 15.47 | 15.53 | 14.82 | 14.59 | **13.43** | 16.38 | 14.53 |
| points | 116.1 | | | | **117.3** | | 115.0 |

Onset 14 read *below* switching it off, because it had moved every point of
help out of the band that manufactures close finishes and into the band that
only shaves blowouts.

**What it costs, and it is not nothing.** Blowouts run 22.5% against 30.5%,
and league scoring is 117.3 against 115.0 - the highest it has read. An
offence-only comeback adds points to the league by construction, where the
old global one gave part of its help back as stops. Onset 3 is inside onset
0's noise on the close-game rate (21.2%) with the margin exactly on the
league at 14.59 and blowouts at 26.7%, and is one constant away.

**Lead changes are untouched by any of this** - 5.8 to 6.5 against the NBA's
4.06 across every setting tried, including switching it off. That gap is not
the slingshot. It is the clearest thing a momentum system could aim at, and
the endgame behaviour the engine did not have - trailing teams fouling and
pushing, leading teams milking clock, timeouts - is the honest route to both
it and the close-game rate this constant is currently standing in for. That
endgame is built now (*The last seconds*, *The last minutes*, October 2026),
and with it the close-game rate went from 23.5% to 22.6% at onset 0 over
3000 games, and the blowouts from 29.7% to 28.2% (*The last minutes*): the
slingshot is due a look the next time the calibration is run.

### Ratings the engine never reads

**Done, September 2026: every rating is read.** This section tracked the
attributes and tendencies built by
`ratings_build`, carried in `players.csv`, and read by no live code. A rating
nothing reads is worse than a missing one: it looks set, it survives every
refresh, and it silently makes every player identical at whatever it was
meant to describe.

Found by scanning every live module for `attr("x")` and `tend("x")`, then
checking each candidate by hand - two were reached through an f-string key
(`tend(f"tend_{suffix}_dunk")`) and are live despite never appearing as a
literal. Re-run that scan after any pass that moves a system; five ratings
were orphaned by the rebounding rewrite and nothing said so.

The last two, `shot_3_deep` and `outlet_pass_frequency`, are live - see *The
deep three* and *The outlet* below. What follows is the history of how each
was found and wired.

**The three shot children are live now, and for real players they change
nothing - this section used to say the opposite.** Until September 2026 nothing
read the catch-and-shoot or off-dribble ones, and this section called that the
worst thing here and said a 95 catch-and-shoot played like a 50. It does not, because
`ratings_build/mapping.py` maps all three from the same 2K field as the
parent - 2K has one three-point rating, not two - so for 557 of 580 players the
child is byte-identical to the parent and a man with a 95 catch-and-shoot also
has a 95 three. Nothing is lost. The 23 that differ are customs typed by hand.

Deriving them from real splits instead would write noise into ratings. From the
tracking tables in the stats cache, each man's catch-and-shoot 3P% minus his
pull-up 3P%, among players with 60 attempts of each:

| | players | spread of the gap | binomial noise in it | true spread |
|---|---|---|---|---|
| 2025-26 | 119 | 5.5 pts | 5.5 pts | **0.0** |
| 2024-25 | 128 | 5.6 pts | 5.6 pts | **0.0** |

and a man's own gap repeats year to year at **r = -0.04** (77 players). Who is
better off the catch than off the dribble, relative to the league, is noise at
every sample the data offers. So the children stay equal to the
parent for real players, and the few that matter are pinned by hand in
`overrides.csv` - a real player's sheet value is overwritten on every build.

**What was real, and missing, was the league's own gap - fixed below.** See
*Catch-and-shoot against pull-up*. (This section once quoted the league at
39.0% and 33.3%. Those were volume shooters, not the league.)

**The five the rebounding rewrite orphaned are live again** as of September
2026: `block_attempt` (see *Blocks: going up for it*), and `crash_for_board`,
`offensive_rebound_aggression`, `boxout_strength` and `swim_move` (see
*Rebounding: who goes, and the fight for the spot*). `predetermined.py`'s
nudges on them, which had been writing onto keys nothing read, take effect
with them.

**`block_attempt` is live** as of September 2026 - see *Blocks: going up for
it* below - and with it `predetermined.py`'s nudge on it, which had been
writing a multiplier onto a key nothing read.

**`rolling`, `shot_3_off_screen` and `drive_off_screen` are live** as of
September 2026 - see *The pick-and-roll* below. The two comments that said the
off-screen action used `shot_3_off_screen` are corrected: its runner is chosen
on `play_off_screen`, and `shot_3_off_screen` is the on-ball screen's three.

**`standing_layup` is live** as of September 2026 - see *Standing and
driving layups* below.

**`tend_standing_layup` is live** too - both call sites of
`_wants_to_look_for_layup` passed `driving=True`, so the standing branch was
reachable and never reached. See below.

**`effort_vs_rivals` is live** as of September 2026, along with the rivalries
tab's `intensity` column, which nothing read either - see *Rivals* below.

**`close_shot_from_post` and `post_fadeaway` are live** as of September 2026 -
the post-up had to be rebuilt first, because it never took a hook or a
fadeaway at all. See *The post-up* below.

`outlet_pass_frequency` was the last, documented in `ratings_build/README.md`
as forked for later; it is live now.

### Catch-and-shoot against pull-up

**Every pull-up three was three and a half points too easy.** The league makes
its catch-and-shoot threes at **37.1%** and its pull-ups at **32.9%** - every
player, GP-weighted, 26.5 and 9.9 attempts a team game (2025-26; 2024-25 reads
37.3 and 32.9). The sim made the catch-and-shoot at 36.85%, inside half a
standard error of the league, and the pull-up at 36.5%. Both volumes were
already right. So one constant, `PULLUP_THREE_MULT`, on the pull-up three's
base probability, and nothing on the catch-and-shoot. The two together make the
league's own 36.0%, so fixing the pull-up brings league 3P% onto the NBA rather
than past it. Two-point jumpers needed nothing: the league's catch-and-shoot
two beats its pull-up two by 1.66 points and the sim's already did by 1.51.

**Pull-ups are too few to calibrate on one run.** At 9.7 a team game the same
code read 36.50, 34.59 and 35.34 on three seed ranges. So it is set off every
point measured, each against its own baseline on the same seeds:

| seeds | games | x1.000 | x0.950 | x0.935 | x0.902 | x0.880 |
|---|---|---|---|---|---|---|
| 9000+ | 300 | 34.59 | | | 31.43 | 30.33 |
| 10000+ | 400 | 35.34 | 34.08 | 33.79 | | |

x0.902 lands 1.5 under the league and x0.935 0.9 over; between them, 0.92. At
x0.935 on 400 games: catch-and-shoot 37.00% against 37.12, pull-up 33.79%
against 32.92, league 3P% 36.12 against 36.0, runs of 6+ 9.02 against 9.03.

**It does not touch league FG% or points.** Both sat still at every value -
47.7 and 116.8 - because pull-ups are about 11% of attempts and that caps the
effect near 0.15 of FG%. An earlier estimate here said it would absorb the
putback's 0.39; it was an extrapolation from one noisy run, and it does not.
The scoring overrun is the slingshot's and the putback's.

**The children are wired, and change nothing for real players.**
`_jumper_rating` reads the catch-and-shoot or off-dribble child by how the shot
was taken - see `JUMPER_CHILD_RATING`. 2K has one three-point rating and one
mid-range rating and `ratings_build` copies each into its children, so for
557 of 580 players the child *is* the parent; with the constant pinned to 1.0
the new code reproduces the old hash exactly. It is there for a custom typed
away from the parent, or a real player pinned in `overrides.csv`. **A child left
empty on the sheet does not fall back to the parent**: the loader fills an
empty cell with 50 before the engine sees it, so an empty catch-and-shoot on
an 85 shooter makes him a 50 off the catch.

### Standing and driving layups

Every layup read `driving_layup` until September 2026, so a putback, a
dump-off and a step-through from the block were all rated as drives. Each
context now reads its own rating, decided by `_rim_context` - the function
that already sizes the dunk window - rather than by the shot's `finish` tag,
which says DRIVING on nearly every layup in the game, putbacks included.
Drives, transition runs and cuts read `driving_layup`; roll catches,
dump-offs, putbacks and laid-in lobs read `standing_layup`. See config's
`LAYUP_RATING_BY_CONTEXT`.

**Cuts stay driving, on the evidence.** A cut is a man in motion, and the
sim's cut layups already make 67.9% against Synergy's 67.3% for every cut in
the league. The men who cut are rated 80.1 driving and 73.5 standing, the
widest gap of any context, so routing them to `standing_layup` would have
knocked a context off its number.

**No new anchor.** Across the standing contexts the two ratings average 77.99
and 77.75, so `LAYUP_ANCHOR` holds the level to a quarter of a rating point
and what changes is who converts. 300 real-roster games an arm, same seeds, a
frozen sheet:

| standing finishes, by the shooter's `standing_layup` | before | after |
|---|---|---|
| under 70 | 63.2% | 54.0% |
| 70-80 | 64.6% | 63.7% |
| 80 and over | **57.5%** | 61.1% |

The before column is the bug: the men with the best standing layup were the
worst standing finishers, because they were being judged on a driving rating
that for a big is usually the weaker of the two. League FG% 47.96 to 47.87;
driving layups 59.5% to 59.5% on 34 attempts a game. Putbacks moved 58.9% to
56.1% against Synergy's 57.4%, from a point and a half over to a point and a
quarter under, both inside a standard error - and the putback is the next thing
rebuilt. Forcing every context back to `driving_layup` reproduces the old hash
exactly.

**The `finish` tag was wrong on almost every layup, and is right now.**
`_resolve_close_shot_selection` is handed how the man got to the rim and then
threw it away: it stamped `DRIVING` on every layup it returned, rolled the
fallback's tag off `tend_driving_layup` read as a percentage, and asked the
layup question with `driving=True` whatever it had been told. The rating was
never affected - `_resolve_shot` routes on the caller's gather, and that was
right all along - but every report that reads `finish` was reading noise, and
`tend_standing_layup` never fired. All three now come from
`LAYUP_RATING_BY_CONTEXT`, so the rating, the tag and the tendency cannot
disagree. 300 real-roster games either side, a frozen sheet:

| layups, per game | before | after |
|---|---|---|
| standing context, tagged STANDING | 0.31 | 7.20 |
| standing context, tagged DRIVING | 6.98 | 0.00 |
| driving context, tagged STANDING | 0.50 | 0.00 |

Standing finishes went from 4% correctly tagged to 99%. The mix hardly moved -
catch layups 3.24 to 3.28 a game, putback layups 3.33 to 3.37 - because across
the league the two layup tendencies sit close together; it is individual men
who differ. League FG% 47.83 to 47.60, runs of 6+ 9.07 to 8.92.

### Putbacks

**Who goes back up with it was backwards.** The scramble multiplied the
rebounder's ordinary attack appetite - his shot and drive tendencies - by
`PUTBACK_ATTACK_MULT`. Against Synergy's own putback frequency for 134 real
players that appetite correlates at **r = -0.60**: the high-appetite scorers are
exactly the men who almost never put one back, and the real crashers carry low
appetites and were passed over. The mean of his standing-dunk tendency and his
offensive-rebound aggression correlates at **+0.70**, and the scramble reads that
now, scaled by its measured mean so the league's rate does not move.

**The `putback` rating is an offset, because it is not a skill of its own.**
`ratings_build` makes it the mean of `standingDunk` and `offensiveRebound`, and
for 553 of 580 players that is exactly what it is - so it says nothing those
two ratings do not, and reading it straight would count both twice. It also
has no bearing on athleticism (r = -0.05 against `vertical`). What it is kept
for is a custom typed away from that mean: the difference widens or narrows
his putback dunk window. Eighteen customs carry a difference of 3 or more, and
two NBA rookies - Noa Essengue (+15) and Tyler Nickel (-7.5) - whose 2K putback
does not match the mean.

Much of the rest of the design was already true. The layup window is the big
one - 3.37 putback layups a game to 0.60 dunks - and the dunk window reads each
man's real dunk rate, so it is the real crashers who dunk them; a putback layup
has read `standing_layup` since the section above.

300 real-roster games either side, a frozen sheet:

| | before | after | NBA |
|---|---|---|---|
| **per-player putbacks against Synergy's, r** | 0.626 | **0.799** | |
| putback FG% | 53.65 | 55.40 | 57.4 |
| putback dunks, share of every putback | 6.8% | 8.6% | |
| putback attempts a team | 3.91 | 3.84 | 4.2 |
| league FG% | 47.58 | 47.97 | 47.1 |
| attempts a team | 89.44 | 88.79 | 88.6 |

**It costs 0.39 of league FG%**, which is inside the tolerance the rest of the
box score keeps but further from the league. The likeliest reason is that a
guard who comes down with a board no longer fires a scramble shot off his
scoring appetite; he gets it out, which fits attempts falling 0.65 a team. It
is not yet decomposed. The catch-and-shoot and pull-up constant in *Ratings the
engine never reads* is a league-level recalibration that moves FG% anyway, and
is where this should be absorbed. Putbacks themselves still run a little light,
3.84 against 4.2.

### The post-up

**It never took a post shot.** The post-up picked its finish by how far out it
ended: a layup inside 5 ft, a jumper from 5 to 15. It started up to 14 ft out,
the entry closed 1.8 ft of that and a back-down or a move 2 to 5 more, so it
ended 6 to 12 ft out and **93% of post shots were jumpers**, at 36%. The move was
chosen and then ignored: `_resolve_post_move` picked a hook, a spin, a drop
step or an up-and-under, wrote it on the event, and nothing read it. The
`HOOK_SHOT` and `FADEAWAY` shot types existed and were never assigned, so
`close_shot_from_post` and `post_fadeaway` were read by nothing.

**The finish is the move now, not the distance.** A layup or hook taken *in*
the post rates on `close_shot_from_post`, and a face-up that leaves the post
is something else:

| what he did | the shot | rated on |
|---|---|---|
| a back-down, drop step, up-and-under or spin that worked | layup or dunk, 2-5 ft | half `close_shot_from_post`, half `standing_layup` (layup); the dunk window |
| the hook, or any move that did not work | hook, 5-9 ft | `close_shot_from_post` |
| the fadeaway | fadeaway, 8-14 ft | `post_fadeaway` |
| face-up, then the jumper | jumper, 10-16 ft | `mid_range_jumper` |
| face-up, then the drive | a drive, off the post | the drive's own finishes |
| face-up, then a step-through | layup without a dribble | half `close_shot_from_post`, half `standing_layup` |

A post finish has its own rim context, `"post"`, so the layup rating and the
dunk window agree on what it is. The dunk used to read `tend_standing_dunk` as
a percentage and run its own rim check outside the calibrated window; it asks
the same window every other finish does now. `BLOCK_SHOT_TYPE_MULT` had
entries for the hook and the fadeaway all along, and they are reached for the
first time.

**The anchors, from 200 real games.** Basketball-reference's play-by-play
names the shot and its distance, and 200 games of 2025-26 give:

| real, 2025-26 | a team a game | FG% |
|---|---|---|
| hooks, all | 2.26 | **47.0** (+-1.7) |
| hooks, 5-9 ft | 1.42 | 48.2 (+-2.1) |
| 2-point jumpers, 8-14 ft | 10.27 | **46.5** (+-0.8) |
| Synergy post-up, 2025-26 | 2.56 FGA | **52.7** |

The hook's base is set on the first line. **The fadeaway's is a ceiling, not a
fit**: it is `SHOT_IN_PAINT_BASE`, the league's own jumper from that range,
because a fadeaway is the harder shot from the same spot and should not beat
46.5%. The post contest does the rest - a fadeaway keeps 0.64 of its base
through it, a hook 0.80 - and it lands near 35%.

**That settled the one thing no source splits: how often a post-up fades
away.** The four phase weights are each his own tendency, all four built from
an attribute centred on 50, so the average post player faded on a quarter of
his post-ups and a third of his post shots. With the hook on its real rate and
the fadeaway under its ceiling, that mix cannot reach the league: 46.8%.
Getting 52.7% out of it would need the fadeaway to make 46% or better - to
beat the average jumper from its range - on a base of 0.77 or more. So
`POST_FADEAWAY_PHASE_W` scales the fadeaway against the other three and is
**the one number fitted to the aggregate**.
Taking fadeaways away does not hand them to the hook - the post-ups it frees go
to the back-down and the moves, which mostly work and end at the rim:

| fadeaway weight | post FG% | fadeaways | finishes at the rim |
|---|---|---|---|
| 1.0 | 46.8 | 32% | 33% |
| 0.5 | 49.5 | 19% | 38% |
| 0.35 | 51.9 | 15% | 41% |
| **0.25** | **52.5** | **11%** | **43%** |
| 0.20 | 53.2 | 9% | 44% |

The bottom three are the same 1200 games, the top two 400, all at the
first foul correction below. Each is about +-0.9 on 1200 games and +-1.5 on
400, so 0.25 is good to about 0.1.

**The fouls moved, and not mainly because of the hooks.** Post-up shooting
fouls came to 18.7% of post-up plays against Synergy's 14.1%, with the
weight at 0.35. Two-thirds of them are the per-tick foul during the post-up,
not the shot's own roll. The fadeaway jumps straight to the finish and almost
never meets it; the moves that replaced it spend their ticks in the phases
that draw it. Both halves came
down by the same ratio, as they did the first time: 0.75, then 0.94 more once
the weight settled at 0.25, which drew a little more of it -
`PLAYTYPE_FOUL_MULT["postup"]` 0.69 to 0.48, `POST_FOUL_PER_TICK` 0.0072 to
0.0050. 14.2%.

1200 games either side on a frozen sheet, the same seeds (the fouls 800):

| | before | after | NBA |
|---|---|---|---|
| **post-up FG%** | 38.4 | **52.3** (+-0.9) | 52.7 |
| post shots that were jumpers | 93% | 31% | |
| hooks, a team | 0.00 | 0.33 at 45.2% | |
| fadeaways, a team | 0.00 | 0.15 at 35.1% | |
| layups and dunks off a post-up, a team | 0.10 | 0.57 | |
| post-up FGA a team | 1.47 | 1.32 | 2.56 |
| **post-up shooting fouls, of plays** | 12.2% | **14.2%** (+-0.7) | 14.1% |
| league FG% | 47.44 | 47.72 | 47.1 |
| points a team | 116.2 | 116.8 | 115 |
| free throw attempts a team | 23.6 | 23.7 | |
| turnovers a team | 13.76 | 13.72 | |
| runs of 6+ a game | 8.98 | 8.94 | 9.03 |

(The 31% of jumpers is the face-up jumper and the fadeaway, which are
jumpers.)

**Two costs, both known.** The post scores what it should now, so it adds
0.28 to a league FG% that already runs over, and 0.6 points; that belongs to
the scoring pass the slingshot and the putback are waiting on. And **post-up attempts fell from
1.47 to 1.32 a team, against a real 2.56.** A fadeaway is chosen at the sixth
tick and shot at the seventh, and the post-up's one read of the double team -
and of the turnover - waits for 45% of a post-up that runs 16 to 34 ticks, so
no fadeaway has ever been passed out of or lost. Fewer fadeaways means more
post-ups reach that read, and more of them end in a pass. That the fadeaway
skips the read is a quirk of its own, and left alone here: making it wait
would cut the volume further. The volume was already half the league's
before this - *Drives, post-ups and isolations* has post-ups starting at a
third of the real post-touch rate - and it is that start rate, not the
finish, that needs the next look.

### Rivals

**A rivalry has two halves, and they are independent.** `rival_factor` is how
*well* he plays against his rival - rating points, through the booster, as it
always was. `effort_vs_rivals` is how *much* of the game he tries to take - his
touches and his shots - and nothing read it. A man can want the ball badly
against a rival who locks him up anyway (5-for-11 becomes 5-for-17), or play
well without forcing it (4-for-6).

Both are scaled the same two ways:

| | scale |
|---|---|
| rival's team is the opponent, or a rivalry with a whole team | 0.5 |
| rival on the floor | 1.0 |
| the two guarding each other | 1.5 |
| the rivalry's own `intensity`, 1-10 | intensity / 8.5 |

**`intensity` was dead too.** The rivalries tab rates every rivalry and the
loader read the column into a dict that nothing looked at. 8.5 is the baseline:
there `rival_factor` plays exactly as it always has, a 10 gets 18% more, a 7
18% less and a 5 41% less. All 173 real rivalries on the Sheet carry one. A
blank read as 5 before; now that it means something, a blank reads as 8.5.

**The volume.** Effort against the pivot of 50, over a span that puts the
Sheet's highest - 90 - at the full effect: at 90, his rival on the floor,
intensity 8.5, about **40% more shots** (`RIVAL_EFFORT_SHOTS_AT_MAX`, 0.45 at
first). Low effort is the mirror. Nothing measures a player's effort against one
opponent, so the scale is the user's, not the league's.

**It had to go where the shots come from, not where it was easy to hook.**
Hooked where the hot hand is - the touch read's appetite and the pass target -
even the full multiplier on both moved his shots by less than half of it:
x1.45 gave x1.19. The rest of his volume comes through the man who brings the ball up,
the play call and the catch-and-shoot trigger, which carried on as if nothing
were happening. So it goes onto his touches weight and his shot weight
themselves, which all five read, and `RIVAL_EFFORT_EXPONENT` is fitted so the
shots he really takes move by the multiplier:

| exponent | x1.45 gives | x0.685 gives |
|---|---|---|
| 1.0 | x1.32 | x0.74 |
| **1.4** | **x1.42** | **x0.65** |
| 1.5 | x1.48 | x0.64 |
| 2.0 | x1.61 | x0.55 |

300 rivalry games each, a multiplier held on every man with a rivalry, against
the same games without. The other players in those games give up most of what
he takes: x0.83 of their shots at x1.45.

**Two real rivalries**, 200 games each, the same seeds with effort on and off:

| | FGA | FG% | points | minutes |
|---|---|---|---|---|
| Luka Doncic v the Suns (Booker), effort off | 22.5 | 52.3 | 34.3 | 33.9 |
| ...effort 79, intensity 9 | **29.8** | 51.3 | **44.0** | 33.7 |
| Joel Embiid v the Nuggets (Jokic), effort off | 8.6 | 50.6 | 13.6 | 24.1 |
| ...effort 35, intensity 8 | **6.6** | 50.9 | **10.0** | 23.9 |

The volume moves and the efficiency does not, which is the design. The table
is at 0.45. Luka's 44 a night against Phoenix is why it came down to 0.40,
which reads 34.2 to 44.7 once the guarding tier is real (below): a tenth off
the effect is about a point for him, because he carries every multiplier at
once - effort 79, intensity 9, and guarding Booker at 1.5.

Across the league it does not show, and should not: over the same 1200
random-pairing games as the tip-off fix, FG% 47.63 to 47.64 and points 116.67
to 116.70. Rivalry games are rare, and the shots change hands rather than
appearing from nowhere.

**The guarding tier is real now** - see *Who guards whom*. The table above was
measured before it was, when "guarding each other" meant "play the same
position". With Luka and Booker really on each other it read 33.4 to 45.4
points on 53% shooting at 0.45, and 34.2 to 44.7 at 0.40. The guarding tier,
1.5 until then, came down to 1.25 (`RIVAL_TIER_GUARDING`, which scales
`rival_factor` too): 32.8 to 41.6, against 43.0 at 1.35. The other two tiers were already current: a
substitution by either side rebuilds every booster on the floor, and since
the tip-off fix so does the opening tip.

### Who guards whom

**Nothing the matchup code decided ever reached a game.**
`Team.assign_defensive_matchups` built its assignments into a local dict and
dropped it - the docstring said "Returns dict" and there was no return - and
every possession `_build_defensive_assignments` set a plain position match,
PG on PG, which also wiped the rival override. So the Sheet's matchup ratings
(`ins_off`, `per_off`, `ins_def`, `per_def`, loaded for every player) decided
nothing, and the `matchup: yes` column did nothing either. Three smaller
gaps sat around it: a substitution re-matched only the team that made it,
though the other side is guarding different men too; quarter-break and
injury substitutions rebuilt no boosters; and nothing was matched at tip-off.

**Rebuilt to the user's rules:**

- **The gate, on all five pairs at once.** A defender must play 3.0 or better
  at a position his man plays at 7.0 or better (3.5 at first - see below). Every league player has at
  least one 7.0 position; 43 have two, and for them one is enough
  (`MATCHUP_GATE_EVERY` asks for both).
- **The matchup ratings decide.** Each pair is worth his man's threat - the
  better of ins_off and per_off - times his defence where the man attacks,
  ins_def and per_def weighted by the man's own ins_off and per_off. Summed
  over the five, that puts the best defenders on the biggest threats and
  hides the weakest on the least.
- **Length is a small factor.** A mismatch in mean height and wingspan costs
  0.08 of defence an inch, so it decides only between defenders who are close
  on the ratings: six inches is worth half a point, on ratings whose spread is
  nearly two.
- **Rivals marked `matchup: yes` guard each other** whenever the gate allows.

All 120 assignments are scored and the best taken, rather than handing out
defenders one threat at a time - a greedy pass can spend the only man who can
guard their centre on their best wing. It runs on every lineup change, for
both teams, through one method (`_lineups_changed`), and each possession only
checks that the assignments still cover the ten men on the floor. Over 100
games that check never had to act.

**Matchup profiles from the ratings** (`matchup_ratings.py`, 2026-10-08).
The four numbers were formulas on the Sheet's team sheet tab, and they leaned
on size and position: every man who could play a position defended it about
alike, a man whose defensive ratings were never typed was a 5.0, and a centre
who finishes lobs was as big a threat as the league's best scorers -
Zubac 7.7, Gilgeous-Alexander 7.7, on a scale that topped out under 8. They
are read from his ratings now, on the archetypes' own composites
(`roles.raw_features`) standardised against the league's NBA men:

- **po**, perimeter offence: threes off the catch and the bounce, the
  mid-range, his handle, finishing a drive - and his *volume*.
- **io**, interior offence: the post, finishing a drive and at the rim,
  strength, how much he posts up - and his *volume*.
- **pd**, perimeter defence: perimeter defence above all, with his hands and
  his quickness.
- **id**, interior defence: interior and post defence and rim protection,
  height a little.

*Volume* is how much of the offence he is - how often he shoots, how much he
makes his own, his touches - so a dominant scorer is a threat wherever he
attacks and a man who finishes what he is given is not, however well. All
four are scaled to a mean of 5.0 and a spread of 1.6 over the NBA's men, one
scale, so a threat inside and a threat outside compare, and kept to 1-10. The
top threats now are Embiid, Giannis, LeBron, Jokic, Jaylen Brown, Kawhi,
Edwards, Davis, Gilgeous-Alexander, Wembanyama and Tatum; Zubac is 7.1,
Gobert 4.0. The wider scale doubled 20% more pick-and-rolls and 40% more
post-ups and switched 15% more screens, so those rates are scaled to do what
they did (`DOUBLE_*_RATE`, `SCREEN_DEF_SWITCH`). Over 100 paired real-only
games the league then scores about 1.5% less, its field-goal percentage 0.9
of a point lower: the best defenders now guard the biggest threats rather
than whoever plays their position - the calibration loop takes that up.

**What it does, over 100 games:**

| | before | now |
|---|---|---|
| defenders on their positional counterpart | all | 55% of slots |
| possessions with all five on the position match | all | 20% |
| `matchup: yes` rivals guarding each other | 36% | 72% |
| all five pass the gate on natural positions | - | 59% |
| all five pass it with the failsafe | - | 89% |

**The gate cannot always hold, and it is not the lineups' fault.** The
rotation keeps someone rated 5.0 or better at every position on 86% of
possessions, and 4.0 or better on 93% - so there is nearly always a man for
every spot. But the gate reads a man's *natural* positions, his 7.0s, not the
one he is playing, and lineups play men out of them: the Cavaliers' small
five has Porter (PG), Harden (PG/SG) and Merrill (SG, playing SF at 2.5),
with Hezonja (SF) at forward - three natural guards against a Philadelphia
five with two men who can guard one. 88% of failures are that, with both
sides' coverage intact; the other 12% are an attacker nobody on the floor can
guard, and every one of those is a defence the rotation left without a 5.0
somewhere. The Sheet is narrow too - 78 league players are 3.0 or better at
one position, 326 at two, 46 at three or more - so the misses are big: 78%
are short by 2 or more. At 3.5 the gate failed on 45% of possessions; at 3.0, 41%. When no
assignment gets all five through, it gets as many as it can and takes the
nearest misses.

**The failsafe, and only that.** When no assignment gets all five through on
natural positions, a defender may also pass by playing the position his man
is playing now - which the rotation's coverage nearly always provides - and
the assignment keeps as many natural passes as it can. When the gate as
written can be met, nothing changes: with `MATCHUP_GATE_FAILSAFE` off the
code reproduces the version before it game for game. It is needed on 41% of
possessions and takes the all-five share from 59% to 89%; most of what is
left is a real coverage hole. It leans on the position match a little more -
all five on it 25% of the time rather than 20%. Within the failsafe a rival
pair comes first, so long as the pair itself passes natural-or-current - put
second, behind getting all five through, the locks held 64% of the time; first,
72%, and the all-five share did not move. What is left of the gap is
possessions where the gate as written can be met, and keeping the rivals
together would break it for someone else: the gate as written comes first.

**League totals do not move** - the average defender is still average - but
where the good ones stand does, and that moves both ends toward the league.
1200 games either side, the same seeds, against the same players' real
2025-26 FG%:

| | real | before | now |
|---|---|---|---|
| league FG% | | 47.64 | 47.61 |
| points a team | | 116.70 | 116.55 |
| top 25 scorers' FG% | 49.1 | 51.2 | **49.7** |
| the next 50 | 48.1 | 48.4 | 48.3 |
| everyone else | 47.5 | 46.7 | **47.8** |

The position match was letting the stars shoot two points over their real
numbers and holding everyone else under theirs. Nothing was tuned toward
this; it is what happens when the stopper guards the star. That table is
before the failsafe. With it, ranked by that run's own scoring, the top 25
shoot 50.0 against a real 48.8 and everyone past the top 75 47.5 against
47.7 - a little of the correction handed back, because the failsafe leans on
the position match, and still well inside where the position match left
them.

### The pick-and-roll

**It ran at 63% of the league's volume for the handler and 48% for the roll
man, and three of its ratings did nothing.** Synergy, 2025-26: the handler
takes 12.2 shots a team game, about 32% of them threes (the table has no 3PA
column, but its makes are exact - 2 x FGA x (eFG - FG%) - and the league's
pull-up 3P% turns them into attempts), and the roll man 4.3 at 52.3%. The sim
had 7.7 and 2.1.

**The read.** A screen that works is four options, each his own tendency
against the league's: drive (`drive_off_screen`), look for the three
(`shot_3_off_screen`, only within a step-back of the arc - 88% of screens are),
pull up for two (`shot_mid_off_dribble`), or hit the screener. The three and
the two used to be one "shot" whose zone `_take_shot` rolled again from his
shot shares, so the read never decided where he shot from; they are kept as
chosen now, through the same shot path, so the clock and the contested
jumper still have their say. `drive_off_screen` differs from
`drive_frequency` for 66 of the league's players - values typed on the Sheet -
and is otherwise the same.

**`shot_3_off_screen` is re-sourced** in `ratings_build`, from Synergy's
on-ball P&R table: his share of pick-and-roll shots that were threes. It was
the off-ball "Off Screen" play type, a different skill. Curry 62%, Edwards
47%, Luka 45%, Brunson 33%, SGA 21%, DeRozan 4%, Gobert and Zion 0. **It takes
effect when the ratings are rebuilt and pasted**; until then the Sheet's column
is the old one. See `ratings_build/README.md`.

**The roll man is open or he is not.** His `rolling` against the man guarding
him - agility and interior defence - each against its league mean. The pass
used to be a flat chance whoever the roller was, and he inherited the
handler's screen openness. An open roller is thrown to about three times as
readily as a covered one and goes straight up with it from 3 to 8 ft; he had
been sent through the catch read like any catch, and only about three in ten
passes to the screener became his shot. A covered roller is caught short and
finishes through his man, as a heavier contest - the openness bonus may now
be negative, only this sets it, and a pass clears it so a teammate never
inherits it.

**The pop was broken.** It went to uniform(20, 26) - inside the arc half the
time, where a catch almost never shoots - and read as a swing, so threes were
12% of the roll man's shots against the league's ~32%. It goes to the arc as
often as his jumpers are threes now, otherwise to the elbow, and is caught
like the kick-out it is.

**The drive was the constraint.** A screen call takes the place of a drive in
the attack read, so calling screens at the league's rate and pulling up off
them cost the league seven drives a team game. The NBA's pick-and-roll is
how its handlers drive, so the drive carries the most weight in the read, and
a screen that did nothing is now often *rejected* - he turns away from it and
drives - where every failed screen, 28% of them, used to stand and re-read.
That gives the drives back.

1200 games either side, a frozen sheet with the re-sourced tendency, the same
seeds:

| | before | after | NBA |
|---|---|---|---|
| **P&R handler attempts** | 7.7 | **12.4** | 12.2 |
| ...share that are threes | 24% | **32%** | ~32% |
| ...FG% | 45.1 | 44.6 | 42.3 |
| **P&R roll man attempts** | 2.1 | **4.4** | 4.3 |
| ...FG% | 55.1 | 53.5 | 52.3 |
| ...share that are threes | 25% | 26% | ~32% |
| tracked drives | 43.6 | 42.7 | 66.1 |
| free throw attempts | 23.7 | 23.7 | 23.4 |
| league FG% | 47.49 | 47.40 | 47.1 |
| attempts a team | 89.4 | 90.5 | 88.6 |
| points a team | 116.4 | 117.5 | 115 |

Shooting fouls hold: the handler draws them on 10.1% of his plays (9.3%), the
roll man on 8.9% (10.9%). Per player, handler volume against Synergy's reads
r = 0.69 and the roll man's 0.55 - who rolls is who screens, and `rolling`
decides whether he is open, not whether he is the screener.

**Two costs.** The handler still shoots 2.3 points over Synergy: the read is
right and the shots are not - the sim's pull-ups and drives score what they
score wherever they come from, and 6 of screen openness (it was an unfitted
20) is as low as it helps. And **the league scores 1.1 points more**, on 1.1
more attempts at a lower FG%: the pick-and-roll ends in a shot where it used
to end in a reset. Both belong to the scoring pass.

### Blocks: going up for it

**A defender goes up for the block or stays down with his hands up, and he
decides before the shot.** No block without an attempt. `block_attempt` had
been read by nothing, and it could not simply be added: it and the block
rating are both built from real block rates, they correlate at 0.94, and the
block curve was already fitted to those rates, so a second layer on top would
count them twice. The chance of a block is split instead:

| | reads | real players |
|---|---|---|
| does he go up | `block_attempt`, in proportion | attempts run as the rating to the 1.42 |
| does he get it, on a miss | the block rating, to the 2.0 | |

Among 322 real players with 500 minutes, real blocks per 36 run as the block
rating to the 2.85 and `block_attempt` as the rating to the 1.42, so a success
on the rating to 1.58 would have reproduced the old curve exactly. That curve
left the league's best shot-blockers short - the fifteen with the highest real
rates made 86% of them while the league made 110% of its own - and 2.0 closes
most of it. A custom whose two numbers disagree now plays like it: a man who
goes up for everything and seldom gets it fouls and gives up looks.

**The cost of going up, as the user specified.** An attempt that does not get
it contests a little worse than staying down, and fouls more. Both are
redistributions around the league's own rate, not additions to it: staying
down contests a little better and fouls a little less, by what keeps the
league where it was. The foul half is balanced on the attempt share weighted
by foul rate (0.42), not per shot (0.37), because the men who go up most guard
the men at the rim, whose shots draw the most fouls anyway; balanced per shot
it added fouls. The contest given up is 4 points of contest score against a
spread between defenders of about 9, so a good defender who goes up still
contests better than a poor one who stays down.

**The help defender's block is the same split.** Whether he rotates and goes
up reads `block_attempt` and help IQ; whether he gets it, the block rating.
Its attempt used to read the block rating too, on top of the success.

800 games either side, a frozen sheet, the same seeds:

| | before | after | NBA |
|---|---|---|---|
| **blocks a team** | 5.29 | **4.83** | 4.8 |
| per player against his real rate, r | 0.90 | 0.91 | |
| top 15 real blockers, share of their real rate | 86% | 92% | |
| shooting fouls a team, by play type (900 games) | 10.17 | 10.18 | |
| league FG% | 47.30 | 47.57 | 47.1 |

**The cost is a small one to scoring.** With blocks back on the league's rate,
more misses stay live for the offensive rebound, and league FG% came up 0.27
on these games - partly noise at 800 games, but in the same direction on
every configuration that lowered blocks, and further the lower they went. It
belongs to the scoring pass.

### Rebounding: who goes, and the fight for the spot

**Every man on the floor went for every rebound.** Each had a claim on the
miss - his real rebound rate, from his rating - and nobody ever got back or
leaked out, and nobody ever boxed anybody out. Four ratings described exactly
that and nothing read them: `crash_for_board`, `offensive_rebound_aggression`,
`boxout_strength` and `swim_move`.

**Who goes.** On a missed shot each man goes to the glass or does not, and
only a man who went has a claim. The offence's men get back instead
(`offensive_rebound_aggression`), the defence's leak out for the break
(`crash_for_board`) - about 1.5 of 5 crash on offence and 4 of 5 on defence,
the user's call, since nothing public measures it. Both tendencies are
box-outs per 36; `crash_for_board` was the man's *offensive* rebounds, which
track defensive crashing at r 0.66, and is re-sourced in `ratings_build` from
defensive box-outs - it takes effect on the next rebuild and paste.

**It feeds the break.** After a defensive rebound each leaker beyond the
average makes a fast break likelier and each offensive man back beyond the
average less likely, around the league's rate - so crashing is a trade, not
a free roll. League transition is where it was (15.0 FGA a team game).

**How much the decision may decide was the data's call, not a choice.** Real
rebounds per 36 follow the rebound rating at R2 0.96 and 0.98; box-outs per 36
track them at only 0.88 and 0.64, because the man who boxes out is often not
the man who gets it. Letting the crash tendencies carry much of *who*
rebounds took each player's rate off his real one - r 0.93 to 0.75 on the
defensive glass - so they tilt the decision gently and the rating still
decides who gets the board, as the user specified.

**The fight for the spot.** A defender and the man he guards, both crashing,
sometimes meet. The defender is nearer the rim and boxes out; the other tries
to swim round him - `boxout_strength` against `swim_move`, and holding is far
easier than getting round. The winner's claim goes up, the loser's down, and
position helps a lot without deciding it. The NBA's hustle tracking anchors
all three numbers, and the event fills the rebound event's `contested`,
`boxed_out`, `boxed_out_by` and `swim_moved` fields, which were there from the
start and never set:

| | sim | NBA |
|---|---|---|
| box-outs a team game | 6.1 | 5.9 |
| ...held by the defender | 75% | ~75% (4.4 defensive to 1.5 offensive) |
| ...the winner got the board | 59% | 61% |

(The sim's column counts every fight. The NBA's counts a fight won with the
loser kept off the ball, and on that count the sim is 5.6 - see *Switches,
the corner, the man on the drive, and box-outs counted right*.)

**The claims are decomposed, not added to.** Only the men who went have one
now, so `REBOUND_CLAIM_IF_CRASH` is the claim given that he went: the
offensive curve scaled up for the fewer who go, and each exponent giving up
the part the crash decision and the box-out now carry, fitted on the sim. A
missed free throw lines all ten up and still reads the old curve.

1200 games before, 800 after, a frozen sheet, the same seeds:

| | before | after | NBA |
|---|---|---|---|
| offence's share of player boards | 25.5% | 25.9% | 26.0% |
| offensive rebounds a team | 11.3 | 11.5 | 11.3 |
| putback attempts | 4.05 | 4.12 | 4.2 |
| missed free throws, offence's share | 13.3% | 12.9% | 13.0% |
| transition attempts | 15.0 | 15.0 | 14.2 |
| per player OREB/36 on real: slope, r | 1.04, 0.95 | 1.01, 0.92 | |
| top 15 offensive rebounders, share of real | 107% | 100% | |
| per player DREB/36 on real: slope, r | 0.97, 0.96 | 0.95, 0.90 | |

**The cost** is a little of the per-player fit - defensive r 0.96 to 0.90 -
which is what real randomness on every miss costs: a big who boxes out for
his teammates now gives some of his boards to them, as he does.

### The deep three

**Every three had the same 8% chance of being a deep one, whoever took it.**
`shot_3_deep` - a man's real attempts from 30 ft or more, per touch - was read
by nothing, so the men who took the sim's deep threes had nothing to do with
the men who take the league's: r 0.04. Now whether a three he takes off the
dribble is from 30 ft or more is his `shot_3_deep` against the league's, and
it lands between 30 and 35.5 ft, about one in ten from 35 or more, as the
league's do. The penalty per foot beyond 25 ft was 0.025, which left a
31-footer nearly as good as a 25-footer, and is fitted to the league's rate.

400 games before and 800 after, a frozen sheet, the same seeds:

| | before | after | NBA |
|---|---|---|---|
| threes from 30-34 ft a team | 0.54 | 0.86 | 0.84 |
| ...made | 31.6% | 25.8% | 24.8% |
| from 35 ft or more | 0.00 | 0.09 | 0.08 |
| each man's deep share against his real one, r | 0.04 | 0.82 | |
| league 3P% | 35.57 | 35.41 | 36.0 |

### The outlet

**A fixed quarter of every defensive rebound was thrown to the best
ball-handler, whether anyone was running or not.** `outlet_pass_frequency` was
read by nothing, and when that outlet went out of bounds the engine recorded
a turnover and let the rebounding team keep the ball: 0.66 turnovers a team
game that never changed hands.

**Now the long outlet exists when somebody leaked** - which the rebounding
work made a real decision. The rebounder throws it ahead on his
`outlet_pass_frequency` and how open the leaker is, where openness is how few
of the offence got back; or he hands it to his best ball-handler, who may
throw it ahead himself on his own frequency, a beat later. Whether it gets
there is `pass_accuracy` and `strength`, averaged. Caught, it is the break in
stride; missed, it is a turnover and the other team's ball, inbounded. With
nobody leaking there is no long outlet, and the break is the ordinary chance
the leak-outs and get-backs already shape.

400 games either side, a frozen sheet, the same seeds:

| | before | after | NBA |
|---|---|---|---|
| long outlets a team | 8.2 (a flat 25% of boards) | 6.5 | |
| ...lost | 0.66, ball kept | 0.43, ball changes hands | |
| transition attempts | 15.0 | 14.3 | 14.2 |
| turnovers a team | 13.9 (13.2 real) | 13.5 | 13.7 |
| league FG% | 47.22 | 47.03 | 47.1 |

Jokic throws the most, then Gobert, then Harden - the handler who takes the
hand-off and throws it himself.

### Known problems, in the order they are worth fixing

**No longer: the wrong men taking the shots.** This read: if every player
shot exactly his own sheet mix with the attempts the sim hands out, the
league would come to 41.7 / 20.0 / 38.3 against 40.4 / 16.8 / 42.8 -
mid-range players fed, shooters starved. Measured again in September 2026 it
is 19.1% mid and 40.9% three with the sim's attempts and 19.4% and 40.5%
with each man's real ones, and a player's attempts no longer lean toward his
mid-range share. See *Touch length, who shoots, and where the mid-range
comes from*.

**Fixed: a position the sheet leaves empty no longer takes over the
rotation.** This was the big one - once, starters played 48 minutes because
position coverage refused every swap. The sheet's hand-entry pass fixed most
of that, but coverage stayed a hard rule, and where a team's rotation had
nobody rated 5+ at a position it kept whoever did cover it on the floor: Jake
LaRavia, a 1-minute Laker and their only man at both forward spots, played
36.9 a night, Walker Kessler 7.6 of his 26, and a Blazer on an 8-minute
target 27. The design's relaxation was never written.

Coverage is a preference now: a sub takes full coverage from anyone who
still has minutes left, otherwise the smallest gap on offer, and never
refuses. Over a 1,560-game season, players 10+ minutes off their target went
26 to 0, 5+ off went 60 to 3, and the mean miss 2.32 minutes to 1.10. The
league on real rosters did not move beyond noise.

It moves the gap from the minutes to the positions, where it can be seen.
83% of possessions have full coverage; the teams that play most without it
are the sheet's own gaps - the Blazers at PF (83% of possessions) and C
(32%), the Wizards at SG (85%), the Lakers at SF (77%) and PF (46%), the
Mavericks at SG (62%). A 5 at those positions in the Sheet closes them.

**Superseded by *The touch*: the four problems below are the state before
it.** Pull-up threes now run 9.4 against a real 9.8 and catch-and-shoot
jumpers about 28 against 27.9. `CATCH_SHOOT_TENDENCY_SCALE` is 0.45, which
works once the catch-and-shoot two has its own multiplier and the forced shots
are gone. And FG% is hot rather than light.

**The sim surveys and pulls up where the NBA drives and kicks.** This is the
largest thing left, it is entirely a selection problem, and it is one problem
rather than three. Measured on real rosters against the league's own tracking
data, per team per game:

Measured in early September 2026, before any of the work below. The drive
rows use the engine's own wider count; on the NBA's definition the figure was
lower still.

| | sim | NBA |
|---|---|---|
| drives | 24.8 | 66.1 |
| drives ending in the driver's shot | 26.4% | 40.6% |
| **drive field goal attempts** | **6.5** | **27.0** |
| pull-up threes | 26.1 | 9.8 |
| catch-and-shoot threes | 16.6 | 26.3 |
| threes, total | 44.8 | 37.0 |

The sim drives a third as often, finishes a smaller share of the drives it
does take, and ends up with under a quarter of the NBA's drive attempts. What
replaces them is the handler surveying and shooting: **26.1 pull-up threes
against a real 10.2**, while catch-and-shoot threes - the shot a drive and
kick actually creates - run at 16.6 against a real 27.4. The sim has the two
backwards.

By gather the split is close to binary, which is the shape of the bug:

| gather | per game | close | mid | three |
|---|---|---|---|---|
| off dribble | 37.0 | 0.0% | 29.5% | 70.5% |
| driving | 26.9 | 100% | 0% | 0% |
| catch and shoot | 18.4 | 0.0% | 9.9% | 90.1% |

**Assists are a third light and only 46.2% of made shots are assisted**,
against a real 64.6%. This is now by far the largest gap and nothing else is
close. The shape of it: the sim passes about as often as the NBA and still
gets fewer assists, so the pass is less often the last thing before the shot.

The proximate cause is measurable. Catch-and-shoot threes, which assist
automatically, run at **11.5 a game against a real 27.4**, while
off-the-dribble threes run at **28.0 against a real 10.2**. The sim has the
two backwards, and the NBA keeps a large share of its assists in that
catch-and-shoot column.

**Raising `CATCH_SHOOT_TENDENCY_SCALE` does not fix it - measured.** At 0.40
instead of 0.15 catch-and-shoot threes went to 21.1 and assists to 23.1, but
the three-point share went from an exact 42.6% to 49.2% and pace to 110.8.
The check fires *before* `_select_shot`, so raising it **adds** threes rather
than moving them out of the pull-up column. Whatever fixes this has to take
the shot away from the off-dribble path at the same time - the same
"two gates that should be one closed set" shape as the dunk-versus-layup fix.

**FG% is 5% light and 8-16 ft is 7 points cold** at 38.8% against 45.6%. Some
of this was hidden until the foul rate came down: a missed shot that draws a
foul is not a field goal attempt, so a high foul rate quietly removes the
hardest attempts from the denominator. Cutting `BASE_SHOOTING_FOUL_RATE` from
0.042 to 0.029 took FTA from 30.7 to 24.2 and FG% from 45.1 to 43.3 at the
same time - the shooting did not get worse, it stopped being flattered. 0.034
is the compromise in place now, and the honest reading is that contested rim
and short-mid attempts convert too poorly.

### Why the drive rate only ever nudged: three gates, none of them the weights

**Partly superseded by *The touch*.** The pass-gate drive below is gone with
the gate it worked around, and `DRIVE_KICK_BIAS` is 0 now that the read's
neutrals sit on measured means. The 10 ft drive gate and reading the kick-out
from a position rather than a fraction of the drive both stand.

Four separate passes had tried to raise the drive rate by tuning the action
roll, and each one moved it a little and broke something else. The weights
were never the problem. Measured over 622 rolls, the mean weight arriving at
the terminal action roll is **48.3 to shoot and 45.0 to drive**, and drive
already wins 35% of the roll. What was wrong was upstream of it and in three
separate places.

**A drive is not a terminal action, and modelling it as one caps it.** The
action roll fires about 80 times a team a game, so even winning it outright
could not reach 66 drives — and the README already said so. What it did not
say is where the NBA keeps the rest: **43.9% of NBA drives end in a pass**,
29.0 a team a game, 10% of every pass in the game. Those touches are both a
drive and a pass, and `_tick_ball_handler_deciding` asked "pass or attack" as
a closed set, so in this engine they could only ever be one. The same wrong
turn as dunk-versus-layup. The pass-first gate — 101 touches a team a game —
now sometimes puts it on the floor first (`PASS_GATE_DRIVE_RATE`), and the
drive's own machinery decides what happens next.

**23% of every drive in the game began inside 10 ft.** `drive_w` had no
distance gate, where `post_w` on the line beside it always has: a man standing
at five feet rolled "drive" and the engine started a drive from where he
already was, 10.7 a team a game. That is not a drive in any sense — the NBA
would call it a post finish, a cut or a putback — and **it is why raising the
drive weight kept failing.** The extra drives landed in the paint, where a
drive cannot draw help and cannot kick out, so they became rim attempts and
free throws instead of the drive-and-kick they were meant to be. Gating it
took points from 110.9 to 113.5 and the close share to 40.5% on its own.

**The kick read fired on a fraction of the drive's duration, and a fraction of
a duration is not a position.** This is the fifth constant in this project
found standing in for the wrong quantity. The driver's distance is
interpolated from where he started, so 45% of the way through a drive from
24 ft left him at 14 ft — outside `DEF_COLLAPSE_THRESHOLD_FEET`, so no help
had rotated, so he read an empty paint and went up. 45% of a drive from 14 ft
left him at 8.8 ft, inside the collapse, so he kicked.

**Exactly backwards from the NBA**, where the drive from the arc is the one
that pulls the defence in. The consequence was that the drive-and-kick and
the tracked drive were mutually exclusive by construction: drives that
qualified as drives at all ended in a shot **92%** of the time, and every
kick-out in the game came from a short attack no tracker would have counted.
`DRIVE_READ_DISTANCE_FEET` replaces it — he reads when he has actually got
into the paint. `DRIVE_KICK_BIAS` went -16 to -58 to re-anchor the split
afterwards, because the same bias now sees far more collapse than it was
fitted against.

Measured together, 240 league games on real rosters: **tracked drives 16.8 to
31.4**, points per possession 1.111 to 1.131 against a real 1.130, close share
40.8% against 40.3%, three-point share 43.9% against 42.6%, and the finish
rate 44.6% against 40.6%. The spacing pass that followed took drives to
**40.6**, largely for free: `_take_shot` already turns a rim pick from beyond
10 ft into a drive, and fixing the ball's location stopped 40% of catches being
teleported into the paint where that rule cannot fire.

**It cost pace**, because a drive that finishes ends the trip early:
possessions went 99.8 to 103.6. Re-anchoring `PACING_BASELINE` was measured and
rejected at the time — it took pace from 109.3 to 98.2 and assists from 18.4 to
**14.3**, because the tempo multiplier scaled the handler's action rate and
acting is how he passes. That coupling has since been fixed; see *The pacing
lever was throttling the wrong thing* below. Pace is back to 101.9.

### The kick-out nobody shot

57% of kick-outs were caught and passed straight on again. The ball came out
of a genuinely collapsed defence to a man standing open behind the arc, and he
swung it. Only 4.7% of kick-outs became a catch-and-shoot at all, while 12.6%
became a **pull-up three off the dribble by the same receiver** — the entire
survey-and-pull-up inversion, and most of the assist gap, in one measurement.

A swing pass and a kick-out were reading the same `CATCH_SHOOT_TENDENCY_SCALE`.
There was a catch-and-*finish* path gated on `state.last_pass_was_kick` and no
catch-and-*shoot* one, though the kick to the arc is the commoner play by a
factor of four. `CATCH_SHOOT_KICK_SCALE` is that gate.

Raising the global scale was tried before and failed because it fires ahead of
`_select_shot` and so *adds* threes. Aimed only at the kick it does not: +1.0
assists with the three-point share unmoved to a tenth of a point. **The gain
is small only because there are not yet enough kick-outs** — the chain is
drives to kick-outs to assists, and it pays off at the far end.

### Drives: the finish rate, and the double supply

A drive ended in the driver's own shot 26.4% of the time against a real 40.9%,
and that was true before any of the kick-out work and after it - 26.4% at the
start of the September 2026 pass, 28.3% once help defence was working. The
kick-out changes did not cause it. Two things did.

`DRIVE_KICK_BIAS` was -2, which made an average driver against average rim
protection a coin flip, and the NBA is not a coin flip - it goes up 40.9% of
the time and passes 43.9%. It went to -16 then, with `DRIVE_KICK_PER_HELPER`
cut to 0.04 so the help read shades the decision rather than dominating it.
**It is -58 now** - see the read-position fix above, which moved what the bias
is reading and so forced it to be re-anchored.

And `_take_shot` granted a rim shot on the spot when the closed set asked for
one, teleporting the handler from 22 ft to 3 ft with a DRIVING gather and no
drive. **Tried once before and measured worse** - it leaked rim attempts to
the arc, because a kick-out could only ever find a spot-up shooter. With the
roller reachable and help defence real, the same change now works: drives
38.9 to 46.8, the finish rate to 41.6% against 40.9%, and points to 113.1.
It also stops the rim being supplied twice, once by drives and once by the
closed set granting itself a layup.

The cost was free throws - more rim attacks, more whistles, FTA to 30.7 - and
that is what forced the foul recalibration above.

That 46.8 was the engine's own wider count, not the NBA's. On the NBA's
definition the same engine was at about 17. See the drive section above for
what that changed, and what it did not: **31.4 tracked drives against 66.1**
is where it now stands. The split is right; the volume is still not.

### Help defence, and the constant that multiplied it by zero

`_recover_from_collapse` decided nothing at all until September 2026. Both
halves of the recovery calculation were anchored at 50 and scaled as if 50
were an ordinary rating, when the NBA's real means are 78 reaction time, 70
help IQ, 77 agility-and-speed. For a median defender:

```
recog    = 0.5 + (78-50)*0.02 + (70-50)*0.01 = 1.26
rotation = ((78+76)/198) * 3.0               = 2.33
recovery = min(1.0, (1.26 + 2.33) / 2)       = 1.0, clamped
```

Openness is `base * (1 - recovery)`, so **every kick-out in the game created
exactly zero openness**. The whole help and recovery system computed a number
and multiplied it by nothing; even a 25-rated defender recovered 25%. This is
the fourth constant in this project found anchored to a league average that
had stopped being one, after `PACING_BASELINE`, the shot curves' rating 74,
and `stamina_factor`. **When something here looks inert, check its baseline
before anything else.**

Re-anchored on the real means, a median defender now recovers half. Measured
openness on a catch-and-shoot three went 0.78 to 1.71 and its 3P% to 37.3
against a real 37.1.

**And the kick-out now follows from the help.** `_should_kick` weighed the rim
protector against the driver's nerve and could not see whether anyone had
actually rotated, so a drive nobody helped on passed out as often as one that
pulled three men into the lane. It now adds `DRIVE_KICK_PER_HELPER` per
defender who came and multiplies by `DRIVE_KICK_NO_HELP_MULT` when nobody
did. A drive that draws help kicks to an open man - which is what makes an
assist rather than manufacturing one - and a drive that draws nobody finishes,
which is where rim attempts come from.

With that plus `PLAY_WEIGHT_DRIVE` at 1.1, drives went 26.9 to 39.1 against a
real 68.7, drive field goal attempts 7.4 to 11.1 against 28.1, and the
three-point share landed exactly on 42.6%.

### Defenders on the rim side

**Every defender stood behind the man he was guarding.** All four places a
defender is placed against his man - the set-up, the drift back each tick,
the isolation and the post-up - *added* his cushion to his man's distance
from the basket. Sampled at every shot over 12 games:

| his man at | the defender stood | on the rim side |
|---|---|---|
| the rim, inside 8 ft | 10 ft behind him | 0.1% of the time |
| mid-range | 3.4 ft behind | 17% |
| the arc | 3.4 ft behind | 14% |

A contest reads the gap between the two and could not tell. Everything that
asks how near the rim a defender is could: help range, paint traffic and the
rim protection a drive reads. And the sag was the same whoever he guarded -
an elite shooter's man stood +3.4 ft off, a non-shooter's +3.2 - so there was
no gravity for anything to build on. "The arc stays home" was true by
accident, for every man at the arc, because his defender was 28-32 ft out.

It is subtracted now (`DEF_MIN_FEET` keeps him off the baseline), and the
constants that had been fitted around the old placement were re-set to hold
the league. Flipping the placement alone cost 6 points a team a game, put
three helpers on 14% of drives against 0.4%, and doubled the deterrence
kick-outs:

| constant | was | now | why |
|---|---|---|---|
| `DEF_OFFBALL_SAG_FEET` | 4-8 / 4-7 | 2.5-4.5 | on the rim side 4-7 left 88% of threes open |
| `HELP_COMMIT_RANGE_FEET` | 16 | 9 | 16 let 73% of mid-range defenders help |
| `DRIVE_KICK_THREAT_NEUTRAL` | 30 | 43 | a big guarding a man at the rim now stands with him |
| `CONTEST_CLOSE_BONUS`, `_SHORT_` | 8, 3 | 4, 2 | the close shot's own defender is beside him now |

Over 480 league games on real rosters, against the old placement on the same
seeds:

| | old | new | NBA |
|---|---|---|---|
| points | 116.7 | 116.4 | 115.0 |
| FG% | 47.2 | 47.0 | 47.1 |
| inside 8 ft / mid / three | 61.8 / 40.0 / 35.6 | 62.0 / 39.1 / 35.1 | |
| free throws | 23.7 | 23.7 | 23.4 |
| drives ending in a shot | 30.5 | 30.5 | |
| drives drawing 0 / 1 / 2+ helpers | 65 / 29 / 6% | 64 / 30 / 6% | |
| threes open / light | 79.1 / 20.6% | 79.5 / 20.4% | |

The mid-range is the one number that moved past a standard error (1.7):
there are more bodies near the elbow than there were. The three-point
contests are identical, so its half a point is the shooters, not the
defence.

This is gravity's first layer and changes nothing that can be seen, on
purpose: every defender still sags the same whoever he guards. What it
changes is that he now stands where sagging *means* something - toward the
rim, into help range - so the next layer can set the sag by the threat of
his man. Two anchors the advanced scores are measured against moved with it
(deterrence kick-outs 3.98 to 4.35 a team game, catch-and-shoot 1.05 to
0.92); re-anchor them when the gravity layers are done, not before.

The flat 2.5-4.5 ft sag in the table above did not last: the next section
replaced it.

### Gravity: a man is guarded by what leaving him costs

The second layer. Two steps, each held to the league.

**Real feet first.** The rim-side sag held the league on distances the NBA
would not recognise. NBA tracking splits every shot by its closest defender
(the `cov_overall_*` tables the coverage pull already caches), and against
them:

| closest defender on threes | 0-2 ft | 2-4 | 4-6 | 6+ |
|---|---|---|---|---|
| NBA 2025-26 | 1.1% | 12.4% | 38.9% | 47.6% |
| sim, flat sag | 5.2% | 61.6% | 14.5% | 18.7% |

The same for every shooter - 17-20% wide open whatever his rating - and 3P%
came out right only because the contest thresholds had been fitted around
the squeeze. The sag is now a share of the floor between his man and 4 ft
out (`DEF_OFFBALL_SAG_FRACTION`, `DEF_SAG_FROM_FEET`), set so the sim's
catch-and-shoot threes are wide open as often as the NBA's (about 52%,
worked back from the league's 47.6%, the 72% of threes that are catch-and-
shoot and the pull-ups' 36%). With real distances the make rate follows the
defender the way the NBA's does - catch threes 34.4% at 2-4 ft, 35.2 at
4-6, 38.1 wide open, against 31.0 / 33.9 / 37.3 - without the contest
being refitted; only the mid-range's bonus moved (`CONTEST_SHORT_BONUS` 2 to
4). **Self-created shots are not on this scale.** Their space is the
openness bonus a quick move or a screen earns, a channel of its own, so a
pull-up's distance is still the on-ball cushion's.

**Then the sag by threat.** `_offball_threat` is what an open catch of his
is worth against the league's man: his catch-and-shoot make chance on the
engine's own curve over the league's, times `shot_3_off_catch` over 50 (the
mid-range pair for a man inside 21 ft; since the pairs became shares, the
square root of the rate their chain gives, which is the same number - see
*How the threes come, and the split under the diet*). His defender's sag is multiplied by
`threat ** -0.2`, between 0.4 and 3. Real defences weigh a man's shooting as
heavily as how often he fires (-4.0 and -4.6 points of wide-open share per
SD), and on the make curve the best and worst shooters are only 0.7-1.25
times the league apart, so the make chance carries a weight of 2. Fitted to
the spot-up shooters in the same splits, wide-open share of catch threes:

| | low | | | high |
|---|---|---|---|---|
| by catch-and-shoot rating, NBA | 61 | 55 | 45 | 43 |
| sim | 68 | 56 | 48 | 46 |
| by `shot_3_off_catch`, NBA | 65 | 55 | 48 | 40 |
| sim | 64 | 53 | 46 | 36 |

Duncan Robinson, Klay and Curry are played at two-thirds of the league's
sag; Jalen Duren, who never shoots off the catch, at three times it, which
puts his man in the lane. `off_ball_movement` is not in it: on its own it
predicts nothing (r -0.04), and a mover's tight coverage is the chase off a
screen, which the off-screen action already is.

**And help comes from the sag.** A non-shooter's man now stands in help
range, so at the old commit rate two or more helpers came on 10% of drives
against 6%; `HELP_COMMIT_BASE` 0.75 to 0.58 puts the league back and keeps
who helps. That is the gravity: **a drive with no high-threat shooter
(threat 1.5+) around it draws 0.43 helpers, one with two draws 0.37**, and
nothing but where the defenders stand decides it.

Over 480 league games against the engine before either layer: points 116.8
(116.7), FG% 47.3 (47.2), 3PA 36.4 (36.3), 3P% 35.9 (35.7), free throws 23.2
(23.7), drives ending in a shot 30.7 (30.5), helpers per drive 66/27/6/1%
(65/29/6/0.5%).

Not in it yet: the man next to a Curry staying home too, which would
strengthen the lineup effect, and passing to whoever is actually open -
the third layer.

### The closeout, and passing to the open man

The third layer. Four things the engine did not do:

- **Whether a receiver shot ignored how open he was.** The catch-and-shoot
  read took his tendency, the passer's vision and his defender's length and
  rating - never his defender's distance.
- **A kick-out's openness was a number.** `OPENNESS_KICKOUT_BASE` plus a bit
  per collapsed helper went to whoever caught it, whether or not his own man
  was the one who had left.
- **The pass went by touches,** not by who was open.
- **Defenders never really got back.** The drift home was 0.3-0.4 ft a
  second, so a helper stood in the lane for the rest of the trip.

Now a helper is marked **recovering** when the help ends, and **sprints back
to his spot** after a delay: reaction time and help IQ for how soon he sees
it, agility and speed for how fast he goes, around 13 ft a second. What a man
shoots against is where his defender is **when the ball leaves his hands**:
the pass in the air, then his release. A man whose defender stayed home is
covered; a man whose defender was the helper is open until he arrives - see
`_defender_at` and config's THE CLOSEOUT. `release_quickness` is part of that
clock now, not a flat contest reduction: a point either way is 0.16 ft of
gap, quicker or slower, where it used to help above 5 and do nothing below.

**Open** is a man's gap at the release against the gap he is normally given
(`_rest_gap`), so a non-shooter left alone by design does not read as a man
the defence forgot. An open man shoots off the catch more often
(`CATCH_SHOOT_OPEN_EXPONENT`); a man being closed out on puts it down or
moves it on. And the passer weighs each man outside the paint by **how open
he looks to him** - the gap seen through noise that shrinks with
`pass_vision`, none at 99 - on top of his touches. Turnovers stay with
`pass_accuracy`; vision is only who he finds.

Held to the league, over 480 games against the second layer: points 116.9
(116.8), FG% 46.8 (47.3) with 3PA 37.2 (36.4) against the NBA's 36.8, 3P%
36.0 (35.9), free throws 23.4 (23.2), helpers per drive and drive outcomes
unchanged. Catch threes are still wide open 52% of the time and keep the
shooter tiers. The start sag went 0.22-0.355 to 0.21-0.338 (open men now
shoot more, so the shots lean open), help commitment 0.58 to 0.65 (a helper
runs home now instead of being counted again on the next drive) and the
mid-range bonus 4 to 3.

**What perception has to see is still thin.** `pass_vision` buys +1.50%
shots per pass a point against the NBA's +1.6%, almost all of it through the
multiplier it already had; a kick-out three is 60% wide open off a 90-vision
passer and off a 50. Help comes from the men guarding non-shooters and bigs,
and the shooters' men stay home, so on the perimeter there is rarely a man
more open than the rest to find. The fourth layer - doubles, the man left
open relocating, and the rotations that follow - is what makes one.

### Rotations and double teams

The fourth layer, in four parts, each held to the league.

**The low man.** If nobody already in the lane helps on a drive, the
defender nearest the rim beyond it may tag it, at a rate that falls with the
square of his own man's threat: a non-shooter's man goes readily, an average
shooter's man sometimes - the man forgotten in the corner - and a Curry's man
almost never, so gravity keeps its bite (helpers per drive 0.49 / 0.46 / 0.42
with 0 / 1 / 2 high-threat shooters around the driver). **The X-out:** when
the ball reaches a man whose defender is off helping, the nearest defender
whose own man is worth less may rotate onto him and the helper takes his man
- a switch, both on the closeout clock, once a trip, put back at the end of
it - so the man the rotation left is the one open for the extra pass.

**The double team**, on post-ups, isolations and pick-and-roll blitzes, read
once per action. The chance is the action's league rate (post-ups 10%,
isolations 5%, blitzes 10%; 7.1%, 3.5% and 8.3% since the profiles came from
the ratings, to double as often as before) times his mismatch on his own
defender from the matchup profiles - interior against interior on a post-up,
perimeter against perimeter otherwise, `exp(0.4 x the gap)` - times his hot
hand (up to half as many again), and up to 15% less for a man who will pass
out of it (a Jokic or a Sabonis). The doubler is the man guarding the least
dangerous player within reach; he runs at the ball on the closeout clock, and
the doubled man reads it once it is on him, sooner the better he sees. He
passes out - to whoever looks open, where `pass_vision` does its work - or
keeps it against two, 2% of the time at a `pass_out_frequency` of 50 and
steeply more below it, with a harder shot, more turnovers and more fouls. A
pass out of a double goes astray more often, more so for a poor passer - that
is `pass_accuracy`'s. A blitz leaves the screener: the handler gets it to
him, open, and keeps it as rarely as any double.

**The man left open moves.** While the second man runs at the ball, the man
he left - the least dangerous on the floor - cuts if the lane is empty and he
is a cutter, or steps into the mid-range if he is a better threat there, at
his own pace. If that makes him worth more than someone else, that man's
defender rotates onto him and the doubler takes his man when the ball moves:
the new least dangerous man is the open one. Once a double.

The old post-up "double team read" was a stand-in for all of this, and with
real doubles it nearly retires: `POST_KICK_OUT_RATE` 0.22 to 0.08, and the
league's post-ups pass out 45% (the NBA's post touches 44.6%), shoot 41%
(39.9) and turn it over 6.1% (5.1, down from 7.5% before doubles). 10.5% of
post-up reads and 4.9% of isolations are doubled, 0.6 doubles a team game.

**What `pass_vision` finds now.** A clearly open man on the perimeter - 1.5
times his usual gap and 1.5 times the next man's - is found by 48% of passers
under 60 vision, 56% at 60-70, 61% at 70-80, 65% at 80 and up; each point of
vision is +1.54% shots per pass against the NBA's +1.6%.

**The heliocentric big.** Zubac made into one - interior offence 10, the
touches and post-ups of a team built around him, elite post finishing, his
own vision - is doubled on a third of his post-ups and averages 5.7 assists
and 24.6 points, against 1.1 and 16.8 as he is. Nothing special-cases him.

**Held to the league**, over 480 games against the engine before any of the
gravity work: points 117.9 (116.7), FG% 46.7 (47.2), 3P% 36.3 (35.7), free
throws 23.7 (23.7), turnovers 13.5 (13.8), assists 27.1 (27.0), 63.5% of
made field goals assisted (63.3; the NBA's 63.8). Open catch threes took
shots from the drive - the three share went 40.1% to 42.3%, the NBA's is 42.6
- so `DRIVE_FOUL_DRAW_BASE` went to 0.218 to keep the free throws and
`ASSIST_SELF_CREATED_SCALE` to 1.10 to keep the assisted share; help
commitment 0.62, post turnovers 0.0888, `PASS_VISION_SHOT_ELASTICITY` 0.019.
Points sit 1.2 over where they were, from the threes (the NBA's 3P% is 36.0).

**Double teams are on the record.** Every double - post-up, isolation or
blitz - is a `DoubleTeamEvent`: the man doubled, his own defender, and the
man who left his to come. The box score counts `doubled` for the first (a
DBL column in the playmaking table) and `double_teams` for both of the men
on him (a DOUBLE TEAMS list under the defence), and a season reports them
as "times doubled" and "double teams" - per game on the leaderboards, and
`rank doubled` / `rank double teams` for the whole table. The tab-separated
rows for the Sheet are left as they are.

**Checked after, against the engine before any of the gravity work** (240
games each), so an old gap is not read as a new one. Field goal percentage
moved only on the post-up, 50.8% to 47.4% - the helpers now stand where help
comes from - and the drive's shot share went 49.8% to 52.8%. The points a
play this check first reported were wrong, and so was its "P&R handler a
tenth of a point too efficient": it credited turnovers and free throws from
the events around them and lost most of the handler's turnovers. Measured
properly, and fixed, in *Play types, credited to the play that was
running* below.

**And the contest is not too open.** The closest defender on every field
goal attempt, 0-2 / 2-4 / 4-6 / 6+ ft: NBA 12.3 / 34.9 / 28.4 / 24.4%, sim
26.2 / 22.8 / 24.7 / 26.3% (before gravity 26.2 / 33.1 / 26.7 / 14.1). 4 ft
or more on 51% of shots against the NBA's 52.8%. What is off is the rim, and
it was off before: 51% of shots inside 10 ft go up with a defender within 2
ft against the NBA's 26%, because the rim is contested through help and
traffic rather than distance. (It was the man on the drive, standing inside
the driver - fixed in *Switches, the corner, the man on the drive, and
box-outs counted right*.)

The advanced scores' anchors (league means, SDs, deterrence baselines) have
moved with all four layers and have not been re-set: do it with
`season.py --set-baselines` once the customs are filled back in.

### What the first look showed

**What the first look showed**, twelve games against 2025-26: 32.5% of shots
go up with the closest defender inside 2 ft against the NBA's 12.3% (2-4 ft
21.1% against 34.9%), and 44% of threes come from the corners against
28.1%. Box-outs won run 4.0 a team game against 5.9. A screen's "switch"
response changes the screen's quality roll and not who guards whom, so no
switch ever shows in the matchups. Speed and distance cannot be measured:
positions are spots that shift on a drive or a cut, and the busiest man
moved 0.08 miles a game against a real starter's 2.5. The first four are
dealt with in *Switches, the corner, the man on the drive, and box-outs
counted right*.

### Switches, the corner, the man on the drive, and box-outs counted right

Four things the audit's first look found off (*What the first look showed*,
under the engine), dealt with in October 2026. 480 real-roster league games
on the engine before and after, same pairings and seeds, per team game:

| | before | after | NBA 2025-26 |
|---|---|---|---|
| threes from the corner | 42.9% | 31.8% | 27.2% |
| ...of the pull-up threes | 53.4% | 23.5% | all but none |
| closest defender, shots inside 10 ft, 0-2 / 2-4 / 4-6 / 6+ ft | 57 / 23 / 13 / 7% | 26 / 54 / 13 / 7% | 26 / 54 / 15 / 6% |
| ...every two | 52 / 24 / 14 / 10% | 25 / 51 / 15 / 9% | 20 / 51 / 21 / 8% |
| ...every shot | 33 / 20 / 23 / 24% | 17 / 37 / 23 / 24% | 12 / 35 / 28 / 24% |
| box-outs | 4.3 counted | 5.6 (4.2 def, 1.4 off) | 5.9 (4.5, 1.5) |
| screens switched | 23%, nobody changed men | 23.5%, 9.2 a team game | |
| points | 116.7 | 116.7 | 115.0 |

FG% 48.4 to 48.3, threes 32.9 to 32.8, 3P% 37.3 to 36.7, turnovers 13.7 to
13.5, at the rim 66.7% to 66.6%.

**Box-outs were the count, not the engine.** The NBA credits a box-out when
the man fought for the spot never got the ball - and either side can win
it: an attacker who gets inside his man has boxed out on the offensive end.
`metrics.py` counted only the defender holding, so it read 4.0-4.3 against
5.9. Counted the NBA's way the engine was at 5.7 already, defensive and
offensive in the NBA's proportions, the boxer's own rebound 62% against
61%; play is untouched. The HUSTLE group now has offensive and defensive
box-outs and nba.com's three percentages. One difference stays, by
definition: the NBA's boxer's team takes the board 98.8% of the time and the
sim's 86%. The trackers credit the box-outs that worked; the sim counts
every fight whose loser was kept off the ball.

**The man on the drive was standing inside the driver.** A driver who had
not beaten his man had him 0.5-1.8 ft away, center to center - two bodies in
one place - and drives are half the shots inside 10 ft. In his hip is
1.5-3.5 ft (`DRIVE_TRAIL_CONTAINED`), and that one number puts the close
shots on the NBA's distribution. The make rates at the rim did not move: the
contest reads 2.5 points a foot, and the levels it falls into are wide.
Threes were right before and still are. **What is still off is how much the
distance matters:** inside 10 ft the NBA makes 50% with a man within 2 ft,
59% at 2-4, 72% at 4-6 and 78% with nobody within 6; the sim 56 / 55 / 58 /
69%. That is the contest's distance curve at close range, and it is the
next thing here if it is wanted.

**The corner is a place to spot up.** The excess was everything that moves:
half the sim's pull-up threes were corner threes, and 60% of its threes off
a screen and 82% off a handoff. A man who has had the ball a second or more
in the corner and rises has dribbled up out of it - to 48-63 degrees, as far
behind the line there as he was in the corner; a handoff is caught where the
ball is, not on the receiver's own ray; an off-screen runner comes up off
the screen to the wing. Each move takes his defender with him, turned
through the same angle (`_carry_to`), so it changes where the shot is taken
and not how open it is. The pull-up threes still in the corner are men who
caught it and went up inside a second, which the NBA would call a catch and
shoot. The corner now shoots better than above the break (37.8% to 36.2%;
the NBA 38.7% and 35.0%), where before they were level.

**A switch trades men.** "Switch" was one of the five answers to a screen
and changed only the screen's quality roll, by +0.05, so a centre never
ended up on a guard. Now the screener's man takes the ball and the handler's
man takes the screener, each from where the other stood, for the rest of
the trip - put back when it ends, like an X-out - and both changes are
`MatchupChangeEvent`s with reason `"switch"`. How often a defence switches
is what the trade costs it: the two pairs a switch would make against the
two it has, scored the way the matchups were chosen (`Team.guard_value`,
the pair score `assign_defensive_matchups` maximises). Between two guards
that is a few points; a centre switching onto one costs 20-30. Each point is
`exp(-0.04)` on the switch's weight, and the weight at no cost is 0.38,
which keeps the league at the 23% of screens it switched before - nothing
pulled measures it. Whatever the switch gives is the new matchup's: the
drive reads the big's feet, the jumper his contest, the roll the guard's
interior defence. **What it does not do yet is hunt:** the offence does not
go looking for the mismatch it was handed, so a guard with a centre on him
isolates no more often than with anyone else.

**Found on the way, and left for its own change: half the catches in the
corner are made inside the line.** The corner spot is 22.3 ft, 0.3 ft behind
the line, with a foot of random placement either way, so 38% of corner men
stand inside it and 48% of corner catches are made there. Those men mostly
pass on rather than shoot the long two, which hides how many catches the
corner gets. Standing every spaced man a foot behind his line takes the
league's threes from 32.9 to 35.1 - toward the NBA's 37.1 - but the corner's
share to 45.5% and points to 119.3: corner shooters get too many of the
looks, and the ones above the break too few. That, and not the corner, is
the three-point gap, and it is the next thing for the threes. Two more
things it showed:

- **The man bringing the ball up takes whatever spot his shooting earned
  him**, so a corner man brings it up the corner's ray, along the sideline.
  Giving him the top is right, and cost 0.65 catch-and-shoot threes a team
  game on the break: the shooter he moved out of the top went to a corner,
  and on the break a corner man starts at 60% of his spot and springs back
  55% of the gap a second, so he needs four or five seconds to cross a line
  his spot is 0.3 ft behind. Left as it was until the spots are behind the
  line.
- **Threes have drifted from about 37 a team game in late September to
  33**, across the play-mix, touch and drive work; `bench.py` shows it
  against its 36.8.

(Both taken up in the next section.)

### Who stands in the corner, the contest's distance, and the mismatch

The follow-up, the same day. **Unfinished, and parked for later**: the
mismatch hunt is built and only run, not measured, and the steal rates' last
step is unmeasured - see *Still to do* below.

**The corner goes to the men whose game is the corner.** A real player's
corner share of his threes (2025-26, the 245 with 120 or more) follows how he
plays, not how much he shoots threes: r +0.56 with `spot_up_frequency`,
-0.52 with `shot_3_off_dribble`, -0.50 with `touches`, +0.13 with
`shot_3_pointer`. The corners went to the second and third most arc-minded
men out, and a player's corner share in the sim had nothing to do with his
real one (r 0.09 over 230 players, 480 games). Who goes out is still the
spacing pull; which spot he takes is `_corner_pull`, the three tendencies
fitted to the real shares (r 0.70), corners to the highest and the top to
the lowest. r 0.65 now. **And a spaced man stands behind the line**
(`SPACING_BEHIND_LINE`, a foot), which is what put the threes back.

**The contest's distance, by the shot.** It read 2.5 points a foot for every
shot and no level, and that left it all but inert: every three scored under
the "open" threshold from 2 ft out, and close shots were "light" whether the
man was on the shooter's body or 5 ft off. Each shot from 480 games was
re-scored offline with its own contest and the distance play used, and
`CONTEST_DISTANCE` fitted by family - inside 10 ft, other twos, threes - to
the NBA's makes by closest defender, threes to 36.0% and the twos' make
rates held. Makes, 0-2 / 2-4 / 4-6 / 6+ ft:

| | before | now | NBA |
|---|---|---|---|
| threes | 39.4 / 33.6 / 37.7 / 38.6 | 31.0 / 32.2 / 35.0 / 38.1 | 38.5 / 31.3 / 34.4 / 38.4 |
| catch-and-shoot / pull-up 3P% | 38.7 / 34.4 | 37.0 / 33.4 | 37.1 / 32.9 |
| twos inside 10 ft | 55.3 / 55.2 / 57.3 / 69.3 | 53.4 / 54.2 / 60.4 / 70.5 | 50.3 / 58.9 / 71.8 / 77.9 |

(0-2 ft threes are 1-2% of them.) Open close shots stay short of the NBA's:
the sim's are floaters and short jumpers more often than dunks, which is the
shot, not the contest.

**Steals re-anchored.** Men behind the line shoot the catch rather than hold
and pass it, and steals fell to 7.7 (3.0 strips, 4.7 interceptions),
turnovers to 12.8. The three rates went up about a tenth and read 8.7
steals and 13.9 turnovers, and were then taken back part of the way, to 4-7%
over where they were (`PASS_INTERCEPTION_BASE_RATE` 0.0262, `HELP_STRIP_RATE`
0.0170, `STEAL_ATTEMPT_BASE_RATE` 0.00074) - not yet measured. `bench.py` now splits steals by the turnover, as
pbpstats and `fit_ratings.py` do: since *Then a hand on the ball* a steal off
a tip has steal_type "tip" or "loose_ball", and it was missing them.

**The league, before the mismatch hunt** (`bench.py --league --real-only`,
240 games against the commit before): points 116.6 to 117.0 (115.0), FG%
48.5 to 47.5 (47.1), threes 32.7 to 35.6 at 36.7% to 36.3% (36.8 at 36.0),
assists 27.1 to 27.0 (26.6), free throws 23.1 (23.4).

**The mismatch hunt** (`_hunt`, config's THE MISMATCH). A man left a worse
defender than the one he started the trip against - by a switch, an X-out
or a rotation - is gone at: his drive and isolation weigh exp(0.3 x the drop
in his man's perimeter defence) more, his post-up the drop in interior
defence, and passes find him by the larger, capped at three times either
way. Trips where nobody changed men play as before. Nothing pulled measures
switch hunting.

**Still to do.**
- Measure the hunt, and hold the league's isolations and post-ups to
  Synergy's 8.1 and 3.9 plays a team game if it moved them.
- Measure the steals after the last step.
- The shot selection: threes are 35.6 against 36.8 and the corner still
  takes 35% of them against 27%, because the sim takes about 50 shots a team
  game inside 10 ft against the NBA's 38, twos from 10 ft out at 5.5 against
  13.2, and pull-up threes at 8.1 against 9.8 - it goes to the rim where the
  NBA pulls up.
- The metric definitions pinned after the audit: free-throw assists,
  potential assists, post touches, the contested-shot threshold.
- The steals fit (`fit_ratings.py`) after the steal rates are settled.

### Who shoots, a read at a time, and the block

**Measured man by man.** The advanced score's calibration (October 2026)
found the sim's own Win Shares, VORP and PIE putting Jokic and Wembanyama
about tenth, where real life puts them in the top three, and traced it to
who gets the ball. Measured on bench's real-roster league rotation, each real
player's share of his team's plays while on the floor against his 2025-26:
the league as a whole was right - sim usage on real at a slope of 1.04, r
0.79 - and the men were wrong.

| usage, sim / real | before | now |
|---|---|---|
| Brunson | 0.46 / 0.30 (31.4 shots a 36 to 20.5) | 0.31 (20.7) |
| Gilgeous-Alexander | 0.41 / 0.32 | 0.35 |
| Murray | 0.42 / 0.27 | 0.30 |
| Edwards | 0.40 / 0.31 | 0.33 |
| Maxey | 0.37 / 0.29 | 0.27 |
| Jokic | 0.19 / 0.29 (12.2 to 18.0) | 0.25 (15.3) |
| Embiid | 0.18 / 0.34 (10.1 to 20.8) | 0.22 (12.5) |
| Wembanyama | 0.23 / 0.32 | 0.30 (20.8 to 20.8) |
| Porzingis | 0.18 / 0.27 | 0.21 |

**The shot weight spread a man's shots over his catches and used them on
everything.** `touches` is the front court's catches, so a point guard who
catches it 30 times a 36 and brings it up 40 more read as twenty shots on
thirty touches - at exponents 3.2 and 2.8 a weight of 413 for Brunson
against Jokic's 27 - and every read used it, the bring-up and the break as
well as the catch. Brunson attacked on 96% of everything he touched, the
cap; Jokic on 19%. Traced shot by shot (a shot is his own attack if his read
attacked and nothing was passed since), only 37% of a man's attempts come off
his own attack - the rest are catch-and-shoots, cuts, rolls and putbacks -
and an attack becomes his shot 27% of the time, so a man's shots respond to
his weight at about a sixth of its change, and no exponent on shots over
reads could fit both ends. The weight is fitted instead, log-linear on
`shot`, `touches` and `ball_dominance`, to the attack rate each man needs for
his real attempts given what came to him otherwise and how his attacks became
shots: 1.52 x shot^1.85 x touches^-1.83 x dominance^-1.27 (each over 50; 278
men, residual sd 0.33; a second pass moved nothing by more than 0.08). See
config's WHO SHOOTS, A READ AT A TIME.

**Nothing put a post player on the block.** A man's spot came from his
three, mid-range and close shots, and `post_up` - his post touches per touch
- was read only once he had the ball. A big who shot a little was spread to
the arc on every trip: Jokic caught it in the post 0.6 times a 36 against a
real 8.1, Embiid 0.8 against 6.8, while Sengun and Sabonis, who cannot shoot,
caught it at the elbow 17 and 21 times against 7. And a post-up began only as
one of the plays an attack chose among, so it went to whoever attacked from
inside 22 ft - guards driving in more than the bigs: Brunson 1.8 a 36 against
0.8, Jokic 0.6 against 5.7, a per-player slope of 0.25. So:

- `post_up`'s true multiple over the league's pulls a man to the block
  (`SPACING_POST_FROM_POST`), and going out to the arc is a draw near the
  threshold (`SPACING_OUT_SOFTNESS`) rather than a line: Jokic is out on
  about a third of his trips, Towns and Wembanyama half, Adebayo three in
  five, and the shooters and the rim-runners stand where they did.
- A catch in the post - tracking's post area, as metrics.py counts it -
  starts a post-up (`POST_CATCH_PROB` 0.9), with the attack read's post
  weight halved beside it (`PLAY_WEIGHT_POST` 7.0 -> 3.5).

Post touches now follow each man's real ones at a slope of 1.09 (r 0.77;
0.29 and 0.39 before), post-ups at 0.75 (0.25): Jokic 4.1 a 36 against 5.7,
Embiid 4.0 against 6.3, Antetokounmpo 5.0 against 5.7, Brunson 1.0 against
0.8.

**And the rim-runners caught too much.** With the guards no longer attacking
on nearly every read, more of the ball reached the dunker spot, and the
catch-and-finish fired at 0.63 of `shot_close` on every one:
`CATCH_FINISH_TENDENCY_SCALE` 0.45. `BRING_UP_ATTACK_MULT` was re-swept and
stays 1.5: 2.0 fed the heavy ball-handlers but sent the stars back over and
the league to 118 points and 22.3 pick-and-rolls.

The error by kind of player, usage minutes-weighted (mean |log of sim over
real|):

| | before | now |
|---|---|---|
| ball-handlers (ball_dominance 70+) | 0.152 (0.251 / 0.236) | 0.145 (0.215 / 0.236) |
| post bigs (post_up 75+) | 0.219 (0.207 / 0.242) | 0.132 (0.227 / 0.242) |
| wings and the rest | 0.154 | 0.138 |
| rim-runners | 0.281 (0.199 / 0.158) | 0.337 (0.211 / 0.157) |
| everyone | 0.172, r 0.79 | 0.157, r 0.75 |

The correlation is lower because the spread is: the heavy-usage men are
closer to their own numbers and the league's usage slope is 0.75 against
1.04, which was right only because the guards' surplus and the bigs' deficit
pulled it both ways.

The league, real rosters, per team game (600 games before, 1,200 now):

| | before | now | NBA |
|---|---|---|---|
| points | 117.0 | 115.9 | 115.0 |
| possessions | 100.2 | 99.8 | 100.0 |
| field goal attempts / FG% | 90.4 / 47.7 | 90.9 / 47.1 | 88.6 / 47.1 |
| threes | 35.2 | 35.9 | 36.8 |
| free throws / turnovers | 22.8 / 13.5 | 22.1 / 13.2 | 23.4 / 13.7 |
| assists | 27.1 | 28.2 | 26.6 |
| tracked drives | 56.9 | 53.9 | 66.1 |
| spot-up / transition | 31.1 / 21.3 | 29.9 / 21.2 | 27.6 / 21.0 |
| P&R handler / isolation | 20.1 / 10.8 | 20.1 / 9.1 | 17.3 / 8.1 |
| post-up / roll man | 2.7 / 4.8 | 4.8 / 5.3 | 3.9 / 6.1 |
| cut / putback / handoff / off screen | 4.2 / 5.3 / 4.2 / 4.4 | 4.3 / 5.5 / 4.9 / 4.6 | 7.7 / 6.0 / 5.1 / 4.2 |

**Still out.**
- **Embiid**, 0.22 against 0.34. He needs about two and a half times the
  weight the fit gives him - touches cannot tell him from Jokic and Giddey -
  and his pick-and-pop goes to the elbow, where the catch-and-shoot gate
  skips 8 to 16 ft and he reads like anyone else. Porzingis is short on the
  same counts.
- **The ball-handlers who are not stars**: Cunningham 0.23 against 0.30,
  LaMelo Ball 0.23 against 0.31, Reaves 0.19 against 0.26, Doncic 0.31
  against 0.37. Their attacks turn into their own shots at 0.21-0.26, the
  pick-and-roll passing out of most of them, and a man's shots lean on
  ball_dominance at r -0.6 across the league.
- **The rim-runners**, about twice their real usage: their rolls run 2.3
  times Synergy's (Gobert 5.0 a 36 against 1.7) while the poppers' run short
  (Embiid 0.9 against 5.9), because the screener is chosen by screen
  assists and a roller finishes most of what he catches.
- Post-ups 4.8 against 3.9, most of it Sengun (8.3 against 5.3); cuts 4.3
  against 7.7, as before; tracked drives three fewer.

### The tendencies, against what they were built from

**Every volume tendency is a real rate, so the engine should play it back.**
`shot` is attempts a 36, `touches` front-court catches a 36, and the play
and shot tendencies are each a real rate per touch or a Synergy share - so
each man's sim volume should follow his real one at a log-slope of 1.0.
Measured man by man on bench's real-roster rotation (1,200 games), before
*Who shoots, a read at a time* and after this:

| a man's volume against his real one (log-slope) | original | after *Who shoots* | now |
|---|---|---|---|
| attempts (`shot`) | 0.98 | 0.71 | 0.74 |
| front-court touches (`touches`) | 0.98 | 1.01 | 0.93 |
| P&R ball handler | 0.60 | 0.35 | 0.79 |
| spot-up | 0.22 | 0.29 | 0.87 |
| cut | 0.47 | 0.50 | 0.98 |
| handoff / off screen | 0.30 / 0.44 | 0.33 / 0.43 | 0.49 / 0.65 |
| roll man / putback | 0.99 / 1.11 | 0.96 / 1.08 | 0.91 / 1.10 |
| drives | 1.31 | 1.17 | 0.86 |
| catch-and-shoot threes | 1.19 | 1.07 | 1.05 |
| assists / potential assists | 1.10 / 1.19 | 1.15 / 1.17 | 1.07 / 1.09 |

The attempts were right in the original only in spread - the stars were the
wrong men (see *Who shoots*) - and after it the spread was short: every route
that does not ask the shot weight went to the wrong men. Seven things:

- **Half the tendencies were read at half their spread.** The ratings build
  writes most play and shot volumes square-root compressed (50 x the
  multiple ** 0.5) and the engine read them as written, as the drive and
  the isolation were until they were squared back. The pull-ups in the
  isolation, the pick-and-roll and the drive, the mid-range catch-and-shoot,
  the handoff and the off-screen receiver and the cut now read the true
  multiple (`GameEngine._true_multiple`).
- **The Synergy shares were read as volumes.** `play_handoff`,
  `play_off_screen` and `cutter_frequency` are each a share of the man's own
  possessions, and where the engine picks the man - who comes off a
  handoff or a pin-down, who cuts - a specialist with few possessions read as
  a heavy user: the league's lowest-volume third took 0.74 handoff and 0.65
  off-screen shots a 36 against a real 0.23 and 0.14. Each is now the share
  times his volume (`_play_volume`, the share's multiple times `shot` / 50).
- **Anyone who attacked could call a pick-and-roll for himself**, at the
  same weight, so the bigs ran them (Adebayo 3.0 a 36 against none) and the
  point guards ran half theirs (Doncic 4.6 against 10.9). A man's real
  pick-and-rolls go with ball_dominance at a log-slope of 2.4 (r 0.86), and
  the call is weighed by ball_dominance cubed (`SCREEN_CALL_DOMINANCE_EXPONENT`).
- **Every screener was hit alike**, so Gobert, who sets the most screens,
  got 5.1 roll plays a 36 against a real 1.7 and Embiid 1.7 against 5.9. The
  NBA's roll men finish on screen assists ** 0.6 and their own shot volume
  ** 0.42 (r 0.75), and the pass to the screener is weighed by both
  (`SCREEN_PASS_*_EXPONENT`).
- **A dump-off was filed as whatever the handler was running** - a spot-up,
  or the big's own pick-and-roll - where Synergy files it as a cut: Gobert
  3.4 spot-ups a 36 against 0.2. A catch-and-finish that is not the roll is
  a cut now.
- **The rim-runners finished too much of it.** With the dump-offs counted
  where they belong their usage ran 0.24 against 0.16;
  `CATCH_FINISH_TENDENCY_SCALE` 0.45 -> 0.30, and the cut takes its multiple
  to 0.7, because the cutters also stand where the collapse's dump-offs land.
- **The shot weight was re-swept** with the pick-and-roll following the
  handler (see config's WHO SHOOTS): its pull on ball_dominance had been
  fitted while the handlers' attacks were isolations, and left attempts
  leaning on it at -0.26 (`SHOT_WEIGHT_*`: 1.4, 1.6, 1.5, 0.9).

Usage against real, minutes-weighted mean |log of sim over real|:

| | original | after *Who shoots* | now |
|---|---|---|---|
| everyone (r) | 0.172 (0.79) | 0.157 (0.75) | 0.143 (0.79) |
| the 50 men at 25% usage or more | 0.183 | 0.123 | 0.134 |
| ball-handlers / post bigs | 0.152 / 0.219 | 0.145 / 0.132 | 0.135 / 0.133 |
| wings / rim-runners | 0.154 / 0.281 | 0.138 / 0.337 | 0.120 / 0.312 |

Assists by kind of player a 36, sim / real: ball-handlers 7.2 / 6.3, wings
2.9 / 3.1, post bigs 3.8 / 4.2, rim-runners 2.2 / 2.8. The passer's quality
was already right - a man's potential assists per pass go with his
pass_vision at 0.0095 a point against the NBA's 0.0086 - so what is left is
who has the ball to pass.

The league, per team game: points 115.8, possessions 99.6, attempts 90.1 at
47.3%, threes 35.7 at 36.1%, assists 28.1, turnovers 13.5, free throws 22.4,
tracked drives 54.6 (NBA 115.0, 100.0, 88.6, 47.1, 36.8, 36.0, 26.6, 13.7,
23.4, 66.1); spot-ups 27.8, transition 21.1, P&R handler 18.0, isolation
9.0, cuts 7.1, putbacks 5.4, handoffs 6.0, roll man 4.1, off screen 5.1,
post-ups 5.4 (27.6, 21.0, 17.3, 8.1, 7.7, 6.0, 5.1, 6.1, 4.2, 3.9).

**Still out.**
- **The pull-ups.** 3.3 pull-up twos a team game against 12.3, and per man
  a log-slope of 0.5. An attack that chose to shoot rolls his whole shot
  split, and a rim roll from out there becomes a drive, so the off-dribble
  tendencies are asked only inside the isolation, the pick-and-roll and the
  drive. Tried and backed out: making "shoot" a pull-up by those tendencies
  took the drives with it, and a pull-up chance on every read, the drive's
  treatment, put the league at 14-18 isolations - the NBA's pull-ups come
  off its picks. This is the shot selection pinned after the audit.
- **The hub bigs' share of the ball**: Jokic touches it 72 times a 36
  against 98 and passes 41 against 75, and his assists come with it (7.9
  against 11.1 here). The star bigs run 11% under their usage, the star
  guards 10% over.
- The roll man, 4.1 a team game against 6.1 now that the passes follow the
  screener; post-ups 5.4 against 3.9, most of it Sengun (8.6 a 36 against
  5.3); the rim-runners, still a third over.

### The hub bigs, and the pull-up

**Jokic passed like Jokic and had the ball half as often.** On real rosters
he made 0.18 potential assists a touch, the real one's rate exactly, and
touched it 72 times a 36 against 98: 21 backcourt touches against 39, the
gap the backcourt pass left as "neither the rebound nor the bring-up". Draymond
Green had 16 against 34 and Mobley 14 against 27, while the scorers who hold
the ball - Booker 47 against 25, Durant 37 against 18 - had twice theirs.
Two rules, neither a new column:

- **Who brings it up** read ball_dominance, his seconds a touch, and the
  playmaking bigs keep it a beat and move it. Off the NBA's backcourt touches
  less rebounds and steals the fit runs r 0.83 on touches and ball_dominance
  and 0.86 with pass_vision (0.018 a point), which puts Jokic at 27.0 against
  his real 27.3; doubled for the choice among the handlers on the floor, as
  before (`BRING_UP_*`, `BRING_UP_VISION_PER_POINT`).
- **Whether the man with it keeps it** read his handle, and the best handle
  on the floor kept everything: Booker and Durant, 92 each, pushed every
  board and inbound they got. A man who can handle it now keeps it as often
  as he, not the best handler back, is the man who brings it up - his
  bring-up weight against that man's (`BACKCOURT_KEEP_BY_WEIGHT`).

Handing it on is also a pass now, as tracking counts it - for the record
only, naming no passer for an assist - and the rebounders' passes, which ran
at half the NBA's, come to 36 a 36 against 44 with the spread between men at
0.78 (it was 1.09).

**A pull-up was a zone in his whole shot split.** An attack that chose to
shoot rolled the split, which counts his catch-and-shoots, putbacks and cuts,
so a corner shooter's pull-ups came out threes and the off-dribble
tendencies were asked only inside the isolation, the pick-and-roll and the
drive: 3.3 pull-up twos and 7.8 pull-up threes a team game against the
NBA's 11.0 and 9.9, per man at a log-slope of 0.5. The rim or a jumper is
still his split, so the drive keeps its share; which jumper is his pull-up
rates (`PULL_UP_THREE_SHARE` 0.47, the NBA's mix). And the NBA takes its
pull-ups off its picks, so the handler's pull-up off the screen comes up
(`SCREEN_EFF_SHOOT_PROB` 0.15 -> 1.2, the three 0.45 -> 0.7) with the
attack's own shot (`PLAY_WEIGHT_SHOOT` 0.315 -> 0.6), and the catch-and-shoot
down to make room (`CATCH_SHOOT_TENDENCY_SCALE` 0.28 -> 0.24). Then the shot
weight was re-swept once more, with the right men bringing it up (config's
WHO SHOOTS).

Tried and set aside: a heavier pick-and-roll drive and a higher drive read
moved the drives by under one either way - they are short for reasons this
pass did not find.

Real rosters, 1,200 games (and *The tendencies* before it):

| a man's volume against his real one (log-slope, r) | before | now |
|---|---|---|
| attempts | 0.74, 0.76 | 0.89, 0.84 |
| backcourt touches | 0.88, 0.80 | 0.94, 0.84 |
| pull-up twos / threes | 0.51 / 0.52 | 0.78 / 0.58 |
| P&R handler | 0.79 | 0.85 |
| passes made | 1.09 | 0.78 |
| assists / potential assists | 1.07 / 1.09 | 1.09 / 1.10 |

| usage against real, mean \|log\| | before | now |
|---|---|---|
| everyone (r) | 0.143 (0.79) | 0.120 (0.86) |
| the 50 at 25% usage or more | 0.134 | 0.113 |
| ball-handlers / post bigs / wings / rim-runners | 0.135 / 0.133 / 0.120 / 0.312 | 0.099 / 0.114 / 0.108 / 0.260 |

Jokic: 82 touches a 36 (36 of them in the backcourt), 60 passes, 15.4
potential assists and 10.0 assists, against a real 98, 39, 75, 17.4 and 11.1.

The league, per team game: pull-ups 9.2 threes and 6.8 twos,
catch-and-shoot threes 26.3, restricted area 26.8, paint 20.0, mid-range 9.3,
corner threes 13.2, above the break 22.2, points 115.7, possessions 99.9,
attempts 91.6 at 47.0%, assists 27.4, turnovers 13.3, tracked drives 50.8
(NBA 9.9, 11.0, 26.3, 25.5, 17.9, 9.0, 9.8, 27.4, 115.0, 100.0, 88.6 at
47.1, 26.6, 13.7, 66.1).

`bench.py --games 300 --league --real-only` itself, on the last commit and
on this one: points 115.4 / 116.0, attempts 90.4 / 91.8, assists 28.3 /
27.7, turnovers 13.8 / 13.4, free throws 22.1 / 21.9, tracked drives 54.9 /
50.9, and shots from 8 ft to the arc 18.5% / 21.9% of the attempts - which
bench flags against its 17.1%. That last is the first item below.

**Still out.**
- **The 8-9 ft strip** - done in *The 8-9 ft pile, and the floater*, off
  the shot chart by ACTION_TYPE and distance the pull has since cached. As
  it read: The sim's two-point jumpers are about the NBA's in
  number, 15.8 a team game, but too close in: 6.9 inside 10 ft and 8.9
  beyond, where tracking's catch-and-shoots and pull-ups put 12.6. By the
  exact distance the 8-9 ft strip holds 9.7 shots a team game against the
  NBA's 3.7 (its 5 ft and 8 ft shot-location tables), and 10-19 ft holds
  8.2 against 12.0. Three things put them there: the drive's pull-up shoots
  from where the drive is, 8 to 10 ft, and floats one by tend_floater on top
  of the stop-short floaters, which alone are the NBA's driving floaters and
  hooks (7.1 a team game against 7.4; 10.5 floaters with the pull-up's); the
  step-back of a man inside 10 ft is floored at 8 ft, so a man at two feet
  is moved six; and the jumper's distance bands are the shape of every shot
  beyond 8 ft, floaters included. The pull-ups this pass added went on top
  of the strip rather than out of it. Where the floaters and the pull-ups
  really land wants the shot chart by ACTION_TYPE and distance, which the
  stats cache does not keep. And bench's 17.1% is from an earlier pull: the
  current 2025-26 tables give 40.1% inside 8 ft, 18.5% from 8 ft to the arc
  and 41.4% from three, against its 40.3, 17.1 and 42.6 (its own 36.8 threes
  of 88.6 attempts are 41.5%).
- **The drives**, 50.8 against 66.1 (they were 56.9 at the start of *Who
  shoots*): the pull-ups took some of the pick-and-roll's, and neither the
  pick-and-roll's drive weight nor the drive read brings them back.
- **The pull-up twos**, 6.8 against 11.0 - most of the rest is in the
  strip above - and the corner, 13.2 threes a team game against 9.8 with
  the above-the-break ones 22.2 against 27.4: the shot selection.
- The star guards run 11% over their usage and the star bigs 11% under; Jokic
  catches it 46 times a 36 in the front court against 59; Embiid 0.22 against
  0.34; the rim-runners and the roll man as before; three attempts a team
  game too many, with two free throws too few.

### Touches and shots, held to the tendency

**The one thing the user wants played back as near exactly as the engine
can.** `touches` is a man's real front-court catches a 36 and `shot` his real
attempts (on the working scale both are linear in the real rate: 50 is 30.9
catches and 13.0 attempts, the middle half of the 209 full-season regulars
within ±0.2 of that). Measured man by man against them on bench's real-roster
rotation, the catches missed by 18% on average (r 0.67) and the attempts by
12% (r 0.83), and the misses had a shape:

- **The point guard caught half his number.** Real front-court catches are
  flat across positions - 30.9 a 36 for point guards, 31 for wings and
  forwards, 35 for centres - and the sim gave point guards 23.4. Per pass
  they were picked like anyone (0.25 of the passes they were eligible for),
  but the point guard is the passer on three passes in ten, and the real one
  catches it as often as anybody all the same.
- **Teams did not move the ball as they do.** Each team's catches a game
  against its real ones ran at r 0.03: Indiana 169 against 234, Portland 148
  against 204, Sacramento 245 against 197. Nothing held a team to its men's
  touches; how soon a man ends a trip was fitted to his shots alone.
- **Rim-runners shot a quarter over** through the routes `shot` never
  asked - the putback (Mitchell Robinson 6.3 a 36 against 4.0), the cut
  (Looney 3.9 against 1.2), the roll (Gobert 3.9 against 1.7).

The weights could not fix it: the catches answer to the pass weight at about
a third of its spread, and a team's total is not the pass's to give. So, like
the shot diet, each man carries what he is owed tonight - his rate over the
minutes he has played - against what he has had (config's THE VOLUME
APPETITE):

- **The pass leans to the man owed catches** (`_touch_appetite`). What he
  has had is each pass's chance of finding him, not who it found: counted as
  they fell, the catches were corrected for luck as hard as for the lean.
- **The attack, the catch-and-finish, the putback, the pass to the roll man
  and the cut lean to the man owed shots** among the five on the floor
  (`_shot_appetite`), so it only moves shots between them. Not the spot-up
  jumper, whose volume already follows its own rates (log-slope 1.02): on
  it, a man owed shots was handed them as spot-ups.
- **A team owed catches swings it** (`_ball_movement_appetite`, THE SWING
  in `_read_the_floor`): that share of its catches is passed on without a
  read, and a team that has had its fill attacks sooner. Asking less of every
  read instead moved the shots off the plays and onto late catches.
- **Each man's role tonight** is drawn at the tip (`_roll_nights`). A hold on
  what happened takes the night-to-night swing out with the bias - at full
  strength a man's attempts varied a third as much from game to game as
  chance says - so the swing is drawn instead, lognormal with a mean of 1 (a
  season of them is his tendency), and the appetites hold him to it.
  `NIGHT_*_VARIANCE` were set from the league game log afterwards - see
  *The drives: who drives, and why there are not enough of them*.

The extra catches cost two trips a game; that time comes back after the shot,
where the pace is anchored (`INBOUND_AFTER_MAKE_SECONDS` 5.3 -> 5.0,
`REBOUND_SECONDS` 2.3 -> 2.2), and the shot-clock table did not move.

**And the pull-up off the drive.** A drive can stop in the mid-range and pull
up, decided as it begins on his pull-up two rate (`_drive_pull_up_spot`,
`DRIVE_MID_PULL_UP_*`). The spot is where the NBA's pull-up twos go up, from
the shot chart's action types (`python -m ratings_build.pull
--shot-actions-only`, new): 2.06 a team game from 10-14 ft, 2.11 from 15-19,
0.41 from 20 out. The NBA's tracked 11.0 pull-up twos include its floaters
from 10 ft and beyond (2.2), which the engine's stop short of, so its jumpers
aim at 8.8. A drive that pulls up there never gets inside 10 ft and is not a
tracked drive, so the drive per catch comes up to keep the tracked ones
(`DRIVE_READ_PROB` 0.108 -> 0.22).

Real rosters, 1,200 games (600 before):

| a man against his own tendency | before | now |
|---|---|---|
| front-court touches, mean \|log\| (r) | 0.183 (0.67) | 0.055 (0.93) |
| attempts, mean \|log\| (r) | 0.124 (0.83) | 0.074 (0.93) |
| point guards' catches | -0.30 | -0.04 |
| teams' catches against real (r) | 0.03 | 0.55 |
| a man's game-to-game variance, attempts / catches (chance = 1) | 0.91 / 1.10 | 0.80 / 0.99 |

By how much a man is owed, attempts against his tendency: under 9 a 36
+0.12, 9-13 +0.03, 13-17 -0.00, 17 and up -0.03; Gilgeous-Alexander 23.8
against 23.9.

The league, per team game: front-court catches 213.5, passes 262.5,
pull-up twos 9.1 and threes 9.1 (190.9, 240.8, 6.7, 9.4 before; NBA 208.6,
287.9, 11.0, 9.9). Per man, potential assists run 7.42 a 36 against 7.39
(slope 1.08, r 0.91). The men owed shots take them off the catch, inside the
window of the pass, so the self-created assist came down again
(`ASSIST_SELF_CREATED_SCALE` 1.32 -> 1.03: 69.7% of baskets were assisted).

`bench.py --games 300 --league --real-only`, the last commit / this one
(NBA): points 116.0 / 114.3 (115.0), possessions 100.4 / 99.6 (100.0),
attempts 91.8 / 91.8 at 47.0 / 46.7% (88.6 at 47.1), assists 27.7 / 27.4 at
64.3 / 64.0% assisted (26.6 at 63.8), free throws 21.9 / 19.9 (23.4),
tracked drives 50.9 / 47.6 (66.1), personal fouls 19.1 / 17.5 (19.8),
steals 8.3 / 9.0 (8.4) - 5.7 of them interceptions against 5.1, off the
extra passes; the steal rates are the user's fit (fit_ratings).

**Still out.**
- **The drives**, 47 against 66, short at every position and by half for
  forwards and centres; the chance per catch saturates (three times it is
  twice the drives).
- **The free throws and the fouls**, 19.9 and 17.5 against 23.4 and 19.8
  (21.9 and 19.1 before): a drive that pulls up at the elbow does not draw
  the paint's whistle, and the drives that do are the short ones above.
- **The play types around the shot**: spot-ups 32.8 against 27.6 - a guard
  who gets it back and goes is now a man who caught a pass - and the putback
  4.6 against 6.0, held down where only the rim-runners were over.
- The men owed under 9 shots a 36 still take 12% more, through the lob and
  the tip; Embiid 14.8 against 20.7.

### The drives: who drives, and why there are not enough of them

**The night-to-night swing, from the game log.** The NBA's attempts,
minutes-normalised, vary from game to game at 0.88 of a count's own chance
(the median of 361 men with ten 20-minute games in the league game log,
`python -m ratings_build.pull --game-logs-only`; middle half 0.71-1.08).
`NIGHT_SHOT_VARIANCE` 1.4 / 2.0 / 2.6 put the sim's at 0.78 / 0.95 / 1.06,
so it is 1.75. There is no game log of touches; the catches' swing stays at
chance (1.08).

**Who drives** now follows `drive_frequency` the way the catches follow
`touches` (`_drive_appetite`): his real tracked drives per touch - 0.164 at
50, in proportion, over 208 full-season regulars at a log-slope of 1.00 -
times the touches he has had tonight, against each chance of a tracked drive
he has been given (from 20 ft or more, not on a break, not the pull-up from
the elbow), at every place a drive can start: the read, the attack, the
isolation, the pick-and-roll and its rejected screen, the handoff, the rim
shot from out there and the blow-by. Against the five on the floor - their
drives owed against their drives had, together - so it moves drives between
them. (It was first set against the average of the five's own ratios, and a
centre who never has the ball 20 ft out runs his to the cap and took
everyone else's down: 2.4 drives a team game.) A man's drives against his
real ones, log-slope 0.82 -> 0.89, r 0.87 -> 0.91, and the league's 49.

**How many** it cannot fix: 47 a team game against the NBA's 66, every
position short - a 36, point guards 11.6 against 16.4, wings 8.2 and 7.1
against 11.4 and 10.6, forwards 5.2 against 9.1, centres 1.9 against 3.9.
A tracked drive starts on a touch 20 ft out, and in the half court that is a
catch read from out there or the bring-up's attack. Followed catch by catch,
a forward's catch reaches such a read about half the time and drives on a
fifth of those; the rest are catch-and-shoots, catches inside 20 ft, swings
and passes. The trips run out of reads: the NBA's carry 2.75 catches and
drives, the sim's 2.5 to 2.6, and the NBA takes 17% of its shots in the last
seven seconds of the clock against the sim's 8%. Every way of adding drives
inside the trips the sim has took them from something the NBA also has:

- the drive per catch at 0.32 / 0.42 (`DRIVE_READ_PROB`): 55 / 59 drives,
  the catches down to 197 a team game against 209 and the trips quicker
  (101-102);
- the drive appetite raised outright rather than shared: 57-58 drives, the
  pick-and-roll at 12-13 a team game against 17.3 and spot-ups 40 against
  27.6, because a drive off a catch is a spot-up and it came before the play;
- the swing after the drive rather than before it: 1.4 more drives, the
  teams' catches r 0.55 -> 0.36;
- a team short of catches attacking less on every catch: spot-ups 41;
- a first look on every catch that surveys before it attacks: no change,
  because the quick shots are the catch-and-shoot, the finish and the
  putback, which come before any read.

`bench.py --games 300 --league --real-only`, the last commit / this one: points
114.3 / 114.4, possessions 99.6 / 99.9, assists 27.4 / 27.7 at 64.0 / 64.6%
assisted, free throws 19.9 / 19.7, tracked drives 47.6 / 46.2, personal fouls
17.5 / 17.5.

**Still out**, and the next thing: the trip itself - more, quicker actions in
it, so the drives, the passes and the late-clock shots fit together as the
NBA's do; and with it the free throws (19.7 against 23.4), which follow the
drives.

### The touch, decided once - built, and left off

**Why it was tried.** The read a catch gets asks a chain of chances - the
swing, the post on the catch, the drive, the attack, then pass or hold - and
every hold is a fresh read with all of them asked again. So a man who holds
long has the most chances to attack, the chances compete for the same few
catches, and every drive a team adds costs it catches the swing takes back.
The NBA's trips carry more reads than the sim's (2.75 catches and drives
against 2.5-2.6) and a sixth of its shots come in the clock's last seven
seconds against the sim's 9%.

**What it is** (`_plan_the_touch`, `TOUCH_PLAN`). A catch in the half court,
and the touch that brings the ball up, is decided once: a drive, an attack of
his own, or a pass - and only carried out after, however long he takes.
Holding is time, not another draw (`TOUCH_HOLD`, `BRING_UP_TOUCH_HOLD`, at most
`TOUCH_HOLDS_MAX`). The post on the catch keeps its place; where he caught it
decides that. With `TOUCH_SELF_FIRST` his own share of the touch is his drive
chance plus his attack, times the team's ball-movement appetite, split between
the two by his own rates; the pass is what is left. **Passes need no
tendency of their own**: within the counting, the NBA's passes per touch are
one less his shots, trips to the line and turnovers per touch, and every one
of those already has one.

**How it was set.** A coordinate search over eleven knobs against twelve NBA
targets at once - the front-court catches, the drives, pace, attempts, free
throws, the pick-and-roll, isolations, spot-ups, the late-clock and
early-clock shots, the long touches, the pull-up threes - three rounds on
bench's real-roster rotation. Its best moved shared knobs as well as its own,
and only means anything with them: `ATTACK_SHOT_PROBABILITY_AT_MEAN` 0.1425,
`DRIVE_READ_PROB` 0.30, `PLAY_WEIGHT_SHOOT` 0.20, `SCREEN_CALL_WEIGHT` 171.9,
`INBOUND_AFTER_MAKE_SECONDS` 4.0 and `REBOUND_SECONDS` 2.5 (for equal pace);
its own are in config as found.

**What it did**, 600 real-roster games each, at equal pace:

| per team game | engine | per-touch | NBA |
|---|---|---|---|
| tracked drives | 49.1 | 48.8 | 66.1 |
| P&R handler plays | 14.8 | 16.6 | 17.3 |
| shots in the clock's last 7 s | 9.2% | 11.7% | 17.3% |
| pull-up threes | 9.1 | 7.2 | 9.9 |
| points | 114.8 | 112.7 | 115.0 |

The catches and the shots per man were held as well either way (front-court
touches 0.060 mean log error, r 0.93; attempts 0.080), and the teams' catches
against their real ones went 0.54 to 0.58. The search's own best looked like
more drives, and was 3% more trips. Patience on top - the attack cut while
the clock is young (`TOUCH_PATIENCE`) - left the late-clock shots where they
were and took the pick-and-roll down.

**Why it is off.** It does not raise the drives, which were the point, and it
costs pull-up threes. Two things came out of it. The catch clamp holds each
team's catches a minute at its men's total, so whatever reshapes the trip is
balanced back against the catches. And the catches were in the wrong places -
31.5 paint touches a team game against 24.8, 12-14 post touches against 7.3:
see *Where the catches happen, and how the mid-range comes*.

### Where the catches happen, and how the mid-range comes

The modern floor catches the ball at the rim or behind the arc, and the sim
did not, in three ways. Per team game, against 2025-26 tracking: 31.7 paint
touches against 24.8 and 13.3 post touches against 7.3, while the elbow's
8.6 against 8.9 hid who was there - DeRozan 10.6 elbow touches a 36 against
a real 2.0, Embiid 13.6 against 4.2, Jokic 4.7 against 10.3; Giannis 19.5
post touches against 8.0, Claxton 28.7 paint touches against 10.1. And 23
catches a team game were made between 16 ft and the three-point line, where
the NBA takes 1.6 catch-and-shoot twos against 26.5 threes.

**Coming back out, he runs** (`SPACING_RELOCATE_FEET`). The spring home
closed a share of the gap a second, so a cutter walked back from the rim to
the arc in four seconds, three of them between 15 ft and the line - and the
passes found him there: 14 catches a team game by men on their way back out.
He now covers 12 ft a second at least. **And a spaced man wanders along the
line, never inside it** (`SPACING_LINE_MARGIN`): his spot is a foot behind
it, and the wander put him on it for 7 catches a team game. Catches just
inside the line, 20.4 a team game -> 9.1.

**The elbow is the big's** (`SPACING_ELBOW_*`). It went to the man with the
catch-and-shoot twos - a reason to shoot there read as a reason to stand
there. A real man's elbow touches, as a share of his front-court touches,
follow screener_frequency and post_up (log-slopes 0.78 and 0.23, r 0.78 over
358 regulars, weighted by touches): the man who sets the high ball screen
and works the handoffs, and the post man who catches it high - Jokic,
Sabonis, Sengun, Sarr, and the rim-runners who hand it off, Claxton, Allen,
Duren.

**And so is the top** (`_high_pull`, `SPACING_HIGH_*`). Among the 41 bigs who
screen and do not shoot threes, a real man catches half the ball (0.52) away
from the paint, the post and the elbow - Ayton 0.21 to Nurkic 0.67, going
with his touches at a log-slope of 0.69 - and in the sim they had none of it
(Claxton 0.09, Sengun 0.05): a man who was not spread had only the dunker
spot, the elbow and the block. One man who is not spread may now take the top
of the key instead, drawn against his other pulls on his touches, and the
men spread out take the corners and the wings around him. The block's pull
is post_up as a power now (`SPACING_POST_EXPONENT`), as the real post share
follows it (log-slope 0.80 on the working scale, r 0.84), where it was only
what he had over 50.

**`shot_mid_off_catch` and `shot_mid_off_dribble` are shares now**, under
`shot_mid_range` as it is under `shot`: of his mid-range shots (twos past 8
ft), the share off the catch and the share off the dribble - League 10.1% and
69.6%, the rest hooks, floaters and post moves; Vucevic 52% off the catch,
Embiid 28%, DeRozan 12%, Gilgeous-Alexander 5%. They were each his per-touch
rate of those jumpers, and a rate read on its own said where he stood as
well as what he shot. The engine reads the chain - his shots per touch, times
his mid-range share, times this share, against the league-average man's
(`_mid_multiple`) - so they say how his mid-range comes and nothing about how
much of it there is: Gobert's 28% off the catch sits on a 5% mid-range share.
The chain reproduces the old rates man by man (log r 0.83 for the pull-up
twos, 0.61 for the catch-and-shoot twos, a small and noisy count). The ratings
build makes them (`share_of`, shrunk toward the league by the season's own
prior), the archetype model predicts both for customs (24% and 23% better
than the league average; the catch was 8% as a rate and left out), and a
sheet written before says so on its marker and is converted as it is read
(`tendency_scale.migrate_mid_pair`) - see the ratings build's README, *Shares
vs volume*.

The three pulls and the catch-and-shoot scales were set together, a
coordinate search and then by hand on 600-game runs, against the league's
zone touches and its shot types. 1,200 real-roster games on the sheet as
rebuilt, against 400 before:

| per team game | before | now | NBA |
|---|---|---|---|
| paint touches | 31.7 | 24.6 | 24.8 |
| post touches | 13.3 | 9.0 | 7.3 |
| elbow touches | 8.6 | 9.0 | 8.9 |
| catches from 16 ft to the line | 23.2 | 11.7 | |
| catch-and-shoot threes | 27.7 | 26.7 | 26.5 |
| catch-and-shoot twos | 1.8 | 1.4 | 1.6 |
| pull-up twos | 9.5 | 9.1 | 11.0, 8.8 of them jumpers |
| tracked drives | 49.0 | 50.7 | 66.1 |

`CATCH_SHOOT_TENDENCY_SCALE` 0.24 -> 0.14, because the catches the long two
used to take are now made behind the line; `CATCH_SHOOT_MID_MULT` 0.07 ->
0.16 with it, the same chance on a catch and a little over - the catches it
is asked on halved, and the long two off the catch with them. The pull-up
off the drive stays where it was: the NBA's 11.0 counts 2.2 floaters from 10
ft out, which the engine's drives stop short of.

Man by man, sim against real (400 sim minutes and 500 real or more):

| | before | now |
|---|---|---|
| catch-and-shoot twos a 36, log-slope / r | 0.48 / 0.52 | 0.62 / 0.72 |
| pull-up twos a 36 | 0.80 / 0.91 | 0.90 / 0.92 |
| elbow touches, r | 0.77 | 0.81 |
| paint touches, mean log error | 0.429 | 0.405 |
| post touches, log-slope / r | 0.55 / 0.70 | 0.39 / 0.63 |
| front-court touches, error / r | 0.064 / 0.912 | 0.057 / 0.922 |
| attempts, error / r | 0.081 / 0.922 | 0.081 / 0.927 |
| teams' catches against real, r | 0.57 | 0.59 |

`bench.py --games 300 --league --real-only`, the last commit / this one, on
the sheet as it stands (converted as it loads): points 115.3 / 114.5,
possessions 100.4 / 99.8, assists 27.6 / 27.0 at 64.3 / 63.2% assisted, free
throws 20.6 / 19.9, tracked drives 48.7 / 51.1, drive attempts 21.6 / 24.7,
threes 36.8 / 36.5.

**To play the real shares**, see *How the threes come* - the paste there
carries both pairs.

**Still out.**
- **The drives**, 51 a team game against 66. The catches that moved were the
  bigs', who drive least; the guards' were already behind the line.
- **The post, man by man.** The post scorers who are spread - Porzingis 1.5
  post touches a 36 against 6.4, Horford 0.6 against 5.0, Jaren Jackson 1.4
  against 5.3, Portis 1.9 against 5.8 - post up from out there in the NBA,
  and nothing here starts one; the rim-runners catch in the post area on
  their way in (Raynaud 6.3 against 2.6, Capela 4.4 against 1.2).
- **The elbow, man by man.** The wings never catch it there (none against a
  real one to three a 36); Jokic 6.1 against 10.3, Nurkic 10.7 against 4.1.
- **The pick-and-pop two**: Vucevic 0.5 catch-and-shoot twos a 36 against
  1.6, Embiid 1.7 against 2.6. The pop is where those come from, and it has
  not been followed yet.

### How the threes come, and the split under the diet

**`shot_3_off_catch` and `shot_3_off_dribble` are shares too** -
`tendency_scale`'s version 3: of his threes, the share off the catch and the
share off the dribble, under `shot_3_pointer` the way the mid-range pair is
under `shot_mid_range`. League 70.3% and 26.3%; Curry 52 / 48, Klay Thompson
74 / 25, Doncic 26 / 69, Gilgeous-Alexander 17 / 79. The engine reads them
through the same chain (`_jumper_multiple`, with each key's zone in config's
`JUMPER_ZONE_SHARE`), on the scale each site always read them: the
catch-and-shoot gate, the handoff and gravity on the square root, as the old
rate was written; the isolation, the attack's pull-up and the corner's pull on
the rate itself. For real players the chain is the old rate again (log r 0.95
and 0.98), so on its own the change moves nothing - it is the meaning, for
what you type. See the ratings build's README, *Shares vs volume*.

**What the pair says was not being played, and now is.** Man by man the
sim's pull-up threes followed his real ones at a log-slope of 0.49 (r 0.73):
Doncic 2.1 a 36 against 7.5, Edwards 2.0 against 6.2, while Caruso took 3.0
against 0.8. Two things:

- **The break's shot.** From behind the arc on a break the shot is a pull-up
  from where he is running (config's *THE BREAK'S SHOT*), and who took it was read off
  his shot weight alone - so the wing who caught the ahead pass and did not
  let it go on the catch rose off the dribble as readily as a guard who lives
  on it. That was half the league's pull-up threes (5.1 of 9.6 a team game),
  and the men who rarely take one had twice the share of it the men who do
  had. It is weighted by his own pull-up threes now.
- **The split under the diet** (`_how_appetite`, config's *HOW HE GETS
  THEM*). The shot diet holds where a man's shots come from and nothing held
  how, so the threes a star was owed went up on the catch, which comes before
  anything he does with the ball: Tatum 6.6 catch-and-shoot threes a 36
  against a real 2.3. Under each share of the diet there is now the same
  appetite one level down - his two shares against each other, against the
  jumpers he has taken each way tonight - applied wherever a jumper is
  chosen off the catch (the gate, the handoff) or off the dribble (the
  attack's pull-up, the break's, the isolation's, the pick-and-roll's, the
  drive's). Exponent 4; 8 was no better and took the catch-and-shoot threes
  under the NBA's. The catch scale rises 0.14 -> 0.155 with it, as the stars
  stopped taking their threes on the catch.

1,200 real-roster games, the last commit / this one, sheets as rebuilt:

| man by man, sim against real | before | now |
|---|---|---|
| catch-and-shoot threes a 36, log-slope / r / mean log error | 0.87 / 0.94 / 0.236 | 0.95 / 0.97 / 0.169 |
| pull-up threes a 36 | 0.49 / 0.73 / 0.664 | 0.70 / 0.87 / 0.446 |
| catch-and-shoot twos | 0.62 / 0.72 / 0.378 | 0.60 / 0.68 / 0.403 |
| pull-up twos | 0.90 / 0.92 / 0.398 | 0.87 / 0.92 / 0.394 |
| front-court touches, error / r | 0.057 / 0.922 | 0.057 / 0.920 |
| attempts, error / r | 0.081 / 0.927 | 0.077 / 0.931 |

| a 36: catch-and-shoot / pull-up threes | before | now | real |
|---|---|---|---|
| Tatum | 6.6 / 3.3 | 4.3 / 4.8 | 2.3 / 7.1 |
| Doncic | 6.0 / 2.1 | 3.5 / 3.5 | 2.8 / 7.5 |
| Edwards | 5.6 / 2.0 | 4.0 / 3.4 | 2.4 / 6.2 |
| Curry | 7.4 / 2.8 | 7.1 / 3.2 | 6.8 / 6.3 |
| Caruso | 3.5 / 3.0 | 4.8 / 1.8 | 5.5 / 0.8 |

The league: catch-and-shoot threes 26.5 a team game, pull-up threes 9.4 (the
NBA's 26.5 and 9.9), twos 1.5 and 9.0; threes in all 35.9 against 36.2. The
catch-and-shoot twos per man are within their noise - a small count.

**What is left is the stars' threes as a whole**: Doncic takes 7.0 a 36
against a real 10.4, Curry 10.4 against 13.0, Edwards 7.4 against 8.5 - the
zone split, not the split under it, and the shot diet's own business.

**To play the real shares**, rebuild and paste the whole sheet, and
`ratings_build/output/overrides_1_100.csv` over the overrides tab - each with
its `tendency_scale` column: a pair without the marker is read as old rates
and converted a second time, and the marker without the pairs reads the old
rates as shares. Until then the sim converts the old values as it loads
them, which keeps each man's lean but not his real share. A blank stays blank
through all of it, and the build predicts it for a custom with attributes.

### The 8-9 ft pile, and the floater

**Every two now comes from where its kind of shot comes from**, by the foot,
off the league's whole 2025-26 shot chart by ACTION_TYPE and distance
(`shot_actions_league`, 219,160 attempts). The sim's twos were about the
NBA's in number but 8.9 a team game of them sat at 8-9 ft against 3.55, and
10-14 ft was short, 5.4 against 7.4. Four things put them there, each a
distance that was not the league's:

- **The stop-short floater** was drawn flat from 5-10 ft. The league's
  driving floaters and hooks run from 1 ft to 17, most at 5-8:
  `DRIVE_STOP_SHORT_BANDS` is their shape inside 10 ft, and
  `DRIVE_STOP_SHORT_BASE` their share of the drives' shots there, 0.31 (it
  was 0.37, every floater over every driving shot).
- **The ones from 10 ft and beyond**, 1.86 a team game, come off the drive
  that stops out there, beside the pull-up from the elbow
  (`DRIVE_LONG_FLOAT_BASE`, `DRIVE_LONG_FLOAT_BANDS`, `_drive_pull_up_spot`).
  Drawn into the stop-short instead they cost five drives a team game: a
  drive that stops at 12 ft never gets inside ten, so it is not a drive, and
  it never kicks out either, so 44% of the floaters came from out there
  against the league's 25%.
- **The pull-up inside the drive** made a floater half the time by his
  tend_floater - the stop-short's floater asked a second time - and 2.9 shots
  a team game from 8-10 ft against the league's 0.47 pull-up jumpers there. A
  jumper always now, at `DRIVE_PULL_UP_BASE` 0.012: 0.47.
- **The step-back from the rim** was floored at 8 ft, so every mid-range
  jumper a man chose from 1-6 ft went up from exactly 8.0. A man too close
  for a step-back to reach the mid-range shoots from where he is - the rule
  the three already had.
- **The jumper's own distance** (`MID_RANGE_DISTANCE_BANDS`) was the shape of
  every two beyond 8 ft, a third of the 8-10 ft ones floaters. It is the
  jumpers' alone now: 11% from 8-9 ft against the 24% it gave.

**And the floater reads the same from anywhere.** The league's go in at 44%
from 4 ft to 12. The sim's went in at 44% from 7 ft and 36% from 8, because
two finishing terms meant for the rim stopped at the 8 ft line - the empty
paint in `_drive_finish` and the zone's contact counter in
`_calculate_contest` - and at 10 ft the contest switched to the jumpers'
family. A floater takes none of the three now, and `FLOATER_BASE` 0.67 (was
0.509) puts it at the league's rate.

**And a drive that stops out there can be fouled.** One that pulls up beyond
10 ft puts its whistle away as it sets off, for the jumper to draw its own
the way every jumper does - but `_resolve_shot` read it as a drive, and a
drive's shot draws nothing but the whistle it set off with. So the elbow
pull-up never went to the line, from the day it was added, and the long
floaters would not have either: a free throw a team game, which is what the
first measurement of this pass lost. They draw their own now.

600 real-roster games on the same seeds, a team game:

| | before | now | NBA |
|---|---|---|---|
| twos from 0-3 ft | 26.8 | 29.7 | 25.3 |
| 4-7 ft | 10.2 | 9.7 | 10.4 |
| **8-9 ft** | **8.9 at 39.4%** | **3.6 at 43.6%** | **3.55 at 44.3%** |
| 10-14 ft | 5.4 | 6.9 | 7.4 |
| 15-19 ft | 4.4 | 5.3 | 4.4 |
| 20 ft and out | 0.6 | 1.1 | 1.1 |
| floaters | 10.9 at 40.9% | 10.4 at 45.2% | 7.75 at 45.1% |
| floaters from 8 ft out | 36.6% | 45.0% | 44.3% |
| inside 8 ft / mid / three | 40.2 / 21.0 / 38.8% | 42.9 / 18.5 / 38.6% | 40.1 / 18.4 / 41.5% |
| pull-up jumpers from 10 ft | 8.5 | 9.0 | 8.8 |
| tracked drives | 51.7 | 48.2 | 66.1 |
| free throws | 20.7 | 20.7 | 23.4 |
| points | 115.1 | 115.6 | 115.0 |

**What it cost.** Three and a half tracked drives, two of them the long
floaters, which the NBA does not count as drives either, and most of the
rest the elbow pull-ups the mid-range appetite asked for once the 8-9 ft
shots were gone (`DRIVE_MID_PULL_UP_BASE` 0.05 to 0.035 brought those back to
the 8.8). And 2.7% of the shots moved from the mid-range to inside 8 ft:
the drives that no longer pull up at 8-10 ft go on to the rim, and the
league's floaters from 1-4 ft are made now too, so the rim is 4 a team game
over where it was 1.4. The floaters stay a third too many, as they were -
the drives' shots, not their distance.

### Play types, credited to the play that was running

**The measurement.** A play is what Synergy counts: a shot, a turnover, or
a trip to the line. Each is credited to the play the engine was running at
that moment - the shot's own `play_type`, and `_shot_play_type` of the
state for a turnover or a whistle - so a bad pass out of a pick-and-roll is
the pick-and-roll's. An unnamed half-court play is a spot-up if the man
caught a pass that trip, and otherwise "no named play". The first check
after gravity read turnovers and trips off the events around them instead,
and a pass out of a play closed the play before its turnover was counted;
the pick-and-roll handler looked 0.1 of a point too efficient only because
most of his turnovers were missing.

**What it found, and what changed** (480 league games each, real rosters;
the NBA is Synergy 2025-26):

| | committed engine | now | NBA |
|---|---|---|---|
| isolation FG% / eFG% | 37.3 / 44.1 | 43.3 / 46.0 | 43.2 / 46.2 |
| isolation threes, share of its shots | 44.7% | 17.4% | ~16-18% |
| isolation shooting fouls / turnovers | 15.5 / 5.9% | 13.2 / 10.5% | 12.9 / 10.2% |
| isolation points a play | 0.947 | 0.914 | 0.933 |
| post-up FG% | 47.9 | 53.4 | 52.8 |
| post-up shooting fouls / turnovers | 10.6 / 13.4% | 14.5 / 12.0% | 14.5 / 12.1% |
| post-up points a play | 0.897 | 1.010 | 1.017 |
| P&R ball handler points a play | 0.902 | 0.906 | 0.882 |
| tracked drives ending in a pass / shot | 40.6 / 52.8% | 43.4 / 49.6% | 43.9 / 40.9% |

**The isolation took the wrong shot.** It pulled up from where it squared
up, which is the arc, so 45% of its shots were threes against the league's
16-18% (Synergy's eFG% less its FG%), and an iso that had not shaken its man
took a bad shot - the shot clock's 0.75 on top of a hand in his face - two
iso shots in five, at 30%. Its points a play were right only because it
went to the line too often and hardly ever turned it over. `_iso_shot` now
chooses the drive (`drive_frequency`), the mid-range pull-up he steps into
(`shot_mid_off_dribble`, 14-20 ft) or from the arc the step-back three
(`shot_3_off_dribble` x `ISO_THREE_W` 0.65, the one weight fitted to the
share), whether or not he beat his man; what beating him buys is the
openness, and the drive's own blow-by roll. Its clean jumpers were already
on the NBA's pull-up rates (41% from two, 32% from three; the league's
42.6 and 32.9). Its fouls came down by the same ratio at both sites
(`PLAYTYPE_FOUL_MULT` 0.46, `ISO_FOUL_PER_TICK`), and it has the post-up's
and the drive's turnover read (`ISO_TURNOVER_RATE` 0.03).

**The post-up was fighting the new contest.** Its hooks went in 42.7% of
the time against the league's 47% that `POST_HOOK_BASE` is anchored to -
the help it goes up against now stands where help comes from - so the base
went 0.57 to 0.63 (47.2%), and the fadeaway weight, the one number fitted to
the aggregate, 0.25 to 0.15. Its fouls went up and its turnovers down to
Synergy's (`PLAYTYPE_FOUL_MULT` 0.585, `POST_FOUL_PER_TICK`,
`POST_TURNOVER_RATE` 0.060). Tried and taken out: leaving the beaten post
defender on the scorer's hip for a move that worked. Nothing changed - the
finish at the rim is contested by the help, not by the man he beat.

**Drives kick out as often as the NBA's again**, `DRIVE_KICK_BIAS` 10 to
16. The fourth layer had taken the pass share to 40.6%, and it answers the
bias about half as fast as it did.

**The league held, and moved toward the NBA**: points 116.7 (117.9 before,
the NBA's 115.0), field goal attempts 90.5 (91.6; 88.6), FG% 46.8 (46.7;
47.1), threes 38.0 (38.7; 36.8) at 36.4% (36.2; 36.0), free throws 23.6
(23.7; 23.4), turnovers 14.0 (13.5; 13.7), assists 27.2 (27.1; 26.6), 64.3%
of makes assisted (63.5; 63.8).

**How often each play is run was off** - by about the same before gravity as
after, so this is old - and is refitted in *The play mix* below. As a share
of plays, before, against Synergy's per-player tables:

| play | sim | NBA | | play | sim | NBA |
|---|---|---|---|---|---|---|
| spot-up | 36.7% | 24.1% | | cut | 4.9% | 6.7% |
| transition | 15.3% | 18.4% | | putback | 4.3% | 5.1% |
| P&R ball handler | 13.0% | 16.3% | | handoff | 2.0% | 4.6% |
| no named play | 10.6% | 5.1% (misc) | | off screen | 1.8% | 3.7% |
| P&R roll man | 6.3% | 5.2% | | post-up | 1.5% | 3.4% |
| isolation | 3.7% | 7.5% | | | | |

The named plays - isolation, post-up, handoff, off screen - run at about
half the NBA's rate and the spot-up at one and a half times it. Part of that
is the same thing twice: a man who catches it, holds, and then goes at his
man on his own is a spot-up here and an isolation to Synergy. And the NBA
side is not exact. The Synergy tables in the cache are per player, and they
list only players above a minimum, so together they hold 78.4 of the
league's 88.6 field goal attempts a team game; the eleven plays summing to
99.3 is a coincidence, not a partition. The rarer plays lose the most to
that cut, so the real isolation and post-up rates are higher still. The
team tables give the exact volumes and are in the pull now, cached as
`team_play_<type>` (`python -m ratings_build.pull --team-play-types-only`
fetches just those eleven into the snapshot on disk). The build does not
read them.

### The play mix

**Measured against every play a team ran.** Synergy's team tables add up to
113.4 plays and 89.6 field goal attempts a team game - the league's whole
count, where the per-player tables hold 78.4 attempts. And counted the way
Synergy counts: a first handler, or a man who caught it and surveyed, going
at his man with no play called is an isolation; the first handler's
turnover with no play is misc; a catch shot or attacked at once is a
spot-up. The engine ran the league's number of plays, 112.1, in the wrong
mix (480 league games each, plays a team game):

| play | before | now | NBA |
|---|---|---|---|
| spot-up | 38.6 | 30.5 | 27.6 |
| transition | 17.1 | 20.6 | 21.0 |
| P&R ball handler | 14.5 | 15.7 | 17.3 |
| isolation | 13.5 | 8.1 | 8.1 |
| cut | 5.5 | 7.7 | 7.7 |
| putback | 4.8 | 5.9 | 6.0 |
| handoff | 2.2 | 4.9 | 5.1 |
| P&R roll man | 7.0 | 4.8 | 6.1 |
| off screen | 2.0 | 4.2 | 4.2 |
| post-up | 1.7 | 3.8 | 3.9 |

**Each called play came up by its own lever:** its weight in the attack read
(`PLAY_WEIGHT_POST` 0.9 to 5.5, `PLAY_WEIGHT_OFF_SCREEN` 0.28 to 1.1,
`PLAY_WEIGHT_HANDOFF` 0.40 to 1.8, `SCREEN_CALL_WEIGHT` 103 to 190), the cut
(`CUT_FIND_RATE_PER_TICK` 0.014 to 0.021), the break off a miss
(`TRANSITION_AFTER_REBOUND_PROB` 0.12 to 0.28 - about a third of defensive
rebounds become a transition play in the NBA) and the putback
(`PUTBACK_ATTACK_MULT` 2.1 to 2.8). **The spot-up's surplus was the catch:**
an ordinary swing caught and fired before any play began - tracking's
catch-and-shoot ran 31.5 attempts against the NBA's 27.9 - so
`CATCH_SHOOT_TENDENCY_SCALE` 0.50 to 0.32 (30.7, and 26.2 of them threes
against the NBA's 26.3). **More screens were called and more of them
driven**, `SCREEN_EFF_DRIVE_PROB` 0.75 to 1.8 and the pass to the roller
0.45 to 0.30: the handler's plays came toward Synergy's and some drives came
back. The roll man is the one play that went the wrong way.

**The league held.** Breaks and quicker plays took pace to 103.4; the time
after the shot put it back (`REBOUND_SECONDS` 1.8, `INBOUND_AFTER_MAKE_SECONDS`
4.9), which is where pace is meant to be set, leaving the shot-clock table
alone. Assists came up with handoffs, off-screens and cuts, which are
assisted by nature, and `ASSIST_SELF_CREATED_SCALE` went 1.10 to 0.95.

| per team game | before | now | NBA |
|---|---|---|---|
| points | 116.7 | 116.8 | 115.0 |
| possessions | 100.6 | 99.9 | 100.0 |
| field goal attempts | 90.5 | 89.5 | 88.6 |
| FG% | 46.8 | 47.8 | 47.1 |
| threes | 38.0 | 35.6 | 36.8 |
| free throws | 23.6 | 23.5 | 23.4 |
| turnovers | 14.0 | 14.0 | 13.7 |
| assists / % of makes assisted | 27.2 / 64.3 | 26.9 / 63.1 | 26.6 / 63.8 |
| tracked drives | 42.5 | 38.7 | 66.1 |

**What it cost: drives.** Most of the engine's drives were the one-on-one
attack with no play called - 26.2 of its 42.5 - and the called plays took
those possessions. The NBA's drives happen inside its plays: the handoff
that turns the corner, the closeout attacked off the catch, the
pick-and-roll. The engine's handoffs and off-screens nearly always end in a
catch-and-shoot, so they bring no drives with them; more pick-and-roll drives
(12.5 to 17.1) and a heavier generic drive (`PLAY_WEIGHT_DRIVE` 2.2 to 2.5)
won back what they could. Taken up next, in *The drive, per touch*.

**Also still out:** the shot mix leans two - threes 39.7% of attempts
against 42.6%, FG% 47.8 against 47.1 - with the catch-and-shoot on the
NBA's number and the pull-up short (12.4 attempts against 20.8, the twos
most of it, and it was 14.9 before). Cuts and rolls finish too well (71%
and 55% against 67 and 51), as they did before. Turnovers land on the
catch - 10.2% of spot-ups against 5.1% - where the NBA's are inside the
plays (handoffs 5.3% against 11.2, putbacks 3.1 against 7.8). And the
shot clock moved a little early, 18.6% of shots at 22-18 seconds against
the NBA's 14.6, with the extra breaks.

### The drive, per touch

**Where the drives were missing.** 38.7 tracked drives a team game against
the NBA's 66.1, and not evenly: per player, sim drives per 36 rose 0.38 for
every real one. The league's heaviest drivers got a quarter to a half of
theirs - Shai Gilgeous-Alexander 6.4 a 36 against 28.0, Deni Avdija 13.7
against 30.1. Two reasons, one on top of the other. `drive_frequency` is his
drives per touch against the league's, but written square-root compressed
(`50 x multiple ** 0.5`), so a man who drives 2.25 times as often read 1.5
times. And it was only ever a weight in a contest - the attack appetite,
then `_choose_attack` against every play - which is the same flattening the
attack itself had before it became a probability (see *WHO GETS THE BALL*).
Touches are not the gap: the NBA's 373.8 a team game count about 166
backcourt touches the sim never has, and its 207.5 front-court touches are
the sim's catches, about 204.

**What changed.**

- **The tendency at its true strength** (`_drive_multiple`): squared back
  into his real multiple everywhere the drive is weighed - the attack read,
  the pick-and-roll read, the rejected screen, the isolation, the handoff,
  the face-up. A league-average driver is unchanged; the heavy ones weigh
  what they drive. No rebuild: a custom's typed value keeps its meaning.
- **A catch is a chance to drive** (`_drive_chance`): a man who caught it in
  the half court drives on a read with `DRIVE_READ_PROB` 0.12 times his
  multiple, ahead of the attack read, shaded by his defender's deterrence,
  the clock and a closeout as the drive always was. His attack appetite
  there is his shots and the plays he runs (`ATTACK_SHOT_PROBABILITY_AT_MEAN`
  0.22). The man bringing it up keeps the one appetite - his drives are the
  plays he runs - and so does the break.
- **The closeout on every catch** (`_closeout_on_catch`): not only a
  kick-out. A catch whose defender is still coming - his gap by the
  closeout clock at 1.5 times the one he is normally given - is read at once
  with the drive appetite raised.
- **The handoff turns the corner**: a receiver freed by it drives or rises
  on his own two tendencies, where it was always the shot.
- **Re-held**: more screens and more of them driven (`SCREEN_CALL_WEIGHT`
  250, `SCREEN_EFF_DRIVE_PROB` 2.5), handoffs, post-ups and off-screens up
  to hold the mix (`PLAY_WEIGHT_HANDOFF` 2.4, `PLAY_WEIGHT_POST` 7.0,
  `PLAY_WEIGHT_OFF_SCREEN` 1.4), the long two off the catch down
  (`CATCH_SHOOT_MID_MULT` 0.07, tracking's 3.6 a game against 1.6), the drive
  foul rate toward the NBA's own per-drive rate now there are more drives
  (`DRIVE_FOUL_DRAW_BASE` 0.19), pace (`REBOUND_SECONDS` 2.3), assists
  (`ASSIST_SELF_CREATED_SCALE` 1.00).

**What did not work.** The per-touch drive for everyone, the man bringing it
up included, took drives to 48-57 but his drives are Synergy isolations and
a catcher's are spot-ups: isolations ran 11-14 a game against 8.1 and the
pick-and-roll fell to 10-12 plays against 17.3. A closeout at any catch not
tightly guarded (1.0 times the gap) took drives to 47 by speeding up every
trip, pace to 104.7 - not a closeout.

480 league games each:

| per team game | before | now | NBA |
|---|---|---|---|
| tracked drives | 38.7 | 48.5 | 66.1 |
| ...off the pick-and-roll / handoff | 17.1 / 2.1 | 18.2 / 3.9 | |
| drives per 36, sim per real (slope) | 0.38 | 0.54 | 1 |
| points | 116.8 | 117.4 | 115.0 |
| possessions | 99.9 | 100.0 | 100.0 |
| free throws | 23.5 | 23.4 | 23.4 |
| turnovers | 14.0 | 13.7 | 13.7 |
| assists / % assisted | 26.9 / 63.1 | 27.3 / 63.2 | 26.6 / 63.8 |
| threes | 35.6 | 34.1 | 36.8 |
| FG% | 47.8 | 48.4 | 47.1 |
| spot-up plays | 30.5 | 34.4 | 27.6 |
| P&R ball handler plays | 15.7 | 15.4 | 17.3 |

**Still out.** Drives are 48.5 of 66. What is left is mostly the stars: an
isolation is where they drive, and the isolation starts its drives from
where it squared up, which is usually inside 20 ft - it makes 0.7 tracked
drives a game - so Gilgeous-Alexander is still 7.7 a 36 of his 28. The
catcher's drive ends more trips as spot-ups (34.4 against 27.6), the shot
mix leans further to the rim (43.7% of attempts from close against 40.3%,
threes 34.1 against 36.8), and the pull-up is where it was, 10.5 against
20.8.

### Where the scorers stand, and the isolation

**The isolation was already starting at the arc.** 93% of the engine's
isolations begin 20 ft out or more, about half beyond the line, and their
drives start there too. What held the stars' drives down was elsewhere.

**Mid-range scorers were parked at the elbow.** A man's off-ball spot came
from his shot mix, and the mid pull read his whole mid-range share - so a
pull-up scorer like Gilgeous-Alexander, 42% of his shots from mid-range and
almost all of them off the dribble, stood at 9-16 ft, caught it there and
drove from there: 6.6 of his 25 drives a 36 started inside 16 ft, where
tracking counts none, and he was credited 9.2 of his real 28. The rim pull
already knew better ("he takes his rim shots by driving there, not by
standing there"). The mid pull now reads his catch-and-shoot twos per touch
(`shot_mid_off_catch`) on the league's mid share, so a league-average man
stands where he did, the elbow belongs to DeRozan and Durant, and the
pull-up scorers catch it on the perimeter. (Since replaced: the elbow is the
screening big's, and `shot_mid_off_catch` is a share that places nobody -
see *Where the catches happen, and how the mid-range comes*.)

**The isolation tendency was compressed too.** `iso_frequency` is written
square-root compressed like the drive, so the men who live in isolation -
three and a half times the league - weighed under twice it, beside a flat
screen call. It is read at its true multiple now (`PLAY_WEIGHT_ISO`
unchanged): the league's isolations go to the men who run them,
Gilgeous-Alexander 0.9 a 36 to 2.4, and the league's count stays 7.5.

480 league games, tracked drives a 36 (real): Gilgeous-Alexander 7.7 ->
13.4 (28.0), Jalen Williams 6.9 -> 14.1 (23.1), Booker 14.8 (24.2), Morant
14.3 (27.0). The league 48.5 -> 49.1, per-player slope 0.54 -> 0.55;
points 117.4, pace 100.1, free throws 23.6, turnovers 13.7, assists 27.2 -
the league did not move.

**What is left of the stars' gap is the bring-up.** Gilgeous-Alexander drives
28 times a 36 on 26.7 front-court touches, Morant 27 on 28.5: most of their
drives are off the touch that brings the ball up, and the man bringing it up
keeps the combined read (see *The drive, per touch* - a drive of his own
ahead of it turned the called plays back into isolations). That is its own
piece of work: *Who brings it up, and what he does with it*.

### Who brings it up, and what he does with it

**Where the drives came from.** Every drive tagged by the code that began
it, 480 games: 19 a team game off a catch, 18 off the pick-and-roll, 5.5
from the man bringing it up attacking on his own, the rest handoffs and
isolations. The man bringing it up was the gap, twice over.

**Who brings it up** (`_bring_up_weight`). The trip's first handler was
drawn on the pass target's weight, his touches alone, and a big's touches
are rebounds, inbounds and dump-offs: Hartenstein brought it up about a
fifth of the Thunder's trips, Gilgeous-Alexander 17 times a 36 - a quarter.
Now it is his time on the ball, `50 x (touches / 50) ** 1.25 x
(ball_dominance / 50) ** 0.75`, fitted on the NBA's backcourt touches less
defensive rebounds (379 players, log-log; residual 0.24 against 0.32 on
touches alone). No new column: both are tendencies already. It moved the
guards' bring-ups by a sixth - a guard-heavy roster shares them, as the
Thunder's does with Topic, Mitchell and Stirtz - and drives by little.

**What he does with it** (`BRING_UP_ATTACK_MULT` 1.5). Half of all
bring-ups were passed on before he attacked, and those trips ended as
spot-ups, 34 a team game against 27.6. The man who starts the set runs the
screen, the isolation or the drive himself; his attack probability on that
read is half again what it was. The break and the scramble keep theirs.

**Re-held.** Pace with the inbound after a make (`INBOUND_AFTER_MAKE_SECONDS`
4.9 -> 5.5; half a second more of bring-up instead reached the same pace but
emptied the 18-15 bucket, as it did the last time), assists
(`ASSIST_SELF_CREATED_SCALE` 1.00 -> 1.22: more trips are the handler's own
play), isolations (`PLAY_WEIGHT_ISO` 0.8 -> 0.74).

480 league games:

| per team game | before | now | NBA |
|---|---|---|---|
| tracked drives | 49.1 | 53.2 | 66.1 |
| drives per 36, sim per real (slope) | 0.55 | 0.66 | 1 |
| pick-and-roll ball handler plays | 15.2 | 17.8 | 17.3 |
| isolations | 7.5 | 8.4 | 8.1 |
| spot-ups | 34.8 | 31.7 | 27.6 |
| cuts | 6.8 | 5.6 | 7.7 |
| points | 117.4 | 117.8 | 115.0 |
| possessions | 100.1 | 100.5 | 100.0 |
| free throws / turnovers | 23.6 / 13.7 | 23.6 / 13.5 | 23.4 / 13.7 |
| assists / % assisted | 27.2 / 63.1 | 27.5 / 63.4 | 26.6 / 63.8 |
| shots with under 7 s on the clock | 12.9% | 10.8% | 17.3% |

Tracked drives a 36 (real): Gilgeous-Alexander 13.4 -> 16.2 (28.0), Booker
14.8 -> 17.2 (24.2), Cunningham 15.9 -> 17.4 (23.6), Morant 14.3 -> 15.7
(27.0), Avdija 13.7 -> 16.1 (30.1), Jalen Williams 14.1 -> 14.2 (23.1).

**Tried.** Twice the attack (x 2.0): drives 58 and the slope 0.73, but
20.4 pick-and-rolls, 9.6 isolations, pace 104.5 and 57.5% assisted.

**Still out, and left.** The heavy drivers are at 55-70% of theirs. Per
touch Gilgeous-Alexander is close (0.35 drives a touch against the league's
0.19, real 0.40 against 0.18); what he lacks is touches, 46 a 36 against a
real 70 that count his backcourt ones. Cuts fell with the passes that found
them, and fewer shots go up late in the clock.

### The touches, in the front court

**Counted the NBA's way.** Tracking's `TOUCHES` is every time a man gains
the ball, and `FRONT_CT_TOUCHES` the ones that start in the front court. In
the engine the front court is his catches and offensive rebounds, and the
backcourt is the man who starts the trip, defensive rebounds and steals.
Per team game the NBA has 207.5 front-court touches and 166 backcourt; the
engine had 179 and 140, and per player its front-court touches correlated
0.25 with the real ones - Jokic 35 a 36 against 59, Draymond Green 32
against 49, while role players caught what they really catch.

**Three things, one on top of the other.**

- **The pass went by the wrong number.** The pass target read `touches`,
  which counts the backcourt too: a point guard's are mostly bring-ups and a
  big's are catches, so it correlates 0.5 with the catches it was choosing.
  `touches` is the front court's now - tracking's per-36
  `FRONT_CT_TOUCHES`, on the same scale and top (86), the Sheet's column
  pasted over - and the pass reads it (`_touches_weight`,
  `TOUCHES_WEIGHT_EXPONENT` 2.8). One column, not two: the backcourt's
  touches are the engine's own logic - who rebounds it, who handles it -
  rather than a second number to tune by eye.
- **The passer's eyes scrambled it.** How open a man looked was his gap seen
  through 6 ft of noise at the league's vision, on a 4-6 ft gap, raised to
  2.5: every man on the floor looked randomly open or shut, a tenth to ten
  times his weight, so even against a set defence the ball went nearly
  anywhere (with the preference off, the catches followed a man's weight at
  r 0.54 instead of 0.33). Now a man being denied is plain to anybody, and a
  man more open than usual is seen as often as the passer's vision says
  (`PASS_OPEN_SEEN_AT_ANCHOR` 0.6 at the league's vision, certain at 99);
  unseen, he is thrown to on his weight. Gravity is intact: a clearly open
  man is found 47 / 58 / 59 / 66% of the time by passers under 60 / 60-70 /
  70-80 / 80 and up (45 / 52 / 57 / 65 before), pass_vision buys +1.27%
  shots a pass a point (+1.22), and a catch three is wide open 54.1% of the
  time (54.7).
- **Too few catches a trip.** 1.46 passes a trip, where the NBA's trips
  carry about two front-court catches; the rest was a man standing and
  surveying, 0.54 times a trip. A survey is a swing now (`HOLD_WEIGHT`
  120 -> 80), and with more touches every per-touch rate comes down in
  proportion so a trip still ends where it did - the attack
  (`ATTACK_PROBABILITY_AT_MEAN` 0.25 -> 0.225,
  `ATTACK_SHOT_PROBABILITY_AT_MEAN` 0.22 -> 0.198), the drive read
  (`DRIVE_READ_PROB` 0.12 -> 0.108), the catch-and-shoot
  (`CATCH_SHOOT_TENDENCY_SCALE` 0.32 -> 0.28, `CATCH_SHOOT_KICK_SCALE` 1.10
  -> 0.99) - and the per-pass rates with the passes (interceptions 0.018 ->
  0.015, `ASSIST_SELF_CREATED_SCALE` 1.22 -> 1.10).

480 league games:

| per team game | before | now | NBA |
|---|---|---|---|
| front-court touches | 179 | 204.6 | 207.5 |
| ...per player against real, r / slope | 0.25 / 0.25 | 0.71 / 0.91 | 1 |
| ...against his own tendency, log-log slope | | 0.99 | 1 |
| points / possessions | 117.8 / 100.5 | 117.0 / 100.1 | 115.0 / 100.0 |
| turnovers / steals | 13.5 / 7.5 | 13.5 / 7.5 | 13.7 / 8.4 |
| assists / % assisted | 27.5 / 63.4 | 27.5 / 64.0 | 26.6 / 63.8 |
| catch-and-shoot FGA | 28.6 | 28.1 | 27.9 |
| pick-and-roll / isolations / spot-ups | 17.8 / 8.4 / 31.7 | 17.2 / 7.7 / 33.8 | 17.3 / 8.1 / 27.6 |
| tracked drives | 53.2 | 51.4 | 66.1 |

Front-court touches a 36 (real): Jokic 35 -> 49.5 (58.7), Draymond Green
32 -> 47 (49.0). Correlation with the real ones is 0.71.

The shot weight and the bring-up weight, both fitted on the old total,
were refitted with the backcourt - see *The touches, in the backcourt*.

**Tried.** The pass back to the man who brought it up (a weight on him as a
target later in the trip): nothing at 2x or 3x, and 6% more catches for the
heavy bring-up guards at 50x - he is rarely the target of an ordinary pass
once he has moved it on.

**Still out.** The men who bring it up most, 24 or more times a 36, catch
0.83 of their real front-court touches, where everybody else is at
0.96-1.00: McConnell 18 against 34. And the backcourt is the next piece: 139
touches against 166, and a trip holds the ball about 10 seconds against the
NBA's 14.4 (tracking's 24.0 minutes of possession a team game) - the rest is
the rebounder with it, the inbound and the outlet, which the engine charges
as dead time (`REBOUND_SECONDS`, `INBOUND_AFTER_MAKE_SECONDS`). Tracked drives
per touch are now the NBA's (0.167 against 0.177); the drives that are
missing come off the backcourt touches.

### The touches, in the backcourt

**The ball arrived in the front court.** Every trip started with its handler
already over half court, the one touch the backcourt ever saw, so the NBA's
166 backcourt touches a team game were the engine's 139, and the men who
really have them - Brunson, Morant, McConnell, 50-60 a 36 - had half.

**Where they come from, basic logic, no column.** `touches` is the front
court's alone; the backcourt is what happens (`_bring_it_up`):

- **After a dead ball** somebody takes it out, and whoever comes to get it
  takes it in (`_select_inbound_catcher`, the bring-up weight ** 0.5 - the
  guards, but not only the one who brings it up). The throw-in itself is
  not a touch: the NBA's bigs, who take it out, have no more backcourt
  touches than its wings once rebounds and steals are out, 9.6 a 36 against
  9.0 - the man out of bounds is not counted. The man who takes it out is
  the man under the basket (`defensive_rebound`), and only names the passer.
- **A defensive rebound and a steal** are touches, and leave the ball in his
  hands.
- **Then whoever has it keeps it or hands it on** (`_keeps_it`), the rule
  for the rebounder applied to everybody in the backcourt: if a teammate
  with 70 ball_handle, and more than his, is back, a man under 70 gives it
  to him almost every time (`BACKCOURT_KEEP_BELOW` 0.03); over 70 he keeps
  it 15% of the time plus 2% a point of handle, up to 80% (Giannis, Jokic
  pushing it themselves); with nobody to give it to, he keeps it. The man
  out in front after a steal leads the break he started (80%). Handing it on
  is a touch for the man who gets it, and he is chosen among those handlers
  by the bring-up weight.
- **A long outlet caught in stride**: the man who caught it runs the break,
  not a man picked afresh.
- **Who brings it up** is what is left of the NBA's backcourt touches once
  rebounds and steals are out: `ball_dominance ** 1.45 x touches ** 0.36`
  across the league (332 players; ball_handle adds nothing to it), doubled
  for the choice among the handlers on the floor (`BRING_UP_*_EXPONENT`
  2.9 and 0.72) - at the fit itself the point guards had 40% of theirs too
  few.

Every touch is a `BallReceiveEvent` with its `source` - rebound, steal,
inbound_catch, outlet, side_inbound_catch - so the box score's touches are
counted the NBA's way. The time is what it was: the rebound, the inbound and
the walk up were already on the clock.

**Re-held.** The shot weight spread each man's shots over a `touches` that
no longer counts the backcourt, and his attempts a 36 followed his real ones
at a log-slope of 0.80 (0.64 before *The touches, in the front court*):
`SHOT_WEIGHT_SHOT_EXPONENT` 2.5 -> 3.2 and `SHOT_WEIGHT_TOUCHES_EXPONENT`
2.4 -> 2.8 make it 0.88 with no lean left on touches. And the stars shoot
more of their own: `ASSIST_SELF_CREATED_SCALE` 1.10 -> 1.32, `HOLD_WEIGHT`
80 -> 70, `INBOUND_AFTER_MAKE_SECONDS` 5.5 -> 5.3, `PLAY_WEIGHT_ISO` 0.74 ->
0.58.

480 league games:

| per team game | before | now | NBA |
|---|---|---|---|
| backcourt touches | 139 | 159 | 166 |
| ...per player against real, r / slope in proportion | 0.90 / 0.65 | 0.82 / 1.00 | 1 |
| front-court touches | 204.6 | 201.3 | 207.5 |
| all touches | 344 | 360 | 374 |
| attempts a 36 against real, log-slope | 0.80 | 0.88 | 1 |
| tracked drives | 51.4 | 56.0 | 66.1 |
| ...drives a 36 against real (slope) | 0.60 | 0.88 | 1 |
| points / possessions | 117.0 / 100.1 | 117.8 / 99.8 | 115.0 / 100.0 |
| turnovers / % assisted | 13.5 / 64.0 | 13.1 / 63.3 | 13.7 / 63.8 |
| isolations / pick-and-roll / cuts | 7.7 / 17.2 / 5.5 | 9.3 / 18.8 / 4.3 | 8.1 / 17.3 / 7.7 |

**The drives came with the touches.** Nothing about the drive changed here;
the men who drive got the ball they drive with. Tracked drives a 36 (real):
Gilgeous-Alexander 15.5 -> 22.7 (28.0), Morant 14.1 -> 23.4 (27.0), Booker
18.9 -> 25.2 (24.2), Cunningham 15.2 -> 23.4 (23.6).

**Still out.** The hub bigs' backcourt touches: Jokic 21 a 36 against 39,
Sabonis 17 against 26 - they are neither the rebound nor the bring-up, and
the data does not say what they are. Avdija and Jalen Williams drive half
their real rate (13 against 30 and 23): they are not the men who bring it
up. Isolations run 9.3 against 8.1 whatever `PLAY_WEIGHT_ISO` is, being
mostly the stars' own attacks off the bring-up, and cuts fell with the
catches. The clutch column (`clutch_touches`) is still on the old total
until the Sheet is rebuilt.

### Ratings doing what they say

September 2026, the user's definitions of all 64 ratings laid against what
the engine does with each. Most matched. Fixed:

- **Speed is in the blow-by.** `_drive_beats_defender` read
  `speed_with_ball`, which is no rating, so every driver's speed was 50.
  With his real speed the league got by 32.1% of the time against 28.8;
  `PRESSURE_BLOWBY_BASE` 0.30 -> 0.269 puts it back, so speed decides who,
  not how often.
- **A layup in the post** - off a move or a step-through - is half
  `close_shot_from_post`, half `standing_layup` (`"post_layup"`). The hook
  is `close_shot_from_post` alone.
- **Shot confidence nullifies deterrence, all of it.** Every deterrence read -
  the drive, the attack, length, the catch, the bail-outs, the pass-out of an
  isolation or a post-up, the dunk - scales by `_deterrence_felt`:
  `(99 - shot_confidence) / 25`, all of it at the league's 74, none at 99,
  1.3 times at the tenth percentile. The go-up-or-kick read had it already.
- **Contact down low goes by how he got there.** Every shot at the rim had
  its contest eased by `contact_layup`, putbacks, lobs and post hooks
  included. Now on the move it is `contact_layup` (or `dunk_in_traffic` for
  a dunk), and standing it is `strength` (or `standing_dunk`) - contact is
  the standard down low. `contact_layup`, `dunk_in_traffic` and
  `tend_dunk_in_traffic` are drive-only everywhere else already. The four
  groups' means sat within 4 points of what they read before: 118.4 points
  against 118.2, FG% 48.3 against 48.2.
- **Post defense is for the post.** At the rim on a drive the contact battle
  reads the defender's `interior_shot_defense_strength`; the on-ball man
  stops the drive with `perimeter_defense` before that. Both come from one
  2K rating today, so nothing moved yet.

480 league games on the same sheet, before and after: points 118.1 / 118.2,
possessions 100.1 / 100.6, turnovers 13.1 / 13.4, assisted 63.4% both,
drives 56.1 / 56.3; each man's attempts a 36 against his real ones, log-slope
0.89 -> 0.94 (confident scorers no longer shy from the length in front of
them).

Kept as the engine has them, by the user's call: pass_vision is the assist
knob and pass_accuracy the turnover one; the putback rating is the putback
dunk's; every deterrence rating; dunks at one make rate, the dunk ratings
deciding whether it is one; the paint jumper's range; the deep three from
25 ft. Still to come: vertical (read by nothing - its place has to be found
without counting length twice). Hustle decides the 50/50 balls now - see
*Then a hand on the ball* below. `draw_foul` as the foul chance came
next, below.

### Fitting ratings to the real players

**`draw_foul` is the foul chance.** Every foul a man draws - on the drive, in
an isolation, a jab move, a post-up, on the shot - is that situation's league
base times one multiplier from his rating,
`exp((draw_foul - DRAW_FOUL_ANCHOR) / DRAW_FOUL_SPREAD)`: 0.4 times the
league's at 25, 3 times at 98, the spread set by the real one (free throws
per shot, log sd 0.48). It was four different formulas of 2K's rating, and the
drive read a tendency of its own, `attempt_draw_foul_on_drive`, which is
retired: nothing reads it and the build no longer writes it, so its Sheet
column can go. Each situation's old level at the league's rating is folded into its
base, and the anchor (71) is where the league's multiplier averages 1: 23.6
free throws a team game (23.9 before, the NBA's 23.4). With 2K's ratings each
man's free throws per shot follow his real ones at a log-slope of 0.61, r 0.50
- which is what the fit is for.

**`fit_ratings.py` fits each real player's ratings to his real numbers,
through the engine.** It plays the test year as nearly as it can be played -
the thirty teams with the rosters they finished 2025-26 with, real minutes,
no customs anywhere, no injuries, no coaching bonus - compares every real
player with his real self, moves each rating part of the way toward the value
that would close the gap, and plays again with smaller steps, ten rounds by
default. Each knob is one rating and the one rate it drives (`KNOBS`), and
`FIT`, at the top of the file, says which a plain run fits - several at once,
so long as no two share a rate. How far a man moves is his evidence:
n / (n + prior), n his attempts (this season and half of last), so a man with
a season of shots gets his real rate and a man with thirty keeps nearly his
2K rating - the fallback. Rates are read relative to their own league and the
league's average multiplier is held, so the league's level stays with config
(holding the average rating instead let the first run's free throws per shot
fall 0.264 -> 0.252: an exponential curve lifts with spread); no rating moves
more than its knob's cap from where it started (45 for draw_foul), and the
report lists the biggest movers, which is where an engine problem would show.

The first run, ten rounds: each man's free throws per shot against his real
ones went from log-slope 0.51, r 0.47 to 0.81, r 0.84, settled by the fifth.
Nineteen men sat on a cap of 30, both ways and not by the kind of shot they
take (r -0.10 with their share of threes): 2K's rating misjudging them -
Draymond Green 30 on a league-average rate - so the cap went to 45. The second
is the one kept: the league at 0.263-0.265 every round against the real 0.261,
and each man at log-slope 0.79, r 0.84 from 0.51, 0.48. A slope under 1 is
the evidence at work - a real rate is a noisy one, and the fit believes it
only as far as its attempts go.

**Neither number that sets the size of a step is typed in.** The *prior* is
measured on the NBA's last two seasons: across the men in both, the
covariance of their two rates is the spread between players that carries
over, what each season has beyond it is noise falling as 1/n, and their ratio
is what a starting rating is worth - 79 shots for free throws per shot (it was
set at 100 by hand), 112 chances on the defensive glass, 67 on the offensive.
The *response* - how far a man's rate moves for a point of his rating - is
measured in the fit itself: each round every man plays three points either
side of his rating, at random, and his gap to his real self against that
jitter is the engine's answer, used once it is known to within a quarter of
itself. The rating kept never has the jitter in it, and each step is taken
from the rating he played at. Read off the fit's own moves instead, the
response ran to its bound every time: a man moved down after a lucky round
came back the next whatever his rating did, and that regression to the mean
passed for the engine's answer. Adding a knob is a pairing and bounds;
checking that the engine reads the rating for that rate, and that no
tendency is fitted to the same one, is the part that still needs a look.

**The rebound ratings are the second family.** Each man's claim on a miss is
his rating to a power (config's REBOUND_CLAIM_IF_CRASH), and what it makes is
his share of the rebounds there were while he was on the floor - the NBA's
OREB_PCT and DREB_PCT, which the fit counts the same way in the sim: a board
to a man is a chance for all ten. A share and not boards a minute, so a sim
team that plays faster or misses more than the real one does not hand that to
its players' ratings. Whether a man goes to the glass is the crash
tendencies', built from his box-outs and not fitted, so the rating takes
whatever his real share needs on top of them. The engine reads putback as its
distance from the mean of standing_dunk and offensive_rebound, zero for a real
player, so a fitted offensive_rebound carries putback half its move - in the
fit's games and in the build (`FITTED_CARRY`) - and nobody's putbacks change
under him; boxout_strength and swim_move are left as they are built, in both.

The first run, ten rounds: each man's share against his real one went from
log-slope 0.99, r 0.91 to 0.98, r 0.96 on the defensive glass, and 1.05,
0.92 to 1.02, 0.97 on the offensive. The engine answers at 1.23 and 1.59
against the curves' 1.5 and 2.2 - a claim is shared with the rest of the
floor - measured to +/- 0.03 and 0.05. The sim's league shares read 0.148 and
0.053 against the NBA's 0.132 and 0.045, the same 12-16% on both ends: the
NBA's pool of chances counts team rebounds and the sim's does not, which the
relative rates take out. The movers are partly the crash tendencies: 2K
built its ratings from real rates, going to the glass included, and the
engine counts going again through the crash tendency, so on average a man
with twice the league's box-outs came down 10% on the defensive glass and 6%
on the offensive. The rest is the men themselves - Edey 91 -> 69 on a real
21.6%, Nurkic 93 -> 99 at the same crash, Brook Lopez, who boxes out for
others, 64 -> 40. Thirteen men ended over 99 (Tatum and Sabonis at the
ceiling of 110, Antetokounmpo, Wembanyama, Adams, Robinson, Capela among
them): real rates past where 2K's scale tops out.

**Blocks are the third.** block is whether he gets it once he has gone up;
block_attempt, the square root of his real blocks a minute, is whether he
goes up and is not fitted, so the rating takes the other half of his rate -
config's BLOCK ATTEMPTS split, held to each man's own numbers. The rate is
blocks per miss at his end while he was on the floor, the defensive rebound
chances again, so pace and opponents' shooting stay out of it; prior 139
misses (year-to-year r 0.88). Re-sourcing block_attempt from contested
two-point shots (r 0.94; blocks per contest 0.72) was the alternative, and
was left: contests count how many shots a man is near, which the engine's
matchups already decide, so bigs would have had their opportunity counted
twice and their block rating - rim threat and the dunk window read it too -
pushed down to pay for it. The run: r 0.88 -> 0.93, slope 1.00, response 2.42
against the curve's 2.0; fitted 33 to 96, inside 25-99.

**Steals are the fourth, by kind.** The engine already has the NBA's two
steals, read off the ratings the Sheet says make them: a strip - `steal`,
with some hands and agility, against the handler's `ball_security` - and a
pass picked off - `pass_perception`, with reaction time and hands, against
the passer's disguise. pbpstats scores them apart (a steal on the handler's
lost ball or the passer's bad pass: 3.27 and 5.11 a team game in 2025-26,
with each man's defensive possessions), and the pull fetches its player
totals now (`--pbpstats-only`). So there are three knobs: `steal` on his
strips and `pass_perception` on his interceptions, each per defensive
possession, and `ball_security` on the lost balls taken off him per second he
has the ball. Per touch that last one does not work - the men who hold it
longest are stripped most per touch and rated most secure, +0.19 against 2K's
rating - and per minute of possession it reads -0.91.

Three engine changes came first (config's STRIPS AND INTERCEPTIONS). The
interception roll was (lane - disguise) / 200 + 0.15 held to 0.08-0.35, and
against an average passer 180 of 381 real players (53% of minutes) sat on
the 0.35 - a 97 read a lane no better than a 60. Both rolls are now each side
on its own curve against the league's mean, the passer's side led by
`pass_accuracy` ("the ability to pass without an interception"; it was
vision first). The exponents make fitted ratings keep 2K's spread, the scale
customs are typed on: the real spread each rating has to carry over the
rating's own - a regression on 2K reads flatter where 2K tracks the rate
loosely, 0.41 against 1.40 for the lane (r 0.37), and a fit on it would have
spread the ratings several times wider than 2K's. `reach_for_strip` is his
strips a minute, not all his steals, so a man who picks passes off is not
also a man who reaches (Jokic 59 -> 48, Gilgeous-Alexander 62 -> 80). And the
split, never measured, is anchored: steals had drifted to 7.17, and are 8.32
now - strips 3.30, interceptions 5.02. That uncovered drives losing it 2.58
times a team game, which the missing steals had hidden; the drive turnover
rate came down to hold the league on 13.8.

`pass_accuracy` waits. Once the kind of passer is known (potential assists
per pass), accuracy says nothing about how often his passes are picked off
(0.07 against 0.59): creators throw the passes that get stolen. The engine
treats every pass alike, so a fit would give the league's best creators the
worst accuracy to make up for it. It needs passes that set up shots to carry
the risk they do first. With it goes the ball thrown away, whose roll floors
at 0.002 for an accurate passer and at 0.005 for any pair whose chemistry is
not 5 - so good chemistry made bad passes more likely.

One finding on the way: the sim's seconds with the ball follow the NBA's time
of possession at r 0.92 but a log-slope of 1.52 - handlers right (LaMelo Ball
15.1 a minute against 14.8), role players holding it half as long as they do.
It does not bias `ball_security`, whose strips come a tick at a time while he
holds it, so seconds held are his exposure on both sides.

**The first run was not kept.** It lifted each man's rate against his real one
a long way - strips r 0.60 -> 0.74, interceptions 0.58 -> 0.79, lost balls
0.12 -> 0.65 - but the movers were an engine problem. Strips split by
position: guards stripped two to three times their real rate and bigs a third
of theirs (Tyus Jones 0.021 a defensive possession against 0.007, Paul Reed
0.006 against 0.019), because only the man guarding the ball could strip, a
tick at a time, while the NBA's lost-ball steals come from help too - the dig
at a drive, the big swiping in the paint, the double in the post. The fit was
pushing guards' `steal` into the teens and bigs' into the seventies, on the
cap of 30 both ways. Interceptions showed no such split: there the fit was
re-ranking 2K's `pass_perception` (Mobley 85 -> 55, Pritchard 45 -> 74), and
the cap stopped a dozen short. The lost balls leaned on the handler curve: the
bigs 2K rates at 35-40 were stripped four to eight times their real rate a
second, the 2.43 exponent - set to keep 2K's spread, which assumes 2K ranks
them roughly right, and here it half does (r -0.38) - making far too much of
a low rating.

**So strips come from help now (config's THE DIG).** Once a driver is inside
the collapse, every defender off him may swipe at it - the stunt from the
wing, the gap, the help at the rim - and so may every defender off a man in
the post (half as often) and a doubler once he is on his man. How often each
reaches is his `reach_for_strip`, his real strips a minute, so everyone gets
the chance and his own numbers say how often he takes it; the strip roll and
the reach-in on a miss are the on-ball reach's. The on-ball reach is down to
a fifth, and the dig carries 63% of a point guard's strips and 91% of a
center's. Per 100 defensive possessions, over 480 real-roster games:

| | PG | SG | SF | PF | C |
|---|---|---|---|---|---|
| NBA (pbpstats) | 0.80 | 0.67 | 0.65 | 0.60 | 0.52 |
| on-ball only | 1.72 | 0.95 | 0.64 | 0.45 | 0.22 |
| with the dig | 0.85 | 0.68 | 0.60 | 0.58 | 0.49 |

Steals 8.39 (3.23 strips, 5.16 interceptions), turnovers 13.8, fouls 19.9,
points 116.6 (from 118.6: some drives end in a strip before the shot). The
handler curve went back to 1.0 - the regression on 2K reads -0.91, and at
1.0 a big 2K rates 38 is stripped about twice as often a second as an 85
guard, the real gap. The three knobs are capped at 45 now. Still off: who
loses it - a point guard 36% of the lost balls against the NBA's 23%, a
center 10% against 17% - which follows how long each holds the ball, and the
sim's role players hold it half as long as theirs. It does not bias
`ball_security`, fitted a second at a time.

**Then a hand on the ball (config's DEFLECTIONS AND LOOSE BALLS, THE
GAMBLE).** A reach or a jumped lane either got the ball or did not, and the
deflection was a record read off the roll - a miss close to a steal - with the
ball staying with the offence every time, so no loose ball ever happened and
`hustle` was read by nothing. Now every attempt gets a hand on it or does not:

- **A hand on it** comes away clean (a steal) more often the better his hands
  and the skill that got him there - `pass_perception` on a pass, which he
  read early enough to catch, `steal` on a strip. Otherwise it is a tip: the
  man it was meant for gathers it on his own hands, or it gets away.
- **A loose ball** - a tip that got away, or a fumbled catch, which was a
  dead-ball turnover - is anybody's. Each man's claim is how near he is (a
  strip is at both men's feet; a tipped pass carries on toward its receiver)
  times how badly he wants it: `hustle`, with fatigue on it, four parts in
  five, and agility the fifth. The defence's recovery is a turnover and the
  steal goes to the man who knocked it loose, as the NBA scores it; the
  offence's plays on with whoever came up with it. A defender may foul the man
  who got it.
- **A gamble that gets nothing is punished.** A man who jumps a lane and misses
  lunges at the pass and starts back on the closeout clock, so the man he left
  is open until he is back. A reach that misses may leave the handler a step
  clear - a drive with his man beaten, more often on an isolation or a drive
  already going, on his `ball_handle` against the reacher's agility - and a
  reacher far quicker than him can still get back in front.

480 real-roster games, same seeds, the commit before and this:

| per team game | before | now | NBA |
|---|---|---|---|
| steals: off passes / off the dribble | 5.00 / 3.14 | 5.06 / 3.26 | 5.10 / 3.26 |
| deflections, steals inside them as the NBA counts | 16.97 | 17.40 | 17.39 |
| loose balls recovered: offence / defence | 0 / 0 | 2.01 / 2.27 | 2.17 / 2.12 |
| turnovers: live / dead | 8.15 / 5.19 | 8.32 / 5.35 | 8.37 / 5.35 |
| fouls / loose-ball fouls | 19.81 / 1.40 | 19.87 / 1.42 | 19.8 / 1.41 |
| points / possessions | 115.96 / 99.50 | 116.67 / 99.61 | 115.0 / 100.0 |

Points rose 0.6 per 100: the open men a failed gamble leaves. A missed reach
on the ball is rare - most strips are the dig's now - so the blow-by is too,
about 0.1 a team game. The steal knobs count steals by the turnover they came
from now, as pbpstats does, so a steal off a tip sorts with its kind; their
fit has to be run again on this engine.

    python fit_ratings.py                       fits FIT; writes ratings_build/output/fit_*
    python fit_ratings.py --knobs draw_foul     another knob, this once
    python fit_ratings.py --resume --rounds 5   carries on from the last fit
    python fit_ratings.py --accept              keeps the men it moved in
                                                ratings_build/fitted.csv

The build reads `fitted.csv`: a fitted rating takes the place of 2K's, and
`overrides.csv` still wins over both. It is run on the user's machine, not by
Claude.

### The funnel, and why it took three failures to find

**Superseded by *The touch*.** The gates measured here are gone. The section
is kept because the measurement is what led to removing them.

`_handle_deciding` is five gates deep and each one can end the touch in a
pass. Three separate attempts to raise the drive rate failed because they
tuned the action roll at the bottom without knowing what reached it. The
engine now counts, permanently, into `GameEngine.funnel` - the increments are
a few hundred a game and the shape of this thing is worth that.

What it found, per team per game, before anything was changed:

| | sim | NBA |
|---|---|---|
| touches | 562.9 | 388.5 |
| passes | 459.1 | 297.7 |
| **drives per touch** | **2.5%** | **17.7%** |

Of the 426.6 touches that produced an action, **only 13.7% reached the action
roll**. The rest: 34.5% to the pass-first gate, 27.8% to attack suppression,
13.2% to a screen call, 10.1% to a reset pass. And **35% of every pass in the
game was a reset or a suppression** - not a read, but a gate saying "not yet".

`ATTACK_SUPPRESSION_FLOOR` was 0.05 with `FULL_PASSES` at 6: a first touch
attacked 5% of the time, and the offence had to make **six passes** before it
was allowed to attack at full strength. The NBA averages three passes a
possession. That one constant was the single largest thing standing between
this engine and the shot mix it was being asked for.

Now 0.45 and 3, with the reset pass cut from 0.35 to 0.15. Action-roll reach
went 13.7% to 27.2%, drives 13.9 to 22.8, passes 459 to 350, touches 563 to
461.

**Re-anchor pacing after touching any of this.** Fewer passes means shorter
possessions means more of them: the first relaxation took pace from 102 to
116 without the engine changing speed. `PACING_BASELINE` is 110.5 and the
slope 1/45.3, both re-swept afterwards, and both will move again if the funnel
does.

**Drives are still only 4.9% of touches against a real 17.7%**, so the funnel
is opened and not yet right. But the shot mix no longer depends on fixing
that, which it did before.

**A drive can now find the roller, and it still is not enough on its own.**
Three things were missing and are now present:

- Every kick-out went to `uniform(22.5, 26.5)` feet. The arc, for everybody,
  whoever he was - a rim-running centre caught a dump-off from twenty-four
  feet. It now draws from the receiver's own shot profile, pushed outward
  because the defence has genuinely collapsed.
- `_select_pass_target` weights touches, shot tendency, spot-up frequency and
  off-ball movement, all of which describe a perimeter player. The man diving
  in behind the help was invisible to it. A kick-out now also reads
  `cutter_frequency` and the close end of his shot profile.
- There was a catch-and-shoot path and **no catch-and-finish one**. A man who
  caught it at the rim had to pass through setup and deciding before he could
  shoot, which burnt the assist window, so the dump-off layup came out
  unassisted or not at all. 33% of NBA rim attempts arrive on a catch - cuts,
  rolls, alley-oops, tips and putbacks, 11.8 a team a game - and here none
  could.

Measured, this is about a wash: points 115.8 to 114.3 against a real 113,
threes 48.3% to 47.6%, rim 36.6% to 36.9%, and assists 25.4 down to 24.1. It
is kept because it is a mechanism the game has and the engine did not, not
because the table moved.

**The reason it is a wash is that almost nothing flows through it.** There are
only about fifteen kick-outs a game, because there are only 24.8 drives. And
re-applying the drive change on top of the working kick-out machinery - the
experiment below, repeated with the roller now reachable - **still measured
worse**: 109.3 points, 43.2% FG, and the three-point share going to 50.3%. A
kick-out sends about a fifth of its receivers to the rim, so converting a rim
attempt into a drive still leaks most of it to the arc.

So the two fixes are mutually dependent and neither is sufficient: kick-outs
cannot pay off without drives, drives make things worse without kick-outs, and
both together are still short. That is the evidence that the problem is
genuinely upstream of both, in the funnel.

**Scoping matters here and cost two runs to find.** Catch-and-finish fired on
every pass caught inside 8 ft at first, which produced 55% of all shots at the
rim and 153 points a game - most passes into the paint are an entry or a swing
and the man receiving one has time to survey. It is gated on
`state.last_pass_was_kick` now: only a pass out of a collapsed defence.

**Raising the drive rate directly was tried and measured worse. Do not retry
it without reading this.** Three changes together: `_take_shot` routed a
closed-set "close" pick into `_begin_drive` when the handler was beyond 10 ft
rather than teleporting him to the rim, `PLAY_WEIGHT_DRIVE` went 0.6 to 1.0,
and `DRIVE_KICK_BIAS` went -2 to -14 so drives kicked out at the NBA's 43.9%
rather than 61.5%.

It did what it was aimed at. Drives went 24.8 to 36.5 and the share finishing
in the driver's own shot went 26.4% to 34.8%. Every output metric got worse
anyway:

| | before | after | NBA |
|---|---|---|---|
| points | 115.8 | 108.5 | 113.0 |
| field goal attempts | 90.5 | 84.7 | 88.0 |
| FG% | 45.7 | 43.5 | 46.5 |
| assists | 25.4 | 21.6 | 26.5 |
| shots inside 8 ft | 36.6% | 34.2% | 40.3% |
| shots from three | 48.3% | **49.9%** | 42.6% |

**The three-point share went up, which is the whole lesson.** Work it through:
of 100 terminal shoot actions the closed set picks close 43 times. Granted
directly those were 43 rim attempts. Routed into a drive they become 43 drives
that finish 35% of the time - 15 rim attempts and 24 kick-outs - and the
kick-out lands on a receiver standing beyond the arc, where the catch-and-shoot
check fires and 88% of those are threes. So making the engine drive more
*converts rim attempts into threes*, which is the exact opposite of the
intent, and it bleeds shot volume, assists and free throws on the way.

**The drive is not the fix; it is downstream of the fix.** The NBA gets 35.9
rim attempts out of 68.7 drives *because it has 68.7 drives*, and it has them
because a drive is something that happens on an ordinary touch, not a rare
terminal decision. In this engine a touch reaches the action roll only after
surviving the screen call, the quick-move check, the pass-first gate, attack
suppression and the reset pass - so the roll fires about 97 times a game and a
drive can only ever be a slice of that. Doubling a slice of 97 cannot reach
68.7.

So the real work is in the funnel in `_handle_deciding`, not in the weights at
the bottom of it, and it wants doing before the drive rate is touched again.
A cheaper intermediate worth measuring first: kick-outs land on perimeter
players and immediately become threes, so a drive that beats its man should be
able to find a cutter or a roller, not only a spot-up shooter.

**The closed set is not the culprit, and this is worth knowing before anyone
retunes it.** `shot_close` + `shot_mid_range` + `shot_3_pointer` average
43.0 / 14.7 / 42.2 across the NBA on the sheet, which normalises to almost
exactly the real 40.3 / 17.1 / 42.6, and `_select_shot` honours those weights
faithfully. The distortion is in how often shots arrive through paths that
never call `_select_shot` at all - the catch-and-shoot check is one, the drive
finish is another. Fix the paths, not the weights.

**Free-throw attempts are 8% heavy** and blocks 32% light.

### Shooting

**Recalibrated September 2026 against the real relationship between the sheet's
ratings and the percentages those same players actually shoot.** Two faults,
found by regressing real FG% on the sheet's own rating, attempt-weighted, over
every NBA player above a volume floor.

**The anchor was wrong.** `_sigmoid_prob` hardcoded rating 74 as the point
where `base_prob` is the answer, on the grounds that 74 was league average. It
is not, and has not been since the rating overhaul: the NBA's attempt-weighted
mean is 81.9 for `three_pt_jumper`, 83.3 for `mid_range_jumper`, 83.0 for
`paint_jumper`. Every real player sat above the anchor on a curve steep enough
for the distance to matter - the three-point curve returned 41.8% at its own
mean rating where the NBA shoots 36.5%.

This hid inside a league-average benchmark, because the sheet's weaker players
pulled the mean back down. It appeared the moment `--real-only` gave real
rotations their real minutes: 3P% 42.5%, FG% 52.4%, 134 points a game. **An
anchor set below the real mean punishes you for concentrating minutes on good
players**, which is exactly what a real rotation does.

**k was too steep, separately.** What a rating point is actually worth, in FG%
points:

| zone | real | engine was | too steep by |
|---|---|---|---|
| close | 0.193 | 0.820 | 4.3x |
| mid | 0.355 | 0.949 | 2.7x |
| three | 0.570 | 1.022 | 1.8x |

Over a season that produced a per-player 3P% spread with a standard deviation
of **11.3 against a real 3.5** - a quarter of the sim's volume shooters under
18%, which does not happen, because a player who shot 18% would stop being
allowed to shoot.

Every curve now carries its own `_ANCHOR`, and every `k` reproduces its
measured slope. Re-measure if the rating system moves again; the scratch script
that did it regresses `shot_locations_8ft` on the sheet.

Two levels moved afterwards, once spread was right: threes were still 3.3
points hot so `SHOT_THREE_BASE` was scaled by 36.0/39.3, and the mid-range got
a distance decay - one probability had been covering everything from 8 ft to
the arc, so a 9-footer and a 21-footer were the same shot against a real 45.1%
and 41.3%.

### The rim, and where dunk data comes from

The rim was eight points hot at 69.7% against a real 61.6%, and no curve was
to blame. The composition was:

| | sim was | sim now | real |
|---|---|---|---|
| layup | 52.4% @ 62.0% | 59.2% @ 56.2% | 64.6% @ 56.9% |
| **dunk** | **27.7% @ 91.6%** | **15.9% @ 87.1%** | **15.2% @ 88.5%** |
| floater | 7.8% @ 45.1% | 10.6% @ 41.0% | 11.5% @ 46.5% |
| jump shot | 12.0% @ 47.7% | 14.4% @ 45.3% | 8.8% @ 48.9% |

Nothing on stats.nba.com breaks a rim attempt down by how it was finished, so
`stats_fetch` now pulls `shotchartdetail` - every shot in the league - and
counts `ACTION_TYPE`. It is collapsed to one row per player before caching,
under the `dunks` key, with a `LEAGUE` row carrying the totals. The NBA takes
**5.44 dunks per team per game**, makes 4.81 at 88.5%, and that is **9.9% of
all points**. (Those are the first 573 games: the endpoint stops at 102,400
rows without saying so, and the chart is fetched a month at a time since.
Over all 1,230 it is 5.47 at 88.7% - see *Who dunks*.)

The gate itself was wrong in two ways the sheet already had the answer to:

```python
self.rng.random() * 100 < handler.tend("tend_driving_dunk")     # was
```

A tendency is a relative weight, not a probability - this file says so in the
ratings table above. And `tend_driving_layup` was never read at the rim at
all, because layup was the fallback branch, so 20-dunk/80-layup played exactly
like 20-dunk/20-layup. Both tendencies average 46.8 across the NBA, so reading
one as a percentage was close to a coin flip for everybody.

It is now three questions, asked in order, and only a dunk short-circuits.
`_wants_to_look_for_dunk` asks whether he even checks, on his own dunk
tendency. `_dunk_window_open` asks whether there is room, from attributes
alone, and that is the one that decides. Then - whether the dunk failed
because he never looked, because the window was shut, or because he would not
go up in traffic - `_wants_to_look_for_layup` asks about the layup fresh, on
its own tendency.

**Dunk and layup are not a closed set**, and modelling them as one was a wrong
turn worth recording: a man who is not going to dunk it has not thereby
decided to lay it up. He can still float it or pull up, and only when the
layup question fails too does the rest of the finishing chain get a say. The
window also carried a `* 0.7` at one of the two call sites and nothing at the
other, for the same decision; it became one constant, and later one per way
of getting to the rim - see *Who dunks*.

**A spacing change was tried and measured worse.** Feeding the shot profile
into spacing dropped shots inside 8 ft from 34.3% to 32.1% and pushed threes
from 41.1% to 43.4%. Reverted. It is written down here so it is not retried.

### Shot distance

The mid-range was two bugs, and neither was in shot *selection*.

**The mid band was drawn flat.** A mid-range pick took `uniform(8, 22)`, which
says a 21-footer is as likely as a 12-footer. Measured off the league's own
shot locations, 71% of two-point attempts beyond 8 ft come from inside 15 ft,
and the 20–23 ft strip — a long two taken a step inside the line — is **1.3%**
of the band against the 14.3% a flat draw gives it. `MID_RANGE_DISTANCE_BANDS`
now carries the real shape.

**Catch-and-shoot fired for the man who brought the ball up.** A possession
opens with its first handler at `uniform(20, 28)` feet, roughly half of which
is inside the arc, and the catch-and-shoot check ran on him before any pass
existed. So the first touch of a half-court set could become a 21-foot jumper
off the dribble, scored as a catch-and-shoot. That one path was **72% of the
sim's long twos**. It now requires an actual pass to have arrived.

| band, within the mid range | before | now | real |
|---|---|---|---|
| 8–10 ft | 9.3% | 20.3% | 23.8% |
| 10–15 ft | 24.8% | 43.9% | 46.8% |
| 15–20 ft | 41.7% | 31.2% | 28.2% |
| **20–23 ft** | **24.2%** | **4.5%** | **1.3%** |

Zone shares came with it: shots inside 8 ft went 35.8% to 39.3% against a real
40.3%, and 8–22 ft went 20.9% to 16.4% against 17.1%.

### Spacing: two position systems that had never spoken to each other

There were two. `player_positions` tracked where all ten men were standing and
drifted them every ten ticks. `location_feet` — the number the entire offence
actually reads — was set on every catch by `_receive_location`, which drew from
`shot_close` / `shot_mid_range` / `shot_3_pointer`.

**Those are shares of where a player *shoots*, being used as where he
*stands*.** A man takes a third of his shots at the rim because he *drives*
there, not because a third of his passes arrive there. The two systems
correlated at **+0.18**, with a mean absolute gap of 8.6 ft.

Each was wrong in the opposite direction, which is why neither could be fixed
alone — and the previous pass proved it, by trying:

| | `_receive_location` (what the ball read) | `player_positions` (what was tracked) |
|---|---|---|
| **who** | wrong — a PG standing at 22.5 ft was teleported inside 8 ft on **35.8%** of his catches, where he genuinely is 1.4% of the time | right — PG 22.5 ft, C 8.9 ft |
| **shape** | right — bimodal, rim or arc | wrong — **55% of all bodies parked at 8–22 ft** |

The tracked floor was a 1990s offence: PG 23-26, SG 22-26, SF 20-24, PF 14-18,
C 8-14, which put nobody in the dunker spot, 22.8% behind the arc, and over
half the league standing in the strip the modern NBA has emptied.

**So the fix had to be both halves at once.** Making the ball follow the floor
on its own — spiked, measured — moved the mid-range to 19.9% against a real
17.1% and threes down to 38.8% against 42.6%, because it faithfully followed a
floor that was wrong.

Four changes, one commit:

- **One source of truth.** `_catch_location` reads the tracked position;
  `_place_ball` moves the ball and the man together. `_receive_location` and
  `_kick_out_location` are deleted. Correlation is now 1.000 by construction.
- **The floor shape comes from the player, not his label.** `_home_spot` draws
  a spot from his own `shot_3_pointer`, `spot_up_frequency`, `shot_mid_range`,
  `shot_close` and `cutter_frequency`, against three bands that are the three
  places an NBA player actually stands — arc, elbow, dunker spot. **Nothing
  lives at 16–22 ft.** A stretch five stands at the arc and a rim-runner
  stands in the dunker spot because his own tendencies say so. Swept to
  59/20/20 against the NBA's rough 60/20/20.
- **Movement is transient.** Drift was a random walk with a one-way ratchet —
  a cutter moved `max(4.0, dist - rate*2)` toward the rim every ambient tick
  and nothing ever brought him back, so the paint filled up over a possession
  and stayed full. It is now a spring toward the home spot plus a cut that
  ends. Time spent cutting: 6.3%, against 6.7% of NBA possessions.
- **Passing reads the floor.** Every term in `_select_pass_target` describes
  the player and none the floor, so once the ball followed the floor the
  dunker-spot big was as findable on an ordinary swing as on a kick-out and
  20.1% of all catches landed inside 8 ft. Against a set defence you do not
  throw it into the paint; the collapse is what opens that pass, and the
  `kick_out` branch is where it was already opened.

| | before | now | NBA-ish |
|---|---|---|---|
| ball vs position correlation | +0.18 | **1.00** | identical |
| bodies behind the arc | 23% | 48% | ~60% |
| bodies at 8–22 ft | **55%** | 25% | ~20% |
| bodies inside 8 ft | 3% | 21% | ~20% |
| passes caught inside 8 ft | 40.1% | **9.5%** | |
| **handler decisions inside 8 ft** | **27.7%** | **8.7%** | |
| handler decisions beyond 20 ft | 51.8% | 65.9% | |

**The teleport could then be closed.** `_select_shot` re-rolled the zone from
tendencies and never looked at where the shooter stood, so a man at four feet
could be handed `uniform(23.75, 28.0)`. Zeroing the three weight inside 10 ft
had been tried before and was catastrophic — three-point share 44.3% to 33.4%
— because **the shot mix was resting on it**: `_receive_location` teleported
40% of catches into the paint and the zone re-roll quietly teleported them back
out. Two wrongs holding each other up. With the ball following the floor there
is nothing left to prop up, and it lands with the mid-range at 15.6% against
17.1% and FG% up.

### The pacing lever was throttling the wrong thing

`get_tempo_multiplier` scaled the handler's **per-tick action rate**, so
slowing a team down made its handler hold the ball and do nothing. Fewer
actions meant fewer passes, so re-anchoring pace cost assists every time —
109.3 to 98.2 took them from 18.4 to **14.3**, which is why the previous pass
recorded the lever as unusable.

Real basketball runs the other way: **a longer possession contains more passes,
not fewer.** A slow team is not one that does less, it is one that works the
ball for longer before it commits. Tempo now shifts the pass-versus-attack read
instead of the action rate, which lengthens the possession and raises the pass
count together. Assists went 18.8 to 19.6 at unchanged pace, and per-100 they
now hold flat across a re-anchor instead of falling.

`BASE_SHOOTING_FOUL_RATE` went 0.034 to 0.022 at the same time — more of the
offence attacks the rim from the perimeter now, so the old rate drew 28.1 FTA.
That cut used to cost FG% badly; it no longer does (44.7 to 44.6).

**And then `PACING_BASELINE` turned out to be a sixth one.** It was 115.0
against a sheet whose NBA teams run 99 to 107 with a mean of **103.2**, so all
thirty teams sat below baseline and the tempo multiplier for a league-average
team was **0.740, not 1.0** — after `PACING_BASELINE` itself, the shot curves'
rating 74, `stamina_factor`, the help recovery's 50 and `STAMINA_BASELINE`.

It was doing two jobs at once. One is honest: how fast this team plays
*relative to the league*. The other was a league-wide "everyone attacks too
early" correction smuggled in by putting the anchor twelve points above the
fastest team in the league — which also squashed the real 99-to-107 spread
into a corner of the curve, so the difference between the fastest and slowest
team barely registered. They are separate constants now: `PACING_BASELINE` is
the measured mean (an average team gets exactly 1.0, and the spread is a real
0.91 to 1.08), and `PACE_ACTION_RATE_SCALE` is the league-wide dial.

**And the pace dial had to go back on the action rate, for a reason worth
recording.** Possession *length* is set by how often the handler acts, not by
how often he passes: a pass costs only the setup ticks, so raising the
pass-first rate adds passes without adding much time — swept, 0.74 to 0.52
moved pace only 116.5 to 112.8. The reason that is safe now, when it was not
before, is that team tempo no longer touches it. Applied uniformly across the
league, assists per 100 possessions hold flat across the whole sweep (21.4 at
pace 116 to 20.8 at pace 106); it was the *team-relative* use of the lever
that did the damage.

### The lateral angle, and the 4-out set

Position was one number — distance from the basket — so two men at 24 ft on
opposite wings were, to every calculation that asked, **in the same place.**
That is not a rounding error, it is the floor collapsing to a line, and two
things fell out of it.

**Every "how close is the defender" question was answered radially.**
`_get_defender_distance` said so in its own docstring — *"the court is 50ft
wide, players at the same basket-distance can be on opposite wings"* — and
substituted `rng.uniform(2.0, 5.0)` for the real lateral gap. So the man
guarding the right corner contested a shot from the left one.

**And a set could not be represented at all.** Five independent draws from a
distance band put a mean of **2.81 men beyond 22 ft** — a 3-out floor, with
true 4-out only 34.6% of the time. The modern NBA runs 4-out as its default.
You cannot space four men around an arc if the arc is a single number.

Angle is measured from the straight-out axis through the basket: 0 is the top
of the key, ±90 the baseline. Distance between two players is the law of
cosines, not a subtraction — two wings at 24 ft are **35.7 ft apart**, where
the old model said 0.

**The set is slot-based, and that is the part that matters.** Five men now
take distinct spots from a fixed list — top, both corners, both wings, then
the dunker spots, elbows and blocks — each taken at most once. That is the
whole difference between a set and five independent draws: nothing previously
stopped two men landing on the same spot, and nothing pushed the fourth man
out. How many go out is personnel rather than a constant: every player whose
own profile points hard enough at the arc is one of the men spread around it,
so a team of shooters spaces five out and a team with two bigs plays three.

| | before | now |
|---|---|---|
| 2-out | | 2.8% |
| 3-out | | 12.5% |
| **4-out** | | **49.7%** |
| 5-out | | 35.0% |
| **mean men out** | **2.81** | **4.17** |
| nearest teammate, median | *unanswerable* | 17.0 ft |

**The corner three now exists.** The line is 22 ft in the corners and 23.75
above the break, and the engine tested a flat 23.75 everywhere — so a man
standing on the corner line was shooting a long two. Two of the five perimeter
spots in a set are corners, so that was a large share of the offence. With an
angle the real geometry is available: the arc meets the corner line 8.95 ft
out along the baseline, which is |angle| = 67.9°, and inside that the line is
`22/sin(angle)`. Corner threes are now 13.1 a team a game, 32.8% of all threes
against a real ~23% — a little heavy, and they were previously zero.

Measured over 240 league games, against the state before the angle: FG% 44.6
to **47.5** against a real 46.5, 8–22 ft 15.6% to **17.3%** against 17.1%,
free throws 23.2 to **21.9** against 22.0, assists 19.3 to 20.9.

**What it did not fix, and this is the next thing.** The nearest-defender
distribution barely moved:

| nearest defender | before | now | NBA |
|---|---|---|---|
| 0–2 ft | 19.8% | 19.6% | 12.3% |
| 2–4 ft | 53.5% | 49.1% | 34.9% |
| 4–6 ft | 14.9% | 18.6% | 28.4% |
| 6+ ft | 11.8% | 12.7% | 24.4% |

The 2D maths is right; the problem is upstream of it. **The assigned defender
is glued to his man**, at a 2–4 ft cushion on the ball and a 4–7 ft sag off it,
so "nearest defender" really means "the man guarding him" and he is never
actually beaten. Getting open is modelled as `openness_bonus`, a number added
to the shot probability, entirely separately from where anybody is standing —
so the engine has two representations of the same fact again, exactly the
shape of the bug the spacing work just removed. **A closeout should be a
distance, not a bonus.** Until it is, this distribution cannot be right even
though the FG% it produces now is.

### The plays, and why they were not firing

With the floor finally real, the remaining question was whether the plays that
should run on it actually do. Measured against Synergy's own per-team-per-game
rates — the whole set is already in `ratings_build`'s cache — most of them did
not. **Of 77.5 field goal attempts a game that the NBA takes out of a named
play type, the sim was producing 61.6, and the missing 22 had all landed in
the same place: the `off_dribble` pull-up column.** The engine ran the right
number of possessions and resolved a fifth of them as a generic jumper
instead of as the play they should have been.

Five separate causes, and no two alike.

**The break was flagged and then walked.** 19.1 transition possessions a game
— the right rate, against a real 18.3 — produced **4.4** transition field goal
attempts against a real 14.2. `TRANSITION_SETUP_TICKS` existed and was applied
*once*, at the first catch of the possession; every pass after it paid the
full half-court 2.2 seconds of setup while an 8-second transition flag ran
down. Two catches and the break was over before anybody shot. It now applies
to every catch on the break, and the handler decides on the move.

**There were two cut systems and they had never met.** `_check_off_ball_cut`
rolled its own cut on `cutter_frequency`, entirely unaware that
`_update_ambient_positions` was already running cuts of its own on the same
tendency — so the man moving at the rim was not the man the handler could
find, and the cut pass landed on somebody standing still. Exactly the shape of
the ball-and-floor bug the spacing pass removed. Cuts now go to the man who is
actually cutting: 0.9 field goal attempts a game to 7.4, against a real 5.6.

**Handoffs were switched off entirely** — 4.6% of the NBA's offence — because
`dribble_handoff_frequency` is not a real tendency key, so `tend()` returned
the 50.0 default and every player ran them identically. Disabling the play was
the wrong answer to that. `screener_frequency` is the honest stand-in: a
dribble handoff is a screen with the ball in your hands, set by the same
population, and it is measured rather than defaulted. **Superseded:** the
Sheet now carries the real Synergy rate — see *The handoff and the off-screen
action, measured*.

**The post read the double team every tick.** `POST_KICK_OUT_RATE` was 0.040
*per tick*, which over a thirty-tick post-up compounds to a four-in-five
bail-out: 3.6 post-ups a game, the right rate against a real 3.4, passed out
of 62% of them. Precisely the bug the drive had before `_decide_drive_kickout`
became a single read, and the same fix — one read, part-way through.

**And the off-screen action did not know whether the team owned a shooter.**
Its weight was the *handler's* `pass_willingness` (now
`pass_out_frequency`), which says nothing about
that, so every team called it equally often. `shot_3_off_screen` is a measured
tendency and was already what `_begin_off_screen` picks the runner with; it is
now what decides whether the play is called at all. You run a man off a screen
because you have a man worth running off a screen.

### The dead time in the middle of every touch

**Superseded by *The touch*.** `BALL_HANDLER_SETUP_TICKS` and the per-tick
swing are gone: the time a touch takes now follows from what the handler
decides, and it is anchored on the shot clock rather than on seconds per touch.

Fixing the plays broke the pace, and chasing the pace kept destroying the
passing game — assists fell from 21.5 to 16.6 across a *single step* of
`BALL_HANDLER_SETUP_TICKS`. The cause was a four-tick constant.

A catch put the handler in `setup` for 2.2 seconds, during which
`QUICK_PASS_TICKS = 4` allowed a swing pass **for the first 0.4 of those
seconds** and the remaining 1.8 were frozen. Setup is most of a possession, so
most of a possession was dead time — and lengthening it to slow the game down
added only dead time, which is why a longer possession kept containing *fewer*
passes instead of more.

The swing window is the whole of the touch now. That makes possession length
an honest pace lever, and it has a real anchor to be set against: **the NBA
holds the ball 3.85 seconds per touch and takes 3.76 touches a possession**,
which is the 14.5-second possession that makes 100 a game. `track_possessions`
in the cache carries both. `BALL_HANDLER_SETUP_TICKS` is 44, swept against it.

**Half-court possessions were 11.9 seconds against a real 16.0** before this,
and transition 9.1 against 7.0 — the sim was playing every trip like a
semi-break.

### One field was answering two questions

`ShotGather` was being used for two different things, and the second kept
writing over the first. **Where the shot came from** — the cut, the post move,
the lob, the catch, the drive — and **how he went up at the rim**, driving or
standing, which is what a layup or a dunk needs to know. `_select_shot` handed
every rim shot to `_resolve_close_shot_selection`, which returned its DRIVING
or STANDING *as the gather*, replacing whatever the caller had passed.

So a cut layup, a post finish and an alley-oop were all recorded as drives.
Measured with the two kept apart, that erased a real source on **4.6 cuts, 1.0
catch-and-finishes and 0.5 alley-oops a game**, and labelled another **13.8
off-the-dribble rim shots** as drives as well. It is why alley-oop assists read
exactly zero in every box score ever produced — the check looks for an
`ALLEY_OOP` gather that could not survive to the event — and why box-score
drive makes and misses counted every rim attempt in the game.

**They are two fields now and neither can touch the other.** `shot_gather` is
where the shot came from and is never replaced; `finish` is DRIVING or
STANDING for a rim finish and `None` otherwise. A cut layup is `CUT` and
`DRIVING` at once.

`play_type` had its own, separate faults, and they are fixed with it:

- **It survived the pass**, so the man who caught an iso kick-out and shot was
  written down as having isolated himself. A completed pass now hands over the
  ball and resets the play; a catch off an ordinary pass is a spot-up.
- **`_begin_drive` stamped every drive `MISC`**, overwriting the play it came
  out of, so every pick-and-roll handler who turned the corner was filed as a
  broken play. A drive is a way of getting to the rim, not a play; its own
  `DriveEvent` records it.
- **The roll man had no tag** and inherited the handler's. **An alley-oop
  stamped itself `CUT`**, even thrown to a roller. **Nothing was ever tagged a
  putback.**
- **Transition is decided at the shot**, not stored: whatever is run on the
  break counts as transition, while the play underneath is still recorded, so
  a post-up that outlives the eight-second window is a post-up.

**The engine never reads `play_type`**, and it reads the gather in exactly one
place — the assist probability — so this was proven rather than argued. Across
24 seeded games, with the assist logic still reading exactly what the override
used to produce, every shot sequence and every total came out **identical**.
Then the assist logic was allowed to see the real source (a named source wins;
`OFF_DRIBBLE`, which is only `_take_shot`'s default, still defers to the
finish): shot sequences, points, attempts, makes, free throws, turnovers,
drives and passes all identical again, and assists **+8 across 48 team-games**.

That +0.17 a game is real and small. An immediate cut or lob was already
rolling close to 1.0 through the drive formula; the override only cost the
assist on finishes that came late. **It is not where the assist gap is.**

`season.py`'s gather splits are now source splits too, which is what they
were always meant to be.

### Still radial in one respect

An angle is not a full coordinate. Two men at the same angle and different
radii — a big at the elbow and a shooter at the top — are on the same ray,
which is fine, but the model still has no notion of the ball's own position
affecting who is open, and no baseline/sideline geometry beyond the corner
line. It was enough for everything measured above.

### Fatigue

Recalibrated September 2026, and worth reading before touching it again.

The per-tick constants were written in five-zero decimals nobody had ever
converted to a per-minute rate. Doing so found a defender emptying his tank in
4.8 minutes and a cutter in 2.1, against a recovery of 24% a minute. That is
not a conditioning model, it is a sawtooth: everyone drained flat in five
minutes, sat, refilled in four, and came back. End-of-game fatigue measured
time since last rest and nothing else — one sampled game had a man finish 41.7
minutes at 0% and another finish 22.3 at 100%.

They are now written **per minute**, converted to ticks in one place, and
calibrated so a stamina-87 player who never leaves the floor lands near 60% at
48 minutes. Under 18 minutes ends effectively fresh; genuine exhaustion is
reserved for the double-overtime night.

Two anchors go with them. `STAMINA_BASELINE` is 87 because that is the rated
league mean — it read 74, which is not the mean of anything, so every real
player got a standing discount on a scale that claimed to be neutral. And
`FATIGUE_IMPACT` is 0.08 rather than 0.25, because the old value double-counted:
base shot curves are calibrated to reproduce the real league FG%, and the real
league FG% is a season average measured across whole games with tired minutes
already in it. Charging a fatigue penalty on top charged twice, and the sim shot
41.1% where the league shoots 48.4%. Fatigue should move a player around that
average across a night, not drag the average down. Mean penalty at shot time is
now 1.3%.

Quarter-break recovery reaches everyone, too. It used to reach `on_bench` only,
so the five men on the floor at the buzzer got no break at all.

Not everything is wrong. Run `calibrate.py --shape shot_3_pointer:tpa` and the
sim turns a point of three-point tendency into 3PT attempts at 1.01 times the
real rate — the tendency pipeline is doing its job.

**Fixed, September 2026: rival boosters and leadership now start at
tip-off.** `_apply_rivals` and `_apply_leadership` are reachable only through
`_rebuild_boosters`, which ran after a lineup change, a foul-out, a technical,
or on leaving clutch - never at tip-off - so every game opened without either
until the first substitution, a median 4.1 minutes in. `run()` rebuilds once
before the tip now. It draws no randomness, and over 1200 games it moves
nothing in the league box score beyond noise (FG% -0.09, points -0.10):
leadership lifts both ends of the floor. It changes who plays well in the
first four minutes, not how much the league scores.

**`play_initiators` is loaded and read by nothing**, because the call play
system was designed and never built. It is the last unimplemented system from
the original design: a team-level `call_play` tendency firing when a designated
initiator catches the ball in the half court — never in transition — and
selecting a structured set weighted by team preference and by the skills of the
five on the floor.

**Play-type attribution is fixed** — see *One field was answering two
questions*. **`ITO` read zero** because `IsolationEvent` is emitted as the
iso starts and its result was never filled in. `settle_isolation_results`
fills it as the possession ends - his shot, his pass, his turnover or a foul
on him, whichever comes first - which is the reading `season.py` makes on
its own; over 24 seeded games the two agree on every iso, and every game is
identical with it on or off. One quirk from the same family remains, and
every consumer works around it. **A post-up emits two `PostUpEvent`s** — a
blank-result one from the back-down, move or face-up phase and a final one —
so count only events with a result, as `box_scores` and `season.py` both do.
One that ends in a steal or a foul now gets a final one too - see below.

### Stats that read zero for every player

A full season of `season.py` had 23 stats that summed to zero across 1,560
games. Only plus/minus is supposed to. The other 22 came from ten causes, two
of them stats that cannot exist, and **none of the fixes changes a game** - 24
seeded games fingerprinted before and after, score and every shot, free
throw, turnover and rebound in order, came out identical.

| stat | why it read zero |
|---|---|
| contact dunks and layups | `_resolve_shot` set the event's `contact_level` to NONE and never assigned it; the drive's real contact only reached the make and foul maths |
| putback gather | a putback is marked by its play type, never `ShotGather.PUTBACK`; `season.py` now files it by that |
| standing gather | STANDING has been the `finish` field, not a source, since the two were split; the row reads `finish` now |
| tip gather | the engine has no tip at all. The row is gone |
| post-up turnovers and fouls drawn | the post-up's steal and foul exits emitted no resolved `PostUpEvent`, as the drive's did not until it was fixed |
| illegal screens drawn | the foul named nobody as fouled; it names the screened defender now |
| technicals drawn | nobody draws a technical. Gone from the drawn tables |
| deflections | nothing ever emitted a `DeflectionEvent` - see config's DEFLECTIONS |
| matchup assists | `box_scores` never charged an assist to the passer's defender |
| catch-and-shoot deterrence | emitted as `catch_shoot_suppressed`, looked up as `catch_shoot` |

Deflections needed a definition as well as a wire, because the engine has no
poke or tip to count. Every failed steal attempt read 40 a team a game; a
failed attempt whose roll landed near the success line reads 8.7, 1.08 per
steal, which is the league's rate once its own count - which includes steals
- has them taken out. Deflections and the catch-and-shoot deterrence were
both already scored in `advanced_scoring`, so `LEAGUE_AVG_DEFENSIVE` went
5.40 to 5.98 with them.

Counting them showed one as gameplay rather than tracking: post-ups turned
it over 0.012 times a team a game against the league's 0.41. Fixed - see
below.

**Box-score drive makes are drive shots.** `DMK`/`DMS` matched `"driving"`
*or* `"pnr handler"` in the shot's tags, so every pick-and-roll handler's
pull-up off the screen counted as a drive make: 6.0 of the 28.7 a team game
the column reported. They match `"driving"` alone - a shot whose source was
the drive - and a handler who turns the corner is tagged that way already.

**Custom-player ratings are being re-entered by hand** after the ratings
overhaul. Until that is finished, roughly 78 custom players are blank rows and
league output reads low. `bench.py` numbers are not meaningful mid-overhaul.

### Turnovers happen in the play

The NBA's 13.7 turnovers are 8.4 steals and 5.3 dead-ball: travels,
offensive fouls, three seconds, the ball thrown away. The sim's own paths
made about 2.8 of the dead-ball kind, and **the rest were one roll at the
start of every possession**, 2.5 a game charged to whoever brought the ball
up before he had done anything. So the turnovers that happen in post-ups
and drives had been counted somewhere else: post-ups turned it over 0.005
times a possession against Synergy's 0.121, and tracked drives 0.7% of the
time against 6.1%.

The roll is gone and the plays read it themselves, once each, at the point
the play is decided. A post-up reads it with the double team, at a flat
rate, because nothing on the sheet predicts it: across 43 real players with
60+ post possessions, `ball_security` and `post_control_footwork` explain
R² 0.006 and 0.045 of their turnover rates. A drive reads it reaching the
paint, beside the charge check, scaled by his ball security against the
league's drive-weighted mean, because across 187 real players with 300+
drives the elasticity is -0.56 - weak (R² 0.07), but there.

| per team game, 100 real-roster games | before | now | NBA |
|---|---|---|---|
| post-up turnovers per post possession | 0.005 | 0.109 | 0.121 |
| tracked drives ending in a turnover | 0.7% | 5.2% | 6.1% |

**The drive rate is set to hold the league total, not the drive split.** The
engine's drives include about 22 a team a game that start inside 20 ft,
which the NBA's 6.1% does not count and which reach the paint all the same.
A rate that put tracked drives on 6.1% took the league to 14.5 turnovers.
At the one in place, over 240 games on real rosters: turnovers 14.0 → 13.9
against 13.7, possessions 102.1 → 101.1 against 101.3, points 116.8 → 116.3.
The drive split will want another look once the sim drives as often as the
league does.

### The handoff and the off-screen action, measured

Two tendencies now come straight from Synergy, where both plays are credited
to the man who **uses** them — the receiver coming off the handoff, the runner
coming off the screen — not to the man who gives or sets it.

| `play_off_screen` | | `play_handoff` | |
|---|---|---|---|
| Klay Thompson | 108 | Michael Porter Jr. | 86 |
| Lauri Markkanen | 94 | Jared McCain | 86 |
| Duncan Robinson | 90 | Julian Strawther | 79 |
| Stephen Curry | 90 | A.J. Green | 77 |
| Aaron Nesmith | 87 | Jamal Murray | 77 |

The engine reads them in the two places a play needs a player. **Whether the
play is called** is the best user on the floor, so a lineup with Klay runs him
off screens and a lineup without a runner rarely calls it; the handoff is still
shaded by the handler's `screener_frequency`, because the giver is not tracked
anywhere and a dribble handoff is a screen with the ball. **Who runs it** is a
weighted choice on the tendency — the off-screen runner used to be the single
best `shot_3_off_screen` on the floor every time, so a lineup with two movement
shooters only ever ran one.

**And the handoff finally has a read.** The off-screen runner has always had
one: if the screen freed him he shoots at once, otherwise he decides straight
away. The handoff sent its receiver into the full 4.4-second half-court setup
instead, where the swing pass is live every tick, so he passed it on before he
had looked at the rim more than half the time — 3.8 handoffs a game produced
**0.9** handoff attempts against a real 3.7, where 82% of NBA handoff
possessions end in a shot. It gets the same read as its sibling now.

Measured on a sheet with the columns filled, 240 league games: handoff 3.7
against 3.7, off-screen 3.5 against 3.2, with points 113.3, possessions 99.3,
attempts 88.6 and a 40.2% rim share all on their anchors — no re-tuning needed.

**Custom players get them too.** `ratings_build`'s archetype model only
predicts a tendency that beats the league average by at least 15% under
cross-validation. Re-run against the documented method — which it reproduces
within a point on cut, iso and spot-up — `play_handoff` improves 45% and
`play_off_screen` 35%, so both are predicted.

**A new loader warning, because this is how handoffs were lost the first
time.** A tendency column that is blank for every player is not an error; it
makes the whole league identical at that one thing, silently. `csv_to_players`
now names any tendency column that is missing or entirely blank.

### Drives, post-ups and isolations, start to finish

**Superseded by *The touch*.** The isolation's pass-out is a single read, a
resolved iso drives or pulls up from where it stands, and the roll man and the
offensive rebounder read on the catch. The table is the state before that.

Traced from the moment each play begins to how it ends, on real rosters, over
80 team-games. Where tracking gives a *start* rate it is used, so starts are
compared with starts:

| | sim | NBA |
|---|---|---|
| **drives begun, NBA definition** | **32.2** | **66.1** |
| ...ending in the driver's shot | 42.8% | 40.8% |
| ...ending in a pass | 56.6% | 43.9% |
| **post-ups begun** | **2.6** | **7.3 post touches** |
| ...ending in the poster's shot | 24% | ~36% of touches, 75% of post-up possessions |
| ...passed out | 63% | |
| **isolations begun** | **4.4** | — |
| ...ending in the iso player's shot | 14% | 78% of iso possessions |
| ...passed out | **79%** | |
| isolation FGA | 0.5 at 57% | 5.8 at 43% |

**Drives** are half the real rate and kick out too readily. Tracked drives
record almost no fouls or turnovers, but that is the definition rather than the
engine: the engine rolls both from the first tick, before the driver is inside
10 ft, so they end a drive that does not yet qualify.

**Post-ups start at about a third of the real post-touch rate**, and most of
those pass out.

**Isolations are the clearest.** `ISO_PASS_OUT_RATE` is 0.035 *rolled every
tick* plus a ramp, so an average 22-tick iso reaches its own resolution only a
third of the time, and a failed resolution then passes 65% of what is left.
**The same bug the drive had before `_decide_drive_kickout` became a single
read, and the post-up had until its kick-out did.** Only 14% of isolations end
in the iso player's shot, against a real 78%.

And two more plays with the same missing read as the handoff:

- **The roll man** catches the pocket pass and is sent into the full setup,
  like any other catch. 0.5 roll-man attempts a game against a real 4.3.
- **The offensive rebounder** is too. **No rebound is ever put straight back
  up** — putbacks, correctly tagged at last, are 0.0 a game against a real 4.2.

### Found while chasing the drives, measured, and not yet fixed

These came out of the September 2026 drive pass. Each is measured, none is
speculative, and they are roughly in order of how much they distort the league.

**Fixed, September 2026 — see Spacing below.** The two items that stood here,
the `_select_shot` teleport and the 28% of ball-handler decisions happening
inside 8 ft, were one bug wearing two faces and are gone. Handler decisions
inside 8 ft are now 8.7%.

**Fixed, September 2026** — the fast break, the post-up rate and the handoff
all landed in the play-type pass above. What remains from this list:

**Fixed: an iso never reached the rim.** `_resolve_iso` only called
`_begin_drive` at 10 ft or nearer, but the iso tick moved the handler 0.3 ft
and ran 15-30 ticks, so a 22-footer ended at 13-17 ft and resolved as an
off-dribble jumper. The iso now holds his spot, and a resolved one drives or
pulls up from there on his own tendencies - see *The touch*.

**A foul on a driver is always a shooting foul.** Every in-drive foul routes
through `_handle_shooting_foul` and awards two free throws, so the sim gets
2.00 FTA per drive foul against a real 1.54 — in the NBA a foul on a driver who
has not gone up is a common foul and worth nothing outside the penalty. The
foul *rate* is fine (0.076 per drive against 0.086), and drives are not the
main source of the free-throw excess: 0.152 FTA per drive against a real 0.133.
The remaining excess is the rim shooting-foul rate, which is the open
`BASE_SHOOTING_FOUL_RATE` question above.

**A 30-game bench run cannot resolve a three-point difference.** Four blocks of
30 at different seeds gave 108.1 / 111.1 / 109.8 / 114.0 points and 43.4 /
45.1 / 44.4 / 45.7 FG%. Use 120 games to judge a change and 240 to quote a
number. Several of the conclusions recorded in this file — "measured, this is
about a wash" in particular — were drawn from samples that could not have
distinguished the outcomes they describe.

### Where the real play-type numbers come from

`ratings_build/cache/stats-<season>.json` already holds the whole Synergy
play-type set and the tracking tables, so the league's real play mix needs no
new fetch. Two things matter when reading them:

**Weight by games played.** Summing each player's per-game average and
dividing by 30 over-counts badly — a man who played 24 games still contributes
a full per-game rate. Multiply by `GP`, then divide by team-games, taken as
total player-minutes over 240. Done that way the cache reproduces 373.8
touches, 66.1 drives and 9.8 pull-up threes, which are the tracking figures.
Done naively it says 585 touches and 100.3 drives.

**Synergy possessions are a partition; drives are not.** The eleven play types
sum to 99.3 a team a game, one per possession. Drives are 66.1 — they happen
*inside* play types, which is the whole reason a drive cannot be modelled as a
terminal action.

(The 99.3 is short, though, and its closeness to a possession a trip is luck.
The per-player tables list only players above a minimum and hold 78.4 of the
league's 88.6 field goal attempts a team game, so every volume below is
low, the rarer plays most. Rates - FG%, points a play - are unaffected. See
*Play types, credited to the play that was running*.)

| play type | NBA poss | share | FGA |
|---|---|---|---|
| spot up | 23.9 | 24.1% | 21.7 |
| transition | 18.3 | 18.4% | 14.2 |
| P&R ball handler | 16.1 | 16.3% | 12.2 |
| isolation | 7.4 | 7.5% | 5.8 |
| cut | 6.7 | 6.7% | 5.6 |
| P&R roll man | 5.2 | 5.2% | 4.3 |
| misc | 5.1 | 5.1% | 1.0 |
| putback | 5.0 | 5.1% | 4.2 |
| handoff | 4.5 | 4.6% | 3.7 |
| off screen | 3.6 | 3.7% | 3.2 |
| post up | 3.4 | 3.4% | 2.6 |

### A quarter that never ended

**The steals fit stopped twice in its eighth round, at the same game** (9
October 2026). A transition take foul ran the clock down by a random 1-3
seconds, `rng.uniform(1.0, 3.0)` - the one place a second was not a whole
number of ticks. A take foul in a quarter's last three seconds could leave a
sliver - 0.04 s - which the tick loop reads, to the nearest tick, as
nothing: every trip ended on its first tick as the end of the period, used
no time, and the quarter loop, asking only whether the clock was above zero,
started another. The game never finished, filled memory with empty trips,
and the fit's pool waited on it. With a take foul on every break it caught
one game in 400; at the real rate, about one in 13,000.

The take foul's seconds are rounded to the tick - the same draw, so a game's
random numbers do not move - `_advance_clock` keeps the clock on the tick,
and a period ends when no tick is left on it, as the tick loop reads it.
The 400 games run to the end. 60 seeded real-roster games before and after:
the 13 with no take foul identical, and 7 of the 47 with one changed by
their clock's tenth of a second.

### Ball security per touch, and the steals' levels

**The steals fit's first run on the loose-ball engine** (10 October 2026)
was kept for two of its three knobs. `steal` went from r 0.81 to 0.85 against
each man's real strips, its slope 1.30 to 1.07, and `pass_perception` from r
0.54 to 0.77 on the interceptions; nobody reached the cap, and one man each
ran past 99 (Jonathan Isaac's steal, 102; Matisse Thybulle's
pass_perception, 112). The engine answered both at about four-fifths of the
curve it is written with.

**`ball_security` was not kept.** 34 men sat on its cap of 45 and 81 ended
past 99, and they were two kinds. Bigs and forwards - Sengun, Claxton,
Vucevic, Lopez, Jaren Jackson, Markkanen, Gordon - went up by the cap, and
Durant and Edwards down by it. The rate was lost balls per second with the
ball, and on 870 games against each man's real numbers the sim gave him 75%
of his real seconds and 92% of his real lost balls - but the men who really
hold it one to four minutes a 36 only 56% of their seconds, at 0.80-0.94 of
their lost balls. Per second they read 1.4-1.7 times as careless as they
are, and a rate right per second would have been half their lost balls a
game. Part of it is the rebound and inbound time, which the engine charges
as dead time and the NBA credits to the man holding it; most is that the
sim's touches are shorter, 2.9 s against 3.9.

**Per touch, the user's suggestion, is the fit.** The sim counts touches the
NBA's way - catches, rebounds, inbound catches, steals - and has them right
man by man (57.4 a 36 against 57.5, log-slope 0.91, r 0.90). Per touch its
lost balls run 0.94, 0.81 and 0.98 of real for the three kinds of player,
and per 36 minutes, the other candidate, would have handed each man's usage
errors to his security. The prior measures 1,018 touches, so a median season
is worth 66% (per second it was 53%).

**The other kind was the curve.** Tyus Jones loses it 0.11 times a hundred
touches and the sim had him at 1.17; Durant and Edwards, whom 2K rates 92,
lose it about twice as often as the sim had them. At
`STRIP_SECURITY_EXPONENT` 1.0 the fitted ratings would spread 1.4 times as
wide as 2K's, some 37 past 99 and up to about 160. The rule the other two
exponents follow - fitted ratings keep 2K's spread, the scale customs are
typed on - gives about 2.5, the 2.43 it had once and lost because the
engine then played 2K's own, loosely ranked numbers. With real players
fitted that objection is gone, and the user took 2.5, knowing a custom typed
40 is stripped about 2.9 times the league's rate a touch (1.5 before) and
one typed 95 about 0.56 times (0.79).

**The levels, measured at last.** On the fit's real-roster league, 870
games a setting: lost-ball steals 3.05 a team game against the NBA's 3.26,
bad-pass steals 5.60 against 5.10. Steeper, the strips barely moved at the
same base - the most-stripped handlers are guards above the anchor, coming
down as the bigs go up - and the touch-weighted estimate of the change,
a base 17% lower, overshot to 2.56. Stepped to their numbers:
`STEAL_SUCCESS_BASE` 0.1195 -> 0.1331, `INTERCEPT_SUCCESS_BASE` 0.317 ->
0.2903, for 3.30 and 5.13. Turnovers in all came to 12.9 against the NBA's
13.7: the dead-ball ones, about 4.5 against 5.35, which the extra
interceptions had been covering.

`fit_ratings.py --accept --knobs ...` keeps only the named knobs of a run.

### Assists per pass, and vision's curve

**The steals family finished, and pass_vision began** (10 October 2026), in
one run of three knobs. `steal`, starting from its first fit, held at r 0.88
and slope 0.98. `ball_security`, per touch on the steeper curve, went from r
0.29 to 0.74 against each man's real lost balls a touch, slope 0.74, the
engine answering at 87% of its curve; four men on the cap, a dozen past 99,
and the fitted spread a little narrower than 2K's. Both kept, and the
family's attribute-scale maps added as version 2: `steal` 14-100,
`pass_perception` to 112, `ball_security` to 129, from the real players of a
build with no map for them, pins left out. Read back, each is within a point
of its fit; the 102 customs typed in them are untouched.

**pass_vision was fitted to assists a pass - the user's call.** The first
version of the knob fitted potential assists a pass, the shots a man's passes
become, on the grounds that the league's passers have no bearing on whether
a shot is made. The user's answer was that in the engine vision is what
makes a pass an assist, and it is: besides the receiver's chance to shoot,
it adds to the make (`PASS_VISION_ACCURACY_BONUS`). The two repeat alike year
to year (r 0.82 and 0.81), so the rate the rating was built for won.

**The run tracked the men and spread the ratings.** Each man's assists a pass
against his real ones went from r 0.72 to 0.87, but the engine answered
vision at 0.0084 a point against the curve's 0.019 - 44% - and to reproduce
the real spread the fit moved vision half again as wide as 2K's: 10 to 133,
24 men on the cap, Jalen Brunson 75 -> 29, Reed Sheppard 68 -> 22, Ja Morant
89 -> 133, Alperen Sengun 74 -> 118. Vision reaches beyond the assist, and
the bring-up's term alone (`BRING_UP_VISION_PER_POINT` 0.036) would have had
Brunson bringing it up a fifth as often and Morant and Sengun five times as
often. Not kept.

**Why the engine answers at 44%.** The factor multiplies the receiver's
chance to attack off the pass - capped, and held to his own shot volume by
the volume appetite, which takes back later in the night about half of what
a good pass hands him. So a pass's worth is redistributed more than it is
added. Rather than weaken that hold, vision's curve went to 0.040 a point,
where a fit keeps 2K's spread (the rule the steal exponents follow: on this
run's moves, 0.038-0.042 leave the fitted spread within a tenth of 2K's), the
factor's bounds 0.4-2.5 -> 0.15-6.0 (the old top flattened everyone past 86),
and `PASS_VISION_SHOT_LEVEL` 0.912 holds the league's assists: 26.67 and
26.72 a team game on the same 870 real-roster games (the NBA's 26.6). The
anchor, 63, stays, because the double team's passer reads share it.

**Still to do with it**: the refit on the new curve (`FIT` is pass_vision
alone), and then the bring-up's vision term, which was fitted on real
backcourt touches with 2K's vision as the measure of the playmaking bigs who
bring it up, fitted again on the fitted vision.

### Who brings it up, without vision

**The pass_vision refit on the steeper curve** (10 October 2026) did what
the curve was steepened for: each man's assists a pass against his real
ones from r 0.73 to 0.92, slope 0.92, and the fitted vision kept 2K's spread
(sd 17.8 against 17.5) - three men on the cap, two past 99 (Ja Morant and
Trae Young), 21 under 25. Wings 2K rates low as passers went up (Klay
Thompson 38 -> 83, Cameron Johnson 40 -> 85, Trey Murphy 63 -> 96), the
men the sim over-credited down (Jalen Brunson 75 -> 42, Cade Cunningham 94
-> 70, Nikola Jokic 99 -> 86). The engine answered at about 30% of the
written curve, against 44% at the old one: the receiver's appetite takes a
larger share back of a steeper push. Not kept, for what it did elsewhere.

**Fitted vision says nothing about who brings it up.** The bring-up weight
read vision at 0.036 a point, fitted on the NBA's backcourt touches less
rebounds and steals with 2K's vision standing for the playmaker - Jokic and
Draymond Green bring it up whatever their position. Refitted on the fitted
vision the term is -0.003 a point. Brunson's would have fallen to 30% of his
bring-ups and Cunningham's to 40%, and it fed back into the fit: a bring-up's
hand-on is a pass, tracking's and the sim's, and never an assist, so a man
losing bring-ups lost zero-assist passes and his assists a pass rose -
pushing his vision further down.

**Nothing on the Sheet carried the hub big.** PG_Prof matched 2K's vision on
the NBA's backcourt touches (r 0.850 against 0.853) and got the point guards,
not the hub: against what it leaves, the strongest sign is how much a man
really passes (r 0.45), which is his bring-ups seen twice. pass_out_frequency,
outlet_pass_frequency, pass_accuracy, ball_handle, defensive_rebound, the C
proficiency and a passing proxy from touches less shots all read under
0.21. Tried: PG_Prof in the weight, set on the sim (0.07 a point, touches **
0.9, ball_dominance ** 1.6: each man's backcourt touches against his real
ones a mean miss of 0.341 in log, against 0.345 on 2K's vision), and the
team config's play_initiators - a column from the called-play design, read
by nothing - as the user's switch for the hubs, read as a point guard at
PG_Prof 10, which put a named Jokic on 27.4 a 36 against his real 27.3. The
user's call against it: one switch gives every hub a point guard's share,
and Jokic brings it up like a point guard from centre where Zion Williamson
can and does far less. Reverted.

**So it is a tendency, `bring_up`**: his real backcourt touches a 36 less his
defensive rebounds and steals, from the stats pull like `touches` (linear,
the league's man 18.4 a 36 at 50; topped on the Sheet at Jalen Brunson's
138, T.J. McConnell 158, Jaime Jaquez 95, Jokic 74, Draymond Green 71, Zion
50, Rudy Gobert 28). Predicted for a custom from his build and his own
tendencies, 56% better than the league's average under 5-fold cross-
validation (55% on attributes alone), and anything typed kept. The bring-up
weight is 50 x (bring_up / 50) ** `BRING_UP_EXPONENT`, set on the sim, 870
real-roster games a setting:

| exponent | log-slope | r | mean miss (log) | point guards | wings | bigs |
|---|---|---|---|---|---|---|
| 2K's vision, before | 1.02 | 0.82 | 0.345 | +10% | +8% | -29% |
| PG_Prof, tried | 0.87 | 0.79 | 0.341 | +8% | +18% | -22% |
| 1.0 | 0.85 | 0.85 | 0.275 | 0% | +26% | -11% |
| 1.3 | 0.99 | 0.88 | 0.257 | +6% | +16% | -19% |
| **1.5** | **1.06** | **0.90** | **0.255** | +10% | +11% | -24% |
| 2.0 | 1.27 | 0.92 | 0.306 | +16% | -4% | -35% |

At 1.5 Zion brings it up 18.7 times a 36 against a real 18.5, Jokic 23.5
against 27.3, Draymond Green 22.8 against 26.2, Brunson 48 against 51,
Kevin Durant 14.8 against 12.6. The bigs as a group stay short whatever the
curve: the engine's own logic around them.

The vision fit ran again, fresh, once the Sheet carried the new column.

### Vision beyond the role

The vision fit, fresh on `bring_up` (October 2026, ten rounds of 1,305
games): assists per pass against the real ones went from r 0.75 to 0.88-0.92,
slope about 0.9, the league's level 0.101 against 0.094 throughout. The
measured response was 0.011 a point against the curve's 0.040 - the receiver's
shot appetite still takes back most of it - and the fitted spread came out as
2K's (sd 17.8 against 17.5), 10 to 104: Trae Young 104, Ja Morant 101,
LeBron James 97; seven at the knob's floor of 10.

The movers ran by role. Whoever brings it up came down - Jalen Brunson 75 to
41, T.J. McConnell 97 to 66, Cade Cunningham 94 to 72 - and the catch-and-
shoot wings went up - Klay Thompson 38 to 82, Cameron Johnson 40 to 82, Trey
Murphy III 63 to 90 - so that fitted vision follows `bring_up` at r 0.16
against 2K's 0.80. The report's movers are where an engine problem shows, so
the round at 2K's ratings was taken apart, 435 games:

| bring_up | passes a 36, sim / real | assists a 36, sim / real | assists a pass, sim / real |
|---|---|---|---|
| under 35 | 0.92 | 0.79 | 0.069 / 0.079 |
| 35-55 | 0.87 | 0.82 | 0.077 / 0.082 |
| 55-80 | 0.92 | 1.07 | 0.121 / 0.104 |
| 80 and up | 0.90 | 1.17 | 0.158 / 0.121 |

The passes are right for every role; the gap is all assists. Then 435 games
with every player's vision at 63, each completed pass sorted by what the
thrower did with the ball first:

| bring_up | outlets and hand-ons, share of passes | assists a swing pass | assists a pass, all | without the outlets |
|---|---|---|---|---|
| under 35 | 34% | 0.104 | 0.085 | 0.129 |
| 35-55 | 32% | 0.103 | 0.090 | 0.132 |
| 55-80 | 22% | 0.102 | 0.112 | 0.142 |
| 80 and up | 15% | 0.103 | 0.129 | 0.152 |

A swing pass becomes an assist as often from a role player as from a lead
guard. What differs is how many of his passes are the rebounder's outlet or
the hand-on to the man bringing it up - never an assist, and counted as
tracking counts them (a big's passes ran at half the NBA's before the
hand-on was one) - and a few more kick-outs, pick-and-roll passes and lobs
for the men with the ball. With vision flat the sim reproduces the NBA's
role gap exactly: a role player's 0.84 of the league's assists a pass and a
lead guard's 1.28, in both. 2K's vision rates point guards high partly for
being point guards, so on 2K's numbers the role counted twice; on the real
side, 2K's vision explains the real rate on its own (R squared 0.66) and the
role adds nothing once it is in (bring_up's coefficient -0.005 a point,
where the sim's was +0.004). Not an engine bug: what the fit took out was
the second count. Fitted vision is 2K's order within a role - roughly 2K +
3 - 0.43 x (bring_up - 50), R squared 0.43 on the men with 1,500 passes.

Accepted (the user's call), with a map, version 3: 10 / 57.3 / 104. A
custom is typed on 2K's sense of vision and counts his role twice; a one-off
review list (ratings_build/output/custom_vision_review.csv) put each
custom's typed vision against the same rule, for the user to retype by.

### Finishing by the kind of layup

The next rating to fit was chosen by what 2K misses and what repeats. Of the
shooting ratings, 2K's three-point rating already reads real 3P% at r 0.75
(year to year 0.34), and the long mid-range is noise from one season to the
next (r 0.10); the layup was where 2K said least (r 0.47 against made layups)
and the real number held best.

**The first knob** fitted driving_layup to his non-dunk makes inside 4 ft
(pbpstats' AtRim less his dunks), standing_layup carried its whole move. At
2K's ratings the sim read the real rate at slope 0.20, r 0.15. Every layup
rating flat at 70 and then 90 measured the engine at 0.0050 a point in log,
and with every rating equal the sim spread players by 0.055 of its own that
had nothing to do with the real spread (r 0.10), so a fit would have spread
the ratings half again as wide as 2K's; LAYUP_K 0.0146 -> 0.0235 kept it.
That run went from r 0.24 to 0.55-0.63 - and its movers ran by role: guards
down 4.3 on average, centres up 4.0, Poeltl 78 to 120, Castle, Cunningham and
Maxey down 20, the move against a man's share of driving layups r -0.37.

**The user's objection** stopped it: a percentage at the rim is not that
simple - driving_layup is one context, and the best finishers take harder
layups. Neither the contest nor the defender explained the moves (the
nearest defender's distance against the move r -0.06). The kind of layup
did. Inside 5 ft, against the league's shot chart:

| layups | sim, a team game | NBA |
|---|---|---|
| driving | 17.7 at 61.7% | 9.5 at 56.7% |
| catch, cut, lob, post | 4.4 at 59.8% | 4.0 at 67.0% |
| putbacks | 2.1 at 52.9% | 3.4 at 56.3% |

One level for every layup had the drives too easy and the catches and cuts
too hard, and the fit had been putting that into the ratings. Each context
now has its own level at the shared anchor (LAYUP_BASE_BY_CONTEXT), set over
three runs against the shot chart's rate for its kind: the drive 0.620, the
run 0.665, the cut 0.740, the catch 0.686, the putback 0.708, the lob 0.777,
the post 0.816. Points 115.9 -> 115.7 and FG% 46.0 -> 45.5; the non-dunk
shots inside 4 ft fell 59.3% -> 57.4% against the NBA's 61, because the sim
takes nearly twice the NBA's driving layups and each kind now goes in at the
NBA's rate - an open problem of the play mix, not the levels.

**The harder layup** is the kind, not the defender. In the NBA the better a
finisher (by 2K) the more of his layups are driving ones (r +0.47, and +0.64
with rim_craftiness), while his nearest defender is if anything a little
further off (-0.16; the openness rim_craftiness buys in the engine); the sim
leans the same way, half as far (+0.22). So the target became his layups
made over what the league makes of the same kinds - driving, running,
cutting, lob, putback, plain - from a new table off the shot chart
(stats_fetch's rim_layups, pulled by the user for both seasons), the sim's
held to its own rate per context the same way. A post layup is a standing
layup read three parts close_shot_from_post to one standing_layup (the
user's call; it was half each).

**contact_layup** reached the and-ones hardly at all - a fouled shot that
would have gone in was spoiled by one flat roll for everybody, and every
rating at 40 and then 90 moved the league's share of fouled twos that went
in from 22.4% to 22.6%. It is the layup through the foul now: of a fouled
layup he keeps (1 - 0.59) x (contact_layup / 75) ** 1.7 - 14% at 60, 30% at
90, the league 23.0% against the NBA's 22.9%, and 2K's spread of the rating
about the NBA's true spread of the share. It is not fitted (the user's call:
and-ones are noisy - among men fouled on 40 twos in both seasons they carry
over at r 0.30 - and nothing else in the data sees contact): a real
player's is the average of his fitted driving_layup and strength, the build
and the fit carrying half of every driving_layup move into it.
rim_craftiness stays 2K's: its only trace in the numbers is the contested
drive's make, which is driving_layup's, and the defender distance the data
has is something it does not move in the engine.

**The layup tendencies** are shot_close and the layup rating, blended, so a
fitted rating moved about 335 men's - Maxey's driving layup tendency 72 to
48 - after a fit that had played with the old ones. Real data does not
replace them: inside 5 ft a catch or a putback that is not dunked is a layup
99.2% of the time, with nothing that carries from one season to the next
(r 0.07) - the standing side's variation is the post's hooks - and the
driving side's real share is what tend_floater already carries (r 0.77). So
they stay blends (the user's call) and move with the fit: fit_ratings shifts
every tendency the build makes out of a moved rating by what the rating
changes in its formula, which matches the build within its rounding and
keeps a short season's blend with the last.

**The run kept**, driving_layup with draw_foul refitted alongside, ten
rounds: driving_layup from r 0.29 to 0.60 (slope 0.64, the shrinkage's - the
median man's season is worth 47%), the engine at 0.0091 a point against the
curve's 0.0089, the spread sd 9.2 against 2K's 8.5 and 2K's order kept (r
0.76); guards down 2.7 on average and centres up 2.6. Poeltl 111, Jokic 104,
Andre Drummond and Donovan Clingan at the bottom. draw_foul from r 0.85 to
0.90, sd 17.4 against 14.9, its floor of 10 reached by a handful whose free
throws a shot are under anything 2K's scale reaches. The men who take 65% of
their shots from three came down 4.6 on average where everyone else moved
under a point: the sim had given them a few more free throws than they get
(open). Maps, version 4: driving_layup 51 / 78.9 / 111, standing_layup 38 /
68.9 / 119, contact_layup 51 / 71.4 / 100, draw_foul 10 / 61.4 / 94.

### Who posts up, and the drive called

The user's ask (October 2026): post-ups were already rare and the sim ran
them under the league's, and spot-ups could give some of their plays to the
post-up and the pick-and-roll. Over 1,200 real-roster games on the sheet of
12 October the post-up ran 2.5 plays a team game against Synergy's 3.9, the
spot-up 35.8 against 27.6, the pick-and-roll handler 16.4 against 17.3.

**The post-ups went to the wrong men.** Per man they followed Synergy's at a
slope of 0.23 (r 0.51). The rim-runners posted up - Capela, Nick Richards
and Poeltl 1.6-2.0 a 36 against 0-0.3 - and the post scorers did not:
Embiid 1.0 against 6.3, Jokic 1.2 against 5.7, Porzingis 0.5 against 4.7,
Jaren Jackson 0.5 against 3.9. Those same men ran the spot-ups instead
(Jokic 7.8 a 36 against 2.5, Sengun 8.9 against 2.4). `post_up` is post
touches per touch - where his catches are, not what he does with them - so a
rim-runner catching on his way in reads 57, and Capela caught it in the post
area 3.4 times a 36 against a real 1.2. Of the 4.6 post-ups a team game
started, half came from a catch there (POST_CATCH_PROB, 0.9 for anyone) and
half from the attack read, where the post-up was nearly all of a rim-runner's
attack weight inside 22 ft: Richards started 3.0 a 36 that way. Roll men
caught short were 0.3 a team game of it.

**What decides a man's post-ups**, from the Sheet as it stands. His
post-ups per post touch against `post_up` and shot per touch: r 0.51,
(post_up / 50) ** 0.82 x (shot / touches) ** 0.80 - not enough to say
Capela never does. His post-ups a 36, as a Poisson fit over the 328
regulars: 0.362 x (post_up / 50) ** 2.72 x (shot / 50) ** 1.45, r 0.91 on
the men with 30 or more (touches adds 0.44, r 0.92). Embiid reads 5.5 against
6.3, Zubac 4.3 against 5.0, Capela 0.3 and Richards 0.4 against none. A
Synergy post-up frequency on the Sheet would be exact; at r 0.91 it was not
needed.

**THE POST-UP, OWED**, as the drives are owed: what he is owed tonight
against the post-ups he has started, each plus a prior of one, squared, on
all three ways one starts - the catch in the post, his attack, and a new
one, the seal: a pass to a man owed his post-ups finds him sealed on the
block instead of where he stood, at POST_SEAL_RATE times his owed post-ups
a touch. Not normalised among the five, since the league was owed more than
it ran. At a seal rate of 0.05 the league ran 3.8, at 0.10 4.2, and each
man's followed his real ones at a slope of 0.56 (r 0.86). Embiid 1.0 to 2.4,
Jokic 1.2 to 3.3, Porzingis 0.5 to 2.6, Jackson 0.5 to 1.9 - half, still -
and the rim-runners barely moved (Capela 1.9), because an appetite is a
ratio, 1.0 for everyone until his first. And the spot-ups did not move
(35.7): the post-ups came out of the drives (47.4 to 45.3) and the
isolations.

**The spot-ups were the catch and drive.** Split by how they came, a team
game's spot-ups were 18.2 catch-and-shoots, 12.1 catches driven on and 2.3
quick pull-ups. The NBA's catch-and-shoot attempts, less those off a screen,
a handoff, the break and the pop, come to about the first number, so the
whole surplus was the second - the forwards' and bigs' most of all (Sengun
6.0 a 36, Jackson 5.7, Siakam 5.3). Nothing in the attack read moves those:
a heavier screen call (SCREEN_CALL_WEIGHT 380) ran the handler 17.8 plays a
team game and took them from the isolation (7.7) and the handoff, the
spot-ups 35.7; letting a man owed his shots give the ball away less in his
attack (the handoff and the off-screen action weighed by his appetite to -1
and -2) changed nothing either, and was taken out.

**THE DRIVE, CALLED.** In the NBA a drive off the catch that is not a
closeout attack is mostly a screen called first. So such a drive is a screen
call at CATCH_DRIVE_SCREEN_BASE for a league-average ball_dominance, to the
cube the call already reads. At 0.25 alone the spot-ups fell to 30.5 and the
handler rose to 21.1, the roll man 7.8, the isolation 6.9 - and the drives to
41.0, a screen driving less often than the drive it replaced. With the attack
read calling fewer (SCREEN_CALL_WEIGHT 280 -> 150, so the screens move from
where they took isolations and handoffs to where they take spot-ups) and the
handler driving off it more (SCREEN_EFF_DRIVE_PROB 2.5 -> 3.75):

| a team game, 1,200 games | before | 0.15 / 200 / 2.5 | 0.15 / 200 / 3.75 | 0.25 / 150 / 3.75 | NBA |
|---|---|---|---|---|---|
| post-up | 2.5 | 3.9 | 3.9 | 3.9 | 3.9 |
| P&R handler | 16.4 | 17.8 | 18.0 | 18.0 | 17.3 |
| roll man | 6.1 | 6.7 | 6.1 | 6.3 | 6.1 |
| isolation | 8.6 | 8.0 | 8.0 | 8.4 | 8.1 |
| spot-up | 35.8 | 32.7 | 32.6 | 31.4 | 27.6 |
| off screen | 4.7 | 5.1 | 5.1 | 5.6 | 4.2 |
| tracked drives | 47.4 | 43.4 | 44.4 | 43.6 | 66.1 |

The last kept (the user's call: the drives' cost is fine). Each man's
pick-and-rolls follow his real ones at a slope of 0.76 (0.63): Gilgeous-
Alexander 10.2 a 36 against 10.0, Brunson 9.8 against 8.5, Cunningham 8.9
against 9.5. Doncic's 6.1 against 10.9 is his pinned `shot` (the user's: he
plays beside three ball-dominant customs).

On bench.py's real-roster league, 240 games either side, the sheet of 12
October:

| a team game | before | after | NBA |
|---|---|---|---|
| points | 116.0 | 115.4 | 115.0 |
| FG% | 45.7 | 46.0 | 47.1 |
| three-point attempts | 38.5 | 37.4 | 36.8 |
| 3P% | 34.5 | 34.2 | 36.0 |
| free throw attempts | 23.0 | 22.9 | 23.4 |
| turnovers | 13.2 | 13.5 | 13.7 |
| tracked drives | 47.0 | 43.0 | 66.1 |
| drive field goal attempts | 22.8 | 20.2 | 27.0 |
| shots inside 8 ft | 38.9% | 39.5% | 40.1% |

### The volume holds and the diet, checked

The user's question: `shot`, `touches` and the three shot shares are
direct weights, and they did not seem to be working as fully as intended -
did they need strengthening? Over 1,200 real-roster games, against each
man's own tendency:

- front-court touches: a mean miss of 5.7% in log, r 0.92, slope 0.89;
- attempts: 8.2%, r 0.92, slope 0.82 - the men over 30% real usage took 19.2
  a 36 against 21.4, the men under 15% 9.9 against 8.8;
- the shot mix: a mean miss of 4.3, 3.2 and 4.6 points on close, mid and
  three, where chance alone on their attempts would leave 1.5, 1.1 and 1.5,
  at slopes of 0.85, 0.78 and 0.83;
- under it, the catch-and-shoot share of his threes and of his mid-range: a
  miss of 7.4 and 8.3 points, slopes 0.58 and 0.66.

**Stronger did nothing.** The shot appetite at an exponent of 12 and a prior
of 2 (6 and 3): attempts 8.0%, slope 0.80, the stars 18.8. The catch/dribble
appetite at 8 (4): 7.2 and 8.6 points, slope 0.59. The diet's stops at 0.02
and 20 (0.10 and 8): the mid-range worse, 3.5. All of them together, and
the touches at 20: a point of scoring gone and nothing better. The holds were
already as strong as they help; the miss is in what they never read.

**Where the miss is.** Each man's miss on a zone splits into a part for
every path his shots came by (the play, the gather, the shot), so the
league's mean miss can be laid out by path:

| path | share of shots | of the close miss | of the three miss |
|---|---|---|---|
| half-court catch-and-shoot | 19.8% | 2.82 of 4.15 | 2.67 of 4.40 |
| pick-and-roll pull-up | 10.5% | 1.12 | 0.43 (mid 1.14 of 2.89) |
| break catch-and-shoot | 4.6% | 0.60 | 0.53 |
| break pull-up | 4.5% | 0.46 | 0.50 |

Two of those had a reason. The catch-and-shoot gate added (shot weight - 50)
x 0.001 to its chance, outside the diet and the split, on a rate that
already carries his shots per touch: +0.05 a catch for a star against a base
near 0.08, so the men over 30% usage took 4.2 catch-and-shoot threes a 36
against 3.3. At 0: the shot mix 4.0 / 3.2 / 4.3, the mid-range's catch
share 7.1, the league's catch-and-shoot threes 27.5 -> 25.9 (26.3) and its
threes 38.7 -> 37.2 (36.8). And the pick-and-roll's three and pull-up two
decide the zone without the diet: on it, 4.1 / 3.0 / 4.4. Together, with the
plays above, 4.0 / 2.9 / 3.9, and the catch share of the threes at a slope of
0.68.

**The stars' attempts are not the appetite's.** Their tendencies carry their
real rates (Brown 22.7 a 36, Leonard 21.8, Embiid 20.7) and the appetite
reads them as owed, 1.4-1.5 on average over their reads; they took 18.9,
19.5 and 16.3. The extra shots are their teams' low-usage men's - rim shots
5.1 a 36 against 4.4, pull-up threes 0.9 against 0.55 - off putbacks, cuts
and the break, and an appetite that moves shots among the five cannot take
those back. Open.

### Back on the league's percentages

After the finishing fit's ratings were pasted, real-roster benches ran FG%
45.7 and 3P% 34.5 against 47.1 and 36.0. The user's ask: go by zone and turn
whatever knobs it takes. Over 1,200 real-roster games, by nba.com's zones
(every man's 2025-26 shot locations, weighted by his games - the table is
per game, and summed unweighted it read the corner and the paint a point
low):

| zone | sim | NBA |
|---|---|---|
| restricted area | 62.3 | 67.0 |
| paint, outside it | 46.6 | 44.6 |
| mid-range | 39.5 | 41.6 |
| corner three | 35.9 | 38.7 |
| three above the break | 34.3 | 35.0 |

By kind and by the foot, against the league's shot chart: the layups inside
4 ft 57.9% against 62.2, those from 4-8 ft 62.3% against 38.7; jumpers from
10-14 ft 37.5% against 46.5 and from 14-18 ft 39.2 against 43.8; threes
from 23-25 ft two to four points short and from 25-28 ft on it. Two shapes
the league has that the sim did not:

- **A layup's distance.** The league's go in at 68% from a foot, 59% from
  two, 51% from three, 42% from four and 37% from five; every sim layup was
  one rate wherever it went up. Beyond 4 ft (LAYUP_FAR_FEET) a layup is
  times LAYUP_FAR_MULT, 0.60.
- **The corner.** The league makes 38.7% there and 35.0% above the break;
  the sim had one curve and its corner shooters stand a foot behind the
  line, 35.9 and 34.3. A corner three is times CORNER_THREE_MULT, 1.075.

Each kind of layup in the restricted area was near the league's own rate
already, but the driving layup (55.8% against 59.2), and three in four of
the sim's rim layups are driving ones, the league's hardest, against 44% of
the NBA's - so the restricted area was short on the mix. The layup levels
were set to each kind's rate there and then raised together until the zone
went in at the league's, so each kind runs a point or two over its own.
Three rounds:

| | drive / run / cut / catch / putback / lob / post layups | 8-15 ft | long two | three | dunk | hook |
|---|---|---|---|---|---|---|
| before | .620 / .665 / .740 / .686 / .708 / .777 / .816 | .582 | .413 | .3727 | .897 | .63 |
| kept | .688 / .707 / .776 / .741 / .734 / .801 / .794 | .655 | .415 | .378 | .886 | .71 |

and the post fadeaway 0.582 -> 0.62. Each zone after: 66.8 / 44.4 / 41.7 /
38.7 / 35.1. The catch-and-shoot two stayed easy (48.3% against 44.2) and
the pull-up two hard (40.0 against 42.6): the 8-15 ft level is one number
for both, and the contest's step at 10 ft is its own.

**Every zone right is not every total right.** On bench.py's real-roster
league, 240 games: FG% 47.7, 3P% 35.9, and points 118.2 against 115.0 -
the sim takes 91.8 shots a team game against 88.6, and 31% of them in the
restricted area against 28%, so its own mix at the league's percentages
comes to 47.8%. The low shooting had been holding the points on the NBA's.
The user's call: the zones exact, and the attempts chased next.

### Where on the arc

The user's ask (2026-10-12), from the site's shot charts: a player's threes
by zone looked laid out by rule - the movement shooters all corner and next
to nothing from the top of the key, the ball-handlers the other way, and
every man's left the same as his right. Shooters shoot from all over.

The real numbers came from a new table off the shot chart
(`stats_fetch._shot_zone_table`, stored with `pull.py --shot-actions-only`
as `shot_zones`): each man's threes in the site's own zones (the corners,
the wings, the top between the lane lines extended), by angle, and off the
dribble. Against 112 games of eight teams, the men with 60 threes or more:

- **Who stands where was a sort.** The corners went to the two most
  corner-minded men out (`_corner_pull`) and the top to the least, every
  trip. A man's corner share of his threes had an sd of 0.30 across the
  sim's shooters against the NBA's 0.14 - Hauser 79% (real 20), Bridges 81
  (47), Draymond Green 89 (35) - and his share of his above-the-break
  threes from the top ran from Klay Thompson's 4% to Brunson's 86. The real
  one hardly depends on the man at all: 0.24, an sd of 0.08 past the coin
  over 276 men, Curry 29%, Brunson 22, Klay 22, Hauser 23.
- **The top and the wing were pins.** A man out wandered 7 degrees off his
  spot, so the threes above the break went up within 7 degrees of 0 or of
  48 and almost none between, where the NBA's are thickest at 20-40:

  | degrees off the straight-out line | 0-10 | 10-20 | 20-30 | 30-40 | 40-50 | 50-60 | 60-70 |
  |---|---|---|---|---|---|---|---|
  | NBA, share of the threes above the break | 15.0 | 13.9 | 19.4 | 21.6 | 15.9 | 9.3 | 5.0 |
  | sim, before | 34 | 0 | 1 | 2 | 31 | 26 | 4 |
  | sim, now | 15.9 | 14.3 | 21.1 | 18.7 | 17.2 | 7.8 | 5.1 |

- **Left and right were a coin.** The set was mirrored trip by trip, which
  made every man's sides the same to the attempt. A real man leans: his
  share of his corner threes from the left has an sd of 0.08 past the
  coin's (Nesmith 28%, Saddiq Bey 75%), his wings 0.07, and the two go
  together (r 0.53).
- **Both corners were always full.** The perimeter spots went top, both
  corners, then the wings, so with three or more out both corners were
  taken, and the corner had 36-38% of the league's threes against 26.1 (the
  site's corner; 28.1 on the NBA's own, which runs a little higher up the
  sideline) - 49% of the catch-and-shoot threes against about a third.

What changed, all in `_assign_slots`:

- **The order is drawn** (`_arc_order`): the corner pull with a Gumbel draw
  on it, a Plackett-Luce order - SPACING_CORNER_NOISE 0.20 for the corners
  (the shares' sd 0.12-0.14), and above the break the top to the least
  corner-minded of the rest on a far wider one, SPACING_TOP_NOISE 1.0, all
  but a coin (0.07-0.09).
- **Each man has a side** (`_side_lean`, `_take_sides`): a lean drawn once
  from his name, SPACING_SIDE_LEAN_SD 0.095, and the men on a mirrored pair
  of spots split them by it; a man alone on one side of it goes his way as
  often as his lean says.
- **The arc is stretches, not pins**: the wing spot came down from 48 to 34
  (ANGLE_WING), the top and the wings wander 16 degrees either way
  (SPACING_TOP_SPREAD, SPACING_WING_SPREAD), the top shades 16 toward the
  side a lone wing left open (SPACING_TOP_SHADE), and a pull-up up out of
  the corner goes to 50-66 (OUT_OF_CORNER_ANGLE, was 48-63).
- **One corner, mostly** (SPACING_ONE_CORNER 0.9): on that share of trips
  the wings come before the second corner, so four out is the top, a corner
  and both wings. 0 / 0.7 / 1 drew a corner share of 38.1 / 30.3 / 25.6.

Over 240 league games: the corner 26.2% of the threes (26.1), the top 27.4%
of those above the break (24.7), the men's corner shares against their real
ones r 0.68 (mean gap 0.09), and their tops 0.08 off on average. Klay
Thompson 25% corner (23), 25% of his above-the-break threes from the top
(22); Curry 14 (7) and 30 (29); Brunson 11 (17) and 32 (22). The bench's
totals hold: over 200 league games the shots' mean chance of going in is
36.7% before and 36.6% after, at 25.2 ft against the NBA's 25.05 - the 3P%
it printed, 36.2 then 37.0, is the dice, the new draws having moved every
roll after them.

Left: the top three points high; Draymond Green still 75% corner against a
real 35 (his pull is the league's highest); the guards who dribble into
their threes - Pritchard 23% corner against 8, White 21 against 12 - a
little high. Of the sim's off-the-dribble threes 15% are in the corner
against the NBA's 6.9%, but nearly all of those are the break's catches
filed as off the dribble, not pull-ups.

### Where a block goes

The user's ask (2026-10-13), for the site's Striker badge: a striker is the
shot-blocker whose block rating runs past his interior defence and who gets
up - his blocks go into the seats - where the disciplined, cerebral rim
protector keeps them in play; the inverse on a far weaker curve, and a fair
share of anyone's blocks out of bounds regardless.

A block went to the rebound like any miss: out of bounds 11.6% of the time,
a team rebound, and otherwise the rebounders' fight. So nothing of the
blocker decided where it went, and the blocking team recovered about two
in three of its blocks. pbpstats (2025-26) says 58.3% - 6,894 of 11,825 -
fewer than its share of ordinary misses, as a block is swatted as often as
caught. Its spread between men is small: over the 43 with 60 or more
blocks the recovered share has an sd of 0.057, and the coin alone gives
0.055 - a true spread of 0.014. So the effect is kept moderate.

Now a block's own roll (`_block_out_chance`) says whether it is spiked out
of bounds - the offence inbounds it, the same trip - or stays a live ball
for the rebounders, the generic out-of-bounds roll skipped. The chance is
BLOCK_OUT_BASE 0.10 times a lean (`_striker_lean`): (block - interior) / 10
+ (vertical - 74) / 20, capped at 3, times STRIKER_UP 0.3 above zero and
STRIKER_DOWN 0.1 below it (to a floor of 0.8). A live block is the
defence's 66% of the time in the sim against 73% of other misses, so at a
base of 0.20 the league recovered 51.7%; at 0.10, 58.1% over 150 games
(10.1% out). Kagami, Moussa Cisse and Paul Reed lean the most among the
shot-blockers, Wembanyama and Goose Blankie the other way. The misses
nobody blocked keep TEAM_REBOUND_RATE 0.116 and send half to the offence
(it was 0.56 of all), which holds the league's 6.5% to the offence.

Over 200 league games the boards are 11.4 and 30.5 a team game against
11.4 and 30.6 before. The BlockEvent carries `out_of_bounds`, which the
site's badge counting reads (`b_blk_out`).

### Taking turns

The Bears' Sarangi was three brothers who play very alike, and the user
split him into Sarangi I, II and III (2026-10-13) - and wanted them to
take turns, one a game, rather than share the minutes in every game:
three men at 34 minutes each would have taken the rotation from everyone
else, and three men at 11 each would have given each a bench player's line.
Nothing in the sim could say "one of these plays tonight".

Now a rotation spot carries a mark (the site's `RotationSpot.takes_turns`,
`site_data.csv`'s `turns` column, `Player.takes_turns`), and `turns.py`
takes the team's marked men before each game: the one whose turn it is
plays the most minutes any of them is given, from the group's best slot on
the depth chart, and the rest come off the roster, so neither garbage time
nor a deep-bench spurt reaches them. Whose turn is the team's place on the
schedule - its n-th game to the n-th man in depth-chart order, or the next
one healthy - where there is a season of the team's to count in (main.py's
canon game, every version of it the same man; season.py --keep). Elsewhere
the seed picks: over the 78-game round robin the three came out 26, 22 and
30. A man of the group out hurt keeps his place; the next one plays, and
his minutes are the spot's, so `injuries.sit_out` has none of his to share.
The website counts a shared spot once in a rotation's total.

### Past the best real player

The user's ask (2026-10-14): ratings may go past 99 so that a custom can do
what no real player does - but a custom fitted to a line found a ceiling.
Shooters who took any volume of jumpers came out about 60% from the field
however high the ratings went; ball control looked the same. Inside 25-99
everything was to stay as it was; past it, nothing was to be capped - a
rating of 170 is not a rating of 150, and a three-point rating of 300
should go in nine times in ten even with a hand in his face.

**What was capping it.** Measured first, on David Bowie with every jumper
rating set to one number (24-60 games a level, the same seeds):

| jumper ratings | 99 | 130 | 150 | 170 | 200 | 300 |
|---|---|---|---|---|---|---|
| 3P% | 39.3 | 56.8 | 67.4 | 75.7 | 84.0 | 87.7 |
| tightly contested jumpers | 27.9 | 30.9 | 34.1 | 36.1 | 32.3 | 32.5 |
| FG% | 53.5 | 62.0 | 66.2 | 70.6 | 74.3 | 77.7 |

The shot's own curve never stopped - an open shot rose with the rating all
the way. What stopped were the steps after it. A contest multiplies the
chance by 0.48 (heavy) or 0.28 (smothered) whoever is shooting, so a
heavily contested three could never go in more than 48% of the time, at any
rating; the pull-up's 0.92, a forced shot's 0.75, a layup from 4 ft's 0.6,
fatigue and a cold night did the same. Elsewhere, each in its own way:

- the drive's contact penalty: `dunk_in_traffic` stopped helping at 99 (a
  twentieth of the penalty, `max(0.05, ...)`), and `contact_layup` past 198
  turned the penalty into a bonus; `deep_three_pt_jumper` past 198 turned
  the deep three's decay into a bonus;
- a defender: the contest score held at 100 - smothered, and no further -
  so a 300 shot defender held his men to 27%, and a 150 to 29%;
  the strip and the interception held at CONTACT_MAX 0.9, a block at
  BLOCK_SUCCESS_MAX, a clean steal at CLEAN_MAX;
- the ball: a bad pass floored at 0.002 (where the best real passers already
  sit), the isolation's and the post-up's dead-ball turnovers read no rating
  at all, nor did a fumble above 50 hands;
- a charge held between 0.10 and 0.60, a blow-by between 0.02 and 0.85, the
  passer's shot factor at PASS_VISION_SHOT_MAX;
- `consistency` past 10 had a minus where the docstring's plus was: a custom
  built at 12 had 9% standout nights instead of 21, at 15 none - and the
  hot nights were held under 45% in any case.

Ball control itself was mostly not capped: the strip and the interception
read the handler's security and the passer's disguise on powers that take
them toward never, and Bowie's turnovers fell from 2.75 to 0.56 a hundred
touches between 99 and 1000. What a fit to a turnover line ran into was
project.py's own limit - a fit never took a rating past 99 - and
`ball_security`'s scale: the best real ball security is 129 on the working
scale (Tyus Jones, shown 99 through attribute_scale), so a custom typed 99
plays like a real player shown at about 85.

**The rule** (beyond.py). A chance that reads a rating past the best real
player's - 99 for everything 2K rates, a fitted rating's real high (ball
security 129) - is worked out exactly as if he were that player, every
contest, penalty and floor as it is, and what he has beyond is added in the
log-odds at the rate the formula was paying at the top. On a shot's curve
that is the curve's slope, so an open shot lands on his curve as before and
a contested one climbs toward certain; a defender past the top takes off the
shot what a point of contest is worth where its score sits, on the ladder
smoothed between the middles of its bands (config's PAST THE BEST REAL
DEFENDER), nothing where his contest was held at 0. A power curve with a
hard ceiling carries on in the odds on its own exponent (the stealer, the
man in the lane, the shot-blocker). Where a formula had gone flat before the
top, the rating is read past it on the engine's own curve for that rating
elsewhere: the isolation's and post-up's dead balls on the drive's security
exponent, the bad pass on accuracy's interception exponent, the fumble on
the hands' tip exponent. A hard bound no real matchup reaches (the charge,
the blow-by, the clean steal) became a soft one: exactly as it was inside,
and on toward certain or never outside. Where a formula already went on -
the handler's security, the passer's disguise - it was left alone; carrying
those in the odds measured weaker than the powers already were.

**How far past** is the rating as the Sheet has it, before the game's
boosters (`Player.unboosted`). The first cut read the boosted rating, and
momentum, leadership and the hot hand put real 99s a hair past the top all
night: 29 of 58 real-only games parted from the old ones at the first shot
of a Curry or a Brunson, by a few hundredths. Read on the unboosted rating,
a booster lifts everyone exactly as before.

**Measured.** 116 real-only bench games, HEAD against the change on the same
seeds: every one identical, event for event and every shot's chance to 12
places. The same Bowie games:

| jumper ratings | 99 | 130 | 150 | 170 | 200 | 300 |
|---|---|---|---|---|---|---|
| 3P% | 39.9 | 63.0 | 70.7 | 81.1 | 88.6 | 98.8 |
| tightly contested jumpers | 26.9 | 32.8 | 47.0 | 55.2 | 59.8 | 80.6 |
| FG% | 53.9 | 65.7 | 70.9 | 76.3 | 82.4 | 91.9 |

The tight jumpers are threes and mid-range together; the mid-range's curve
is the flatter (0.0142 a point against the three's 0.0234), so a contested
long two climbs more slowly than a three. Blankie's shot defence set to one
number: opponents shot 37.6% on him at 99, 33.1% on his own ratings (110
and up; 33.5% before), 21.2% at 150 and 6.3% at 300, where they had shot
27-29% at both. Bowie's ball control at 150 / 300 / 1000: 1.53 / 1.00 /
0.49 turnovers a hundred touches, against 1.85 / 1.09 / 0.56.

The 23 customs already past the top on something moved little on their own
ratings over 60 games each: Bowie's field goals 56.6% to 58.4%, Libo's 50.5%
to 51.6%, the others inside the dice. project.py's fits now take a rating as
far up as the line needs (`column_limits`), and free_throw to 1.0.

Left as they are: a dunk goes in at DUNK_OPEN_PROB whoever dunks it (the
user's call - the dunk ratings decide whether it is a dunk); the contested
ratings (`contested_three_pt_jumper` and the rest) take a shot as far as open
and no further, which is what they mean - past that it is the shot's own
rating; and shot-clock violations read no rating.
