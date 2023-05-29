local nvim_lsp = require("lspconfig")

local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

nvim_lsp.clangd.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
		"--header-insertion=never",
		"--background-index",
	},
	filetypes = {"c", "cpp", "objc", "objcpp"},
}

nvim_lsp.rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

nvim_lsp.dockerls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"docker-langserver", "--stdio"
	},
	filetypes = { "dockerfile" },
	root_dir = nvim_lsp.util.root_pattern("Dockerfile"),
	single_file_support = true,
}

nvim_lsp.bashls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"bash-language-server", "start"
	},
	cmd_env = {
		GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
	},
	filetypes = { "sh" },
	root_dir = nvim_lsp.util.find_git_ancestor,
	single_file_support = true,
}
