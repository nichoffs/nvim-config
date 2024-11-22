return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
    },
  })
  end,
}
