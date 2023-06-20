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
