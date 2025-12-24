require 'config.options'
require 'config.remap'
require 'config.lazy'

-- Map <Leader>j to move to the start of the line
vim.api.nvim_set_keymap('n', '<Leader>j', '_', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>j', '_', { noremap = true })

-- Map <Leader>h to move to the end of the line
vim.api.nvim_set_keymap('n', '<Leader>k', '$', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>k', '$', { noremap = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.g.omni_sql_no_default_maps = 1
-- Define autocmd to set autoindent for PHP files
vim.cmd[[
  augroup php_autoindent
    autocmd!
    autocmd FileType php lua vim.bo.autoindent = true
  augroup END
]]

local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    }) end)

vim.opt.laststatus = 0

vim.api.nvim_create_user_command("ClearHighlights", function()
  vim.cmd("highlight CursorLineNR guibg=NONE")
  vim.cmd("highlight CursorLine guibg=NONE guifg=NONE")
  vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
  vim.cmd("highlight NormalNC ctermbg=NONE guibg=NONE")
  vim.cmd("highlight VertSplit guibg=NONE ctermbg=NONE")
  vim.cmd("highlight WinSeparator guibg=NONE ctermbg=NONE")
  vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
end, {})

vim.cmd("ClearHighlights");

-- Markdown heading colors (treesitter highlight groups)
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#ffdd33", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#73c936", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#96a6c8", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#cc8c3c", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#95a99f", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#9e95c7", bold = true })
