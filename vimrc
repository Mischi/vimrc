set nocompatible		" be iMproved, required by Vundle
filetype off			" required by Vundle

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" core plugins
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'
	set statusline+=%{fugitive#statusline()}

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-sleuth'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mileszs/ack.vim'
	" When you press gv you Ack after the selected text
	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

	" Open Ack and put the cursor in the right position
	map <leader>g :Ack
Plugin 'edsono/vim-matchit'
Plugin 'scrooloose/nerdtree'
	map <leader>n :NERDTreeToggle<cr>
	map <leader>nb :NERDTreeFromBookmark
	map <leader>nf :NERDTreeFind<cr>

Plugin 'majutsushi/tagbar'
	nmap <leader>t :TagbarToggle<CR>

Plugin 'Valloric/YouCompleteMe'
	let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
	let g:ycm_extra_conf_globlist = ['/usr/src/.ycm_extra_conf.py']

	let g:ycm_key_list_select_completion = ['<C-j>']
	let g:ycm_key_list_previous_completion = ['<C-k>']

	let g:ycm_always_populate_location_list = 1
	let g:ycm_seed_identifiers_with_syntax = 1


	let g:ycm_add_preview_to_completeopt = 1
	let g:ycm_autoclose_preview_window_after_completion = 1

Plugin 'SirVer/ultisnips'
Plugin 'kien/ctrlp.vim'
	let g:ctrlp_match_window = 'max:20'
	let g:ctrlp_clear_cache_on_exit = 0
	let g:ctrlp_show_hidden = 1
	let g:ctrlp_max_files = 0
	let g:ctrlp_lazy_update = 50 " update after 100ms
	let g:ctrlp_mruf_save_on_update = 0
	"if executable('ag')
	"  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	"endif

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/syntastic'
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 0
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_aggregate_errors = 1

Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'

" color schemes
Plugin 'altercation/vim-colors-solarized'
"Plugin 'junegunn/seoul256.vim'

" Languages
Plugin 'vim-scripts/yaml.vim'

" html and templating engines
Plugin 'othree/html5.vim'
Plugin 'AndrewRadev/vim-eco'
Plugin 'mattn/emmet-vim'
	let g:user_emmet_leader_key = '<C-K>'

" css
Plugin 'hail2u/vim-css3-syntax'

" Javascript / Coffescript
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'marijnh/tern_for_vim'

" Perl
Plugin 'vim-perl/vim-perl'

" Mono
Plugin 'nosami/Omnisharp'
Plugin 'OrangeT/vim-csharp'
Plugin 'kongo2002/fsharp-vim'

" Go
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()		" required by Vundle
filetype plugin indent on	" required by Vundle


" General settings

" Seys how many lines of history VIM has to remember
"set history=700


" Ignore compiled files and co.
set wildignore=*.o,*.d,*~,*.pyc
set wildignore+=.git/*,.hg/*,.svn/*
set wildignore+=*/node_modules/*
set wildignore+=*/out/*

" Set to auto read when a file is changed from the outside
set autoread

" Set Line numbers
set number

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" load tag file ftom arch directory too.
set tags=./tags,tags,/usr/src/sys/arch/amd64/tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

colorscheme solarized
set background=dark

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=m
set guioptions-=T

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Monospace\ 12
    " Disable all blinking
    set guicursor+=a:blinkon0
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" md files are markdown files
au BufRead,BufNewFile *.md set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
"set map j gj
"set map k gk

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal! g`\"" |
\ endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Syntex()
	" remove 'silent' for debugging
	execute "silent !zathura --synctex-forward ".line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

map <C-enter> :call Syntex()<cr>
autocmd BufNewFile,BufRead *.tex set spell | set spelllang=de | set tw=80
autocmd BufNewFile,BufRead,BufWrite *.tex Make! pdf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" OpenBSD mapping to switch current buffer to style(9).  This is generally '\f'.
nmap <silent> <Leader>f :call OpenBSD_Style()<CR>


" Ignore indents caused by parentheses in OpenBSD style.
function! IgnoreParenIndent()
    let indent = cindent(v:lnum)

    if indent > 4000
        if cindent(v:lnum - 1) > 4000
            return indent(v:lnum - 1)
        else
            return indent(v:lnum - 1) + 4
        endif
    else
        return (indent)
    endif
endfun


" Follow the OpenBSD style(9).
function! OpenBSD_Style()
    setlocal cindent
    setlocal cinoptions=(4200,u4200,+0.5s,*500,:0,t0,U4200
    setlocal indentexpr=IgnoreParenIndent()
    setlocal indentkeys=0{,0},0),:,0#,!^F,o,O,e
    setlocal noexpandtab
    setlocal shiftwidth=8
    setlocal tabstop=8
    setlocal textwidth=80
endfun
