" _aSk .vimrc

" General {{{
"""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""
" Select text and press gq to wrap the text to 80 chars width
" Wrap text to 80 characters as white space allows without exceeding the 80
" character limit.
" set textwidth=80
set formatoptions+=t

inoremap jk <esc>

" leader is comma
" let mapleader=","

" make Vim use 256 colors
set t_Co=256

" incsearch: search as characters are entered
set ic

" highlight matches
set hlsearch 

" show line numbers
set nu

" number of visual spaces per TAB when a file is read by vim 
set tabstop=4

" size of an indent using << or >>
set shiftwidth=4 

" number of spaces in tab when editing
set softtabstop=4	

" load filetype-specific indent files
filetype indent on  

" visual autocomplete for command menu
set wildmenu

" highlight matching [{()}]}]
set showmatch

"Auto indent
set ai

"Smart indent
set si

" Enable syntax highlighting, text coloring based on syntax
syntax enable

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

" With both ignorecase and smartcase turned on, a search is case-insensitive if
" you enter the search string in ALL lower case else case-sensitive 
set smartcase

" Ignore case when searching
set ignorecase

" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection(''

" highlight current line
"set cursorline 

" tabs are spaces. Don't do for Makefile
"set expandtab 

"Yank across across terminal (Windows)
"set clipboard=unnamed

"Yank across across terminal (Linux)
set clipboard=unnamedplus

" show relative line numbers
"set relativenumber 


" }}}

" Mapping {{{
"""""""""""""""""""""""""""""""""""""""""""
" Mapping 
"""""""""""""""""""""""""""""""""""""""""""
"nnoremap <Leader><space> :nohlsearch<CR> " turn off search highlight with space

map <space> <leader>
" If using EasyMotion
map <space><space> <leader><leader>		

noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
nnoremap <leader>f :call QuickfixToggle()<cr>
" nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
" vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
noremap <leader>[ :cprev<CR>
noremap <leader>] :cnext<CR>

"noremap <F3> :set relativenumber! <bar> :set nu!<CR>
"noremap <F3> :set relativenumber! \| :set nu!<CR>
noremap <F3> :set nu!<CR>
noremap <F4> :w<CR>
inoremap <F4> <ESC>:w<CR>i
nnoremap <F5> :prev<CR>
nnoremap <F6> :next<CR>
noremap <F7> :tabprev<CR>
noremap <F8> :tabnext<CR>
inoremap <C-k> <Up>
noremap <S-l> <ESC>$
noremap <S-h> <ESC>^
noremap <c-j> <Esc>:w<CR>
inoremap <c-j> <Esc>:w<CR>
nnoremap <leader>h :prev<CR>
nnoremap <leader>l :next<CR>
"nnoremap <leader>j :tabprev<CR>
"nnoremap <leader>k :tabnext<CR>
nnoremap <leader>j :bprev<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>p :set pastetoggle<CR>
"nnoremap <leader>p :setlocal paste!<cr>
vnoremap <leader>t :Tab /=
nnoremap <leader>a :Ag -i 
nnoremap <silent> <leader>A :Ag <cword><CR>
nnoremap <leader>= gg=G'' :w<CR>
nnoremap <leader>c ciw

autocmd filetype c nnoremap <leader>m :!gcc % -ggdb -o %:r && ./%:r
autocmd filetype c nnoremap <leader>g :!gcc % -ggdb -o %:r && gdb -tui %:r<CR>
autocmd filetype cpp nnoremap <leader>m :!g++ % -ggdb -o %:r && ./%:r
autocmd filetype cpp nnoremap <leader>g :!g++ % -ggdb -o %:r && gdb -tui %:r<CR>

" Fugitive Shortcuts:
nmap <silent> <leader>gs :Gstatus<cr>
nmap <silent><leader>gb :Gblame<cr>

" Session:
" It will not save the changes to any files that you've made
" vim -S ~/mysession.vim
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
nnoremap <leader>s :mksession ./mysession.vim

nnoremap <leader><leader> :call KeyScrollToggle()<CR>

nnoremap <leader>n :YcmCompleter GoToDefinitionElseDeclaration<CR>

inoremap <C-h> <Esc>i
inoremap <C-l> <Esc>la

" Edit Vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source Vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}

" Folding {{{
"""""""""""""""""""""""""""""""""""""""""""
" Folding 
"""""""""""""""""""""""""""""""""""""""""""
augroup filetype_vim
	autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" File-specific setting:
" Modelines are special comments somewhere in a file that can can declare
" certain Vim settings to be used only for that file. So we'll tell Vim to
" check just the final line of the file for a modeline
set modelines=1

" foldmethod: fold sections by markers, rather than indentation
"set foldmethod=marker
"set foldlevel=0

" HELP:
" zc (close), zo (open), and za (toggle) one folding
" zC, zO and zA for all folding levels


" Any line inside any file with {{{ }}} will be folder
" To prevent this make these settings specific to .vimrc by adding the following
" line(including ") as the end of this file and remove set foldmehtod and set
" foldlevel configuration
" This line should always be at the end to enable folding for that file only 
" vim:foldmethod=marker:foldlevel=0

" }}}

" VUNDLE {{{
"""""""""""""""""""""""""""""""""""""""""""
" VUNDLE 
"""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/taglist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/Solarized'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'hari-rangarajan/CCTree'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'godlygeek/tabular'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tomasr/molokai'
Plugin 'chazy/cscope_maps'
Plugin 'flazz/vim-colorschemes'
"Plugin 'tomtom/tcomment_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/gdbmgr'
Plugin 'rdnetto/YCM-Generator'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'weynhamz/vim-plugin-minibufexpl'
"Plugin 'bling/vim-bufferline'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

