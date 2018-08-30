set indentexpr=Get7bhIndent()
set indentkeys=o,:,=else,=endif
set expandtab

function! Get7bhIndent()
  " Find a non-blank line above the current line.
  let lnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)
  let prevline = getline(lnum)
  let thisline = getline(v:lnum)

  if prevline =~ '^\s*if.*:\s*$'
    let ind = ind + &shiftwidth
  elseif prevline =~ '^\s*else\s*:\s*$'
    let ind = ind + &shiftwidth
  endif

  if thisline =~ '^\s*\(else\|endif\)'
    let ind = ind - &shiftwidth
  endif

  return ind
endfunction
