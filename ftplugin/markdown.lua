-- Markdown filetype configuration

-- Disable autocompletion for markdown files
local cmp = require("cmp")
if cmp then
	cmp.setup.buffer({ enabled = false })
end

-- Enable wrap and line breaking
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

-- Keymaps for better navigation in wrapped lines
vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
vim.keymap.set("n", "0", "g0", { buffer = true })
vim.keymap.set("n", "$", "g$", { buffer = true })

-- Enable spell checking with underline
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- Configure spell checking highlight (underline misspellings)
-- Use undercurl for better visibility - this will underline misspelled words
-- The color will adapt to your color scheme, but we ensure undercurl is enabled
vim.cmd([[
  highlight SpellBad gui=undercurl guisp=Red cterm=undercurl
  highlight SpellCap gui=undercurl guisp=Blue cterm=undercurl
  highlight SpellRare gui=undercurl guisp=Magenta cterm=undercurl
  highlight SpellLocal gui=undercurl guisp=Cyan cterm=undercurl
]])

-- Spell checking keymaps (built-in Vim commands):
-- ]s → jump to next misspelled word
-- [s → jump to previous misspelled word
-- z= → suggestions for the word under cursor
-- zg → mark word as good (add to dictionary)
-- zw → mark word as bad (remove from dictionary)