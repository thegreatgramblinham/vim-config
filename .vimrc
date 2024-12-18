"
" This file contains all Vim startup commands.
"
" Useful help pages
" =================
" :help key-notation
" :help builtin-functions

" TODO Settings/Script Ideas
" ==========================
" - Change leader 'go to' commands to utilize a standard, non-system register
" - Bash/shell programming text macros
"
"
" General settings
" ================
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Disable swap files
set noswapfile

" Disable additions of end of line characters by default
set nofixendofline

" Prevent vim from auto inserting linebreaks/wraps where it thinks appropriate.
set textwidth=0

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Line numbering scheme options:
"   set number == Always show absolute line numbers.
"   set relativenumber == Always show "lines away" line numbers
"   set number relativenumber == Hybrid. Shows absolute at current line and
"       relative numbers on all others.
" (In use) Dynamic scheme. Use absolute numbers in insert mode, but hybrid in command
" mode.
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" Set mouse mode
" Set mouse in "command-line"(c) mode allows for use of terminal context menu
" and selection. Another popular option is 'a', which allows for selection
" and cursor placement.
set mouse=c

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

" No 'visualbell' screen flashes or OS error noises
set belloff=all

" Save the last N commands used in vim for historical lookback
set history=200

" Allow for unsaved changes to exist in background buffers. Aka, no save
" requirement when swapping away from the current buffer.
set hidden

" Detect when a file has changed external to Vim and auto update accordingly
set autoread
autocmd FocusGained,BufEnter * silent! execute "checktime"


" GVim Options
" ============
if has("gui_running")
    " Set the desired font for GUI applications like gVim
    set guifont=JetBrains_Mono_NL:h10

    " Hide menu bar
    set guioptions -=m

    " Hide tool bar
    set guioptions -=T
endif


" Custom Keybindings
" ==================
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" 'Smooth Scroll' Settings
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Leader Keybindings
" ==================
" Map leader keys. Both space and backspace, the thumb keys on
" my custom keyboard.
nnoremap <SPACE> <Nop>
map <SPACE> <leader>
nnoremap <BS> <Nop>
map <BS> <leader>

" Hide search highlighting
map <leader>? :noh<CR>

" Yank and Put to system register
map <leader>y "+y
map <leader>Y "+Y
map <leader>p "+p
map <leader>P "+P

" Hard delete to the black hole register
map <leader>d "_d

" Launch file tree
" at current file's directory
map <leader>E :Lexplore %:p:h<CR>
" at root directory (this also works as a toggle command)
map <leader>e :Lexplore<CR>

" Launch find and replace
map <leader>r :%s//gc<Left><Left><Left>
" Launch find and replace from system register content
map <leader>R :%s/<C-r>+//gc<Left><Left><Left>
" Yank word under cursor and put it into a find and replace statement as the target.
function! ReplaceAllUnderCursor()
    normal "+yiw
    let l:replaceTarget = getreg("+")
    let l:replaceWith = input("Beginning find and replace of \"".l:replaceTarget."\" in current file.\nEnter replacement text:\n")
    if (!empty(l:replaceWith))
        execute ":%s/".l:replaceTarget."/".l:replaceWith."/gc"
    endif
endfunction
map <leader>gr :call ReplaceAllUnderCursor()<CR>

" Launch find with contents of system register
map <leader>/ /<C-r>+<CR>

" Set ripgrep to the default search command when 'grep' is used
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" Create a new search command that will use rg and supress output
command! -bar -nargs=1 Sgrep silent grep <q-args> | redraw!
" Launch find all in working directory. Trailing space is intentional.
map <leader>f :Sgrep 

" Launch find all in working directory from system register content
map <leader>F :Sgrep <C-r>+<CR>

" Yank word under cursor and put it into a vimgrep query
map <leader>gf "+yiw<leader>F

" Open and close the quickfix window
map <leader>x :copen 20<CR>
map <leader>X :cclose<CR>

" Save all open buffers
map <leader>w :wa<CR>
" Close the current buffer
map <leader>q :bd<CR>
" Close all open buffers
map <leader><C-q> :bufdo bd<CR>
" Swap to the alternate file and close what was previously the alt
map <leader>gq :b#\|bd#<CR>
" Save all, close all and quit
map <leader>Q :wqa<CR>

