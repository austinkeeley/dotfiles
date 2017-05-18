" Vim configuration for Austin Keeley (@austinkeeley)

" Vundle set up
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
call vundle#end()           
filetype plugin indent on    

" Make sure airline appears
set laststatus=2

" Basic stuff
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
color solarized 
" color railscasts
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
    if has("win32")
      set guifont=Consolas:h10
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

" A shortcut for cleaning up JSON files
nmap <leader>j :%!python -m json.tool<CR>

" NERDTree toggle 
nmap <leader>n :NERDTreeToggle<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction


" F6 to turn off Syntastic error panel and F7 to toggle Syntastic on/off
" completely
nnoremap <silent> <F6> :<C-u>call ToggleErrors()<CR>
nnoremap <silent> <F7> :SyntasticToggleMode<CR>
