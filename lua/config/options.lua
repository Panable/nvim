vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim

vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                  -- set relative numbered lines

vim.opt.undofile = true                         -- enable persistent undo
vim.opt.ignorecase = true                       -- ignore case in search patterns

vim.opt.smartcase = true                        -- smart case

vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 50                         -- faster completion (4000ms default)

vim.opt.cursorline = true                       -- highlight the current line

vim.opt.scrolloff = 10                           -- is one of my fav

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")

vim.opt.incsearch = true

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab

vim.opt.termguicolors = false                    -- set term gui colors (most terminals support this)
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files

vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}

vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 2                        -- always show tabs

vim.opt.wrap = false                            -- display lines as one long line
vim.opt.sidescrolloff = 8
vim.opt.colorcolumn = "0"

vim.opt.shortmess:append "c"

