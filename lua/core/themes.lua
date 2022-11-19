--tokyonight config
vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true

--catppuccin
local catppuccin = require("catppuccin")
catppuccin.setup()
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

local colorscheme = "carbonfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
	return
end
