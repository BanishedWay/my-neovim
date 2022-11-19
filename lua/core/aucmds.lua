local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})
local funcs = require("core.functions")

local autocmd = vim.api.nvim_create_autocmd

--NvimTree自动关闭
autocmd("BufEnter", {
	nested = true,
	group = myAutoGroup,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})
-- 修改lua/plugins.lua 自动更新插件
autocmd("BufWritePost", {
	group = myAutoGroup,
	-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
	callback = function()
		if vim.fn.expand("<afile>") == "lua/core/plugins.lua" then
			vim.api.nvim_command("source lua/core/plugins.lua")
			vim.api.nvim_command("PackerSync")
		end
	end,
})

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
autocmd("BufWinEnter", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			require("bufferline.api").set_offset(31, "FileTree")
		end
	end,
})
autocmd("BufWinLeave", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		if vim.fn.expand("<afile>"):match("NvimTree") then
			require("bufferline.api").set_offset(0)
		end
	end,
})

--treesitter
autocmd("BufRead,BufNewFile", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		funcs.ts_enable()
	end,
})

--清除缓存
autocmd("VimEnter", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		vim.api.nvim_exec([[LuaCacheClear]], false)
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
