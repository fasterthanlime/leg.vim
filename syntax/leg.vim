" Vim syntax file
" Language: Parser Expression Grammars (leg)
" Maintainer: Gianni Chiappetta
" Latest Revision: 2011-02-08

if exists("b:current_syntax")
  finish
endif

syn match   legRuleIdentifier   /^(\a|-)\+/ skipwhite nextgroup=legSeperator

syn match   legSeperator        "=" skipwhite contained nextgroup=legExpression

syn match   legExpression       /.*/ contained skipwhite contains=legDelimiter,legGrouping,legSpecial,legRange,legTerminal,legOrderedChoice,legNonTerminal,legQuantifier
syn match   legDelimiter        /[§]/ contained display
syn region  legGrouping         matchgroup=legDelimiter start=/(/ end=/)/ contained skipwhite keepend contains=legExpression display
syn match   legSpecial          /[!&ϵ^]/ contained display
syn match   legOrderedChoice    /|/ contained display
syn region  legRange            matchgroup=legDelimiter start=/\[^/ start=/\[/ end=/\]/ contained skipwhite contains=legRangeValue,legUnicode display
syn match   legRangeValue       /\d\+-\d\+/ contained display
syn match   legRangeValue       /\a\+-\a\+/ contained display
syn region  legTerminal         matchgroup=legDelimiter start=/"/ end=/"/ contained display
syn region  legTerminal         matchgroup=legDelimiter start=/'/ end=/'/ contained display
syn match   legUnicode          /U+[A-F0-9]\{4,6}/ contained display
syn match   legNonTerminal      /\a+/ contained display
syn match   legQuantifier       /[+\*?]/ contained display
syn match   legQuantifier       /{\d\+,\d\+}/ contained display
syn match   legQuantifier       /{\d\+}/ contained display

syn match   legComment          /#.*$/ contains=legTodo
syn keyword legTodo             TODO FIXME XXX NOTE contained

hi link legRuleIdentifier Identifier
hi link legSeperator      Conditional
hi link legDelimiter      Delimiter
hi link legSpecial        Special
hi link legOrderedChoice  Conditional
hi link legComment        Comment
hi link legRangeValue     Constant
hi link legTerminal       String
hi link legUnicode        Constant
hi link legQuantifier     Function
hi link legTodo           Todo

let b:current_syntax = "leg"

