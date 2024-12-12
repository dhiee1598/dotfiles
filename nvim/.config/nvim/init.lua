require("dexter.core")
require("dexter.lazy")

vim.cmd([[
augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=default
    au VimEnter * :silent !kitty @ set-spacing padding=0
augroup END
]])