"Plugin 'aSk/ultisnips_aSk'

"Plugin 'scrooloose/syntastic'
"Plugin 'vim-scripts/CCTree'
"Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'ervandew/supertab'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'gcmt/taboo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" HELP:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to

" }}}

" Taglist {{{
"""""""""""""""""""""""""""""""""""""""""""
" Taglist 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"nnoremap <silent> <F9> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1
"let Tlist_GainFocus_On_ToggleOpen = 1

" HELP:

" }}}

" CtrlP {{{
"""""""""""""""""""""""""""""""""""""""""""
" CtrlP 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip,*.git,*.o,*.obj
let g:ctrlp_switch_buffer = 'Et'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Files to be updated without having to reload
"let g:ctrlp_use_caching=0
" Set this to 1 to set searching by filename (as opposed to full path) as the default
"let g:ctrlp_by_filename = 0
"let g:ctrlp_regexp = 0
"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" HELP:
" When opening a file, if it's already open in a window somewhere, CtrlP will try to jump to it instead of opening a new instance
" <c-z>  - Mark/unmark a file to be opened with <c-o>.
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
" Note: you can quickly purge the cache by pressing <F5> while inside CtrlP

" }}}

" EasyMotion {{{
"""""""""""""""""""""""""""""""""""""""""""
" EasyMotion 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Need one more keystroke, but on average, it may be more comfortable.
"noremap s <Plug>(easymotion-s2)
"nnoremap s <Plug>(easymotion-bd-w)
"nnoremap s <Plug>(easymotion-t2)
nmap t <Plug>(easymotion-s)
nmap s <Plug>(easymotion-bd-w)
"nmap s <Plug>(easymotion-bd-w)
"nmap t <Plug>(easymotion-t2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
"noremap <Leader>s <Plug>(easymotion-j)
"noremap <Leader>k <Plug>(easymotion-k)

" HELP:
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
" nnoremap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`

" }}}

" ColorScheme {{{
"""""""""""""""""""""""""""""""""""""""""""
" ColorScheme 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"set background=dark
set background=light

"colorscheme solarized
"colorscheme mayansmoke
"colorscheme molokai

