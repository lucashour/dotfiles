" ========================================================================
" Plugins
" ========================================================================

set nocompatible
filetype off
set encoding=UTF-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'eslint/eslint'
Plugin 'flazz/vim-colorschemes'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'jparise/vim-graphql'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'kdheepak/lazygit.nvim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-grepper'
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plugin 'pangloss/vim-javascript'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'prisma/vim-prisma'
Plugin 'rajasegar/vim-pnpm'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

" ========================================================================

set runtimepath^=~/.vim/bundle/ctrlp.vim

set clipboard=unnamedplus " Clipboard
set go-=L " Removes left hand scroll bar
set grepprg=ack " File searching
set guioptions-=T
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set history=500 " keep 500 lines of command line history
set mouse=a
set ruler " show the cursor position all the time
set wildmenu

set signcolumn=yes
highlight clear SignColumn

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=green

" default the statusline to green when entering Vim
hi statusline guibg=green

" strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" highlight settings
syntax sync minlines=10000

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" highlight all search matches
set hlsearch
" press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

" ========================================================================

" ========================================================================
" General mappings
" ========================================================================

let mapleader = ","
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
" Plugins configuration
" ========================================================================

" General settings
syntax on
filetype off
filetype plugin indent on
filetype plugin on

" NERDTree
let g:NERDTreeWinPos = "left" " position
let g:NERDTreeHijackNetrw=0 " closed by default
let g:NERDTreeQuitOnOpen=0 " close after opening a file
let NERDTreeShowHidden=1 " show hidden files
nmap <silent> <leader>; :NERDTreeToggle<cr>
nmap <silent> <leader>l :NERDTreeFind<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeGitStatusUseNerdFonts = 1

" Conquer of Completion
let g:coc_global_extensions = ['coc-tsserver']
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <CR> coc#pum#visible() && coc#pum#info()['index'] == -1
  \ ? "\<C-r>=coc#pum#cancel()\<CR>\<CR>"
  \ : coc#pum#visible()
    \ ? coc#_select_confirm()
    \ : "\<CR>"
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Tagbar
nmap <silent> <leader>t :Tagbar<cr>

" CtrlP
nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>
let g:ctrlp_custom_ignore = 'node_modules\|log\|git\|tmp\|vendor'

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Grepper
set grepprg=ack " File searching
let g:grepper = {
  \ 'tools': ['git', 'pt'],
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

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }

" JSX
let g:vim_jsx_pretty_colorful_config = 1

" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

" Markdown preview
let vim_markdown_preview_github=1

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

" ========================================================================
