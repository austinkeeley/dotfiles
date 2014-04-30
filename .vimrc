" Pathogen infection
execute pathogen#infect()

" Basic stuff that everyone needs.
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set incsearch 
set ignorecase smartcase

" Make sure my backspace key actually works
set backspace=indent,eol,start

" All those ~ files just make me angry most of the time
set nobackup

" Use spaces instead of tabs becuase the internet hates it when you don't
" By default do 4 spaces of indention
set expandtab
set tabstop=4
set shiftwidth=4

" Makefiles still need tabs though
autocmd FileType make setlocal noexpandtab

" Ruby developers like the 2 space indention; Use that with Javascirpt also
autocmd FileType ruby set tabstop=2|set shiftwidth=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2

" Set my colors; here's a few that I like
set background=dark
" color inkpot
 color solarized " From https://github.com/altercation/vim-colors-solarized
" color railscasts " From https://github.com/jpo/vim-railscasts-theme, not the default one!
" color desertEX
" color zenburn
" color molokai
" color slate 
" color matrix
" color vibrantchalk
" color wombat256
" color zmrok
" color dante
" color freya

" Personal preferences to let me know where the cursor is
set cursorline " Note that this doesn't play nice with all color schemes
set number
set ruler

" Does anyone actually use this?
set novisualbell

" Turn off the arrow keys to make you better at hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" gVim options
if has("gui_running")
  set guioptions-=T    " Get rid of the toolbar. It's ugly.
    " My preferred font, Proggy Clean, from http://www.proggyfonts.com
    if has("win32")
      set guifont=ProggyCleanTTSZ:h12
      " No Proggy? Use Consolas 10pt which is okay 
      " set guifont=Consolas:h10
    elseif has("gui_gtk")
      set guifont=Source\ Code\ Pro\ 10
    endif
	set lines=40
	set columns=110
endif

" Remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
