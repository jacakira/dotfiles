-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable the title option
vim.o.title = true
vim.o.titlestring = "%t - nvim"

-- disable swap files
vim.opt.swapfile = false
