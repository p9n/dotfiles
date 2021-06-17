syn clear cErrInParen

syn keyword cpp0xOperator  alignof decltype static_assert
syn keyword cpp0xStatement alignas noexcept override final
syn keyword cpp0xType      constexpr char16_t char32_t
syn keyword cpp0xConstant  nullptr
syn keyword cpp0xConcept   concept requires
syn keyword cpp20Keyword   constinit consteval co_await co_return co_yield module
syn keyword cpp20Type      char8_t

syn match cpp0xUCN     display contained "\\\(u\x\{4}\|U\x\{8}\)"

syn region cpp0xString start=+\(u\|u8\|U\)"+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,@Spell
syn match cpp0xRawString /\%(u8\|u\|U\|L\)\=R"\([[:alnum:]_{}[\]#<>%:;.?*+\-/\^&|~!=,"']\{,16}\)(\_.\{-})\1"/ contains=cFormat,@Spell

syn match cpp1zNumber /\<0\('\?\o\)*\(u\?l\{0,2}\|ll\?u\)\>\c/ display
syn match cpp1zNumber /\<0b[01]\('\?[01]\)*\(u\?l\{0,2}\|ll\?u\)\>\c/ display
syn match cpp1zNumber /\<[1-9]\('\?\d\)*\(u\?l\{0,2}\|ll\?u\)\>\c/ display
syn match cpp1zNumber /\<0x\x\('\?\x\)*\(u\?l\{0,2}\|ll\?u\)\>\c/ display

syn match cpp1zFloat /\<\d\('\?\d\)*e[+-]\?\d\('\?\d\)*f\?l\?\c/ display
syn match cpp1zFloat /\<\(\d\('\?\d\)*\)\?\.\d\('\?\d\)*\(e[+-]\?\d\('\?\d\)*\)\?f\?l\?\c/ display
syn match cpp1zFloat /\<\d\('\?\d\)*\.\(e[+-]\?\d\('\?\d\)*\)\?f\?l\?\c/ display
syn match cpp1zFloat /\<0x\x\('\?\x\)*\.\?p[+-]\?\d\('\?\d\)*f\?l\?\c/ display
syn match cpp1zFloat /\<0x\(\x\('\?\x\)*\)\?\.\x\('\?\x\)*p[+-]\?\d\('\?\d\)*f\?l\?\c/ display

syn match cpp20Import /^\s*import\>\s*["<]/ display contains=cIncluded

hi def link cpp0xUCN       cSpecial
hi def link cpp0xOperator  Operator
hi def link cpp0xStatement cppStatement
hi def link cpp0xType      Type
hi def link cpp0xConstant  Constant
hi def link cpp0xString    cString
hi def link cpp0xRawString cString
hi def link cpp0xConcept   cppStructure
hi def link cpp1zNumber    Number
hi def link cpp1zFloat     Number
hi def link cpp20Keyword   cppStatement
hi def link cpp20Module    cppModifier
hi def link cpp20Type      Type
hi def link cpp20Import    cppModifier
