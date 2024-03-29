" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetHushIndent()
setlocal autoindent
setlocal indentkeys+=0=end,0=until

" Only define the function once.
if exists("*GetHushIndent")
  finish
endif

function! GetHushIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  " Add a 'shiftwidth' after lines that start a block:
  " 'function', 'if', 'for', 'while', 'else', '{'
  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)
  let midx = match(prevline, '^\s*\%(if\>\|for\>\|while\>\|else\>\|do\>\|then\>\)')
  if midx == -1
    let midx = match(prevline, '{\s*$')
    if midx == -1
      let midx = match(prevline, '\<function\>\s*\%(\k\|[.:]\)\{-}\s*(')
    endif
  endif

  if midx != -1
    " Add 'shiftwidth' if what we found previously is not in a comment and
    " an "end" is not present on the same line.
    if synIDattr(synID(prevlnum, midx + 1, 1), "name") != "hushComment" && prevline !~ '\<end\>'
      let ind = ind + shiftwidth()
    endif
  endif

  " Subtract a 'shiftwidth' on end, else, and '}'
  " This is the part that requires 'indentkeys'.
  let midx = match(getline(v:lnum), '^\s*\%(end\>\|else\>\|}\)')
  if midx != -1 && synIDattr(synID(v:lnum, midx + 1, 1), "name") != "hushComment"
    let ind = ind - shiftwidth()
  endif

  return ind
endfunction
