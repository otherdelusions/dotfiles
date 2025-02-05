return {
  "nvim-treesitter/nvim-treesitter",
  sbuild = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "cpp", "python", "c", "lua", "vim", "javascript", "html", "css", "toml", "go", "java" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
