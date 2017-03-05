set nocompatible              " be iMproved, required
filetype on

set foldmethod=syntax
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"GGPlugin 'ascenator/L9', {'name': 'newL9'}

"Javascript auto-complete
Plugin 'pangloss/vim-javascript'

Plugin 'leafgarland/typescript-vim'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

autocmd FileType typescript :set makeprg=tsc


Plugin 'marijnh/tern_for_vim'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
" Airline Settings========================================================
set laststatus=2
" "let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#fnamemod= ':t' "show just filename
let g:airline_powerline_fonts = 0
let g:bufferline_echo = 0   
Plugin 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

Plugin 'itchyny/lightline.vim'
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'component': {
			\   'readonly': '%{&readonly?"":""}',
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' }
			\ }

Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode='a'    "enable all function in all mode."
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
filetype plugin on 
set omnifunc=syntaxcomplete#Complete

Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'Raimondi/delimitMate'


Plugin 'editorconfig/editorconfig-vim'

Plugin 'bling/vim-bufferline'
let g:bufferline_echo = 1
Plugin 'majutsushi/tagbar'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
set t_Co=256
if has('gui_running')
	set background=dark
else
	set background=dark
endif

set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

set number
set relativenumber
syntax enable
colorscheme desert

set backspace=indent,eol,start 

let mapleader = ' '



"--------Search--------
set hlsearch
set incsearch


"--------Mapping--------

"Making it easy to edit he vimrc file
nmap <Leader>ed:tabedit $MYVIMRC<cr>

"Tab



let g:javascript_plugin_jsdoc =1 

"Semi Colon to Colon
"
nnoremap ; :

"----------Web Dev -----------
au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2
			\ set softtabstop=2
			\ set shiftwidth=2

"-----------Python-------------
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

Plugin 'vim-scripts/indentpython.vim'
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.py
			\ set tabstop=4
			\ set softtabstop=4
			\ set shiftwidth=4
			\ set textwidth=79
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

let python_highlight_all=1

"####
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1 
 let g:syntastic_python_checkers = ['pylint']

" Closse Syntastic
nnoremap <silent> <leader>e :lclose<CR>
nnoremap <silent> <leader>w :Error<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

"####
Plugin 'nvie/vim-flake8'

"### https://github.com/SirVer/ultisnips
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"#### https://github.com/Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
let g:ycm_add_preview_tocompleteopt=0
let g:ycm_add_confirm_extra_conf=0
let g:ycm_python_binary_path = '/usr/bin/python3'
set completeopt-=preview
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>','<TAB>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

"### https://github.com/PyCQA/pyflakes
Plugin 'PyCQA/pyflakes'

"Indent
noremap <leader>= gg<S-v><S-g>=

"### https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

" -----------Django--------------

"### https://github.com/jmcomets/vim-pony/
Plugin 'jmcomets/vim-pony'

let g:last_relative_dir = ''
nnoremap \1 :call RelatedFile ("models.py")<cr>
nnoremap \2 :call RelatedFile ("views.py")<cr>
nnoremap \3 :call RelatedFile ("urls.py")<cr>
nnoremap \4 :call RelatedFile ("admin.py")<cr>
nnoremap \5 :call RelatedFile ("tests.py")<cr>
nnoremap \6 :call RelatedFile ( "templates/" )<cr>
nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
nnoremap \8 :call RelatedFile ( "management/" )<cr>
nnoremap \0 :e settings.py<cr>
nnoremap \9 :e urls.py<cr>

fun! RelatedFile(file)
    #This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()

" -----------HTML --------------

"### xmledit
Plugin 'sukima/xmledit'

" -----------Make Like IDE ----------
"### https://github.com/vim-scripts/project.tar.gz
Plugin 'vim-scripts/project.tar.gz'
