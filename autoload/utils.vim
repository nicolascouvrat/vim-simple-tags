" echo msg with the color given by the highlight group hi
"
" Args:
"   msg (str): the message to echo
"   hi (str): string representation of the highlight group
function! s:echo(msg, hi)
  " because hi is a string but echohl takes a variable as argument, use execute
  execute "echohl " . a:hi
  echo "vim-simple-tags: " . a:msg
  echohl None
endfunction

" EchoSuccess colors msg to signify success
"
" Args:
"   msg (str): the message to echo
function! utils#EchoSuccess(msg)
  call s:echo(a:msg, 'Function')
endfunction

" EchoError colors msg to signify failure
"
" Args:
"   msg (str): the message to echo
function! utils#EchoError(msg)
  call s:echo(a:msg, 'ErrorMsg')
endfunction
