 set runtimepath^=~/.vim runtimepath+=~/.vim/after
 let &packpath = &runtimepath
" source ~/.vimrc




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
Plug 'wfxr/minimap.vim'
Plug 'psliwka/vim-smoothie'
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

" Colorscheme packages
" Plug 'ku1ik/vim-monokai'
Plug 'nanotech/jellybeans.vim'
" Plug 'dylanaraps/wal'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
let ayucolor="light"

Plug 'ggandor/leap.nvim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}

" tex
" Plug 'matze/vim-tex-fold'
"     let g:tex_fold_enabled=1
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method = 'skim' 
    let g:vimtex_view_skim_sync = 1
    let g:vimtex_view_skim_activate = 1
    let g:vimtex_quickfix_mode=0
    " let g:vimtex_fold_enabled=1
    " let g:vimtex_fold_manual=1

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
          \ 'math_super_sub': 0,
          \}
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmgs'

    " Shorten the begin and end statements
    call matchadd('Conceal', '\\begin{\ze[^}]\+}',    10, -1, {'conceal':'['})
    call matchadd('Conceal', '\\begin{[^}]\+\zs}\ze', 10, -1, {'conceal':']'})

    call matchadd('Conceal', '\\end\ze{[^}]\+}',    10, -1, {'conceal':'['})
    call matchadd('Conceal', '\\end\zs{\ze[^}]\+}', 10, -1, {'conceal':'/'})
    call matchadd('Conceal', '\\end{[^}]\+\zs}\ze', 10, -1, {'conceal':']'})

    " syntax match texCmdEnvM '\\langle' contained conceal cchar=⟨
    " syntax match texCmdEnvM '\\rangle' contained conceal cchar=⟩



" Snippets
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
call plug#end()

lua require('leap').create_default_mappings()





" ========== Colorscheme ==========
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=light
colorscheme ayu
highlight! link Conceal Normal
" colorscheme PaperColor
highlight SpellBad cterm=underline term=underline ctermfg=NONE guifg=NONE
highlight Normal ctermfg=black guifg=#111111

" ========== Vimtex inverse search ==========



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




" ========== Word Count ==========
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d '[:space:]'"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()




setlocal colorcolumn=0




