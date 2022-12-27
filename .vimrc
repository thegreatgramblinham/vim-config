
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Always show line numbers
set number

" Set preferred color scheme
colorscheme jellybeans

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set tab width to 4 columns.
set tabstop=4

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=15

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Enable auto completion menu for commands after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

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
