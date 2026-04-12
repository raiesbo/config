" ============================================================
"  Night Shift — colorscheme fallback
" ============================================================

hi clear
if exists("syntax_on") | syntax reset | endif
let g:colors_name = "nightshift-fallback"

" ── Palette ─────────────────────────────────────────────────
let s:bg        = "#1a1b26"
let s:bg_dark   = "#16161e"
let s:bg_hl     = "#292e42"
let s:fg        = "#c0caf5"
let s:fg_dark   = "#a9b1d6"
let s:comment   = "#565f89"
let s:blue      = "#7aa2f7"
let s:cyan      = "#7dcfff"
let s:green     = "#9ece6a"
let s:magenta   = "#bb9af7"
let s:orange    = "#ff9e64"
let s:red       = "#f7768e"
let s:yellow    = "#e0af68"
let s:dark_blue = "#3d59a1"
let s:selection = "#283457"

" ── Base ────────────────────────────────────────────────────
exe "hi Normal          guifg=".s:fg."       guibg=".s:bg."      gui=none cterm=none"
exe "hi NormalNC        guifg=".s:fg_dark."  guibg=".s:bg_dark." gui=none cterm=none"

" ── Editor UI ───────────────────────────────────────────────
exe "hi LineNr          guifg=".s:comment."  guibg=".s:bg."      gui=none cterm=none"
exe "hi CursorLine      guibg=".s:bg_hl."    gui=none  cterm=none"
exe "hi CursorLineNr    guifg=".s:blue."     guibg=".s:bg_hl."   gui=bold cterm=bold"
exe "hi SignColumn      guibg=".s:bg
exe "hi ColorColumn     guibg=".s:bg_hl
exe "hi Visual          guibg=".s:selection
exe "hi Search          guifg=".s:bg."       guibg=".s:yellow."  gui=bold"
exe "hi IncSearch       guifg=".s:bg."       guibg=".s:orange."  gui=bold"
exe "hi MatchParen      guifg=".s:cyan."     guibg=".s:bg_hl."   gui=bold"
exe "hi VertSplit       guifg=".s:comment."  guibg=".s:bg
exe "hi WinSeparator    guifg=".s:comment."  guibg=".s:bg
exe "hi StatusLine      guifg=".s:fg."       guibg=".s:bg_dark." gui=none"
exe "hi StatusLineNC    guifg=".s:comment."  guibg=".s:bg_dark." gui=none"

" ── Popup / Completion ──────────────────────────────────────
exe "hi Pmenu           guifg=".s:fg."       guibg=".s:bg_dark
exe "hi PmenuSel        guifg=".s:fg."       guibg=".s:dark_blue." gui=bold"
exe "hi PmenuSbar       guibg=".s:bg_hl
exe "hi PmenuThumb      guibg=".s:blue

" ── Syntax ──────────────────────────────────────────────────
exe "hi Comment         guifg=".s:comment."  gui=italic"
exe "hi Constant        guifg=".s:orange
exe "hi String          guifg=".s:green
exe "hi Character       guifg=".s:green
exe "hi Number          guifg=".s:orange
exe "hi Boolean         guifg=".s:orange
exe "hi Identifier      guifg=".s:cyan
exe "hi Function        guifg=".s:blue."     gui=bold"
exe "hi Statement       guifg=".s:magenta."  gui=bold"
exe "hi Keyword         guifg=".s:magenta."  gui=bold"
exe "hi Operator        guifg=".s:blue
exe "hi PreProc         guifg=".s:cyan
exe "hi Type            guifg=".s:blue."     gui=bold"
exe "hi Special         guifg=".s:cyan
exe "hi Underlined      guifg=".s:cyan."     gui=underline"
exe "hi Error           guifg=".s:red."      guibg=NONE gui=bold"
exe "hi Todo            guifg=".s:yellow."   guibg=NONE gui=bold,italic"

" ── Diagnostics ─────────────────────────────────────────────
exe "hi DiagnosticError guifg=".s:red
exe "hi DiagnosticWarn  guifg=".s:yellow
exe "hi DiagnosticInfo  guifg=".s:cyan
exe "hi DiagnosticHint  guifg=".s:comment

" ── Diff ────────────────────────────────────────────────────
exe "hi DiffAdd         guifg=".s:green."    guibg=NONE gui=bold"
exe "hi DiffDelete      guifg=".s:red."      guibg=NONE gui=bold"
exe "hi DiffChange      guifg=".s:yellow."   guibg=NONE"
exe "hi DiffText        guifg=".s:bg."       guibg=".s:yellow." gui=bold"
