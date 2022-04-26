syn keyword hushConditional   if else
syn keyword HushRepeat        for while
syn keyword hushOperator      and or not in
syn keyword hushKeyword       break
syn keyword hushKeyword       then
syn keyword hushKeyword       do
syn keyword hushKeyword       end
syn keyword hushKeyword       std
syn keyword hushKeyword       let
syn keyword hushKeyword       function
syn keyword hushSelf          self
syn keyword hushBoolean       true false
syn keyword hushKeyword       nil

syn match   hushMethod        "\w\(\w\)*\(\s\+\)\?("he=e-1,me=e-1
syn region  hushCommandBlock  start="{" end="}" transparent fold
syn region  hushFunctionBlock start="\<function\>" end="\<end\>" transparent fold
syn region  hushBlock         start="\<do\>" end="\<end\>" transparent fold

syn keyword hushTodo          contained TODO FIXME XXX

syn match   hushDecNumber     display "\<\d\+\>"
syn match   hushFloat         display "\<\d\+\(\.\d\+\)\=\([eE]-\=\d*\)\=\>"
syn match   hushSpecialChar   contained +\\["\\'0abfnrtvx]+
syn match   hushCharacter     "'[^']*'" contains=hushSpecialChar
syn region  hushString        start=+"+ end=+"+ contains=hushSpecialChar,hushTodo,@Spell
syn region  hushComment       start="#" end="$" keepend contains=hushCharacter,@Spell

syn region  hushIfThen        start="\<if\>" end="\<then\>"me=e-4 nextgroup=hushThenEnd transparent skipwhite skipempty
syn region  hushThenEnd       start="\<then\>" end="\<end\>" contained transparent
syn keyword hushElse          contained else
syn keyword hushIn            contained in

hi def link hushString        String
hi def link hushSpecialChar   Special
hi def link hushDecNumber     Number
hi def link hushFloat         Float
hi def link hushBoolean       Boolean
hi def link hushKeyword       Keyword
hi def link hushSelf          Constant
hi def link hushOperator      Operator
hi def link hushConditional   Conditional
hi def link hushMethod        Function
hi def link hushException     Exception
hi def link hushComment       Comment
hi def link hushTodo          Todo
