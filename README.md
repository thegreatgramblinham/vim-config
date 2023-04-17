# Overview
This repository contains basic config files for setting up Vim according to my preferences.
This repository is based relative to the user's home directory.

# Inclusions
 - [Jellybeans Colorscheme](https://github.com/nanotech/jellybeans.vim)
 - [OpenSCAD Syntax Highlighting](https://github.com/sirtaj/vim-openscad)
 - [Arduino Syntax Highlighting](https://github.com/sudar/vim-arduino-syntax)
 - [AutoComplPop](https://www.vim.org/scripts/script.php?script_id=1879)
 - [Fugitive](https://github.com/tpope/vim-fugitive)
 - [vim-airline](https://github.com/vim-airline/vim-airline)
 - [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

# Tips
- When compling Vim from source, navigate to the git repo and run the following commands:
 ```
 cd src
 make distclean  # if Vim has already been compiled on the machine.
 make
 sudo make install
 ```
- To compile Vim with important features like clipboard support, run the following commands:
  (also from the git repo directory)
 ```
 sudo apt install libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev
 ./configure --with-features=huge --with-x
 make
 sudo make install
 ```
- Vim can edit remote files with the syntax:
 ```
 :e scp://user@host/<relative>/<path>/<from_home>.txt
 :e scp://user@host//<absolute>/<path>/<from_root>.txt
 ```

# Shortcut Cheatsheet
```
# General
Quit                                => :q
Write (save)                        => :w
Quit and Write                      => :wq
Quit without writing                => :q!
Quit write all (open buffers)       => :wqa
Save file as                        => :sav

Open terminal window                => :ter

# Modes
To Command mode                     => esc
To Visual mode                      => v
To Insert mode before cursor        => i
To Insert mode start of line        => I
To Insert mode after cursor         => a
To Insert mode at EoL               => A
To Insert mode below, new line      => o
To Insert mode above, new line      => O

# Movement
Move foward 1/2 screen              => Ctrl + d
Move back 1/2 screen                => Ctrl + u

Forwards 1 word, to start           => w || Shift + Right
Forwards 1 word, to start w/punc    => W || Ctrl + Right
Forwards N words, to start          => #w
Forwards 1 word, to end             => e
Backwards 1 word, to start          => b || Shift + Left
Backwards 1 word, to start w/punc   => B || Ctrl + Left
Backwards N words, to start         => #b
Backwards 1 word, to end            => ge

Go to first line                    => gg
Go to last line                     => G
Go to line #                        => #gg

Jump next paragraph (code block)    => }
Jump prec paragraph (code block)    => {

# Editing
Undo                                => u
Redo                                => Ctrl + r

Replace single character            => r + [newChar]
Replace >1 character                => r + [newChars] (Esc exit)

Tab (indent, shift right)           => >>
De-tab (de-indent, shift left)      => <<

Delete (cut) line                   => dd
Delete (cut) N lines                => #dd
Delete (cut) to EoL                 => D
Delete (cut) word                   => dw
Delete (cut) character              => x
Yank (copy) line                    => yy
Yank (copy) N lines                 => #yy
Yank (copy) to EoL                  => Y
Yank (copy) word                    => yw
Put (paste) after cursor            => p

System clipboard register copy      => "+y
System clipboard register paste     => "+p

# Searching
Search                              => /[query]
Search forward                      => n
Search backwards                    => N
Remove search highlighting          => :noh

# Multiple File Views
Open (edit) new buffer              => :e [file]
Vertically split                    => :vs [file]
Move split window to tab            => Ctrl + wT

New tab                             => :tabnew [file]
Move next tab                       => gt
Move prev tab                       => gT
Move to tab N                       => #gt

# Code Folding
Toggle (zip) single fold            => za
Toggle (zip) all fold under cursor  => zA
Reset file folding                  => zX

# Visual Mode
Yank (copy) marked text             => y
Delete marked text                  => d
```

# Tips
 - Vim can edit remote files with the syntax:
 ```
 :e scp://user@host/<relative>/<path>/<from_home>.txt
 :e scp://user@host//<absolute>/<path>/<from_root>.txt
 ```
