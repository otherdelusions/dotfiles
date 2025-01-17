---@diagnostic disable: unused-local
return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "onsails/lspkind.nvim" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        lsp_zero.buffer_autoformat()
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufrn })
      end)

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })

      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer" },
        },

        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = {
              Text = " 󰉿 ",
              Method = " 󰆧 ",
              Function = " 󰊕 ",
              Constructor = "  ",
              Field = " 󰜢 ",
              Variable = " 󰀫 ",
              Class = " 󰠱 ",
              Interface = "  ",
              Module = "  ",
              Property = " 󰜢 ",
              Unit = " 󰑭 ",
              Value = " 󰎠 ",
              Enum = "  ",
              Keyword = " 󰌋 ",
              Snippet = "  ",
              Color = " 󰏘 ",
              File = " 󰈙 ",
              Reference = " 󰈇 ",
              Folder = " 󰉋 ",
              EnumMember = "  ",
              Constant = " 󰏿 ",
              Struct = " 󰙅 ",
              Event = "  ",
              Operator = " 󰆕 ",
              TypeParameter = "",
            },
          }),
        },
      })
    end,
  },
}
