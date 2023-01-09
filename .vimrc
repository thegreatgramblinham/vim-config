" This file contains the behavior settings for vim that get initialized on
" startup.
"
"Keybinding notation:
"<S-...>  shift-key                      shift <S-
"<C-...>  control-key                    control ctrl <C-
"<M-...>  alt-key or meta-key            meta alt <M-
"<A-...>  same as <M-...>                <A-
"<D-...>  command-key (Macintosh only)   <D-

" General settings
" ================
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Always show line numbers
set number

" Enable spellchecking (disabled for now).
"set spell

" Set mouse mode
" Set mouse in "command-line"(c) mode allows for use of terminal context menu
" and higlighting. Another popular option is 'a', which allows for selection
" and cursor placement.
set mouse=a

" Set the window title to the name of the file being edited
set title

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200


" Custom Keybindings
" ==================
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" Color Scheme Options
" ====================
" Use editor colors that suit a dark background
set background=dark

" Set preferred color scheme
colorscheme jellybeans

" Use colors from the gui selections only. This option ignores
" 'cterm' color settings.
set termguicolors


" Text Rendering Options
" ======================
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=20

" Keep N lines to the left or right of the cursor
set sidescrolloff=1

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" If wrapping gets turned on, avoid wrapping in the middle of a word.
set linebreak

" Attempt to always support Unicode
set encoding=utf-8

" Turn syntax highlighting on.
syntax on

" Highlight trailing whitespace
match Error /\s\+$/

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Always show cursor position
set ruler

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Set how long to show the matching paren (in tenths of seconds)
set matchtime=3


" Text Editing Options
" ====================
" Preserve indent state
set autoindent

" Allow backspacing over indention, line breaks and instertion start
set backspace=indent,eol,start

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Force the tab key to adhere the the specified tab width (tabstop)
set smarttab

" Force the tab to print spaces according to what is set above.
set expandtab

" Enable folding based on indent levels
set foldmethod=indent

" Limit the folding recursion
set foldnestmax=3


" Search Options
" ==============
" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore case while searching
set ignorecase

" Use highlighting when doing a search.
set hlsearch


" Status Line Config
" ================
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side. (filepath, filetype, ismodified)
set statusline+=\ %F\ %Y\ %M

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side. (hex char, row#, col#, line% of file)
set statusline+=\ 0x%B\ R:\%l\ C:\%c\ %p%%

" Show the status on the second to last line.
set laststatus=2

" Set the colors for the status line
hi StatusLine guibg=#2d2c2b guifg=#e5ddd3


" Pmenu Config
" ============
" Set colorscheme
hi Pmenu guibg=#444444 guifg=#222222
hi PmenuSel guibg=#d4bda8 guifg=#2c2926


" Tab Line Config
" ===============
" Always show the tab line
set showtabline=2

" Set the colors of the tab line
hi TabLineFill guibg=#2d2c2b guifg=#000000
hi TabLine guibg=#444444 guifg=#222222
hi TabLineSel guibg=#d4bda8 guifg=#2c2926


" Wildmenu (command) Options
" ==========================
" Enable auto completion menu for commands after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" NERDTree Plugin Config
" ======================
map <F2> :NERDTreeToggle<CR>

" Set the color of the directory highlighting
hi Directory guifg=#d4bda8
hi NERDTreeClosable guifg=#d4bda8
hi NERDTreeOpenable guifg=#d4bda8

