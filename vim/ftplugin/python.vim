" Python specific settings.
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['flake8', 'pylint']
