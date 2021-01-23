call plug#begin()
Plug 'dense-analysis/ale'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'adelarsq/vim-matchit'
Plug 'sheerun/vim-polyglot'
Plug 'pantharshit00/vim-prisma'
call plug#end()

let g:loaded_matchparen = 1
let g:netrw_banner = 0
let g:netrw_list_hide = '^\.DS_Store$'

let g:ale_linters = {
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\   'javascript': ['tsserver'],
\   'javascriptreact': ['tsserver'],
\   'json': ['jsonlint'],
\   'python': ['pyright'],
\   'cs': ['OmniSharp'],
\   'glsl': ['glslang']
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'graphql': ['prettier'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'yaml': ['prettier'],
\   'python': ['black']
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_delay = 100
let g:ale_linters_explicit = 1
let g:ale_set_quickfix = 2
let g:ale_use_global_executables = 1

let base16colorspace=256
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
  colorscheme base16-tomorrow-night
else
  colorscheme base16-google-light
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#max_abbr_width = -1
let g:deoplete#max_menu_width = -1
call deoplete#custom#option({
  \ 'auto_complete': v:true,
  \ 'auto_complete_delay': 0,
  \ 'auto_complete_popup': 'auto',
  \ 'smart_case': v:true,
  \ 'min_pattern_length': 1
  \ })
call deoplete#custom#option('sources', { '_': ['ale'] })

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestHighlight = 1

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

set clipboard=unnamed
set completeopt-=preview
set foldlevel=0 foldmethod=manual
set formatoptions-=c formatoptions-=r formatoptions-=o
set iskeyword-=_
set lazyredraw
set mouse=a
set nocursorline nolist
set tabstop=2 shiftwidth=2 expandtab autoindent
set termguicolors
set timeoutlen=1000 ttimeoutlen=0 updatetime=0

hi clear SignColumn
hi clear SpellBad
hi clear SpellCap

hi SpellBad cterm=underline
hi SpellCap cterm=underline

au InsertEnter * set splitbelow
au InsertLeave * set splitbelow!
au StdinReadPre * left s:std_in=1

let mapleader = "\<space>"
imap jk <esc>
tnoremap <esc> <c-\><c-n>

nmap <leader>a :Ag<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>o :GFiles<cr>

nmap <leader>d :ALEGoToDefinition -vsplit<cr>
nmap <leader>i :ALEOrganizeImports<cr>
nmap <leader>r :ALEFindReferences<cr>

nmap <c-j> :ALENext<cr>
nmap <c-k> :ALEPrevious<cr>
