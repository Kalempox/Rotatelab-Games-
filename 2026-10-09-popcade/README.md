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
| Windows | the swarm's peak (157 balls, 246 pops) | 540 fps | 2.64 ms | 16.4 ms | Ryzen 5 7500F · RTX 5060 Ti · 390 × 845 window |
| Windows | the lose bot over level 1 (14 s) | 576 fps | 2.50 ms | 16.1 ms | same |
| Mac | — | waiting for the perf run on a Mac | | | |

Source: `Popcade.exe -hcuPerf` (the player's own frame times), 2026-10-09.
