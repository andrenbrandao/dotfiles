" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Remap S to global substitute "
nnoremap S :%s//g<Left><Left>

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  " create directories if they do not exist "
  if empty(glob('~/.vim/tmp'))
    silent !mkdir -p ~/.vim/tmp/{backup,swap}
  endif
  if empty(glob('~/.vim/undo'))
    silent !mkdir -p ~/.vim/undo
  endif
  set backup		" keep a backup file (restore to previous version)
  set backupdir=$HOME/.vim/tmp/backup
  set directory=$HOME/.vim/tmp/swap
  if has('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Keep visual selection when indenting"
vnoremap < <gv
vnoremap > >gv

" Set relative number "
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

