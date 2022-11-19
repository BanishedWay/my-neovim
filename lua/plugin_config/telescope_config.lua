require("project_nvim").setup({})
local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("没有找到 telescope")
	return
end

telescope.setup({
	defaults = {
		-- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
		initial_mode = "insert",
		-- vertical , center , cursor
		-- layout_strategy = "cursor",
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

telescope.load_extension("projects")
telescope.load_extension("env")
telescope.load_extension("fzf")
