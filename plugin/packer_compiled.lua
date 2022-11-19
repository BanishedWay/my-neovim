-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/xujinqi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/xujinqi/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/xujinqi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/xujinqi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/xujinqi/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "git@github.com:numToStr/Comment.nvim"
  },
  LeaderF = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/LeaderF",
    url = "git@github.com:Yggdroot/LeaderF"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "git@github.com:stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "git@github.com:goolord/alpha-nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "git@github.com:romgrk/barbar.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "git@github.com:catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "git@github.com:hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "git@github.com:hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "git@github.com:sindrets/diffview.nvim"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "git@github.com:Mofiqul/dracula.nvim"
  },
  edge = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/edge",
    url = "git@github.com:sainnhe/edge"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "git@github.com:j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "git@github.com:nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "git@github.com:rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "git@github.com:lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "git@github.com:lukas-reineke/indent-blankline.nvim"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/lazygit.nvim",
    url = "git@github.com:kdheepak/lazygit.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "git@github.com:onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "git@github.com:tami5/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "git@github.com:folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "git@github.com:nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "git@github.com:iamcco/markdown-preview.nvim"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/moonlight.nvim",
    url = "git@github.com:shaunsingh/moonlight.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "git@github.com:sbdchd/neoformat"
  },
  neon = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/neon",
    url = "git@github.com:rafamadriz/neon"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "git@github.com:EdenEast/nightfox.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "git@github.com:shaunsingh/nord.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "git@github.com:windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "git@github.com:williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "git@github.com:jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@github.com:neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "git@github.com:rcarriga/nvim-notify"
  },
  ["nvim-tabline"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-tabline",
    url = "git@github.com:crispgm/nvim-tabline"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "git@github.com:kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "git@github.com:p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@github.com:kyazdani42/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "git@github.com:mhartington/oceanic-next"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "git@github.com:navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["persisted.nvim"] = {
    config = { "\27LJ\2\nh\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\14persisted\frequire\0" },
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/persisted.nvim",
    url = "git@github.com:olimorris/persisted.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "git@github.com:ahmedkhalf/project.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "git@github.com:simrat39/rust-tools.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "git@github.com:michaelb/sniprun"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "git@github.com:lewis6991/spellsitter.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "git@github.com:simrat39/symbols-outline.nvim"
  },
  ["telescope-env.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/telescope-env.nvim",
    url = "git@github.com:LinArcX/telescope-env.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "git@github.com:nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "git@github.com:folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "git@github.com:akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "git@github.com:folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "git@github.com:folke/trouble.nvim"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/vim-code-dark",
    url = "git@github.com:tomasiser/vim-code-dark"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "git@github.com:tpope/vim-fugitive"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors",
    url = "git@github.com:bluz71/vim-nightfly-guicolors"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/xujinqi/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "git@github.com:hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: persisted.nvim
time([[Config for persisted.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\14persisted\frequire\0", "config", "persisted.nvim")
time([[Config for persisted.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
