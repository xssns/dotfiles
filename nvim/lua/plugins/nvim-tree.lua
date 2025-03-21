return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- icons
  },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        highlight_opened_files = "icon",
        highlight_git = true,
        indent_markers = { enable = true },
      },
      view = {
        width = 35,
        side = "left",
      },
      filters = {
        dotfiles = false,
      },
    })

    -- hotkeys for nvim-tree
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
  end,
}
