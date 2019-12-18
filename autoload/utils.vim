" It is enough to load the tag directory once, refering to this variable after
let s:tagDir = ""

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

" EchoWarning colors msg to signify something went wrong
"
" Args:
"   msg (str): the message to echo
function! utils#EchoWarning(msg)
  call s:echo(a:msg, 'WarningMsg')
endfunction

" GetTagFile returns the directory in which the tag file should be.
function! utils#GetTagFile()
  return utils#GetTagDir() . "/" . config#TagFile()
endfunction

" GetTagDir returns the directory in which the tag file should be.
" It will cache the value and use this cache if possible
function! utils#GetTagDir()
  if s:tagDir !=# ""
    " if the value is cached, return it
    return s:tagDir
  endif

  if config#UseGitRoot() == 1
    let s:tagDir = s:trim_output(system("git rev-parse --show-toplevel"))
    if v:shell_error == 0
      return s:tagDir
    endif

    call utils#EchoWarning("Could not use git root, using cwd instead. Reason: " . s:tagDir)
  endif
  " default is to create in the cwd
  let s:tagDir = getcwd()
  return s:tagDir
endfunction

" trim_output removes null bytes, sometimes appearing at the end of console outputs
"
" Args:
"   o (str): the output to trim
function! s:trim_output(o)
  " In replace, \n is a null byte, see https://vim.fandom.com/wiki/Search_and_replace
  return substitute(a:o, "\n", "", "")
endfunction

" CallAndReport executes cmd, and prints a success or error message depending on execution
"
" Args:
"   cmd (str): the command to execute
"   successMsg (str): will be printed in case of success
"   errorPrefix (str): will be printed along with the text returned by the shell if error
function! utils#CallAndReport(cmd, successMsg, errorPrefix)
  let ret = system(a:cmd)
  if v:shell_error != 0
    call utils#EchoError(a:errorPrefix . ": " . ret)
    return
  endif

  call utils#EchoSuccess(a:successMsg)
endfunction
