syn clear cErrInParen

syn keyword cpp0xOperator  alignof decltype static_assert
syn keyword cpp0xStatement alignas noexcept override final
syn keyword cpp0xType      constexpr char16_t char32_t
syn keyword cpp0xConstant  nullptr
syn keyword cpp0xConcept   concept concept_map axiom requires late_check

syn match cpp0xUCN     display contained "\\\(u\x\{4}\|U\x\{8}\)"

syn region cpp0xString start=+\(u\|u8\|U\)"+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,@Spell
" syn region cpp0xRawStr start=+\(u\|u8\|U\)R"\z([^ \[\]\v\t\f\n]*\)\[+ end=+]\z1"+ contains=cpp0xUCN 
syn match cpp0xRawString /\%(u8\|u\|U\|L\)\=R"\([[:alnum:]_{}[\]#<>%:;.?*+\-/\^&|~!=,"']\{,16}\)(\_.\{-})\1"/ contains=cFormat,@Spell

hi def link cpp0xUCN       cSpecial
hi def link cpp0xOperator  Operator
hi def link cpp0xStatement cppStatement
hi def link cpp0xType      Type
hi def link cpp0xConstant  Constant
hi def link cpp0xString    cString
hi def link cpp0xRawString cString
hi def link cpp0xConcept   cppStructure
