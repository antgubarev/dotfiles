if exists("b:current_syntax")
  finish
endif
syn keyword briefKeyword schema message key service rpc error
syn match briefIdent '[a-z][a-zA-Z0-9_-]*'
syn match briefType '\v*?(\[\])?([A-Z][a-zA-Z0-9_-]*|bool|int|float|string|bytes|map)' contains=briefTypeOptional,briefTypeListBrackets
syn match briefTypeOptional '*' contained
syn match briefTypeListBrackets '\[\]' contained
syn region briefString start='"' end='"' skip='\\"' matchgroup=Quote contains=briefStringEscape
syn match briefStringEscape '\\.' contained
syn region briefDescription start='`' end='`' matchgroup=Quote
hi def link briefType Type
hi def link briefTypeOptional Operator
hi def link briefTypeListBrackets Normal
hi def link briefKeyword Keyword
hi def link briefIdent Identifier
hi def link briefString String
hi def link briefStringEscape Special
hi def link briefDescription String
