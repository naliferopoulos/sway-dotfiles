" Syntax Settings
syntax on
filetype plugin indent on

" Enable vim-plug
call plug#begin()

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Extra Icons
Plug 'ryanoasis/vim-devicons'

" Indentation Highlighter
Plug 'Yggdroot/indentLine'

" PyWal Colorschemes
Plug 'dylanaraps/wal.vim'

" Fuzzy File Search Integration
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Paragraph Focus
Plug 'junegunn/limelight.vim'

" Focus Mode
Plug 'junegunn/goyo.vim'

" Git Integration
Plug 'tpope/vim-fugitive'

" Git Commit Browser
Plug 'junegunn/gv.vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Extra Syntax Highlighting 
Plug 'sheerun/vim-polyglot'

" Start Screen
Plug 'mhinz/vim-startify'

" Colorscheme
Plug 'morhetz/gruvbox'

" Tag Browser
Plug 'majutsushi/tagbar'

" Syntax Checker
Plug 'vim-syntastic/syntastic'

" Git Diff Sidebar
Plug 'airblade/vim-gitgutter'

" Filesystem Browser Tree
Plug 'scrooloose/nerdtree'
call plug#end()

" Enable GitGutter
let g:gitgutter_enabled = 1

" Set update interval
set updatetime=100

" Set Dark Background
set background=dark

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"Always show current position
"set ruler

" Enable Enter key to automatically enter insert mode and insert a new line
nmap <CR> o<Esc>

" Get out of search by hitting enter
nnoremap <CR> :noh<CR><CR>

" Turn on the Wild menu
set wildmenu

" Bind ctrl+n to NerdTree Toggle
map <C-n> :NERDTreeToggle<CR>

" Bind ctrl+l to FZF Files
map <C-l> :FilesPreview!<CR>

" Bind ctrl+s to FZF BLines
map <C-s> :BLines<CR>

" Set autolaunch NerdTree
"autocmd vimenter * NERDTree

" Easy window navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Enable Deoplete
let g:deoplete#enable_at_startup = 1

" Enable Tagbar
nmap <C-t> :TagbarToggle<CR>

" Enable Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style,warning" }
let g:syntastic_loc_list_height = 3

" Enable Indent Line
set list lcs=tab:\┊\

" Enable Dynamic Theming
" colorscheme wal
colorscheme gruvbox

" Apply transparency to background
hi Normal guibg=NONE ctermbg=NONE

" Enable italics in comments
highlight Comment cterm=italic gui=italic

" Create custom FZF function
command! -bang -nargs=* FilesPreview
\ call fzf#vim#files(<q-args>,
\		     <bang>0 ? fzf#vim#with_preview('up:60%')
\			     : fzf#vim#with_preview('right:50%:hidden', '?'),
\		     <bang>0)

" Set up LimeLight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.2
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Set up Goyo to re-enable transparent background.
function! s:goyo_leave()
	hi! Normal guibg=NONE ctermbg=NONE
	Limelight!
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Configure vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_select_all_key      = 'g<C-a>'
let g:multi_cursor_quit_key            = '<Esc>'
