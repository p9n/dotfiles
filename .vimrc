" If no screen, use color term
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=1%dm
  set t_AB=1%dm
endif

if filereadable("/usr/share/vim/google/google.vim")
  so /usr/share/vim/google/google.vim
endif

if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif

syntax on

set nocompatible
set wildmenu
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup              " keep a backup file
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set viminfo='20,\"51    " read/write a .viminfo file, don't store more
set showmatch
set noundofile

set background=dark     " another is 'light'

" VIM 6.0,
if version >= 600
    set nohlsearch
    set foldmethod=marker
    set foldlevel=1
    set encoding=big5
    set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
    set fileencoding=taiwan
endif


" let mysyntaxfile = "~/.vim/syntax/cpp.vim"

set shiftwidth=2
set ts=2
set softtabstop=2
set fileencoding=utf-8
set fileencodings=utf-8,big5,sjis
set encoding=utf-8
set termencoding=utf-8
set nowrap
set nobackup
set foldmethod=indent
set foldlevel=65535
set showcmd
set expandtab
hi Folded ctermfg=DarkGreen ctermbg=black
au BufNewFile,BufRead *.xul setfiletype xml
au BufNewFile,BufRead *.rdf setfiletype xml
au BufNewFile,BufRead *.n3 setfiletype n3
au BufNewFile,BufRead *.go setfiletype go
au BufNewFile,BufRead *.json setfiletype javascript
au BufNewFile,BufRead {*.cpp,*.h} set matchpairs+=<:>
au BufNewFile,BufRead SConstruct setfiletype python

set mouse=
set nomodeline
set hls

" colorscheme diablo3
colorscheme kolor

" if &encoding == 'utf-8'
"     set ambiwidth=double
" endif

filetype plugin indent on
set completeopt=menuone
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1,}
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/tmp/webrtc_test/.ycm_extra_conf.py']
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
inoremap <expr> <Up> pumvisible() ? "\<C-e>\<Up>" : "\<Up>"
inoremap <expr> <Down> pumvisible() ? "\<C-e>\<Down>" : "\<Down>"
nnoremap <F5> :YcmDiags<CR>
nnoremap <F6> :lcl<CR>
inoremap <F5> <Esc>:YcmDiags<CR>
inoremap <F6> <Esc>:lcl<CR>

let g:netrw_dirhistmax=0
