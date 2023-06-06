" Basic Stuff
set nocompatible
set laststatus=2
set nowrap

" Testing: set Vim-specific sequences for RGB colors
"let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum" " Screen doesnt like termguicolors
"let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
"let &t_ZH="\e[3m"  " Screen doesnt like italics
"let &t_ZR="\e[23m"
"set termguicolors "This is the culprit in screen


" Color Theme
set t_Co=256
" clear t_ut to Use colorscheme's background
set t_ut=
set background=dark
"colorscheme sublime256
"colorscheme codedark
let g:gruvbox_italics=0
colorscheme gruvbox8_hard
"colorscheme lettuce



" CursorLine
set cursorline
"set culopt=screenline ""https://www.ditig.com/256-colors-cheat-sheet
"hi CursorLine cterm=NONE ctermul=NONE ctermbg=235 ctermfg=NONE
if v:version <= 700
  echo "Vim version is <= 700"
  finish
endif
"
" =====  PLUGINS =======
"
" =====  Lightline  =====
"let g:lightline = {
"      \ 'component_function': {
"      \   'filename': 'LightlineFilename'
"      \ }
"      \ }
function! LightlineFilename()
  return expand('%')
endfunction
function! ProjectLocFunc()
    return pathshorten(fnamemodify(getcwd(), ":~:."))
endfunction

try
  let g:lightline = {
        \ 'colorscheme': 'gruvbox8',
        \ 'active': {
        \     'right': [ [ 'lineinfo' ],
        \                [ 'percent' ],
        \                [ 'fileformat', 'fileencoding', 'filetype', 'ProjectLocation' ] ]
        \ },
        \ 'component' : {
        \     'lineinfo': '%3l:%-2v%<',
        \ },
        \ 'component_function': {
        \   'ProjectLocation': 'ProjectLocFunc',
        \   'filename' : 'LightlineFilename',
        \ },
        \ }
catch
endtry

" =====  CtrlP  =====
"let g:ctrlp_custom_ignore = '.*\.(git|o|so|cmd)'
set wildignore+=*.so,*.o,*.swp,*.cmd
try
  let g:ctrlp_working_path_mode = ''
  let g:ctrlp_max_files = 0
  let g:ctrlp_clear_cache_on_exit = 0 "Uncomment this once your done tinkering with ctrlp
catch
endtry

" =====  vim-gitgutter  ========
try
  highlight GitGutterAdd    guifg=#009900 ctermfg=2
  highlight GitGutterChange guifg=#bbbb00 ctermfg=3
  highlight GitGutterDelete guifg=#ff2222 ctermfg=1
catch
endtry

set noswapfile "May not be a good idea; But dont want swp files being created every 100ms too
set updatetime=100

" =====  Indentation  ======
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" ======  cscope  ======
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-


" ======  My Bindings  =======
let mapleader=' ' "Space
imap <C-w> <esc><C-w>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf :cs find f <C-R>=expand("<cword>")<CR><CR>
"set path+=**/*
set wildmenu

" Search for selected text in file ""vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"set timeoutlen=1000 ttimeoutlen=0
"Below insert and visual mappings are so there is no escape delay
"n noremap <ESC> <nop>
"i noremap <ESC> <C-c>
"v noremap <ESC> <C-c>
"m ap  <ESC>[F    <End>
"m ap  <ESC>[H    <Home>
"i map <ESC>[F    <End>
"i map <ESC>[H    <Home>


" =====  Numberline  =====
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END


" =====  Vimdiff  =====
hi DiffAdd      ctermfg=NONE          ctermbg=DarkGreen
hi DiffChange   ctermfg=NONE          ctermbg=NONE
hi DiffDelete   ctermfg=DarkBlue      ctermbg=DarkRed
hi DiffText     ctermfg=NONE          ctermbg=DarkBlue
if &diff
        set nocursorline
    syntax off
endif

" ===== Rainbow Parenthesis ====="
try
  let g:rainbow_active = 1
catch
endtry

" ===== Autocompletion ===="
"set omnifunc=ale#completion#OmniFunc
