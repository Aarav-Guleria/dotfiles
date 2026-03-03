-- Default theme (TRACKED)
-- vim.g.current_theme = "cyberdream" --uncomment to set theme

-- "tokyonight" | "kanagawa" | "catppuccin" | "cyberdream"
-- "rose-pine" | "gruvbox-material" | "zenbones"

-- Local override (UNTRACKED)
pcall(dofile, vim.fn.stdpath("config") .. "/lua/local/theme.lua")

-- Capture final value AFTER override
local current = vim.g.current_theme

-- Core UI settings
vim.o.termguicolors = true
vim.o.background = "dark"

return {
  --------------------------------------------------------------------
  -- TOKYONIGHT (TRANSPARENT)
  --------------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = current ~= "tokyonight",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "transparent",
          floats = "transparent",
        },
        dim_inactive = false,
        lualine_bold = true,
      })

      if current == "tokyonight" then
        vim.cmd.colorscheme("tokyonight")
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
        vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
      end
    end,
  },

  --------------------------------------------------------------------
  -- KANAGAWA (SOLID, SIMPLIFIED)
  --------------------------------------------------------------------
  {
    "rebelot/kanagawa.nvim",
    lazy = current ~= "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        commentStyle = { italic = true },
        keywordStyle = { italic = false },
        transparent = false,
        theme = "dragon",
      })

      if current == "kanagawa" then
        vim.cmd.colorscheme("kanagawa")
      end
    end,
  },

  --------------------------------------------------------------------
  -- CATPPUCCIN (SOLID, CLEAN)
  --------------------------------------------------------------------
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = current ~= "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte | frappe | macchiato | mocha
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { "italic" },
          keywords = { "italic" },
        },
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          telescope = true,
          mason = true,
          blink_cmp = true,
        },
      })

      if current == "catppuccin" then
        vim.cmd.colorscheme("catppuccin")
      end
    end,
  },

  --------------------------------------------------------------------
  -- GRUVBOX
  --------------------------------------------------------------------
  {
    "sainnhe/gruvbox-material",
    lazy = current ~= "gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_enable_bold = true

      if current == "gruvbox-material" then
        vim.cmd.colorscheme("gruvbox-material")
      end
    end,
  },

  --------------------------------------------------------------------
  -- ROSE-PINE
  -------------------------------------------------------------------
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = current ~= "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- main | moon | dawn
        dark_variant = "main",

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      })

      if current == "rose-pine" then
        vim.cmd.colorscheme("rose-pine")
      end
    end,
  },

  --------------------------------------------------------------------
  -- cyberdream
  -------------------------------------------------------------------
  {
    "scottmckendry/cyberdream.nvim",
    lazy = current ~= "cyberdream",
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        theme = {
          highlights = {},
        },
      })
      if current == "cyberdream" then
        vim.cmd.colorscheme("cyberdream")
      end
    end,
  },

  --------------------------------------------------------------------
  -- ZENBONES
  -------------------------------------------------------------------
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.g.zenbones_lighten_noncurrent_window = true
      vim.g.zenbones_transparent_background = false
      vim.g.zenbones_palette = "default"

      if current == "zenbones" then
        vim.cmd.colorscheme("randombones_dark") -- "rosebones", "duckbones" etc.
      end
    end,
  },
}