"let g:solarized_bold = 1
let g:solarized_termcolors=256

" Access colors present in 256 colorspace"
let base16colorspace=256  

if has("gui_running")

	colorscheme solarized
	set guifont=Ubuntu\ Mono\ 12

	"Disable toolbar, menu bar, scroll bars"
	"set guioptions=aiA
	set guioptions=ai

	" Maximize gvim window.
	set lines=999 columns=999

endif


"if has("gui_running")
"	if has("gui_gtk2")
"		set guifont=Inconsolata\ 12
"	elseif has("gui_macvim")
"		set guifont=Menlo\ Regular:h14
"	elseif has("gui_win32")
"		set guifont=Consolas:h10.5:cANSI
"	endif
"endif

" HELP:

" }}}

" Airline {{{
"""""""""""""""""""""""""""""""""""""""""""
" Airline 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_inactive_collapse=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_left_alt_sep = '▶'
let g:airline_right_alt_sep = '◀'
"let g:airline_left_alt_sep = '»'
"let g:airline_right_alt_sep = '«'
"let g:airline_left_alt_sep = '∥'
"let g:airline_right_alt_sep = '∥'
"let g:airline_symbols.readonly = 'R'

" Airline + Bufferline
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#bufferline#enabled = 0

" Airline + Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#fnamemod = ':t:.'

" Airline + Tmux
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0

let g:airline_theme = 'bubblegum'
"let g:airline_theme = 'murmur'
"let g:airline_theme = 'silver'
"let g:airline_theme = 'understated'

let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" HELP:

" }}}

" cctree {{{
"""""""""""""""""""""""""""""""""""""""""""
" cctree 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"noremap <F11> :CCTreeLoadDB cscope.out<CR>
"autocmd VimEnter * if filereadable('cscope.out') | CCTreeLoadDB cscope.out | endif

let g:CCTreeOrientation = "leftabove"
let g:CCTreeWindowVertical = 1
let g:CCTreeRecursiveDepth = 10

" g:CCTreeWindowHeight, default is -1.
" g:CCTreeWindowMinWidth = 40.
" g:CCTreeWindowWidth = -1, auto-select best width to fit.

" HELP:
" :CCTreeLoadDB cscope.out
"
" Display format 
" 1 -- Ultra-compact (takes minimum screen width)
" 2 -- Compact       (Takes little more space)
" 3 -- Wide          (Takes copious amounts of space) 
" g:CCTreeDisplayMode, default: 1

" Enable/disable dynamic call-tree highlighting, default: 1
"let g:CCTreeLoadDB cscope.out

" g:CCTreeKeyTraceForwardTree = '<C-\>>'
" g:CCTreeKeyTraceReverseTree = '<C-\><'
" g:CCTreeKeyHilightTree = '<C-l>' 
" g:CCTreeKeySaveWindow = '<C-\>y' 
" g:CCTreeKeyToggleWindow = '<C-\>w
" g:CCTreeKeyCompressTree = 'zs'   
" g:CCTreeKeyDepthPlus = '<C-\>=' 
" g:CCTreeKeyDepthMinus = '<C-\>-'
"
" }}}

" cscope {{{
"""""""""""""""""""""""""""""""""""""""""""
" cscope 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
set cscopequickfix=s-,c-,d-,i-,t-,e-

