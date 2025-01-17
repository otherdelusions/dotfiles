return {
  "nyoom-engineering/oxocarbon.nvim",
  -- "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd([[colorscheme oxocarbon]])
  end,
}
