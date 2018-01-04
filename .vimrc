set nocompatible              
set hidden
set nowrap
set termguicolors
filetype on
let mapleader = ' '

"fuzzy find ignore files
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

"--------Mapping----------
map  <c-l> :tabn<cr>
map  <c-h> :tabp<cr>
map  <c-n> :tabnew<cr>


"Making it easy to edit he vimrc file
nmap <leader>ed:tabedit $MYVIMRC<cr>

nmap <leader>d :ene<CR>:bw #<CR>
noremap <leader>k :bn!<CR>
noremap <leader>r :b #<CR>
noremap <leader>gg gdf/gf 
"Indent
noremap <leader>= gg<S-v><S-g>=

"--------END Mapping--------

call plug#begin('~/.vim/plugged') 
" git plugin not hosted on github
"plug 'git://git.wincent.com/command-t.git'
Plug 'tpope/vim-fugitive'

" git repos on your local machine (i.e. when working on your own plugin)
"plug 'file:///home/gmarik/path/to/plugin'
" the sparkup vim script is in a subdirectory of this repo called vim.
" pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

"javascript auto-complete
Plug 'pangloss/vim-javascript'

"### auto complete
Plug 'shougo/deoplete.nvim', { 'do': ':updateremoteplugins' }

"### waka time tracking
Plug 'wakatime/vim-wakatime'

"### vim misc https://github.com/xolox/vim-misc
Plug 'xolox/vim-misc'

"###pydocstring https://github.com/heavenshell/vim-pydocstring
Plug 'heavenshell/vim-pydocstring'

"### vim session https://github.com/xolox/vim-session
Plug 'xolox/vim-session'

"###nerdcommenteri https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

"### https://github.com/vim-scripts/project.tar.gz
Plug 'vim-scripts/project.tar.gz'

"###https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

"### xmledit
Plug 'sukima/xmledit'
"### https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" -----------django--------------

"### https://github.com/jmcomets/vim-pony/
Plug 'jmcomets/vim-pony'

"### https://github.com/pycqa/pyflakes
Plug 'pycqa/pyflakes'

Plug 'bling/vim-bufferline'

"####
Plug 'nvie/vim-flake8'

"### https://github.com/sirver/ultisnips
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'On':  'nerdtreetoggle' }
"####
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'mattn/emmet-vim'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'

Plug 'jelera/vim-javascript-syntax'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'raimondi/delimitmate'

Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
"react vim
Plug 'mxw/vim-jsx'
Plug 'skywind3000/asyncrun.vim'
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

"vim-notes
Plug 'xolox/vim-notes'

"color theme
Plug 'morhetz/gruvbox'

"typescript syntax highlight
Plug 'vim-scripts/indentpython.vim'
Plug 'mhartington/nvim-typescript'
Plug 'mhartington/deoplete-typescript'
Plug 'mileszs/ack.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'heavenshell/vim-jsdoc'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

call plug#end()

let g:EditorConfig_max_line_indicator = "fill"
let g:EditorConfig_verbose = 1
" Gruvbox setup
let g:gruvbox_bold = 0
if !has("gui_running")
        let g:gruvbox_italic = 0
endif

filetype plugin on
let g:user_emmet_mode='a'    "enable all function in all mode."
set omnifunc=syntaxcomplete#Complete
let g:bufferline_echo = 1
let g:lightline = {
                        \ 'colorscheme': 'wombat',
                        \ 'component': {
                        \   'readonly': '%{&readonly?"":""}',
                        \ },
                        \ 'separator': { 'left': '', 'right': '' },
                        \ 'subseparator': { 'left': '', 'right': '' }
                        \ }

nnoremap <leader>ss :w!<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" Copy Paste on System Clipboard
" function Func2X11()
" :call system('xclip -selection c', @r)
" endfunction


" vnoremap <F9> "ry:call Func2X11()<cr>
" noremap <Leader>y "*y
" noremap <Leader>p "*p
" noremap <Leader>Y "+y
" noremap <Leader>P "+p

