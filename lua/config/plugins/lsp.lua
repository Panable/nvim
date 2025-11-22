return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"Hoffs/omnisharp-extended-lsp.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		---------------------------------------------------------------------------
		-- LspAttach keymaps and highlighting
		---------------------------------------------------------------------------
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local vmap = function(keys, func, desc)
					vim.keymap.set("v", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>td", require("telescope.builtin").lsp_type_definitions, "[T]ype [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				vmap("<F3>", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		---------------------------------------------------------------------------
		-- Capabilities (nvim-cmp)
		---------------------------------------------------------------------------
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		---------------------------------------------------------------------------
		-- Mason setup
		---------------------------------------------------------------------------
		require("mason").setup()

		---------------------------------------------------------------------------
		-- LSP server configs that ARE Mason-managed
		-- (Mason will install these; mason-lspconfig will auto-enable them)
		---------------------------------------------------------------------------
		local servers = {
			clangd = {
				cmd = { "clangd", "--clang-tidy", "--cross-file-rename" },
				filetypes = { "c", "cpp", "h", "hpp" },
			},
			emmet_ls = {
				filetypes = { "php", "html", "css" },
			},
			gopls = {},
			pyright = {},
			rust_analyzer = {},
			ts_ls = {
				init_options = {
					plugins = {
						-- your TS plugins here if needed
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
			},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		-- Apply capabilities and register configs with vim.lsp.config
		for name, cfg in pairs(servers) do
			cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})
			vim.lsp.config(name, cfg)
		end

		---------------------------------------------------------------------------
		-- ZLS (NOT Mason-managed) – use your system /usr/bin/zls
		---------------------------------------------------------------------------
		vim.lsp.config("zls", {
			cmd = { "/usr/bin/zls" }, -- change if needed
			filetypes = { "zig", "zir" },
			root_markers = {
				"build.zig",
				"build.zig.zon",
				"zig.mod",
				".git",
			},
			capabilities = capabilities,
		})

		-- Enable zls globally for zig/zir filetypes
		vim.lsp.enable("zls")

		---------------------------------------------------------------------------
		-- Mason-tool-installer: tools + LSP servers to install
		---------------------------------------------------------------------------
		-- LSP servers (Mason package names match these nvim-lspconfig names)
		local ensure_lsp = vim.tbl_keys(servers)

		-- Extra tools (formatters, dbg, etc.) – Mason package IDs, NOT lspconfig names
		local ensure_tools = {
			"stylua",
			"asm_lsp",
			"clangd",
			"cmake",
			"csharpier",
			"cssls",
			"gopls",
			"html",
			"lua-language-server",
			"markdownlint",
			"netcoredbg",
			"omnisharp",
			"phpactor",
			"prettier",
			"pretty-php",
			"pyright",
			"rust-analyzer",
			"sql-formatter",
			"sqlls",
			"stylua",
			"typescript-language-server",
			-- deliberately NO "zls" here; we use /usr/bin/zls
		}

		require("mason-tool-installer").setup({
			ensure_installed = vim.list_extend(ensure_tools, ensure_lsp),
		})

		---------------------------------------------------------------------------
		-- Mason-lspconfig: ensure LSP servers installed & auto-enable them
		-- (for servers that Mason knows about; zls is handled manually above)
		---------------------------------------------------------------------------
		require("mason-lspconfig").setup({
			ensure_installed = ensure_lsp,
			-- automatic_enable = true is default; you can be explicit if you like:
			-- automatic_enable = true,
		})
	end,
}
