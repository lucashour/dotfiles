" ========================================================================
" Plugins
" ========================================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-bundler'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'honza/vim-snippets'
Plugin 'chriskempson/base16-vim'
Plugin 'mhinz/vim-grepper'
Plugin 'eslint/eslint'

call vundle#end()
filetype plugin indent on

" ========================================================================

set runtimepath^=~/.vim/bundle/ctrlp.vim
set guioptions-=T

set grepprg=ack " File searching

set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

set wildmenu
set mouse=a
set clipboard=unnamed " Clipboard

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green

" default the statusline to green when entering Vim
hi statusline guibg=green

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" highlight all search matches
set hlsearch
" press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set relativenumber

" ========================================================================
" Programming languages stuff
" ========================================================================

augroup myfiletypes
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,html,css,javascript,typescript,javascriptreact,typescriptreact,php,coffee,json,sh setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

" ========================================================================


" ========================================================================
" Mappings
" ========================================================================

let mapleader = ","
map <Leader>ac :sp app/controllers/application_controller.rb<cr>
map <Leader>bb :!bundle install<cr>
map <Leader>gl :e Gemfile.lock<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sp :sp <cr>
map <Leader>vs :vs <cr>

" shortcut to save
nmap <leader>, :w<cr>

" shortcut to quit
nmap <leader>q :q<cr>

" Paste mode
vmap <leader>p :set paste
vmap <leader>np :set nopaste

" Search with CtrlP
vmap <c-p> :CtrlP
vmap 'CtrlP' :CtrlP

" Async ack
let g:ack_use_dispatch = 1
nmap <leader>g :Grepper<cr>

" Explore mode
nmap <leader>e :Explore<cr>

" Swithching between tabs
map <c-S-Up> <c-w><Up>
map <c-S-Down> <c-w><Down>
map <c-S-Right> <c-w><Right>
map <c-S-Left> <c-w><Left>

" Search selected text on Visual Mode
vnoremap // y/<C-R>"<CR>

" ========================================================================


" ========================================================================
" Functions
" ========================================================================

set history=500 " keep 500 lines of command line history
set ruler " show the cursor position all the time

" ========================================================================

" ========================================================================
" Plugins configuration
" ========================================================================
" NERDTree
let g:NERDTreeWinPos = "left" " position
let g:NERDTreeHijackNetrw=0 " closed by default
let g:NERDTreeQuitOnOpen=1 " close after opening a file
let NERDTreeShowHidden=1 " show hidden files
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

" Tagbar
nmap <silent> <leader>t :Tagbar<cr>

" CtrlP
nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>
let g:ctrlp_custom_ignore = 'node_modules\|log\|git\|tmp\|vendor'

" Grepper
let g:grepper = {
    \ 'tools': ['pt', 'git'],
    \ 'pt': {
    \   'grepprg':    'pt --nocolor --nogroup',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ }}

" Theme and visual customization
set t_Co=256
set background=dark
colorscheme Tomorrow-Night-Bright
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let g:airline_powerline_fonts = 1

" Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }

" General settings
syntax on
filetype off
filetype plugin indent on
filetype plugin on

"
let g:vim_jsx_pretty_colorful_config = 1

" ========================================================================
