set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Begin non-Vundle config
set ruler
set laststatus=2 " Always show status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " custom status line
" Always highlight current row and column:
"set cursorline
"set cursorcolumn
"set number

"call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
syntax on

"filetype plugin indent on
" Settings for unrecognized files; language-specific tab/indent settings files
" live in .vim/after/ftplugin/
set tabstop=4
set shiftwidth=4
set expandtab

syntax enable

" Solarized stuff
let g:solarized_termtrans = 1
"set background=dark
set background=light
colorscheme solarized

"Take care of indents for Java.
set autoindent
set si
set shiftwidth=4
"Java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

"Java syntax highlighting
"let java_comment_strings=1
"let java_mark_braces_in_parens_as_errors=1
"let java_highlight_all=1
"let java_highlight_debug=1
""let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

"Enables omni-completion with javacomplete, if it's is installed:
"setlocal omnifunc=javacomplete#Complete

" dashes/dots/etc. for indentation level
"
" whitespace highlighting
set list listchars=tab:>-,trail:.,extends:>

"set list listchars=tab:»-,trail:·,extends:»,precedes:«
"set list listchars=tab:>-,trail:.,extends:>

":set list listchars=tab:>-,trail:.,extends:>
" Enter the middle-dot by pressing Ctrl-k then .M
":set list listchars=tab:\|_,trail:·
" Enter the right-angle-quote by pressing Ctrl-k then >>
":set list listchars=tab:»·,trail:·
" Enter the Pilcrow mark by pressing Ctrl-k then PI
":set list listchars=tab:>-,eol:¶
" The command :dig displays other digraphs you can use.

" Disable smartindent for Python since it causes new lines starting with # to
" have their indentation stripped.
au! FileType python setl nosmartindent

" F9 passes current buffer to python3.5
nnoremap <buffer> <F9> :exec '!python3.5' shellescape(@%, 1)<cr>

let g:used_javascript_libs = 'underscore,backbone'
au BufNewFile,BufRead *._js set filetype=javascript
au BufNewFile,BufRead *.json set filetype=javascript

"python with virtualenv support
"This is needed for YouCompleteMe to find your virtualenv:
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Map \jd to :YcmCompleter GoTo
" Note that if you don't want to use leader key '\' that too can be remapped:
nnoremap <leader>jd :YcmCompleter GoTo<CR>
