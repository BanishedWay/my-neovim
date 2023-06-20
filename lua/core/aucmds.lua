local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})
local funcs = require("core.functions")

local autocmd = vim.api.nvim_create_autocmd

-- 用o换行不要延续注释
autocmd("BufEnter", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions
			- "o" -- O and o, don't continue comments
			- "r" -- don't do continue when pressing enter.
	end,
})

--自动格式化
autocmd("BufWritePre", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		funcs.format_save()
	end,
})
