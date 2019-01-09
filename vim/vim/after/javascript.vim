if &filetype !=# 'html' || v:version < 700 || &compatible
  finish
endif

compiler flow
setlocal equalprg=flow
