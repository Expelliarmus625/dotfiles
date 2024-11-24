-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
-- local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	--greeter
	use("goolord/alpha-nvim")
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many other plugins use
	use("bluz71/vim-nightfly-guicolors") -- preferred color scheme
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window
	-- essential plugins
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("numToStr/Comment.nvim") -- comment
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("windwp/nvim-autopairs") --auto bracket completion
	use("windwp/nvim-ts-autotag")

	--icons
	use("kyazdani42/nvim-web-devicons")
	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use("BurntSushi/ripgrep")
	use("sharkdp/fd")
	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- multiline editing
	use({ "mg979/vim-visual-multi", branch = "master" })
	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing LSP servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring LSP servers
	use("neovim/nvim-lspconfig")

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- git signs plugin
	use("lewis6991/gitsigns.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
