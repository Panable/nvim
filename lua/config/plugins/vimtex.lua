return {
	"lervag/vimtex",

	-- configuration
	config = function()
		-- Vimtex settings
		vim.g.tex_flavor = "latex"
		vim.g.tex_fast = "bMpr"
		vim.g.tex_conceal = ""
		vim.g.vimtex_enabled = 1
		vim.o.conceallevel = 0
		vim.g.vimtex_indent_enabled = 0
		vim.g.vimtex_matchparen_enabled = 0
		vim.g.vimtex_imaps_enabled = 0

		-- Configure compiler
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "aux",
			out_dir = "build",
			callback = 1,
			continuous = 1,
			executable = "latexmk",
			options = {
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
				"-emulate-aux-dir",
				'-auxdir="aux"',
				'-outdir=""',
			},
		}
		vim.api.nvim_set_keymap("n", "<Leader>ll", ":VimtexCompile<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>lv", ":VimtexView<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Space>tv", ":VimtexView<CR>", { noremap = true, silent = true })
	end,
}
