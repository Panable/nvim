return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    { "<leader>so", "<cmd>only<CR>", desc = "Close all splits" },
    { "<leader>sc", "<cmd>close<CR>", desc = "Close current split" },
    { "<backspace>", "<cmd>e #<CR>", desc = "go prev file" },
  },
}
