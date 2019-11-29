if executable('ctags')
  " Look for tags file in parent file as well
  set tags=tags;

  " CreateTags creates a tag file at the root of the project
  command! -nargs=0 CreateTags call simpletags#CreateTags()

  " UpdateTags for the current file, removing all tags for it in the main tag file
  " before generating them again
  command! -nargs=0 UpdateTags call simpletags#UpdateTags()
endif
