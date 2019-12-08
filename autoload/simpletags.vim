" CreateTags runs ctags in the current directory and creates a tag file
function! simpletags#CreateTags()
  let cmd = "ctags -f " . utils#GetTagFile() . " -R " . utils#GetTagDir()
  call utils#CallAndReport(cmd, "Tags created", "Could not create tags")
endfunction

" UpdateTags remove all tags from the current file before appending then again, effectively updating
" all tags for this file
function! simpletags#UpdateTags()
  let current = expand("%:p")
  " Trim the root out of the current file path. This is maybe not necessary (tags created with
  " CreateTags should use the full path and not relative to the tags file), but might as well do it
  " since file cannot be ambiguous from the root anyway.
  let fromRoot = substitute(current, utils#GetTagDir() . "/", "", "")
  let cmd = 'sed -i "\:' . fromRoot . ':d" ' . utils#GetTagFile()
  let ret = system(cmd)
  if v:shell_error != 0
    call utils#EchoError("Could not update tags: " . ret)
    return
  endif

  let cmd = "ctags -f " . utils#GetTagFile() . " -a " . current
  call utils#CallAndReport(cmd, "Tags updated", "Could not update tags")
endfunction

" ClearTags removes the tags file
function! simpletags#ClearTags()
  let cmd = "rm " . utils#GetTagFile()
  call utils#CallAndReport(cmd, "Tags cleared", "Could not clear tags")
endfunction

