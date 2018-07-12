" If no screen, use color term
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=1%dm
  set t_AB=1%dm
endif

if filereadable("/usr/share/vim/google/google.vim")
  so /usr/share/vim/google/google.vim
  Glug youcompleteme-google
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
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set viminfo='20,\"51    " read/write a .viminfo file, don't store more
set showmatch
set noundofile

set background=dark     " another is 'light'

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

let g:netrw_dirhistmax = 0

nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>

imap <S-Up> <Up>
imap <S-Down> <Down>
nmap <S-Up> <Up>
nmap <S-Down> <Down>
vmap <S-Up> <Up>
vmap <S-Down> <Down>

highlight ColorColumn ctermbg=238
call matchadd('ColorColumn', '\%>80v', 100)

set listchars=tab:>~,nbsp:_,trail:.
set list

au BufRead,BufNewFile */{vboot_reference,depthcharge,coreboot,ec}/*.[ch]
    \ setl noexpandtab nosmarttab tabstop=8 shiftwidth=8 softtabstop=8

" disable google whitespace plugin
if exists(':Glug')
  Glug whitespace highlight=0
endif
