syntax on
"filetype off
filetype plugin indent on

set langmenu=en_US.utf-8
language messages en_US.utf-8

set fenc=utf-8
set fencs=utf-8,gb18030,gbk,gb2312
set fileencodings=utf-8,gb18030,gbk,big5,gb2312
set guifont=Terminus
set nocompatible
"set rnu
set nu
set backspace=indent,eol,start
set ignorecase
set ruler
set hlsearch
set incsearch
set showcmd
set cindent
set showmatch
set foldmethod=indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set colorcolumn=80
highlight ColorColumn ctermbg=543

" Highlight current line and column
set cursorline
set cursorcolumn

" if has("autocmd")
autocmd FileType html,xhtml,css,scss,eruby,ruby,puppet,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.rss,*.atom set filetype=xml
autocmd BufNewFile,BufRead *.md set filetype=markdown

" window
map <c-w><c-j> <c-w>+
map <c-w><c-k> <c-w>-
map <c-w><c-l> <c-w>>
map <c-w><c-h> <c-w><
unmap <c-w>-
map <c-w>- :split<CR>
"TODO
"unknown <c-w>| orz
map <c-w>\ :vsplit<CR>

map <Leader>r :retab<CR>

nmap <Leader>tbc :tabnew<CR>
nmap <Leader>tbn :tabNext<CR>
nmap <Leader>tbp :tabprevious<CR>

vnoremap <Leader>s :sort<CR>
" better indentation
vnoremap < <gv
vnoremap > >gv

" ctags
map <Leader>ct :!ctags -R .<CR><CR>
" cscope
map <Leader>cs :!cscope -Rbkq <CR><CR>
map <Leader>csa :cscope add cscope.out<CR>

" vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/L9'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Townk/vim-autoclose'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
"Plugin 'vim-scripts/FuzzyFinder'
Plugin 'mattn/webapi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tpope/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'itchyny/screensaver.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" vim-colorschemes
set rtp+=~/.vim/bundle/vim-colorschemes
colorscheme darkzen

" vim-airline
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='luna'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'nightly_fox'

" nerdtree
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
nmap <Leader>N :NERDTreeToggle<CR>

" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au syntax * RainbowParenthesesLoadSquare
au syntax * RainbowParenthesesLoadBraces

" Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1

" vim-trailing-whitespace
map <Leader>W :FixWhitespace<CR>

" vim-indent-guides
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=1
set background=dark
map <Leader>I :IndentGuidesToggle<CR>

" vim-trailing-whitespace
map <Leader>] :FixWhitespace<CR>

" syntastic
map <Leader>\ :SyntasticCheck<CR>
let g:syntastic_auto_loc_list=0
let g:syntastic_php_checkers=['php','phpcs','phpmd']

" FuzzyFinder
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>

" neocomplete
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" pangloss/vim-javascript
let javascript_enable_domhtmlcss=1
let g:javascript_conceal=1

" majutsushi/tagbar
" https://github.com/majutsushi/tagbar/wiki
let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_iconchars = ['+', '-']
"let g:tagbar_autoclose = 1
nmap <Leader>T :TagbarToggle<CR>
" c
let g:tagbar_type_c = {
    \ 'kinds'     : [
        \ 'c: classes',
        \ 'd:macros:1',
        \ 'e:enumerators:1',
        \ 'f:functions',
        \ 'l:local:1',
        \ 'm:members:1',
        \ 'g:enums:1',
        \ 'v:variables:1',
        \ 't:typedefs:1',
        \ 's:structs:1',
        \ 'n:namespaces:1',
        \ 'u:unions:1',
        \ 'p:prototypes:1',
        \ 'x:external:1'
    \ ]
\}
" cpp
let g:tagbar_type_cpp = {
    \ 'kinds'     : [
        \ 'c: classes',
        \ 'd:macros:1',
        \ 'e:enumerators:1',
        \ 'f:functions',
        \ 'l:local:1',
        \ 'm:members:1',
        \ 'g:enums:1',
        \ 'v:variables:1',
        \ 't:typedefs:1',
        \ 's:structs:1',
        \ 'n:namespaces:1',
        \ 'u:unions:1',
        \ 'p:prototypes:1',
        \ 'x:external:1'
    \ ]
\}
" markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype':'markdown',
    \ 'kinds':[
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
" go
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constant:1',
        \ 'f:function',
        \ 'v:variable:1',
        \ 't:type:1',
        \ 'm:method:1'
    \ ],
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
