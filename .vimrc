" hybrid line numbers: absolute on current line, relative on others
set rnu
set number
" enable syntax highlighting
syntax on
" Use new regular expression engine https://jameschambers.co.uk/vim-typescript-slow/
" this sets the regex engine to be auto, 1=old, 2=new. auto will chose 1 for simple files
" and 2 for complex ones like ts
set re=0

" --- Performance ---
" don't redraw screen during macros/commands
set lazyredraw
" disable cursor line/column highlighting (expensive redraws)
set nocursorline
set nocursorcolumn
" stop syntax highlighting past column 300 (saves on minified files)
set synmaxcol=300
" don't scan included files for autocomplete (slow on large projects)
set complete-=i
" reduce brace-match timeout from 300ms to 20ms
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 5

" --- Appearance ---
" enable 24-bit true color
set termguicolors
set background=dark
colorscheme glitchberry
" show faint ~ at end of each line (eol), keep tabs invisible
set list
set listchars=eol:~,tab:·\ 

" hide mode text (shown in statusline instead)
set noshowmode
" always show statusline
set laststatus=2
" fast terminal connection (assume modern terminal)
set ttyfast

" --- Search ---
" show matches as you type
set incsearch
" highlight all matches
set hlsearch
" case-insensitive search...
set ignorecase
" ...unless you use a capital letter
set smartcase

" --- Editing ---
" keep indentation from previous line
set autoindent
" text in existing splits stays put when opening/closing splits
set splitkeep=screen
" keep 5 lines visible above/below cursor
set scrolloff=5
" merge sign column into line numbers (saves space)
set signcolumn=number

" --- Command completion ---
" tab completion menu for : commands
set wildmenu
set wildmode=longest:full,full

" --- File finding ---
" search into subdirectories recursively (:find filename<Tab>)
set path+=**

" --- Autocomplete ---
set completeopt=menuone,noselect

" --- Persistent undo ---
" keep undo history across sessions
set undofile
set undodir=~/.vim/undodir

" --- Grep ---
" use ripgrep for :grep (much faster than default grep)
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m

" --- Statusline ---
set statusline=
" current mode via built-in C function (n/i/v/R/c/t)
set statusline+=%#DiffAdd#\ 
set statusline+=%{mode()}
set statusline+=\ %#LineNr#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r

set statusline+=%=

set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}]
set statusline+=\ \ 
set statusline+=%#CursorColumn#
set statusline+=\ %3l:%-2c\ 
set statusline+=\ %3p%%

