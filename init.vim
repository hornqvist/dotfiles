"set t_Co=256
set nocp
filetype off
set number
set relativenumber
set nowrap
set nohlsearch

call plug#begin('~/.config/nvim/plugged')

Plug 'niftylettuce/vim-jinja'
Plug 'jdonaldson/vaxe'
Plug 'ElmCast/elm-vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'equalsraf/neovim-gui-shim'
Plug 'Chiel92/vim-autoformat'
Plug 'BeeWarloc/vim-fuse'
Plug 'jaawerth/nrun.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'archSeer/elixir.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'benekastah/neomake'
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'yuttie/comfortable-motion.vim'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'Shougo/vimproc.vim'
Plug 'pangloss/vim-javascript'
"Plug 'ternjs/tern_for_vim'
"Plug 'carlitux/deoplete-ternjs'
"Plug 'Quramy/tsuquyomi'
"Plug 'leafgarland/typescript-vim'
"Plug 'mxw/vim-jsx'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'airblade/vim-gitgutter'
"Plug 'Yggdroot/indentLine'
"Plug 'unblevable/quick-scope'
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

call plug#end()

syntax on
filetype plugin indent on
set number
set nowrap
colorscheme gruvbox
set smartindent
set guifont=Envy\ Code\ R\ for\ Powerline\ 10
set background=dark
set sw=4
set ts=4
set sts=4
set shiftround
set expandtab
set undofile
set noswapfile
set synmaxcol=0

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

autocmd! BufWritePost * Neomake
autocmd BufNewFile,BufRead *.vue set filetype=html

let g:neomake_javascript_eslint_exe = nrun#Which('eslint')

if findfile('.eslintrc', '.;') ==# ''
    let g:neomake_javascript_enabled_makers = ['eslint']
endif

let g:python3_host_skip_check = 1
let g:jedi#force_py_version = 3
let g:neomake_python_maker_exe = 'python3'
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_open_list = 2

let g:deoplete#enabled_at_startup = 1

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1

set clipboard+=unnamedplus
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules|\.DS_Store|build|Documentation|Templates)$'

augroup AutoSwap
    autocmd!
    autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
    " if swapfile is older than file itself, just get rid of it
    if getftime(v:swapname) < getftime(a:filename)
        call delete(v:swapname)
        let v:swapchoice = 'e'
    endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
            \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
    endif
augroup END

set hidden
let g:racer_cmd = "/home/martin/.cargo/bin/racer"
let $RUST_SRC_PATH = "/usr/local/src/rust"
let g:racer_experimental_completer = 1


"let g:indentLine_indentLevel = 10
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 1

set lazyredraw
let html_no_rendering=1
set scrolljump=16
syntax sync minlines=256
set sw=4

let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
let g:formatters_python = []
"au BufWrite * :Autoformat
