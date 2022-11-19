local M = {}
local exec = vim.api.nvim_exec

M.ts_enable = function()
	exec("silent TSEnable highlight", false)
	exec("silent TSEnable indent", false)
	exec("silent TSEnable rainbow", false)
	exec("silent TSEnable incremental_selection", false)
end

M.format_save = function()
	if vim.bo.filetype == "cpp" or vim.bo.filetype == "c" or vim.bo.filetype == "h" or vim.bo.filetype == "hpp" then
		exec("silent Neoformat clangformat", false)
	end
	exec("silent Neoformat", false)
end

M.compile_cpp = function()
	local compilecmd
	local compileflag = "-o %< "
	if vim.bo.filetype == "c" then
		compilecmd = "!gcc %:h/*.c "
	elseif vim.bo.filetype == "cpp" then
		compilecmd = "!g++ %:h/*.cpp "
	end
	local cmd = compilecmd .. compileflag
	local msg = exec(cmd, true)
	return msg
end

M.compile_java = function()
	local msg = exec("!javac %", true)
	return msg
end

M.run_python = function()
	local msg = exec("!python %", true)
	return msg
end

M.run_lua = function()
	local msg = exec("!lua %", true)
	return msg
end

M.run_java = function()
	local msg = exec("!java %<", true)
	return msg
end

M.run_cpp = function()
	local msg = exec("! ./%<", true)
	return msg
end

M.run_result = function()
	local msg = ""
	local title = ""
	if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
		title = "C/C++ result"
		msg = M.compile_cpp()
		msg = msg .. M.run_cpp()
	elseif vim.bo.filetype == "java" then
		title = "Java result"
		msg = M.compile_java()
		msg = msg .. M.run_java()
	elseif vim.bo.filetype == "python" then
		title = "Python result"
		msg = M.run_python()
	elseif vim.bo.filetype == "lua" then
		title = "Lua result"
		msg = M.run_lua()
	elseif vim.bo.filetype == "cmake" then
		exec("!./bin/*", false)
		msg = "CMake Result"
		title = "CMake Run Success"
	end
	vim.notify(msg, vim.log.levels.INFO, {
		title = title,
	})
end

M.cmake_build = function()
	local msg = ""
	local title = "CMake Build"
	local path = FindPath()
	path = string.sub(path, 3)
	--删除pwd命令返回的空格和其他字符
	local res = string.gsub(path, "\r\n", "")
	res = string.gsub(res, "%s+", "")
	local cmd = "!cmake " .. res .. " -B" .. res .. "build"
	-- print(cmd)
	msg = exec(cmd, true)
	if msg ~= nil then
		cmd = "!cd " .. res .. "build && make"
		msg = exec(cmd, true)
		if msg ~= nil then
			vim.notify("CMake Build Success", vim.log.levels.INFO, { title = title })
		end
	end
end

function FindPath()
	local dir = exec("!pwd", true)
	dir = WipePath(dir)
	-- print(dir)
	local name = exec("!ls %", true)
	name = WipePath(name)
	-- print(name)
	local path = ReversePath(name)
	return dir .. "/" .. path
end

function WipePath(path)
	local i = string.find(path, "\r\n")
	return string.sub(path, i + 1, -2)
end
function ReversePath(path)
	local reverse = string.reverse(path)
	local _, i = string.find(reverse, "/")
	if i ~= nil then
		local m = string.len(reverse) - i + 1
		return string.sub(path, 1, m)
	end
	return ""
end

return M