" If fzf is installed, use that for our file search behaviour
if filereadable("/usr/share/doc/fzf/examples/fzf.vim")
    " Open fuzzy search with file preview
    map <leader>t :FZF --preview cat\ {}<CR>
    " Open fuzzy search with the system register contents
    map <leader>T :FZF -q <C-r>+ --preview cat\ {}<CR>
    " Open fuzzy search at the supplied directory. Start at home.
    map <leader><C-t> :FZF ~/
    " Yank word under cursor and fuzzy search for the file
    function! GoToFileUnderCursor()
        normal "+yiw
        let l:filename = getreg("+")
        execute ":FZF -q ".l:filename
    endfunction
    map <leader>gt :call GoToFileUnderCursor()<CR>
    map <leader>gT :botright split <bar> call GoToFileUnderCursor()<CR>
else
    " Recursively add all the working directory to our searchable path.
    set path+=**
    " Open search filter for filename
    map <leader>t :find *
    " Open search filter for filename with the system register contents
    map <leader>T :find *<C-r>+
endif

" Go to the tag under current
map <leader>a <C-]>
map <leader>ga :pop<CR>
map <leader><C-a> :tselect<CR>

" Open a shell window
map <leader>s :terminal<CR>
map <leader>S :botright vert terminal<CR>

" Spell correct the first entry in the suggestions
map <leader>zz 1z=
" Toggle spellcheck
map <leader>zs :set spell!<CR>

" Toggle word wrap
map <leader>zw :set wrap!<CR>

" Open a new tab
map <leader>nt :tabnew<CR>
" Open a new horizontal window split
map <leader>ns <C-w>s
" Open a new vertical window split
map <leader>nv <C-w>v

" Resize the current vertically split window
map <leader>> :30winc ><CR>
map <leader>< :30winc <<CR>
" Resize the current horizontally split window
map <leader>- :10winc -<CR>
map <leader>+ :10winc +<CR>
" Fullscreen the current window vertically
map <leader>_ <C-w>_
" Fullscreen the current window horizontally
map <leader>\| <C-w>\|
" Equalizes all windows on the current tab
map <leader>= <C-w>=
" Move windows vertically
map <leader>j <C-w>j
map <leader><Down> <C-w>j
map <leader>k <C-w>k
map <leader><Up> <C-w>k

" Move windows vertically and fullscreen vertically
map <leader>J <C-w>j<C-w>_
map <leader>K <C-w>k<C-w>_
" Move windows horizontally
map <leader>h <C-w>h
map <leader><Left> <C-w>h
map <leader>l <C-w>l
map <leader><Right> <C-w>l

" Move windows horizontally and fullscreen horizontally
map <leader>H <C-w>h<C-w>\|
map <leader>L <C-w>l<C-w>\|

" Cycle through open buffers
map <leader><PageUp> :bnext<CR>
map <leader><PageDown> :bprevious<CR>

