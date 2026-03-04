#!/usr/bin/env bash
# Glitchberry — palette source of truth
# All theme colors in one place. Run generate.sh after editing.

# --- Backgrounds ---
THEME_BG="#1E1F22"
THEME_BG_ALT="#1A1D24"
THEME_BG_ALT2="#1c1c1c"
THEME_SIDEBAR="#161920"
THEME_APP="#12141A"
THEME_CURSORLINE="#22252E"
THEME_SELECTION="#33365A"
THEME_SEARCH="#2A4A5A"

# --- Foregrounds ---
THEME_FG="#E2E8F0"
THEME_FG_BRIGHT="#FFFFFF"
THEME_FG_FUNCTION="#E0E7FF"
THEME_MUTED="#94A3B8"
THEME_COMMENT="#64748B"
THEME_BORDER="#2A2F3A"
THEME_SUBTLE="#474F5E"

# --- Accent colors (normal) ---
THEME_RED="#D47FA6"
THEME_GREEN="#85B679"
THEME_AMBER="#ECA563"
THEME_PURPLE="#A38AE6"
THEME_MAGENTA="#C490D4"
THEME_CYAN="#63BCC9"

# --- Accent colors (bright) ---
THEME_RED_BRIGHT="#E09BBD"
THEME_GREEN_BRIGHT="#A0CC96"
THEME_AMBER_BRIGHT="#F2C08A"
THEME_PURPLE_BRIGHT="#BCA8EF"
THEME_MAGENTA_BRIGHT="#D4AADF"
THEME_CYAN_BRIGHT="#8DD0D9"

# --- Accent colors (dim) ---
THEME_RED_DIM="#B06A8C"
THEME_GREEN_DIM="#6E9963"
THEME_AMBER_DIM="#C48A52"
THEME_PURPLE_DIM="#8670BF"
THEME_MAGENTA_DIM="#A377B0"
THEME_CYAN_DIM="#4F9BA6"

# --- Semantic accents (single place to change session/window colors) ---
THEME_SESSION_ACCENT="$THEME_PURPLE"
THEME_WINDOW_ACCENT="$THEME_RED"

# --- Border style ---
# "rounded" uses ╭╮╯╰ corners, "sharp" uses ┌┐┘└ corners.
# Terminal UI only supports these two options (Unicode box-drawing limitation).
# This value is mapped to tmux popup-border-lines and Vim borderchars by generate.sh.
THEME_BORDER_STYLE="rounded"

# --- Diff backgrounds ---
THEME_DIFF_ADD="#1E2A1E"
THEME_DIFF_CHANGE="#2A2518"
THEME_DIFF_DELETE="#2A1520"
THEME_DIFF_TEXT="#3A3520"
