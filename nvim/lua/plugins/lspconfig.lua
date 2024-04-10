return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        html = {},
        cssls = {},
        emmet_ls = {},
        pyright = {},
        bashls = {},
        bicep = {},
        yamlls = {},
        marksman = {},
        powershell_es = {},
        terraformls = {},
        helm_ls = {},
      },
    },
  },
}