" HELP:
" PREREQUISITE - Run this command on Project root directory to create cscope.out
" 1. find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files
" 2. cscope -q -R -b -i cscope.files
" 3. cscope -d
"
" cscope -bv -c ./*.[ch] ./*.cpp 
"
" cscope -R		// Start cscope and recursively parse all subdirectories. 
" Use Ctrl D to exit
"
" -b : build database and exit i.e. and not launch the Cscope GUI
" -q : causes an additional, 'inverted index' file to be created, which makes
"	   searches run much faster for large databases
" -k : sets Cscope's 'kernel' mode--it will not look in /usr/include for any header
"	   files that are #included in your source files
" -i : cscope.files specifies the list of source files
"
" cscope -d : use the standalone Cscope browser // will not regenerate the
" database
"
" 's'   symbol: find all references to the token under cursor
" 'g'   global: find global definition(s) of the token under cursor
" 'c'   calls:  find all calls to the function name under cursor
" 't'   text:   find all instances of the text under cursor
" 'e'   egrep:  egrep search for the word under cursor
" 'f'   file:   open the filename under cursor
" 'i'   includes: find files that include the filename under cursor
" 'd'   called: find functions that function under cursor calls
"
" Ctrl+Space		// Opens result in new split window
" Ctrl+\			// Opens result in the same window

" }}}

" cscope_maps {{{
"""""""""""""""""""""""""""""""""""""""""""
" cscope_maps
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:

" HELP:
" vim (some versions) automatically read the cscope database in. This causes 
" cscope_maps.vi to fail, since it tries to add the same database. 
" To remove this error
" E568: duplicate cscope database not added
" comment the following lines in cscope_maps.vim
" if filereadable("cscope.out")
"	cs add cscope.out
" elseif $CSCOPE_DB != "
"	cs add $CSCOPE_DB
" endif"

" }}}

" NerdTree {{{
"""""""""""""""""""""""""""""""""""""""""""
" NerdTree 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
noremap <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" HELP:
" o.......Open files, directories and bookmarks....................
" go......Open selected file, but leave cursor in the NERDTree.....
" t.......Open selected node/bookmark in a new tab.................
" T.......Same as 't' but keep the focus on the current tab........
" i.......Open selected file in a split window.....................
" gi......Same as i, but leave the cursor on the NERDTree..........
" s.......Open selected file in a new vsplit.......................
" gs......Same as s, but leave the cursor on the NERDTree..........
" O.......Recursively open the selected directory..................
" x.......Close the current nodes parent...........................
" X.......Recursively close all children of the current node.......
" e.......Edit the current dir.....................................

" }}}

" AgSearch {{{
"""""""""""""""""""""""""""""""""""""""""""
" AgSearch 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
let g:ag_highlight=1

" HELP:
" :Ag SearchTerm
" q close the quickfix window
" e open file and close the quickfix window.
" o open file (same as enter).
" go preview file (open but maintain focus on ag.vim results).
" t open in a new tab.
" T open in new tab silently

" }}}

" Syntastic {{{
"""""""""""""""""""""""""""""""""""""""""""
" Syntastic 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" HELP:

" }}}

" Surround {{{
"""""""""""""""""""""""""""""""""""""""""""
" Surround 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:

" HELP:
" cs"' to change surround with '' instead of "
" ds"  to delete surround ""
" cs'<q> to change ' to <q>
" Change [] to {} and add some space (use } instead of { for no space): cs]{

" }}}

" Commentry {{{
"""""""""""""""""""""""""""""""""""""""""""
" Commentry 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" HELP:
" 

" }}}

" Taboo {{{
"""""""""""""""""""""""""""""""""""""""""""
" Taboo 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"let g:taboo_tab_format=" %N %f%m "

" HELP:

" }}}

" Tabular {{{
"""""""""""""""""""""""""""""""""""""""""""
" Tabular 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:

" HELP:
" Highlight text and then :Tab /=

" }}}

" tComment {{{
"""""""""""""""""""""""""""""""""""""""""""
" tComment 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:

" HELP:
" gcc
" gc
" gcip

" }}}

" Multicursors {{{
"""""""""""""""""""""""""""""""""""""""""""
" Multicursors 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

" HELP:

" }}}

" Ultisnips {{{
"""""""""""""""""""""""""""""""""""""""""""
" Ultisnips 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-k>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""
let g:UltiSnipsSnippetsDir="~/.vim/bundle/aSk/ultisnips_aSk/snippets_aSk"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "../aSk/ultisnips_aSk/snippets_aSk"]

