local opts = {
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		require("core.keymapping").mapLSP(buf_set_keymap)
	end,
}
return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
