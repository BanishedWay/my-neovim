-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("正在安装Pakcer.nvim，请稍后...")
	paccker_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"git@github.com:wbthomason/packer.nvim.git",
		-- "https://github.com/wbthomason/packer.nvim",
		--"https://gitcode.net/mirrors/wbthomason/packer.nvim",
		install_path,
	})
	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("Pakcer.nvim 安装完毕")
end
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("没有安装 packer.nvim")
	return
end
packer.init({
	git = {
		default_url_format = "git@github.com:%s",
	},
})
packer.startup({
	function(use)
		use("wbthomason/packer.nvim")
		----------------------------plugins ----------------
		-----lsp
		use({ "williamboman/nvim-lsp-installer" })
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- Snippet 引擎
		use({
			"hrsh7th/vim-vsnip",
			requires = "hrsh7th/cmp-vsnip",
		})
		use("rafamadriz/friendly-snippets")
		use("hrsh7th/cmp-nvim-lsp")
		-- 补全源
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
		-- use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })
		-- use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }) --{'name'='tabnine'}
		-- Lua 增强
		use("folke/lua-dev.nvim")
		--Rust增强
		-- use("simrat39/rust-tools.nvim")
		-- TypeScript 增强
		-- use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = { "nvim-lua/plenary.nvim", opt = false } })
		-- UI 增强
		use("onsails/lspkind-nvim")
		use("tami5/lspsaga.nvim")
		use("rcarriga/nvim-notify")
		use("j-hui/fidget.nvim")
		-- nvim-autopairs
		use("windwp/nvim-autopairs")
		-- format
		use("sbdchd/neoformat")
		--markdown
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})
		--indentline
		use("lukas-reineke/indent-blankline.nvim")
		--comment
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		--OutlineTree
		use("simrat39/symbols-outline.nvim")
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("aerial").setup()
			end,
		})
		--treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
		})
		use("p00f/nvim-ts-rainbow")
		use({
			"lewis6991/spellsitter.nvim",
			config = function()
				require("spellsitter").setup({
					enable = true,
				})
			end,
		})
		--nvim tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		--trouble tree
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		--term
		use({
			"akinsho/toggleterm.nvim",
			tag = "v2.*",
			config = function()
				require("toggleterm").setup()
			end,
		})
		-----search
		use({
			"Yggdroot/LeaderF",
			run = ":LeaderfInstallCExtension",
		})
		use({
			"nvim-lua/plenary.nvim",
		})
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- telescope extensions
		use("LinArcX/telescope-env.nvim")
		use("nvim-telescope/telescope-ui-select.nvim")
		use("ahmedkhalf/project.nvim")
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
			run = "make",
		})
		------UI
		use("goolord/alpha-nvim")
		use("crispgm/nvim-tabline")
		use("folke/todo-comments.nvim")
		use("romgrk/barbar.nvim")
		use("nvim-lualine/lualine.nvim")
		------Theme
		-- use({
		-- 	"dracula/vim",
		-- 	as = "dracula",
		-- })
		use("Mofiqul/dracula.nvim")
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})
		use("navarasu/onedark.nvim")
		use("shaunsingh/nord.nvim")
		use("folke/tokyonight.nvim")
		use("mhartington/oceanic-next")
		use("EdenEast/nightfox.nvim")
		use("rafamadriz/neon")
		use("tomasiser/vim-code-dark")
		use("bluz71/vim-nightfly-guicolors")
		use("shaunsingh/moonlight.nvim")
		use("sainnhe/edge")
		------git
		use("kdheepak/lazygit.nvim")
		use("lewis6991/gitsigns.nvim")
		use("sindrets/diffview.nvim")
		use("tpope/vim-fugitive")
		-----startup time
		use("nathom/filetype.nvim")
		use("lewis6991/impatient.nvim")

		use({ "michaelb/sniprun", run = "zsh ./install.sh" })
		-----session
		use({
			"olimorris/persisted.nvim",
			--module = "persisted", -- For lazy loading
			config = function()
				require("persisted").setup()
				require("telescope").load_extension("persisted") -- To load the telescope extension
			end,
		})
	end,
	config = {
		-- 锁定插件版本在snapshots目录
		-- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
		-- 这里锁定插件版本在v1，不会继续更新插件
		-- snapshot = "v1",
		-- 最大并发数
		max_jobs = 16,
		-- 使用浮动窗口
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
