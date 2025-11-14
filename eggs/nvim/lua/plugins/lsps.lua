return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.enable("gleam")

			-- local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({
			--   capabilities = capabilities,
			-- })
			-- lspconfig.ts_ls.setup({
			--   capabilities = capabilities,
			-- })
			-- lspconfig.html.setup({
			--   capabilities = capabilities,
			-- })
			--lspconfig.kotlin_lsp.setup({
			--	capabilities = capabilities,
			--})
			-- lspconfig.clangd.setup({
			--   capabilities = capabilities,
			--   cmd = { "clangd", "--background-index" },
			-- })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set({ "n", "x" }, "<leader>ca", function()
        require("tiny-code-action").code_action()
      end, { noremap = true, silent = true })
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
        blend = {
          factor = 0.0,
        },
        options = {
                  virt_texts = {
            priority = 3072,
        },
        }
      })
			vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
		end,
	},
}
