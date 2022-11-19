--- set for keymap
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- leader key 为空
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = {
	noremap = true,
	silent = true,
}

local map = vim.api.nvim_set_keymap

--基础快捷键
map("n", "<A-q>", ":qa<CR>", opt)
map("n", "<C-q>", ":q<CR>", opt)
map("n", "<A-s>", ":silent w<CR>", opt)
map("i", "<A-x>", "<End> <CR>", opt)
-- map("n", "<A-p>", ":PackerSync<CR>", opt)

--- 设置搜索
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)
--全选
map("n", "<A-a>", "ggVG", opt)
--- Plugins 配置
map("n", "ll", ":LazyGit<CR>", opt)
map("n", "<C-j>", ":Gitsigns toggle_signs<CR>", opt)
map("n", "<A-v>", ":SymbolsOutline<CR>", opt)
map("n", "<space>o", ":DiffviewOpen<CR>", opt)
map("n", "<space>p", ":DiffviewClose<CR>", opt)

-- Todo设置
map("n", "<Leader>t", ":TodoTelescope<CR>", opt)
map("i", "<A-v>", "TODO:", opt)

--Buffer切换
map("n", "<Leader>1", ":BufferGoto 1<CR>", opt)
map("n", "<Leader>2", ":BufferGoto 2<CR>", opt)
map("n", "<Leader>3", ":BufferGoto 3<CR>", opt)
map("n", "<Leader>4", ":BufferGoto 4<CR>", opt)
map("n", "<Leader>5", ":BufferGoto 5<CR>", opt)
map("n", "<Leader>6", ":BufferGoto 6<CR>", opt)
map("n", "<Leader>7", ":BufferGoto 7<CR>", opt)
map("n", "<Leader>8", ":BufferGoto 8<CR>", opt)
map("n", "<Leader>9", ":BufferGoto 9<CR>", opt)
map("n", "<space>n", ":BufferNext<CR>", opt)
map("n", "<space>b", ":BufferClose<CR>", opt)

local pluginKeys = {}

pluginKeys.nvimTreeList = {
	{ key = { "<CR>", "<2-LeftMouse>" }, action = "edit" },
	{ key = "o", action = "system_open" },
	-- v分屏打开文件
	{ key = "v", action = "vsplit" },
	-- h分屏打开文件
	{ key = "h", action = "split" },
	-- Ignore (node_modules)
	{ key = "i", action = "toggle_ignored" },
	-- Hide (dotfiles)
	{ key = ".", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	-- 文件操作
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "I", action = "toggle_file_info" },
	{ key = "n", action = "tabnew" },
	-- 进入下一级
	{ key = { "]" }, action = "cd" },
	-- 进入上一级
	{ key = { "[" }, action = "dir_up" },
}

--cmp
pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		-- 上一个
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- 出现补全
		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<A-,>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- 确认
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		-- 如果窗口内容太多，可以滚动
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		-- snippets 跳转
		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		-- end of super Tab
	}
end

-- 回调函数
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	--[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  --]]
	mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	-- mapbuf("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opt)
	-- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)
	--[[
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  Lspsaga 替换 gh
  --]]
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gb", { noremap = false })

--F快捷键 配置
map("n", "<F5>", ":ToggleTerm<CR>", opt)
map("n", "<c-l>", ":SnipRun<CR>", opt)
map("v", "<c-l>", ":SnipRun<CR>", opt)
map("n", "<F6>", ":lua require'core.functions'.run_result()<CR>", opt)
map("n", "<F7>", ":NvimTreeFindFileToggle<CR>", opt)
map("n", "<F9>", ":MarkdownPreviewToggle<CR>", opt)
map("n", "<space>t", ":TroubleToggle<CR>", opt)

--leaderf、telescope 快捷键
map("n", "<C-f>", ":silent Leaderf function<CR>", opt)
map("n", "<C-n>", ":silent enew<CR>", opt)
map("n", "<C-p>", ":Telescope find_files prompt_prefix=🔍<CR>", opt)
map("n", "<C-o>", ":Telescope oldfiles<CR>", opt)
map("n", "<Leader>b", ":Telescope buffers<CR>", opt)
map("n", "<Leader>p", ":Telescope projects<CR>", opt)
map("n", "<A-m>", ":Telescope git_commits<CR>", opt)
map("n", "<A-t>", ":Telescope <CR>", opt)
map("n", "<A-f>", ":Telescope live_grep<CR>", opt)
map("n", "<A-w>", "<C-w>w", { noremap = false })
map("n", "<A-c>", ":Telescope colorscheme<CR>", opt)
map("n", "<A-g>", ":Telescope persisted<CR>", opt)

--cmake
map("n", "cb", ":lua require'core.functions'.cmake_build()<CR>", opt)

return pluginKeys
