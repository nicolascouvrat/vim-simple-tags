" TagFile is the name of the file in which the tags will be saved
function! config#TagFile()
  return get(g:, "simpletags_tag_file", "tags")
endfunction

" UseGitRoot returns true if the tag file should be handled at the root of a github repository
function! config#UseGitRoot()
  return get(g:, "simpletags_use_git_root", 1)
endfunction
