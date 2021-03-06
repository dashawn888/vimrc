#!/bin/bash
#
# Usage: yank [FILE...]
#
# Copies the contents of the given files (or STDIN if no files are given) to
# the terminal that attaches a tmux(1) session and runs this program therein,
# or to the terminal that runs this program directly, outside of any tmux(1).
#
# This is achieved by writing an OSC 52 escape sequence to the said terminal.
# The maximum length of an OSC 52 escape sequence is 100_000 bytes, of which
# 7 bytes are occupied by a "\e]52;c;" header, 1 byte by a "\a" footer, and
# 99_992 bytes by the base64-encoded result of 74_994 bytes of copyable text.
# In other words, this program can only copy up to 74_994 bytes of its input.
#
# See http://sunaku.github.io/tmux-yank-osc52.html for an article about this.
# See http://en.wikipedia.org/wiki/Base64 for the 4*ceil(n/3) length formula.
# See http://sourceforge.net/p/tmux/mailman/message/32221257 for copy limits.
# See http://sourceforge.net/p/tmux/tmux-code/ci/a0295b4c2f6 for DCS in tmux.
#
# osc52="\e]52;c;$( cat "$@" | head -c 74994 | base64 | tr -d '\r\n' )\a"
osc52="\e]52;c;$( cat "$@" | head -c 74994 | base64 -w 0 )\a"
test -n "$TMUX" && osc52="\ePtmux;\e$osc52\e\\" # wrap it inside DCS for tmux
echo -ne "$osc52"
