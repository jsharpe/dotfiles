return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"clangd",
				"tailwindcss",
				"svelte",
				"lua_ls",
				-- "graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"ruff",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"ruff", -- python linter
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})
	end,
}
