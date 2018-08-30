if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword _7bhBuiltins step pickup drop giveto takefrom nearest set jump
  \ write calc tell listenfor
syn keyword _7bhConditional if else endif
syn keyword _7bhIdentifier mem1 mem2 mem3 mem4
syn keyword _7bhSpecial
  \ wall shredder nothing hole worker printer something
  \ myitem datacube end everyone
syn match _7bhNumber "\<\d\+\>"
syn region _7bhComment start="--" end="$"
syn keyword _7bhMessage hi morning ready ok go coffeetime ugh goodbye

hi def link _7bhConditional Conditional
hi def link _7bhBuiltins Function
hi def link _7bhIdentifier Identifier
hi def link _7bhNumber Number
hi def link _7bhSpecial Special
hi def link _7bhComment Comment
hi def link _7bhMessage String 
