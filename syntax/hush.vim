syn keyword hushConditional if else
syn keyword HushRepeat      for while in
syn keyword hushOperator    and or not
syn keyword hushKeyword     break
syn keyword hushKeyword     then
syn keyword hushKeyword     do
syn keyword hushKeyword     end
syn keyword hushKeyword     std
syn keyword hushKeyword     let
syn keyword hushKeyword     function
syn keyword hushSelf        self
syn keyword hushBoolean     true false
syn keyword hushKeyword     nil

syn match   hushMethod      "\w\(\w\)*\(\s\+\)\?("he=e-1,me=e-1
syn region  hushBlock       start="{" end="}" transparent fold

syn match   hushDecNumber   display "\<\d+"
syn match   hushFloat       display "\<\d\+\(\.\d\+\)\=\([eE]-\=\d*\)\="
syn match   hushSpecialChar contained +\\["\\'0abfnrtvx]+
syn match   hushCharacter   "'[^']*'" contains=hushSpecialChar
syn region  hushString      start=+"+ end=+"+ contains=hushSpecialChar,@Spell
syn region  hushComment     start="#" end="$" keepend contains=hushCharacter,@Spell

hi def link hushString      String
hi def link hushSpecialChar Special
hi def link hushDecNumber   Number
hi def link hushFloat       Float
hi def link hushBoolean     Boolean
hi def link hushKeyword     Keyword
hi def link hushSelf        Constant
hi def link hushOperator    Operator
hi def link hushConditional Conditional
hi def link hushMethod      Function
hi def link hushComment     Comment
hi def link hushException   Exception