" List all open buffers
function! ListBuf()
    " List buffers with time-based sorting (t) TODO print dir
    let l:bufferIndexColWidth = 11
    let l:fileNameColWidth = 50
    echo "\n"
    echo '==================='
    echo '[[ OPEN BUFFFERS ]]'
    echo '==================='
    let l:bufferList = execute("ls t")
    echo system("echo \'".l:bufferList."\'
                    \ | awk -F \'\"\'
                    \ \'{
                        \idx=split($2,parts,\"/\");
                        \printf(\"%".l:bufferIndexColWidth."s %-".l:fileNameColWidth."s %s\\n\", $1, parts[idx], $2);
                    \ }\'
                \")
    echo "\n"
endfunction
" List all open buffers in a menu and allow selection
function! ChooseBuf()
    call ListBuf()
    echo 'Enter buffer # to swap to: (e.g. "4")'
    let l:choice = input('>')
    if (!empty(l:choice))
        execute ':b'.l:choice
    endif
endfunction
nnoremap <Leader>b :call ChooseBuf()<CR>
" Swap to the previous open buffer
function! SwapToPrevBuf()
    let l:bufferList = execute("ls t")
    let l:prevBufLine = system('echo "'.l:bufferList.'" | sed -n 3p')
    let l:prevBufNumber = system('echo "'.l:prevBufLine."\" | awk \'{print $1}\'")
    if (!empty(l:prevBufNumber))
        execute ':b'.l:prevBufNumber
    endif
endfunction
nnoremap <Leader><C-b> :call SwapToPrevBuf()<CR>
" List all open buffers in a menu and allow deletion
function! DeleteBuf()
    call ListBuf()
    echo 'Enter buffer #(s) to delete: (e.g "7" or "12 5 8")'
    let l:choice = input('>')
    if (!empty(l:choice))
        silent execute ':bd '.l:choice
    endif
endfunction
nnoremap <Leader>gb :call DeleteBuf()<CR>

" Reload the vimrc file
map <leader>zv :source $MYVIMRC<CR>

" Git Fugitive plugin leader command. Trailing space is intentional.
map <leader>gg :Git 

" Include the current file in a diff
map <leader>zd :diffthis<CR>
" Exit the current diff
map <leader>zgd :diffoff<CR>

" 'Invert' the current word underneath the cursor
function! InvertUnderCursor()
    let l:wordToInvert = expand("<cword>")
    if (l:wordToInvert == "true")
        normal! ciwfalse
    elseif (l:wordToInvert == "false")
        normal! ciwtrue
    elseif (l:wordToInvert == "1")
        normal! r0
    elseif (l:wordToInvert == "0")
        normal! r1
    else
        " Otherwise move to the start of the word and inspect the
        " the character right before the start.
        normal! eb
        let l:startingChar = getline('.')[charcol('.') - 2]
        if (l:startingChar == "!")
            normal! hx
        else
            normal! i!
        endif
    endif
endfunction
map <leader>i :call InvertUnderCursor()<CR>

function! OpenAllGitModified()
    " TODO still working on a way to abort the system call if git status
    " fails. 'exit 1' seems to not work as expected.
    let l:modifiedFilesString = system("(git status --porcelain || exit 1) | sed \'/^\\s*D/d\' | awk \'{print $2}\'")
    if v:shell_error != 0
        echo "Getting modified files failed."
    else
        let l:modifiedFiles = split(l:modifiedFilesString, '\n')
        for f in l:modifiedFiles
            execute ":argadd " . f
        endfor
    endif
endfunction
map <leader>zt :call OpenAllGitModified()<CR>


" Leader Text Macros
" ==================
let macroCommandPrefix = 'm'

" General Text Macro Functions
" ----------------------------
map <leader>m( :call GpGenerateMethodEnding()<CR>
map <leader>m{ :call GpGenerateReturnBraces()<CR>
map <leader>m<C-{> :call GpGenerateEndLineBraces()<CR>

" OpenSCAD Leader Macro Functions
" -------------------------------
let openScadCommandPrefix = 'o'

" OpenSCAD Statements
map <leader>mom :call OsGenerateModule()<CR>
map <leader>mof :call OsGenerateFor()<CR>

" OpenSCAD Bodies
map <leader>moc :call OsGenerateCube()<CR>
map <leader>moy :call OsGenerateCylinder()<CR>
map <leader>mop :call OsGenerateSphere()<CR>

" OpenSCAD Transformations
map <leader>mot :call OsGenerateTranslate()<CR>
map <leader>mor :call OsGenerateRotate()<CR>
map <leader>mos :call OsGenerateScale()<CR>

" OpenSCAD Spatial Boolean Operators
map <leader>mou :call OsGenerateUnion()<CR>
map <leader>mod :call OsGenerateDifference()<CR>
map <leader>moi :call OsGenerateIntersection()<CR>

" C# Leader Macro Functions
" -------------------------
let csCommandPrefix = 's'

" When a C# files is opened, open the autocomplete file in a
" background buffer for our popup to source from.
autocmd BufNewFile,BufRead *.cs call LoadCSharpAutoCompletions()
function! LoadCSharpAutoCompletions()
    execute ":argadd " . $VIMHOME . "/autocompl/cSharpCompletionKeywords.ac"
endfunction

" C# Statements
map <leader>mse :call CsGenerateForeach()<CR>
map <leader>msf :call CsGenerateFor()<CR>
map <leader>mss :call CsGenerateSwitch()<CR>

" C# Function Structures
map <leader>msm :call CsGenerateMethodStructure()<CR>

" C# Comments
map <leader>msc :call CsGenerateClassComments()<CR>
map <leader>msC :call CsGenerateFullClassComments()<CR>
map <leader>mst :call CsGenerateUnitTestComments()<CR>
map <leader>msu :call CsGenerateSummaryComment()<CR>

" C++ Leader Macro Functions
" --------------------------
let cppCommandPrefix = 'p'

" C++ Statements
map <leader>mpe :call CppGenerateForeach()<CR>
map <leader>mpf :call CppGenerateFor()<CR>
map <leader>mps :call CppGenerateSwitch()<CR>

" C++ Function Structures
map <leader>mpl :call CppGenerateClassStructure()<CR>
map <leader>mpm :call CppGenerateMethodStructure()<CR>

" C++ Comments
map <leader>mpu :call CppGenerateSummaryComment()<CR>

" C Leader Macro Functions
" ------------------------
let cCommandPrefix = 'c'

" When a C# files is opened, open the autocomplete file in a
" background buffer for our popup to source from.
autocmd BufNewFile,BufRead *.c call LoadCAutoCompletions()
autocmd BufNewFile,BufRead *.h call LoadCAutoCompletions()
function! LoadCAutoCompletions()
    execute ":argadd " . $VIMHOME . "/autocompl/cCompletionKeywords.ac"
endfunction

" C Statements
map <leader>mcf :call CGenerateFor()<CR>
map <leader>mcs :call CGenerateSwitch()<CR>

" C Function Structures
map <leader>mct :call CGenerateStructTemplate()<CR>
map <leader>mcn :call CGenerateFunctionTemplate()<CR>

" C Comments
map <leader>mcc :call CGenerateSourceFileComment()<CR>
map <leader>mch :call CGenerateHeaderFileComment()<CR>

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

" Set special rendering for tab indent levels and trailing spaces
set list
set listchars=multispace:❘\ \ \ ,trail:·
hi SpecialKey guibg=NONE


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

" Ignore case while searching unless a different case is typed
" in the search parameter.
set ignorecase
set smartcase

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
hi StatusLine guibg=#775f73 guifg=#e5ddd3
hi StatusLineNC guibg=#484644 guifg=#252025


" Pmenu Config
" ============
" Set colorscheme
hi Pmenu guibg=#444444 guifg=#C9A0A0
hi PmenuSel guibg=#d4bda8 guifg=#2c2926


" AutoComplPop Config
" ===================
" Always enable
let g:acp_enableAtStartup = 1

" Always ignore case
let g:acp_ignorecaseOption = 1

" Allow popup to display after just one character
let g:acp_behaviorKeywordLength = 1

" Allow the completion to search everywhere for suggestions
" ('i' appears to allow cross buffer support)
let g:acp_completeOption = '.,w,b,u,t,i'


" Tab Line Config
" ===============
" Always show the tab line
set showtabline=2

" Set the colors of the tab line
hi TabLineFill guibg=#2d2c2b guifg=#000000
hi TabLine guibg=#444444 guifg=#222222
hi TabLineSel guibg=#d4bda8 guifg=#2c2926


" Terminal Config
" ===============
" Set the default Vim terminal to bash
set shell=zsh

" Set the terminal colorscheme
let g:terminal_ansi_colors = [
  \'#062B35', '#AD706F', '#879886', '#B58900',
  \'#D1A4D7', '#D33682', '#CDC4DA', '#EEE8D5',
  \'#8C7BC6', '#6A6360', '#E7B0DE', '#657B83',
  \'#8C8073', '#6C71C4', '#A682B8', '#FDF6E3' ]

" Set terminal colors
hi Terminal guibg=#151515
hi Terminal guifg=#DCD3CB
hi StatusLineTerm guibg=#775f73 guifg=#e5ddd3
hi StatusLineTermNC guibg=#484644 guifg=#252025


" Wildmenu (command) Options
" ==========================
" Enable auto completion menu for commands after pressing TAB.
set wildmenu

" Show wildmenu options in popup
set wildoptions=pum

" Make wildmenu behave like similar to Bash completion.
set wildmode=longest:full

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.dll,*.pdb,*.mp4


" Netrw Config
" ============
" Whether to show the hint header
let g:netrw_banner = 0

" File format style. 3 = tree.
let g:netrw_liststyle = 3

" Keep focus in tree when opening files (not working?)
let g:netrw_preview = 1

" Reuse the same window when opening a file
let g:netrw_browse_split = 0

" Default size at open.
let g:netrw_winsize = 22

" Set the color of the directory highlighting
hi Directory guifg=#d4bda8

" fzf Config
" ==========
" Attempt to load the fzf.vim file that comes with the default installation
if filereadable("/usr/share/doc/fzf/examples/fzf.vim")
    source /usr/share/doc/fzf/examples/fzf.vim
endif

" Airline Config
" ==============
" Turn on airline chevron tags
let g:airline_powerline_fonts = 1

" Turn on tab line extension as well.
let g:airline#extensions#tabline#enabled = 1

" Set custom theme variant
let g:airline_theme = 'deuscustom'

" Replace the defaul mode tags with single letter variants
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S-L',
    \ ''     : 'S-B',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V-L',
    \ ''     : 'V-B',
    \ }