" hack to swap lines
function! s:swap_lines(n1, n2)
        let line1 = getline(a:n1)
        let line2 = getline(a:n2)
        call setline(a:n1, line2)
        call setline(a:n2, line1)
endfunction
function! s:swap_up()
        let n = line('.')
        if n == 1
                return
        endif
        call s:swap_lines(n, n - 1)
        exec n - 1
endfunction
function! s:swap_down()
        let n = line('.')
        if n == line('$')
                return
        endif
        call s:swap_lines(n, n + 1)
        exec n + 1
endfunction
noremap <silent> <s-up> :call <SID>swap_up()<CR>
noremap <silent> <s-down> :call <SID>swap_down()<CR>

let g:javascript_plugin_jsdoc = 1
let g:jsdoc_additional_description = 1
nmap <silent> <leader>bb :JsDoc<CR>

let g:jsx_ext_required = 0




"###Plug Nerdtree

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1

" Airline Settings========================================================
set laststatus=2
" "let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#fnamemod= ':t' "show just filename
let g:airline_powerline_fonts = 0
let g:bufferline_echo = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Prettier JS
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" All of your Plugs must be added before the following line
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PlugUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line

"NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
set t_Co=256
if has('gui_running')
        set background=dark
else
        set background=dark
endif


set number
set relativenumber
syntax enable
colorscheme gruvbox


set backspace=indent,eol,start



"--------Search--------
set hlsearch
set incsearch


"Tab
let g:javascript_plugin_jsdoc =1

"Semi Colon to Colon
"
nnoremap ; :

"----------Web Dev -----------
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
set expandtab
au BufNewFile,BufRead *.html, *.css  , *.scss
                        \ set tabstop=2
                        \| set softtabstop=2
                        \| set shiftwidth=2
autocmd Filetype *.scss setlocal tabstop=2

"-----------Python-------------
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.py
                        \ set tabstop=4
                        \| set softtabstop=4
                        \| set shiftwidth=4
                        \| set textwidth=120
                        \| set expandtab
                        \| set autoindent
                        \| set fileformat=unix

let python_highlight_all=1


"-----------ALE Settings-------------
let g:ale_linters = {
\   'javascript': ['eslint'],
\ 'python' : ['pylint'],
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
"-----------END ALE Settings-------------
"
let g:UltiSnipsExpandTrigger="<c-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" -----------Make Like IDE ----------
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nmap <silent> <leader>dd <Plug>(pydocstring)

let g:session_autoload = "no"
let g:session_autoload = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession
" nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession
nnoremap <leader>sc :CloseSession

"### Close all the hidder buffer
command! CloseHiddenBuffers call s:CloseHiddenBuffers()
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

let g:deoplete#enable_at_startup = 1
" Deoplete
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.scala = '[^. *\t]\.\w*\|: [A-Z]\w*'
    let g:deoplete#sources#clang#libclang_path='/usr/local/opt/llvm/lib/libclang.3.6.dylib'
    let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang/3.6.2/include'
    let g:deoplete#sources#clang#flags = [
          \ '-isystem',
          \ '/Library/Developer/CommandLineTools/usr/bin/../include/c++/v1',
          \ '-isystem',
          \ '/usr/local/include',
          \ '-isystem',
          \ '/Library/Developer/CommandLineTools/usr/bin/../lib/clang/7.3.0/include',
          \ '-isystem',
          \ '/Library/Developer/CommandLineTools/usr/include',
          \ '-isystem',
          \ '/usr/include',
          \ '-isystem',
          \ '/System/Library/Frameworks',
          \ '-isystem',
          \ '/Library/Frameworks',
          \ ]

" Supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" Python 3 for deoplote
let g:python3_host_prog = '/usr/bin/python3'

"VIM Notes
let g:notes_directories = [ '~/Dropbox/Shared Notes']

" "emmet-vim
" let g:user_emmet_leader_key='<c-tab>'
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}
