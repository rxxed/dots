" vim:fileencoding=utf-8:foldmethod=marker

" ┏┓╻┏━╸┏━┓╻ ╻╻┏┳┓   ┏━╸┏━┓┏┓╻┏━╸╻┏━╸╻ ╻┏━┓┏━┓╺┳╸╻┏━┓┏┓╻
" ┃┗┫┣╸ ┃ ┃┃┏┛┃┃┃┃   ┃  ┃ ┃┃┗┫┣╸ ┃┃╺┓┃ ┃┣┳┛┣━┫ ┃ ┃┃ ┃┃┗┫
" ╹ ╹┗━╸┗━┛┗┛ ╹╹ ╹   ┗━╸┗━┛╹ ╹╹  ╹┗━┛┗━┛╹┗╸╹ ╹ ╹ ╹┗━┛╹ ╹

" Plugins {{{
call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'axvr/org.vim'
Plug 'chrisbra/Colorizer'
Plug 'dylanaraps/wal.vim'
Plug 'godlygeek/tabular'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf'
Plug 'junegunn/goyo.vim'
Plug 'llathasa-veleth/vim-brainfuck'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'plasticboy/vim-markdown'
Plug 'ptzz/lf.vim'
Plug 'tomlion/vim-solidity'
Plug 'tools-life/taskwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'urbit/hoon.vim'
" Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vimwiki/vimwiki'
Plug 'voldikss/vim-floaterm'
Plug 'yuezk/vim-js'

call plug#end()
" }}}

" syntax highlighting, ruler, line numbers
syntax on
set ruler
set number
set relativenumber

" tabs equal 8 spaces
set tabstop=8
set shiftwidth=8
set softtabstop=8
set expandtab
set smartindent

" copy and paste to vim from system clipboard
set clipboard=unnamedplus

" (don't) display the status bar
set laststatus=1

" incremental search results
set incsearch

" show command as you type
set showcmd

" case insensitive matching
set ignorecase
set smartcase

" keep at least 5 lines above/below while scrolling
" set scrolloff=5

" dont highlight matching parens
" set NoMatchParen
let loaded_matchparen=1

" " disable arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" disable auto commenting
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" airline and syntax colors
" set background="light"
" let g:gruvbox_contrast_light="hard"
" colorscheme default
" set termguicolors
" let g:airline_theme="gruvbox"

" don't wrap lines
" set nowrap

" don't break words while wrapping
set linebreak

" delete trailing whitespaces and newlines on save
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritepre * %s/\n\+\%$//e

nnoremap <Leader>r :source $HOME/.config/nvim/init.vim<CR>

set splitbelow splitright
noremap <C-left> :vertical resize +3<CR>
noremap <C-right> :vertical resize -3<CR>
noremap <C-up> :resize -3<CR>
noremap <C-down> :resize +3<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vertical split-line
set fillchars+=vert:-

" airline statusbar
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='term'
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline#extensions#tabline#left_alt_sep = '|'

hi CursorLine   cterm=NONE
" hi CursorColumn cterm=NONE
" set cursorline! cursorcolumn!
" set cursorline
" set cursorcolumn
" nnoremap <Leader>h :set cursorline! cursorcolumn!<CR>

let g:vimwiki_list = [{'path': '~/.local/share/vimwiki'}]
" let g:vimwiki_conceal_pre = 1 " conceals preformatted text markers

" use space as leader key
nnoremap <Space> <nop>
let mapleader=" "

" placeholder
nnoremap <Leader><space> /<++><CR>"_c4l

" annoying
nnoremap S <nop>

" Y to yank till the end of the line
nnoremap Y y$

