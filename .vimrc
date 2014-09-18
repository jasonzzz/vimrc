syntax on
filetype off
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

autocmd FileType html,xhtml,css,scss,javascript,eruby,ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.coffee set filetype=coffee

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

" vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Bundle 'gmarik/Vundle.vim'
Bundle 'vim-scripts/L9'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
"Bundle 'Lokaltog/powerline'
Bundle 'scrooloose/nerdtree'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'msanders/snipmate.vim'
Bundle 'sjl/gundo.vim'
Bundle "majutsushi/tagbar"
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Townk/vim-autoclose'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'scrooloose/syntastic'
"Bundle 'vim-scripts/Emmet.vim'
"Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'tpope/vim-markdown'
Bundle 'pangloss/vim-javascript'
Bundle 'flazz/vim-colorschemes'
"Bundle 'vim-scripts/DrawIt'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jcf/vim-latex'

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
nmap <Leader>T :TagbarToggle<CR>
" Go
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
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
" CoffeeScript
if executable('coffeetags')
    let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
            \ 'f:functions',
            \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
            \ 'f' : 'object',
            \ 'o' : 'object',
        \ }
    \ }
endif

" kchmck/vim-coffee-script
" https://github.com/kchmck/vim-coffee-script#configure-syntax-highlighting
let coffee_indent_keep_current = 1
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
