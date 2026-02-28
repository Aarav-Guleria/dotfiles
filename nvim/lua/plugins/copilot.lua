return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          dismiss = "<C-e>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },

      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
        -- json = false,
        -- yaml = false,
      },
    },
  },
}
