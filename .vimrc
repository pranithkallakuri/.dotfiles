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
