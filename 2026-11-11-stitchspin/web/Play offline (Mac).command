#!/bin/sh
# Serves this folder on http://localhost and opens the game in the default browser (hc publish-build).
# A browser runs the game only from a web address; this is a web address on this computer. Close the window to stop.
cd "$(dirname "$0")" || exit 1
PORT=8765
if command -v python3 >/dev/null 2>&1; then
  (sleep 1; open "http://localhost:$PORT/") &
  echo "The game is running at http://localhost:$PORT/ - keep this window open while you play, close it to stop."
  exec python3 -m http.server "$PORT" --bind 127.0.0.1
else
  echo "Python 3 is not installed on this Mac: play the game online (the link is in the README)."
fi
