-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.zettelkasten")

vim.api.nvim_set_hl(0, "Comment", { bg = "NONE", fg = "#5C6370" })
