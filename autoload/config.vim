" TagFile is the name of the file in which the tags will be saved
function! config#TagFile()
  return get(g:, "simpletags_tag_file", "tags")
endfunction