" HELP:
" To edit ultisnips file
":UltiSnipsEdit

" }}}

" Ag.vim {{{
"""""""""""""""""""""""""""""""""""""""""""
" Ag
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
if executable("ag")
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" HELP:
" ctrlp would ignore files in .gitignore
" Caveats: g:ctrlp_show_hidden and g:ctrlp_custom_ignore do not work with
" custom user commands
" apt-get install silversearcher-ag

" }}}

" YouCompleteMe {{{
"""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"let g:ycm_global_ycm_extra_conf = \"~/.vim/bundle/aSk/YouCompleteMe_aSk/cpp/.ycm_extra_conf.py\"
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" Disable user confirmation to load python file
let g:ycm_confirm_extra_conf = 0
let g:ycm_register_as_syntastic_checker = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Open Preview Window at bottom
set splitbelow
" ctags --fields=+l // ctags should be exuberant ctags
let g:ycm_collect_identifiers_from_tags_files = 1
" Set to 0 if using Syntastic
let g:ycm_show_diagnostics_ui = 1
" To disable preview window
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0

" HELP:
"sudo apt-get install vim
"sudo apt-get install vim-youcompleteme
"sudo apt-get install vim-addon-manager
"sudo vam install youcompleteme
"sudo apt-get install clang
"cd ~/.vim/bundle/YouCompleteMe
"./install.sh --clang-completer
"
"Filtering is smart-case sensitive;
"Use the TAB key to accept a completion and continue pressing TAB to cycle
"through the completions. Use Shift-TAB to cycle backwards.
"Shift-TAB might not work on Console vim
"
"Client-server architecture
"YCM has a client-server architecture; the Vim part of YCM is only a thin client
"that talks to the ycmd HTTP+JSON server that has the vast majority of YCM logic
"and functionality. The server is started and stopped automatically as you start
"and stop Vim.
"
"Use Ctrl+Space to trigger the completion suggestions anywhere, even without a
"string prefix
"
"YCM looks for a .ycm_extra_conf.py file in the directory of the opened file or
"in any directory above it in the hierarchy (recursively); when the file is
"found, it is loaded (only once!) as a Python module. YCM calls a FlagsForFile
"method in that module which should provide it with the information necessary to
"compile the current file.
"
" }}}

" YCM-Generator {{{
"""""""""""""""""""""""""""""""""""""""""""
" YCM-Generator 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:

" HELP:
"./config_gen.py -v PROJECT_DIRECTORY
" OR
":YcmGenerateConfig
"

" }}}

" Tagbar {{{
"""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
nnoremap <silent> <F9> :TagbarToggle<CR>

" HELP:
" g:tagbar_autoclose setting to open the Tagbar window, jump to it
" and have it close automatically on tag selection
"

" }}}

" Tmux-Navigator {{{
"""""""""""""""""""""""""""""""""""""""""""
" Tmux-Navigator
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> <c-H> :TmuxNavigateLeft<cr>
"nnoremap <silent> <c-J> :TmuxNavigateDown<cr>
"nnoremap <silent> <c-K> :TmuxNavigateUp<cr>
"nnoremap <silent> <c-L> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"let g:tmux_navigator_save_on_switch = 1

" HELP:
"

" }}}

" vim-session {{{
"""""""""""""""""""""""""""""""""""""""""""
" vim-session 
"""""""""""""""""""""""""""""""""""""""""""
" CONFIG:
let g:session_autosave = 'no'

" HELP:

" }}}

