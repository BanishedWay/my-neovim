return {
	on_setup = function(server)
		server.setup({
			flags = {
				debounce_text_changes = 150,
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.document_formatting = false
				client.server_capabilities.document_range_formatting = false

				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end
				require("core.keymapping").mapLSP(buf_set_keymap)
			end,
		})
	end,
	download_jdtls = function()
		vim.api.nvim_command("silent !bash ~/.config/nvim/lua/modules/scripts/dj.sh]]")
	end,
}
