return {
  "LazyVim/LazyVim",
  priority = 10000,
  config = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.defer_fn(function()
          -- Гарантированное переопределение для Bufferline
          vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "NONE", fg = "#ebdbb2", bold = true })
          vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE", fg = "#928374" })
          vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "NONE", fg = "NONE" })
          vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "NONE", fg = "NONE" })
        end, 50) -- задержка в 50 мс для гарантированного выполнения после всего
      end,
    })
  end,
}
