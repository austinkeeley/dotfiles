" Vim configuration for Austin Keeley (@austinkeeley)
"
" Installation instructions (nvim)
" 1. Install Vundle
"     git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
" 2. Copy this file to ~/.config/nvim/init.vim
" 2. Start vim, run :PluginInstall

" Vundle set up
" For regular vim, change the `set rtp` line
set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
" Regular vim version
" set rtp+=~/.vim/bundle/Vundle.vim
" nvim version
set rtp+=~/.config/nvim/bundle/Vundle.vim
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
let g:airline_powerline_fonts = 1

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

" Show tabs and spaces
set listchars=tab:>-,trail:·
set list


" Set my colors; here's a few that I like
set background=dark
" color inkpot
" color solarized
" color railscasts
" color desertEX
" color zenburn
color molokai
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
set colorcolumn=88

" Does anyone actually use this?
set novisualbell

" Don't let vim insert new lines
set textwidth=0

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
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Automatically clean up trailing whitespace in source code. Note that if you're dealing
" with 'other people's code' you might make them angry when you commit a ton of changes
" due to this. See also the shortcut for showing trailing whitespace.
" autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call StripTrailingWhitespaces()


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}

""""""" Shortcuts

" A shortcut for cleaning up JSON files
nmap <leader>j :%!python -m json.tool<CR>

" NERDTree toggle
nmap <leader>n :NERDTreeToggle<CR>

" Capital L to do a syntastic check e.g. 'Lint'
" Lower case l to turn off syntastic
nnoremap <leader>L :SyntasticCheck<CR> :Errors<CR>
nnoremap <Leader>l :SyntasticReset<CR>

" Show trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
map <leader>w :match ExtraWhitespace /\s\+$/<CR>

" Quickly switch between tabs and spaces
map <leader>T :set noexpandtab<CR>
map <leader>t :set expandtab<CR>
