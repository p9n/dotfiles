function ToggleCopyMode()
  set list!
  set number!
  set relativenumber!
endfunction

nnoremap <F5> :call ToggleCopyMode()<CR>

set listchars=tab:»\ ,nbsp:_,trail:∙
call ToggleCopyMode()
