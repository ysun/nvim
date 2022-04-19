local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
	return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if not vim.loop.fs_stat(vim.fn.glob(install_path)) then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	compile_path = vim.fn.stdpath('data')..'/site/plugin/packer.lua',
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	}
})

local use = packer.use
packer.reset()

-- actual plugins list
use {'wbthomason/packer.nvim'}

use {'folke/tokyonight.nvim', config = get_config("tokyonight")}

use { "neovim/nvim-lspconfig", config = get_config("lsp") }

use({
	"nvim-telescope/telescope.nvim",
	requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	config = get_config("telescope"),
})

use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = get_config("nvim-tree")
}

use({ 
	"nvim-lualine/lualine.nvim",
	config = get_config("lualine"),
	event = "VimEnter",
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
})

use({
	"nvim-treesitter/nvim-treesitter",
	config = get_config("treesitter"),
	after = "nvim-lspconfig",
	run = ":TSUpdate",
})

use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }

use({
	"hrsh7th/nvim-cmp",
	requires = {
		{ "onsails/lspkind-nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "lukas-reineke/cmp-rg" } },
	},
	after = "nvim-lspconfig",
	config = get_config("cmp"),
})

use("ironhouzi/starlite-nvim")

use({ "folke/which-key.nvim", config = get_config("which") })

if packer_bootstrap then
	require("packer").sync()
end
