" General Vim Behavior
" ====================
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
" set spell

" Flash the screen on error instead of playing noise
set visualbell

" Use mouse in "command-line"(c) mode. Allows for use of terminal context menu
" and higlighting. Another popular option is 'a', which allows for selection
" and cursor placement.
set mouse=c

" Set the window title to the name of the file being edited
set title

" Set preferred color scheme
colorscheme jellybeans

" Use editor colors that suit a dark background
set background=dark

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Preserve indent state
set autoindent


" Wildmenu Options
" ================
" Enable auto completion menu for commands after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Text Rendering Options
" ======================
" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=20

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Attempt to always support Unicode
set encoding=utf-8

" Turn syntax highlighting on.
syntax on

" Enable folding based on indent levels
set foldmethod=indent


" Search Options
" ==============
" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Show matching words during a search.
set showmatch

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
set termguicolors
hi StatusLine guibg=#2d2c2b guifg=#e5ddd3

" Tab Line Config
" ===============
" Always show the tab line
set showtabline=2

" Set the colors of the tab line
hi TabLineFill guibg=#2d2c2b guifg=#000000
hi TabLine guibg=#444444 guifg=#222222
hi TabLineSel guibg=#d4bda8 guifg=#2c2926

" NERDTree Plugin Config
" ======================
map <F2> :NERDTreeToggle<CR>

" Set the color of the directory highlighting
hi Directory guifg=#B865AA
hi NERDTreeClosable guifg=#d4bda8
hi NERDTreeOpenable guifg=#d4bda8

