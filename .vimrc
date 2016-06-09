
" @bram

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" call pathogen#infect()
syntax enable
filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  if has("gui_macvim") && has("gui_running")
    colorscheme yule
  else
    colorscheme 256-grayvim
    hi CursorLine cterm=NONE
    if $TERM_PROGRAM =~ "iTerm"
      if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
      endif
    endif
  endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" /@bram

" @chris
let mapleader=" "

function! NavTweaks()
  noremap Y y$
  nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
  nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
  inoremap <C-K> <Left>
  inoremap <C-L> <Right>
endfunction
call NavTweaks()

function! LeaderCommands()
  nnoremap <Leader>r :set relativenumber!<CR>
  nnoremap <Leader>R :so $MYVIMRC<CR>
  nnoremap <Leader>f :%s/\s\+$//<CR>:noh<CR>
  nnoremap <Leader>d :set wrap<CR>:set linebreak<CR>
  nnoremap <Leader>n :NERDTreeToggle<CR>
  nnoremap <Leader>N :NERDTreeFind<CR>
  nnoremap <Leader>/ :noh<CR>
endfunction
call LeaderCommands()

function! ArrowKeys()
  nmap <Left> <<
  nmap <Right> >>
  nmap <Up> :m .-2<CR>==
  nmap <Down> :m .+1<CR>==

  vmap <Left> <gv
  vmap <Right> >gv
  vmap <Up> :m '<-2<CR>==gv
  vmap <Down> :m '>+1<CR>==gv
endfunction
call ArrowKeys()

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'scrooloose/syntastic'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'
  Plugin 'justinmk/vim-sneak'
  Plugin 'scrooloose/nerdtree'
  Plugin 'ctrlpvim/ctrlp.vim'

  Plugin 'pangloss/vim-javascript'
  Plugin 'mustache/vim-mustache-handlebars'
call vundle#end()

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

function! SneakOneCharSearch()
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  xmap f <Plug>Sneak_f
  xmap F <Plug>Sneak_F
  omap f <Plug>Sneak_f
  omap F <Plug>Sneak_F

  nmap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  xmap t <Plug>Sneak_t
  xmap T <Plug>Sneak_T
  omap t <Plug>Sneak_t
  omap T <Plug>Sneak_T
endfunction
call SneakOneCharSearch()

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/node
set shellcmdflag=-ic

set guifont=Source\ Code\ Pro:h12
set guioptions-=L
set nowrap

" set ignorecase
" set smartcase
set splitbelow
set splitright

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set cursorline
" set cursorcolumn
set relativenumber
set autochdir
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

let g:mustache_abbreviations = 1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
let g:loaded_syntastic_java_javac_checker = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufReadPost *.hbs set filetype=html.mustache syntax=html.mustache

" /@chris

