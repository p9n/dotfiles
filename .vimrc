" If no screen, use color term
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

set number
set relativenumber

colorscheme kolor

filetype plugin indent on

let g:netrw_dirhistmax = 0

nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>

imap <S-Up> <Up>
imap <S-Down> <Down>
nmap <S-Up> <Up>
nmap <S-Down> <Down>
vmap <S-Up> <Up>
vmap <S-Down> <Down>

call matchadd('ColorColumn', '\%>80v', 100)

set listchars=tab:»\ ,nbsp:_,trail:∙
set list

au BufRead,BufNewFile */.gitconfig
    \ setl noexpandtab nosmarttab

source ~/.vim/startup/cros.vim
source ~/.vim/startup/google.vim
