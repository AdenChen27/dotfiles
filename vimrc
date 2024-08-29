" For preservation of last edit point
if !has('nvim')
    source $VIMRUNTIME/vimrc_example.vim
endif

set nohlsearch
set mouse=a


filetype plugin on

set hidden
" ========== Plugins ==========
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe'
Plug 'tmsvg/pear-tree'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
" Plug 'ggandor/lightspeed.nvim'
Plug 'wfxr/minimap.vim'
Plug 'psliwka/vim-smoothie'
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

" Colorscheme packages
" Plug 'ku1ik/vim-monokai'
" Plug 'nanotech/jellybeans.vim'
" Plug 'dylanaraps/wal'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
let ayucolor="light"

" tex
Plug 'matze/vim-tex-fold'
    let g:tex_fold_enabled=1
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method = 'skim' 
    let g:vimtex_view_skim_sync = 1
    let g:vimtex_view_skim_activate = 1
    let g:vimtex_quickfix_mode=0
    let g:vimtex_fold_enabled=1
    let g:vimtex_fold_manual=1

    let g:vimtex_compiler_latexmk = {
        \ 'aux_dir' : 'aux',
        \ 'out_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}

    let g:vimtex_matchparen_enabled=0

    let g:vimtex_syntax_conceal = {
          \ 'math_bounds': 0,
          \}
Plug 'KeitaNakamura/tex-conceal.vim'
    " set conceallevel=2
    set conceallevel=1
    let g:tex_conceal='abdmgs'

    " Conceal certain characters
    " hi Conceal ctermbg=none guibg=none


    " Shorten the begin and end statements
    " call matchadd('Conceal', '\\begin{\ze[^}]\+}',    10, -1, {'conceal':'['})
    " call matchadd('Conceal', '\\begin{[^}]\+\zs}\ze', 10, -1, {'conceal':']'})

    " call matchadd('Conceal', '\\end\ze{[^}]\+}',    10, -1, {'conceal':'['})
    " call matchadd('Conceal', '\\end\zs{\ze[^}]\+}', 10, -1, {'conceal':'/'})
    " call matchadd('Conceal', '\\end{[^}]\+\zs}\ze', 10, -1, {'conceal':']'})

    " syntax match texCmdEnvM '\\langle' contained conceal cchar=⟨
    " syntax match texCmdEnvM '\\rangle' contained conceal cchar=⟩



" Snippets
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

call plug#end()




if has("gui_running")
  syntax on
  set hlsearch
  colorscheme macvim
  set bs=2
  set ai
  set ruler
endif


" ========== Colorscheme ==========
set background=light
colorscheme ayu
highlight! link Conceal Normal
" colorscheme PaperColor


" ========== Misc =========
set mouse=v
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2
let g:loaded_matchparen=1


" ========== Keyboard Shortcuts ==========
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Comment
nnoremap <leader>/ :Commentary<cr>j
inoremap <leader>/ <Esc>:Commentary<cr>ji
vmap <leader>/ gc



" ========== Folding ==========
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set relativenumber number
set encoding=utf-8

" ========== Aux Files =========
let &directory = expand('~/.vim/swap//')

" set backup
let &backupdir = expand('~/.vim/backup//')

" set undofile
let &undodir = expand('~/.vim/undo//')

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

" Save folds
set foldenable
set foldmethod=manual
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END



" ========== Tabs ==========
" indent, tabs, and spaces
set backspace=indent,eol,start
set autoindent
set cindent

" tab to space
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0

autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" show tabs
set list
set listchars=tab:▸\ 
" set listchars=tab:▸·



" ========== Spellcheck ==========
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u



set colorcolumn=80



" ========== Language Specific Settings ==========
" js, html, css
au BufNewFile,BufRead *.js,*.html,*.css,
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2







setlocal colorcolumn=0




