" Vim syntax file
"      Language: JavaScript
"    Maintainer: Jose Elera Campana <https://github.com/jelera>
" Last Modified: Wed 24 Feb 2016 03:35:03 AM CST
"       Version: 0.8.2
"       Credits: Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based
"                on their hard work), gumnos (From the #vim IRC Channel in
"                Freenode), all the contributors at this project's github page
"                (https://github.com/jelera/vim-javascript-syntax/graphs/contributors)

if !exists("main_syntax")
	if version < 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
	unlet javaScript_fold
endif

"" Remove dollar sign from identifier when embedded in a PHP file
if &filetype == 'javascript'
	setlocal iskeyword+=$
endif

syntax sync fromstart

"" syntax coloring for Node.js shebang line
syntax match shebang "^#!.*"
hi link shebang Comment

" Statement Keywords {{{
syntax keyword javaScriptSource         import export from
syntax keyword javaScriptIdentifier     arguments this let var void yield async await const
syntax keyword javaScriptOperator       delete new instanceof typeof
syntax keyword javaScriptBoolean        true false
syntax keyword javaScriptNull           null undefined
syntax keyword javaScriptMessage        alert confirm prompt status
syntax keyword javaScriptGlobal         self top parent
syntax keyword javaScriptDeprecated     escape unescape all applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding
syntax keyword javaScriptConditional    if else switch
syntax keyword javaScriptRepeat         do while for in of
syntax keyword javaScriptBranch         break continue
syntax keyword javaScriptLabel          case default
syntax keyword javaScriptPrototype      prototype
syntax keyword javaScriptStatement      return with
syntax keyword javaScriptGlobalObjects  Array Boolean Date Function Math Number Object RegExp String
syntax keyword javaScriptExceptions     try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
syntax keyword javaScriptReserved       abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws goto private transient debugger implements protected volatile double import public
"}}}
" Comments {{{
syntax keyword javaScriptCommentTodo      TODO FIXME XXX TBD OPTIMIZE HACK REVIEW contained
syntax match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syntax match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javaScriptComment          start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
"}}}
" Strings, Numbers and Regex Highlight {{{
syntax match   javaScriptSpecial          "\\\d\d\d\|\\."
syntax region  javaScriptString	          start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syntax region  javaScriptString	          start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc

syntax match   javaScriptSpecialCharacter "'\\.'"
syntax match   javaScriptNumber           "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syntax match   javaScriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
"}}}
	" HTML events and internal variables"{{{
	syntax case ignore
	syntax keyword javaScriptHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize onload onsubmit
	syntax case match
	"}}}

  " Code blocks"{{{
syntax cluster javaScriptAll       contains=javaScriptComment,javaScriptLineComment,javaScriptDocComment,javaScriptString,javaScriptRegexpString,javaScriptNumber,javaScriptFloat,javaScriptLabel,javaScriptSource,javaScriptWebAPI,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFuncKeyword,javaScriptConditional,javaScriptGlobal,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptMessage,javaScriptIdentifier,javaScriptExceptions,javaScriptReserved,javaScriptDeprecated,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation,javaScriptBrowserObjects,javaScriptDOMObjects,javaScriptAjaxObjects,javaScriptPropietaryObjects,javaScriptDOMMethods,javaScriptHtmlElemProperties,javaScriptDOMProperties,javaScriptEventListenerKeywords,javaScriptEventListenerMethods,javaScriptAjaxProperties,javaScriptAjaxMethods,javaScriptFuncArg

if main_syntax == "javascript"
	syntax sync clear
	syntax sync ccomment javaScriptComment minlines=200
	" syntax sync match javaScriptHighlight grouphere javaScriptBlock /{/
endif
"}}}
" Function and arguments highlighting {{{
syntax keyword javaScriptFuncKeyword     function contained
syntax region  javaScriptFuncExp         start=/\w\+\s\==\s\=function\>/ end="\([^)]*\)" contains=javaScriptFuncEq,javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match   javaScriptFuncArg         "\(([^()]*)\)" contains=javaScriptParens,javaScriptFuncComma,javaScriptComment contained
syntax match   javaScriptFuncComma       /,/ contained
syntax match   javaScriptFuncEq          /=/ contained
syntax region  javaScriptFuncDef         start="\<function\>" end="\([^)]*\)" contains=javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match   javaScriptObjectKey       /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\)\@=/ contains=javaScriptFunctionKey
syntax match   javaScriptFunctionKey     /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\s*function\s*\)\@=/ contained
"}}}
" Braces, Parens, symbols, colons {{{
syntax match javaScriptBraces       "[{}\[\]]"
syntax match javaScriptParens       "[()]"
syntax match javaScriptOpSymbols    "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syntax match javaScriptEndColons    "[;,]"
syntax match javaScriptLogicSymbols "\(&&\)\|\(||\)"
"}}}
" ES6 String Interpolation {{{
syntax match  javaScriptTemplateDelim    "\${\|}" contained
syntax region javaScriptTemplateVar      start=+${+ end=+}+                        contains=javaScriptTemplateDelim keepend
syntax region javaScriptTemplateString   start=+`+  skip=+\\\(`\|$\)+  end=+`+     contains=javaScriptTemplateVar,javaScriptSpecial keepend
"}}}
" JavaScriptFold Function {{{

function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
endfunction

" }}}
" Highlight links {{{
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
	if version < 508
		let did_javascript_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink javaScriptTemplateDelim          Preproc
	HiLink javaScriptTemplateVar            Preproc

	HiLink javaScriptComment                Comment
	HiLink javaScriptLineComment            Comment
	HiLink javaScriptDocComment             Comment
	HiLink javaScriptCommentTodo            Todo

	HiLink javaScriptString                 String
	HiLink javaScriptRegexpString           String
	HiLink javaScriptTemplateString         String

	HiLink javaScriptNumber                 Number
	HiLink javaScriptFloat                  Number

	HiLink javaScriptGlobal                 Constant
	HiLink javaScriptCharacter              Character
	HiLink javaScriptPrototype              Type
	HiLink javaScriptConditional            Conditional
	HiLink javaScriptBranch                 Conditional
	HiLink javaScriptIdentifier             Identifier
	HiLink javaScriptRepeat                 Repeat
	HiLink javaScriptStatement              Statement
	HiLink javaScriptMessage                Keyword
	HiLink javaScriptReserved               Keyword
	HiLink javaScriptOperator               Operator
	HiLink javaScriptNull                   Type
	HiLink javaScriptBoolean                Boolean
	HiLink javaScriptLabel                  Label
	HiLink javaScriptSpecial                Special
	HiLink javaScriptSource                 Special
	HiLink javaScriptGlobalObjects          Special
	HiLink javaScriptExceptions             Special

	HiLink javaScriptDeprecated             Exception
	HiLink javaScriptError                  Error
	HiLink javaScriptParensError            Error
	HiLink javaScriptParensErrA             Error
	HiLink javaScriptParensErrB             Error
	HiLink javaScriptParensErrC             Error

	HiLink javaScriptFuncKeyword            Function
	HiLink javaScriptFuncDef                PreProc
	HiLink javaScriptFuncExp                Title
	HiLink javaScriptFuncArg               	Special

	delcommand HiLink
endif
" end Highlight links }}}

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear javaScriptExpression
syntax cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
	unlet main_syntax
endif
