                   " .
    " ##############..... ##############
    " ##############......##############
      " ##########..........##########
      " ##########........##########
      " ##########.......##########
      " ##########.....##########..
      " ##########....##########.....
    " ..##########..##########.........
  " ....##########.#########.............
    " ..################JJJ............
      " ################.............
      " ##############.JJJ.JJJJJJJJJJ
      " ############...JJ...JJ..JJ  JJ
      " ##########....JJ...JJ..JJ  JJ
      " ########.....JJJ..JJ.. JJ. JJ
      " ######    ..JJJJ..JJJ. JJJ JJJ
                  " .....
                    " .


"-----------------------PLUGINS-------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'michaeljsmith/vim-indent-object'
Plug 'unblevable/quick-scope'
Plug 'junegunn/goyo.vim'

call plug#end()

"------------------------ GENERAL ------------------------

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
set laststatus=2

" airline statusbar
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='term'
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline#extensions#tabline#left_alt_sep = '|'

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

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable auto commenting
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" highlight current line
" set cursorline
" hi CursorLine term=bold cterm=bold
" hi CursorLineNR term=bold cterm=bold

" airline and syntax colors
colorscheme peachpuff
" let g:airline_theme="dracula"

" don't wrap lines
" set nowrap

" delete trailing whitespaces and newlines on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

"---------------------- KEY MAPS ------------------------

" use space as leader key
nnoremap <Space> <nop>
let mapleader=" "

" annoying
nnoremap S <nop>

" Fuzzy search
map <Leader>/ :FZF<CR>

" Y to yank till the end of the line
nnoremap Y y$

" move by screen line if text is wrapped
" nnoremap j gj
" nnoremap k gk

" save the current buffer and move to the next buffer
nnoremap <silent> gb :w<CR>:bn<CR>
nnoremap <silent> gB :w<CR>:bp<CR>

" switch the roles of 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" easy to type {} blocks
inoremap {<CR> {}<Esc>i<CR><Esc>k$o

" placeholder
nnoremap <Leader><space> /<++><CR>"_c4l

" do not register text cleared using c to the clipboard
nnoremap c "_c

" Q to call the macro q instead of ex mode
nnoremap Q @q

" make
map <F1> :!sudo make clean install<CR>

" highlight hex color codes
nnoremap <Leader>ch :ColorToggle<CR>

" sudowrite
nnoremap <Leader>w :SudoWrite<CR><CR>

" make file executable
nnoremap <Leader>cx :!chmod +x %<CR>

" reload the file
nnoremap <Leader>rl :e %<CR>

" execute file
nnoremap <Leader>x :!./%<CR>

" highlight search results and remove them with ctrl L
set nohlsearch
" nnoremap <C-l> :noh<CR>
" inoremap <C-l> <Esc>:noh<CR>a

" move around windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" goyo toggle
nnoremap <Leader>g :Goyo<CR>

" quickscope toggle
nnoremap <Leader>q :QuickScopeToggle<CR>

"-----------------------FILETYPE SPECIFIC----------------------------

autocmd FileType rust noremap <F5> :!cargo<space>build<CR>
autocmd FileType rust noremap <F6> :!cargo<space>run
autocmd FileType rust noremap <F7> :!cargo<space>test<CR>

autocmd FileType python nnoremap <F5> :!python %

autocmd FileType html inoremap ,html <html></html><Esc>F<i<CR><CR><Esc>k"_cc<head></head><Esc>F<i<CR><CR><Esc>k"_cc<title></title><Esc>F<i<++><Esc>/head<CR>o<body></body><Esc>F<i<CR><CR><Esc>k"_cc<++><Esc>?html<CR>
autocmd FileType html inoremap ,bt <b></b><Esc>F<i
autocmd FileType html inoremap ,it <i></i><Esc>F<i
autocmd FileType html inoremap ,span <span></span><Esc>F<i
autocmd FileType html inoremap ,div <div></div><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html inoremap ,p <p></p><Esc>F<i
autocmd FileType html inoremap ,a <a<space>href="<++>"><++></a><Esc>Fa;
autocmd FileType html inoremap ,img <img<space>src=""><Esc>F"i
autocmd FileType html inoremap ,f <form></form><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html inoremap ,ta <table></table><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html inoremap ,tr <tr></tr><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html inoremap ,td <td></td><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html inoremap ,th <th></th><Esc>F<i<CR><CR><Esc>k"_cc
autocmd FileType html inoremap ,h1 <h1></h1><Esc>F<i
autocmd FileType html inoremap ,h2 <h2></h2><Esc>F<i
autocmd FileType html inoremap ,link <link /><Esc>Fka<space>rel="stylesheet"<space>type="text/css"<space>href="<++>"<space>media="screen"<Esc>?link<CR>

autocmd FileType tex map <F5> :w<CR>:!pdflatex %<CR>
autocmd FileType tex map <F6> :!zathura *.pdf &<CR><CR>

autocmd FileType c map <F5> :!gcc % -o %.out<CR>
autocmd FileType c map <F6> :!./%.out
autocmd FileType c,cpp nnoremap <Leader>f /^