" Functions {{{
"""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""
" SCROLL:
let g:key_scroll_flag = 0

function! KeyScrollToggle()
    if g:key_scroll_flag
        let g:key_scroll_flag = 0
		nnoremap j j
		nnoremap k k
    else
        let g:key_scroll_flag= 1
		nnoremap j 5<C-e>
		nnoremap k 5<C-y>
    endif
endfunction

" }}}

" PTR {{{
"""""""""""""""""""""""""""""""""""""""""""
" PTR 
"""""""""""""""""""""""""""""""""""""""""""
" CSCOPE:
" Also use -I option for generating ctags
" noremap <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"
" }}}




" va}	" select text inside curly braces
" vi{

" Before entering insert mode to paste, run :set paste. Turn it off once you leave insert mode with :set nopaste

" Use . command

" QuickFix Window
" :cope[n] [height]
" :lop[en] []
" :ccl[ose] 
" :lcl[ose]

" "$MYVIMRC
" :help echo.
" :help echom.
" :help messages
"
" Toggling Boolean Options
" :set number!
" :set number?
" map, nmap, vmap, imap
" use noremap instead of map alwasy. Same for others
" :let maplocalleader = "\\"
"
" :wq<cr> (or ZZ)
"
" Correcting typos
" iabbrev waht what
" iabbrev tehn then
" iabbrev ccopy Copyright 2013 Steve Losh, all rights reserved.
"
" Number of ways to exit insert mode in Vim
" <esc>
" <c-c>
" <c-[>
"
" inoremap <esc> <nop>
"
" Indent file before exiting
" autocmd BufWritePre *.html :normal gg=G
" autocmd BufWritePre,BufRead *.html :normal gg=G
"
" A common idiom in Vim scripting is to pair the BufRead and BufNewFile events
" together to run a command whenever you open a certain kind of file, regardless
" of whether it happens to exist already or not
" autocmd BufNewFile,BufRead *.html setlocal nowrap
"
" Different types of comments depending on the file type
" autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
" autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
" :help autocmd-events
"
" Abbreviations
" autocmd FileType python     :iabbrev <buffer> iff if:<left>
" autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
"
" augroup testgroup
"     autocmd!
"     autocmd BufWrite * :echom "Cats"
" augroup END
"
" dw     Delete     to next word
" ci(    Change     inside parens
" yt,    Yank       until comma
"
" Move cursor Inside paranthesis and press di(
" di(	Delete everything inside (
" onoremap p i(
" onoremap in( :<c-u>normal! f(vi(<cr>))
"
" always use explicit case sensitive or insensitive comparisons. Using the
" normal forms i.e. == is wrong and it will break at some point
" ==? is the "case-insensitive no matter what the user has set" 
" ==# is the "case-sensitive no matter what the user has set"
"
" echom "foo" | echom "bar"
" 
" Strings that start with a number are coerced to that number, otherwise they're
" coerced to 0.
"
" Vimscript functions must start with a capital letter if they are unscoped!
" function Meow()
"   echom "Meow!"
" endfunction"
" call Meow()
"
" The execute command is used to evaluate a string as if it were a Vimscript
" command.
" execute "echom 'Hello, world!'"
"
" if 0
"     echom "if"
" elseif "nope!"
"     echom "elseif"
" else
"     echom "finally!"
" endif
"
" When writing Vim scripts you should always use normal!, and never use plain
" old normal. 
" something like the nnoremap version of nmap for normal
" normal! run the sequence of commands as if they were entered in normal mode,
" ignoring all mappings, and replacing string escape sequences with their
" results
" normal! G
"
" execute "normal! gg/foo\<cr>dd"
" execute "normal! mqA;\<esc>`q"`
"
" In a nutshell: :grep ... will run an external grep program with any arguments
" you give, parse the result, and fill the quickfix list so you can jump to
" results inside Vim
"
" The :! command (pronounced "bang") in Vim runs external commands and displays
" their output on the screen
" :!ls
"
" ~ will toggle case
"
" In the quickfix window, you can use:
"
" e    to open file and close the quickfix window
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ag.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split siletly
" q    to close the quickfix window
"
"


" Grep Operator
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" viw<leader>g: Visually select a word, then grep for it.
" <leader>g4w: Grep for the next four words.
" <leader>gt;: Grep until semicolon.
" <leader>gi[: Grep inside square brackets.]


function! s:GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[v`]y
	else
		return
	endif

	silent execute "grep! -R " . shellescape(@@) . " ."
	copen

	let @@ = saved_unnamed_register
endfunction`






let g:quickfix_is_open = 0

function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_return_to_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction


" TIPS
" Ctrl + E - Scroll Windows down
" Ctrl + Y - Scroll Windows up
" Ctrl + F - Scroll down one page
" Ctrl + B - Scroll up Windows one page
" Ctrl + M - Move cursor to middle of window
" caw   change all word (even if cursor is in middle of word)
" di(	Delete everything inside ()
" da(	Delete everythin inside () and () too
" dta	Delete until a
" dfa	Delete until a including a
"
" va(	Visually select all inside ( and (
"
" .    Repeats the last command/Motion
"
" P		Paste above line
" A		End of line and insert mode
" I		Beginning of line and insert mode
"
" FUGITIVE.vim
" :GBlame
" o		to get the diff msg for that line
" :Glog		Load every version of the file
"
" tmux new-session -s pasta
" can even save session on reboot using some plugin
" Can write in multiple split terminals simultaineously
" which are already ssh ed into different machines
"
" :PluginUpdate
" set clipboard=unnamed
"
" Now yy will copy to system clipboard
"
" gf go to file under cursor
"
" TODO
" YouComplteme
" Scorll bind
" scroll faster
"



" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>



" toggle syntastic
" nmap <leader>sy :SyntasticToggleMode<cr>


"set guioptions=egmrt
"set background=light
"colorscheme solarized
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_powerline_fonts=0
"let g:airline_theme='solarized'
"
"
"GDB DEBUGGER
"
"+----------+------------+-----------------+
"| Netrw Dir| Messages   | Function Stack  |
"|          |            |                 |
"| ( a      +------------+-----------------+
"|  netrw   | Source Window                |
"|  listing |  (prog1.c listing)           |
"| )        |                              |
"|          +-------+---------+------------+
"|          | Expr  | Breakpt | Watchpoint |
"|          |       |         |            |
"+----------+-------+---------+------------+
"
"cd ~/.vim/bundle/gdbmgr/gdbmgr/src
"make
"export LD_LIBRARY_PATH="$HOME/.vim/bundle/gdbmgr/gdbmgr/src:default"
"Inside vim
":DI		Debugger Initialize
":DR		Debugger Run
":DQ		Debugger Quit
"
"
"
"

"
"
"guu     : lowercase line
"gUU     : uppercase line
"~       : invert case (upper->lower; lower->upper) of current character
"gf      : open file name under cursor (SUPER)
"CTRL-A,CTRL-X : increment, decrement next number on same line as the cursor
"=%            : (re)indent the current braces { ... }
"
"'.       : jump to last modification line (SUPER)
"`.       : jump to exact spot in last modification line
"<C-O>    : retrace your movements in file (backward)
"<C-I>    : retrace your movements in file (forward)
":ju(mps) : list of your movements {{help|jump-motions}}
":history : list of all your com
"
"q             : quit recording
"@a            : execute commands again
"@@            : repeat
"
":g/^\s*$/d       : delete all blank lines
":g/green/d       : delete all lines containing green
":v/green/d       : delete all lines not containing green
"
"
"REMEMBER
"<C-O>    : retrace your movements in file (backward)
"<C-I>    : retrace your movements in file (forward)
"C+E
"C+Y
"@@       : repeat
"ctrl+L	in insert mode
"ctrl+H	in insert mode
" caw   change all word (even if cursor is in middle of word)
" di(	Delete everything inside ()
" da(	Delete everythin inside () and () too
"
"LineWise Completion
"C-x C-l
"FileWise Completion
"C-x C-f
"Dictionary Completion
"C-x C-k
"
":UltiSnipsEdit
" vnoremap <leader>t :Tab /=
"
"Check if key already has Mapping
"verbose map <C-k>
"
"










