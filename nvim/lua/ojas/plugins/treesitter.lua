local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotab = { enable = true },
	ensure_installed = {
		"lua",
		"json",
		"yaml",
		"markdown",
		"bash",
		"vim",
		"dockerfile",
		"gitignore",
	},
	auto_install = true,
})