" --- Cheatsheet popup (\?) ---
let s:cheatsheet = [
  \ '  vim cheatsheet',
  \ '',
  \ '  motions',
  \ '  h j k l         left/down/up/right',
  \ '  w b e           word forward/back/end',
  \ '  W B E           WORD forward/back/end',
  \ '  0 ^ $           line start/first char/end',
  \ '  gg G            file top/bottom',
  \ '  { }             paragraph up/down',
  \ '  f{c} F{c}       jump to char forward/back',
  \ '  t{c} T{c}       jump before char forward/back',
  \ '  ; ,             repeat f/F/t/T forward/back',
  \ '  %               matching bracket',
  \ '  Ctrl-D Ctrl-U   half-page down/up',
  \ '  H M L           screen top/middle/bottom',
  \ '',
  \ '  editing',
  \ '  i a             insert before/after cursor',
  \ '  I A             insert at line start/end',
  \ '  o O             open line below/above',
  \ '  d{motion}       delete (dd = line)',
  \ '  c{motion}       change (cc = line)',
  \ '  y{motion}       yank (yy = line)',
  \ '  p P             paste after/before',
  \ '  x               delete char',
  \ '  r{c}            replace char',
  \ '  R               replace mode',
  \ '  .               repeat last change',
  \ '  u Ctrl-R        undo/redo',
  \ '  >> <<           indent/dedent',
  \ '  J               join lines',
  \ '  "+y / "+p       yank/paste system clipboard',
  \ '  ~               toggle case',
  \ '',
  \ '  text objects (use with d/c/y/v)',
  \ '  iw aw           inner/around word',
  \ '  i" a"           inner/around double quotes',
  \ '  i'' a''           inner/around single quotes',
  \ '  i( a(           inner/around parens',
  \ '  i{ a{           inner/around braces',
  \ '  i[ a[           inner/around brackets',
  \ '  it at           inner/around HTML tag',
  \ '  ip ap           inner/around paragraph',
  \ '',
  \ '  visual mode',
  \ '  v               character select',
  \ '  V               line select',
  \ '  Ctrl-V          block select',
  \ '  gv              reselect last selection',
  \ '',
  \ '  search',
  \ '  / ?             search forward/back',
  \ '  n N             next/prev match',
  \ '  * #             word under cursor forward/back',
  \ '  :noh            clear highlights',
  \ '',
  \ '  files',
  \ '  :w :q :wq       write/quit/both',
  \ '  :e {file}       open file (stays in memory)',
  \ '  :find {file}    fuzzy find (path+=**)',
  \ '  :grep {pat}     ripgrep search',
  \ '  :cn :cp         next/prev quickfix result',
  \ '',
  \ '  buffers (open files kept in memory)',
  \ '  :ls             list all buffers',
  \ '  :b {name}       switch by partial name',
  \ '  :bn :bp         next/prev buffer',
  \ '  Ctrl-^          toggle last two buffers',
  \ '  :bd             close current buffer',
  \ '',
  \ '  windows',
  \ '  Ctrl-W s        split horizontal (same file)',
  \ '  Ctrl-W v        split vertical (same file)',
  \ '  :sp/:vsp {file} split with different file',
  \ '  Ctrl-W h/j/k/l  navigate splits',
  \ '  Ctrl-W =        equalize splits',
  \ '  Ctrl-W o        close other splits',
  \ '',
  \ '  registers / macros',
  \ '  "{reg}y         yank to register',
  \ '  "{reg}p         paste from register',
  \ '  :reg            show all registers',
  \ '  q{reg}          record macro',
  \ '  @{reg}          play macro',
  \ '  @@              repeat last macro',
  \ '',
  \ '  history',
  \ '  q:              command history (editable)',
  \ '  q/              search history (editable)',
  \ '',
  \ '  completion',
  \ '  Ctrl-N/Ctrl-P   next/prev completion',
  \ '  Ctrl-X Ctrl-F   filename completion',
  \ '  Ctrl-X Ctrl-L   whole line completion',
  \ '',
  \ '  j/k scroll · {/} section · g/G top/bottom · q/Esc close',
  \ ]

function! s:CheatsheetFilter(winid, key) abort
  if a:key ==# 'j'
    call win_execute(a:winid, 'normal! j')
    return 1
  elseif a:key ==# 'k'
    call win_execute(a:winid, 'normal! k')
    return 1
  elseif a:key ==# '}'
    call win_execute(a:winid, 'normal! }')
    return 1
  elseif a:key ==# '{'
    call win_execute(a:winid, 'normal! {')
    return 1
  elseif a:key ==# 'G'
    call win_execute(a:winid, 'normal! G')
    return 1
  elseif a:key ==# 'g'
    call win_execute(a:winid, 'normal! gg')
    return 1
  elseif a:key ==# 'q' || a:key ==# "\<Esc>"
    call popup_close(a:winid)
    return 1
  endif
  return 1
endfunction

let s:t = g:glitchberry
exe 'highlight CheatsheetPopup guifg='.s:t.fg.' guibg='.s:t.bg.' ctermfg=254 ctermbg=234'
exe 'highlight CheatsheetBorder guifg='.s:t.border.' guibg='.s:t.bg.' ctermfg=236 ctermbg=234'

function! s:ShowCheatsheet() abort
  let l:maxh = &lines * 80 / 100
  let l:h = min([len(s:cheatsheet), l:maxh])
  let l:winid = popup_create(s:cheatsheet, #{
    \ pos: 'center',
    \ border: [1,1,1,1],
    \ borderchars: g:glitchberry_borderchars,
    \ padding: [0,1,0,1],
    \ scrollbar: 0,
    \ mapping: 0,
    \ minheight: l:h,
    \ maxheight: l:h,
    \ minwidth: 50,
    \ maxwidth: 50,
    \ wrap: 0,
    \ cursorline: 1,
    \ highlight: 'CheatsheetPopup',
    \ borderhighlight: ['CheatsheetBorder'],
    \ filter: function('s:CheatsheetFilter'),
    \ })
  " popups use PmenuSel (not CursorLine) for the selected line
  call win_execute(l:winid, 'highlight PmenuSel guifg='.s:t.fg_bright.' guibg='.s:t.selection.' ctermfg=254 ctermbg=237')
endfunction

nnoremap <silent> <leader>? :call <SID>ShowCheatsheet()<CR>
