" Vim compiler file
" Compiler:	Taskfile

if exists("current_compiler")
  finish
endif
let current_compiler = "task"

let s:cpo_save = &cpo

set cpo-=C

CompilerSet makeprg=task\ -s
CompilerSet errorformat&

let &cpo = s:cpo_save
unlet s:cpo_save
