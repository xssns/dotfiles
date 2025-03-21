return {
  {
    "wittyjudge/gruvbox-material.nvim",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_transparent_background = 0 -- фон НЕ прозрачный (это важно!)
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}

