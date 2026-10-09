# Popcade — 2026-10-09

A hypercasual puzzle game: tap a tray cube, it flies up its lane and bursts into balls that pop every cube of their own
colour they touch, in chains. 100 levels, boosters, lessons, a shop, a season board, lives and streaks.

Made in hc (three.js) first, then ported one to one to Unity 6 (6000.3.10f1, URP).

## Web (three.js)

**https://kalempox.github.io/Rotatelab-Games-/2026-10-09-popcade/web/** — Chrome, Safari, Edge or Firefox on a desktop or
laptop (about 24 MB on the first load). The folder [`web/`](web/) is the whole static package.

## Windows

1. Download [`windows/Popcade-Windows.zip`](windows/Popcade-Windows.zip) and extract it (right-click → Extract All…).
2. Double-click `Popcade.exe` in the extracted `Popcade` folder (the whole folder is needed).
3. If Windows says *"Windows protected your PC"*: More info → Run anyway.

## Mac (Apple silicon and Intel, macOS 12 or later)

1. Download [`mac/Popcade-Mac.zip`](mac/Popcade-Mac.zip) and double-click it: a `Popcade-Mac` folder appears.
2. Double-click **`Run perf test.command`** first: it prepares the app for this Mac (the app is not signed by Apple; the
   script signs it ad hoc so it runs natively on Apple silicon), measures the frame rate, and puts
   `popcade-perf-mac.zip` on the Desktop. If macOS refuses to open the script: open Terminal, type `bash ` (with a space),
   drag the script into the window, press Return.
3. Then double-click `Popcade.app` to play. Details: `READ ME FIRST.txt` in the folder.

## Frame rate (uncapped, at the swarm's peak)

The floor for every platform: an average of at least 90 fps and a p95 frame of at most 11.1 ms, each platform measured on
its own machine by the player's own perf run.

| platform | load | average | p95 frame | worst frame | machine |
|---|---|---|---|---|---|
| Windows | the swarm's peak (157 balls, 246 pops) | 526.8 fps | 2.45 ms | 20.4 ms (the shot's first frame) | Ryzen 5 7500F · RTX 5060 Ti · 390 × 845 window |
| Windows | the lose bot over level 1 (14 s) | 597.3 fps | 2.18 ms | 17.9 ms | same |
| Mac | — | waiting for the perf run on a Mac | | | |

Source: `Popcade.exe -hcuPerf` (the player's own frame times), 2026-10-09, with the pops' paint, the particle bursts,
the shake and flash and both ceremonies drawn. The GPU's share of a frame at the peak: 0.24 ms (0.65 ms before the shell
pass was bounded to what each blur reaches, 0.31 ms before a blur read only its own layer, as Chrome reads it — both
changes aimed at the Mac's Retina screens).

## One to one with the three.js game

The Unity port is checked against hc by a tool that lists every gap it can find (`hcu/tools/port-gaps.mjs`: the port's
own admissions, every button of every recorded screen, every row of the motion inventory, every surface the shell draws);
it lists none for this build. Completed for this update:

- the splash slides into the menu; the won card's coins fly to the counter, which takes them as they land; the Moves pill
  beats when three moves are left and on a gift move;
- every world's own card and level page, the no-lives card, the Haptics switch on the pause and settings cards;
- the shop, leaderboard, season (with its prize to claim), worlds and lives panels and the hub's streak and pips show the
  player's own values; the level picker rings the level Play opens;
- the 🪙 on the paid continue (the browser's own picture of it, the same on Windows and Mac); a short balance flashes red;
- the wall's lighter cube forms (hc's own thinned geometry); a card's blur reads only the interface behind it, as Chrome
  does — the board under a card stays sharp, as in hc.
