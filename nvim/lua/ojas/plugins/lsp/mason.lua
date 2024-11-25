local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end
local lspconfig = require("lspconfig")
mason.setup()

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({})
	end,
	["yamlls"] = function()
		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemas = {
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
					},
				},
			},
		})
	end,
})
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
	},
})
