" General
syntax on
set title
set modelines=5
set termencoding=utf-8
set smarttab
set t_Co=256
set tags=tags;$HOME/.tags
set directory=~/.vim/tmp/swap
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
set backup
set undofile
set undolevels=1000
set undoreload=10000
set hidden
set nocompatible
set bs=2
set history=20
set ruler
set autoread
set hlsearch
set formatoptions=tcw1
set wrap
set linebreak
set nu
set textwidth=78
set cc=+1

call pathogen#infect()

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


autocmd! bufwritepost .vimrc source ~/.vimrc


" Tabs
map <silent> <C-T> :tabnew<CR>
map <silent> <kPageUp> :tabprevious<CR>
map <silent> <kPageDown> :tabnext<CR>
map <silent> <C-J> :tabprevious<CR>
map <silent> <C-K> :tabnext<CR>
imap <silent> <C-T> <ESC>:tabnew<CR>i
imap <silent> <C-W> <ESC>:tabclose<CR>i
imap <silent> <kPageUp> <C-O>:tabprevious<CR>
imap <silent> <kPageDown> <C-O>:tabnext<CR>
map <silent> <C-H> :tabfirst<CR>
imap <silent> <C-H> <C-O>:tabfirst<CR>

nnoremap <silent> <F7> :TagbarToggle<CR> 
nnoremap <silent> <F8> :TlistToggle<CR> 
nnoremap <silent> <F3> :NERDTreeToggle<CR> 

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol         = '✗'
let g:syntastic_style_error_symbol   = '✗'
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let c_no_curly_error   = 1
let g:localrc_filename = '.lvimrc'

" Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

if has("autocmd")
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd FileType java set omnifunc=javacomplete#Complete
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif

autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.so$', '\.o$', '\.la$', '\.a$', '\.class$', '\~$', '\.beam$', '^Mnesia.', 'deps/', '\.hi$', 'vendor/']

let g:neocomplcache_enable_at_startup = 1

let g:Tlist_Use_Right_Window = 1

" no matter your colorscheme, you'll have a vertical bar when you split.
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#555552 guibg=#555552 gui=NONE
set fillchars+=vert:\ 

"GitGutter
let g:gitgutter_eager = 0
au VimEnter * GitGutterEnable



if has("gui_running")
   set guifont=terminus:h14
   set background=dark
   set t_Co=256
endif


"colors zenburn
colors molokai
set cursorline
set clipboard=unnamed
set showmatch
set showmode
set wildchar=<tab>
set wildmenu

set wildignore=*.o,*.class,*.pyc,*.aux,*.toc,*.pdf,*.doc,*.docx,*gz,*.blg,*.dvi,*.bbl

set autoindent
set incsearch
set nobackup
set copyindent
set ignorecase
set smartcase
set smarttab
set noerrorbells
set novisualbell
set t_vb=
set noeb
set novb
set tm=500

" tabs {
   set expandtab
   set softtabstop=3
   set shiftwidth=3

"   au FileType Makefile set noexpandtab
"}

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
   let curdir = substitute(getcwd(), $HOME, "~", "")
   return curdir
endfunction

function! HasPaste()
   if &paste
      return '[PASTE]'
   else
      return ''
   endif
endfunction

"}

" leader
let mapleader=","
let g:mapleader=","

nmap <leader>p :set paste!<BAR>set paste?<CR>
nmap <leader>r :source ~/.vimrc<CR>
nmap <leader>cc :tabnew ~/.vimrc<CR>
nmap <leader>. :!%:p<CR>
nmap <leader>ji :r !jist %:p<CR><esc>0v$"*d
"nmap <leader>ji :let @* = execute ":r !jist %:p"<CR>
"vmap <leader>ji "jy:'<,'>!jist -f % -d selection<CR><esc>0v$"*y0v$"jp
vmap <leader>ji "*y:r !jist -P -f % -d selection<CR><esc>0v$"*d
"vmap <leader>ji :let @* = !jist -P -f % -d selection<CR>
nmap <leader>je :r !./% \| jist<CR><esc>0v$"*d
"nmap <leader>je :let @* = !./% \| jist<CR>
nmap <leader>" ci"

"nmap <leader>kl o<esc>:r !names.sh %:p<CR>0v$h"bd<esc>:tabnew <C-r>b<CR>

vnoremap < <gv
vnoremap > >gv

cmap cd. lcd %:p:h

" LaTeX files
au BufNewFile,BufRead *.tex setlocal ft=tex
au FileType tex setlocal spell spelllang=en_us
nmap <leader>ll :!vtex.sh '%:p'<CR><CR>
nmap <leader>lo :!vtex.sh -o '%:p'<CR><CR>
if has("gui_running")
   set mousemodel=popup
endif

"python-mode
let g:pymode_rope_vim_completion=0
"jedi-vim
let g:jedi#popup_select_first = 0

"Startify
let g:startify_skiplist = [
             \ 'COMMIT_EDITMSG',
             \ $VIMRUNTIME .'/doc',
             \ 'bundle/.*/doc' ,
             \ 'vimpager'
             \ ]
let g:startify_show_sessions = 1
let g:startify_show_files = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-l>"
"

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_prompt_mappings = {
   \ 'AcceptSelection("e")': ['<c-t>'],
   \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']
   \ }
let g:ctrlp_custom_ignore = {
   \ 'file': '\v\.(log)$'
   \ }

function! ToggleHighlighting(group,regex) " {{{
   let entries = filter(getmatches(), 'v:val.group == "' . a:group . '"')
   if len(entries) > 0
      let entry = entries[0]
      call matchdelete(entry.id)
   else
      execute 'highlight' a:group 'ctermbg=blue guibg=blue'
      call matchadd(a:group, a:regex)
   endif
endfunction! "}}}
function! ToggleHighlightTrailingSpaces() "{{{
   call ToggleHighlighting('TrailingSpaces', '\v\s+$')
endfunction! "}}}
function! ToggleHighlightTabs() "{{{
   call ToggleHighlighting('Tabs', '\v\t+')
endfunction! "}}}