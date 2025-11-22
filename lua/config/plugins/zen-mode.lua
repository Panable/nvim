return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 120, -- 40% of the editor width
      options = {
        number = false,
        relativenumber = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      twilight = { enabled = false }, -- disable twilight.nvim integration
      gitsigns = { enabled = true },
      tmux = { enabled = true }, -- enable tmux integration to hide status line
    },
  },
  keys = {
    {
      "<leader>z",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Toggle Zen Mode",
    },
  },
}