" switch the roles of 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" easy to type {} blocks
inoremap {<CR> {}<Esc>i<CR><Esc>k$o

" do not register text cleared using c to the clipboard
nnoremap c "_c

" Q to call the macro q instead of ex mode
nnoremap Q @q

" move by screen line if text is wrapped
" nnoremap j gj
" nnoremap k gk

" Fuzzy search
map <Leader>/ :FZF<CR>

" make
map <F1> :!sudo make clean install<CR>

" sudowrite
nnoremap <Leader>w :SudoWrite<CR><CR>

" save the current buffer and move to the next buffer
nnoremap <silent> gb :w<CR>:bn<CR>
nnoremap <silent> gB :w<CR>:bp<CR>

" make file executable
nnoremap <Leader>cx :!chmod +x %<CR>

" reload the file
nnoremap <Leader>rl :e %<CR>

" execute file
nnoremap <Leader>x :!./%<CR>

" highlight hex color codes
nnoremap <Leader>ch :ColorToggle<CR>

" highlight search results and remove them with ctrl L
set nohlsearch
" nnoremap <C-l> :noh<CR>
" inoremap <C-l> <Esc>:noh<CR>a

" goyo toggle
nnoremap <Leader>g :Goyo<CR>

" quickscope toggle
nnoremap <Leader>q :QuickScopeToggle<CR>
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" tabularize
nnoremap <Leader>t :Tabularize<space>/
vnoremap <Leader>t :Tabularize<space>/

" use <tab> in normal mode to open and close folds
nnoremap <Leader>; za

" sent presentations
nnoremap <F7> :!sent %<CR>

" insert date using <F3>
nnoremap <F3> "=strftime('%F')<CR>
inoremap <F3> <C-r>=strftime('%F')<CR>

" insert date with the exact time using <F4>
nnoremap <F4> "=strftime('%F %T')<CR>
inoremap <F4> <C-r>=strftime('%F %T')<CR>

" open file in sxiv
nnoremap <Leader>img yiW:!sxiv<space><C-r>"<CR>
" open file in zathura
nnoremap <Leader>pdf yiW:!zathura<space><C-r>"<CR>
" open link in browser
nnoremap <Leader>ll 0/ttps<CR>lyiW:!brave<space>--new-tab<space><C-r>"<CR>

" invoke lf
let g:lf_map_keys=0
nnoremap <C-p> :Lf<CR>

" wrapped lines vertical movement
" uses gj/gk when moving a single line up/down
" uses j/k when prefixed with a number
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

nnoremap <Leader>h :GitGutterPrevHunk<CR>
nnoremap <Leader>l :GitGutterNextHunk<CR>

" " From https://gist.github.com/tpope/287147
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
" function! s:align()
"   let p = '^\s*|\s.*\s|\s*$'
"   if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"     let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
"     let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
"     Tabularize/|/l1
"     normal! 0
"     call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"   endif
" endfunction

autocmd FileType rust noremap <F5> :!cargo<space>build<CR>
autocmd FileType rust noremap <F6> :!cargo<space>run
autocmd FileType rust noremap <F7> :!cargo<space>test<CR>

autocmd FileType python nnoremap <F5> :!python %
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4

autocmd FileType javascript,css set tabstop=4
autocmd FileType javascript,css set shiftwidth=4
autocmd FileType javascript,css set softtabstop=4

autocmd FileType html,javascript set tabstop=4
autocmd FileType html,javascript set shiftwidth=4
autocmd FileType html,javascript set softtabstop=4
autocmd FileType html,javascript inoremap ,html <html></html><Esc>F<i<CR><CR><Esc>k"_cc<head></head><Esc>F<i<CR><CR><Esc>k"_cc<title></title><Esc>F<i<++><Esc>/head<CR>o<body></body><Esc>F<i<CR><CR><Esc>k"_cc<++><Esc>?html<CR>
autocmd FileType html,javascript inoremap ,bt <b></b><Esc>F<i
autocmd FileType html,javascript inoremap ,it <i></i><Esc>F<i
autocmd FileType html,javascript inoremap ,span <span></span><Esc>F<i
autocmd FileType html,javascript inoremap ,div <div></div><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,p <p></p><Esc>F<i
autocmd FileType html,javascript inoremap ,br <br/><Esc>a
autocmd FileType html,javascript inoremap ,strong <strong></strong><Esc>F<i
autocmd FileType html,javascript inoremap ,code <code></code><Esc>F<i
autocmd FileType html,javascript inoremap ,a <a<space>href="<++>"><++></a><Esc>Fa;
autocmd FileType html,javascript inoremap ,img <img<space>src=""/><Esc>F"i
autocmd FileType html,javascript inoremap ,f <form></form><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,ta <table></table><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,ul <ul></ul><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,li <li></li><Esc>F<i
autocmd FileType html,javascript inoremap ,tr <tr></tr><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,td <td></td><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,th <th></th><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html,javascript inoremap ,h1 <h1></h1><Esc>F<i
autocmd FileType html,javascript inoremap ,h2 <h2></h2><Esc>F<i
autocmd FileType html,javascript inoremap ,h3 <h3></h3><Esc>F<i
autocmd FileType html,javascript inoremap ,h4 <h4></h4><Esc>F<i
autocmd FileType html,javascript inoremap ,link <link /><Esc>Fka<space>rel="stylesheet"<space>type="text/css"<space>href="<++>"<space>media="screen"<Esc>?link<CR>

autocmd FileType htmldjango set tabstop=4
autocmd FileType htmldjango set shiftwidth=4
autocmd FileType htmldjango set softtabstop=4

autocmd FileType tex map <F5> :w<CR>:!pdflatex %<CR>
autocmd FileType tex map <F6> :!zathura *.pdf &<CR><CR>

autocmd FileType c map <F5> :!gcc % -o %.out<CR>
autocmd FileType c map <F6> :!./%.out
autocmd FileType c,cpp nnoremap <Leader>f /^

autocmd FileType vimwiki inoremap ,now **<Esc>i<C-r>=strftime('%F %T')<CR><Esc>o
autocmd FileType vimwiki nnoremap <Leader>= yyppVr=2kVr=j 
autocmd FileType vimwiki set tabstop=4
autocmd FileType vimwiki set shiftwidth=4
autocmd FileType vimwiki set softtabstop=4
