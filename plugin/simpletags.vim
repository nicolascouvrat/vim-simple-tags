if executable('ctags')
  " Look for tags file
  " TODO: this is ugly, as it triggers an error message when opening out of a repo. Instead make
  " this setup be run on create tags? or setup?
  execute "set tags=" . utils#GetTagFile()

  " CreateTags creates a tag file at the root of the project
  command! -nargs=0 CreateTags call simpletags#CreateTags()

  " UpdateTags for the current file, removing all tags for it in the main tag file
  " before generating them again
  command! -nargs=0 UpdateTags call simpletags#UpdateTags()

  " ClearTags removes the current tag file
  command! -nargs=0 ClearTags call simpletags#ClearTags()
endif
