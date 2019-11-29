" CreateTags runs ctags in the current directory and creates a tag file
function! simpletags#CreateTags()
  let cmd = "ctags -f " . config#TagFile() . " -R " . utils#GetTagDir()
  let ret = system(cmd)
  if v:shell_error != 0
    call utils#EchoError("Could not create tags: " . ret)
    return
  endif
  call utils#EchoSuccess("Tags created")
endfunction

function! simpletags#UpdateTags()
  call utils#EchoSuccess("Update Tags")
endfunction

function! simpletags#ClearTags()
  call utils#EchoSuccess("Tags cleared")
endfunction
