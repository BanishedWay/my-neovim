require("nvim-lsp-installer").setup({
	automatic_installation = true,
})

local lspconfig = require("lspconfig")

local servers = {
	-- sumneko_lua = require("lsp.settings.lua"), -- lua/lsp/config/lua.lua
	bashls = require("lsp.settings.bash"),
	pyright = require("lsp.settings.pyright"),
	-- clangd = require("lsp.settings.cpp"),
	-- jdtls = require("lsp.settings.java"),
	vimls = require("lsp.settings.vim"),
	-- cmake = require("lsp.settings.cmake"),
	prosemd_lsp = require("lsp.settings.markdown"),
	-- rust_analyzer = require("lsp.settings.rust"),
	-- tsserver = require("lsp.settings.ts"),
	-- html = require("lsp.settings.html"),
	-- cssls = require("lsp.settings.css"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		config.on_setup(lspconfig[name])
	else
		lspconfig[name].setup({})
	end
end

-- lspconfig.lua_ls.setup(require("lsp.settings.lua"))
