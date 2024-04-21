-- Leader Key

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
-- Map <Leader>h to ClangdSwitchSourceHeader
vim.api.nvim_set_keymap('n', '<Leader>h', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })

-- Moving lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- vim.keymap.set("i", "jk", "<ESC>", opts)


-- Centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc='set [X]ecutable', silent = true })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {desc = '[F]ind projects'})
