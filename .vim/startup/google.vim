if filereadable("/usr/share/vim/google/google.vim")
  so /usr/share/vim/google/google.vim
  Glug youcompleteme-google
endif

" disable google whitespace plugin
if exists(':Glug')
  Glug whitespace highlight=0
endif

