-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>p", '<cmd>lua require("cmp").setup { enabled = true }<cr>', { desc = "Enable completion" })
vim.keymap.set(
  "n",
  "<leader>P",
  '<cmd>lua require("cmp").setup { enabled = false }<cr>',
  { desc = "Disable completion" }
)

-- map esc to jk for laptop use
-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape jk" })
-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- replaces
vim.keymap.set("n", "<leader>rbs", "<cmd>%s/\\//g<CR>", { desc = "Replace Backward Slash" })

-- telescope symbols
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

-- convert Current line to title cases
vim.keymap.set(
  "n",
  "<leader>rlt",
  "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
  { desc = "Replace Line Title" }
)
-- vim.keymap.set("n", "<leader>rlt", "<cmd>s/<./\u&/g<cr>", { desc = "Replace Line Title" })

-- these keep the cursor in the middle when scrolling with ctrl d and u
-- from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- and these are for searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })

-- trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Open/Close trouble list" })
vim.keymap.set(
  "n",
  "<leader>xw",
  "<cmd>TroubleToggle workspace_diagnostics<CR>",
  { desc = "Open trouble workspace diagnostics" }
)
vim.keymap.set(
  "n",
  "<leader>xd",
  "<cmd>TroubleToggle document_diagnostics<CR>",
  { desc = "Open trouble document diagnostics" }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open trouble quickfix list" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Open trouble location list" })
vim.keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Open todos in trouble" })
