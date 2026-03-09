return {
  {
    "saghen/blink.cmp",
    opts = {
      -- snippets = {
      --   preset = "default",
      -- },

      -- appearance = {
      --   use_nvim_cmp_as_default = false,
      --   nerd_font_variant = "mono",
      -- },

      completion = {
        -- accept = {
        --   auto_brackets = {
        --     enabled = true,
        --   },
        -- },

        -- menu = {
        --   draw = {
        --     treesitter = { "lsp" },
        --   },
        -- },

        menu = {
          border = "rounded",
          -- winblend = 10,
        },

        documentation = {
          auto_show = false, -- turn OFF
        },

        ghost_text = {
          enabled = false, -- ONLY Copilot provides ghost text
        },
      },

      -- sources = {
      --   compat = {},
      --   default = { "lsp", "path", "snippets", "buffer" },
      -- },

      -- keymap = {
      --   preset = "enter", -- Enter accepts blink completion
      --   ["<C-y>"] = { "select_and_accept" },
      -- },
    },
  },
}
