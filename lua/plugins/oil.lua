return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup()
  end,
  keys = {
    { "<C-e>", ":Oil<CR>", desc = "Open Oil" },
  },
}
