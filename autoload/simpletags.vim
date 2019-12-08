" CreateTags runs ctags in the current directory and creates a tag file
function! simpletags#CreateTags()
  let cmd = "ctags -f " . config#TagFile() . " -R " . utils#GetTagDir()
  call utils#CallAndReport(cmd, "Tags created", "Could not create tags")
endfunction

function! simpletags#UpdateTags()
  call utils#EchoSuccess("Update Tags")
endfunction

function! simpletags#ClearTags()
  let cmd = "rm " . config#TagFile()
  call utils#CallAndReport(cmd, "Tags cleared", "Could not clear tags")
endfunction

