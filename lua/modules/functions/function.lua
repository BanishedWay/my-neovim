local M = {}
local filetype = vim.bo.filetype
M.compile_gcc = function()
	local compile_cmd
	if vim.bo.filetype == "cpp" then
		compile_cmd = "!gcc"
	else
		compile_cmd = "!g++"
	end
	local compile_flag = "-o %< "
	local execcmd = compile_cmd .. " % " .. compile_flag
	vim.api.nvim_command(execcmd)
end

M.compile_java = function()
	vim.api.nvim_command("!javac %")
end

M.compile_code = function()
	if filetype == "cpp" or filetype == "c" then
		M.compile_gcc()
	elseif filetype == "java" then
		M.compile_java()
	end
end

M.run_result = function()
	local res
	if filetype == "cpp" or filetype == "c" then
		M.compile_gcc()
		res = vim.api.nvim_cmd("! ./%<", true)
	elseif filetype == "java" then
		M.compile_java()
		res = vim.api.nvim_cmd("!java %<", true)
	elseif filetype == "py" then
		vim.api.nvim_command("!python %")
	elseif filetype == "lua" then
		vim.api.nvim_command("!lua %")
	end
	return res
end

return M
