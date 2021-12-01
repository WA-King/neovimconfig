local M = {}

-- compile c++, python
M.compile = function()
	vim.api.nvim_command('w')
	local type=vim.o.filetype
	if(type=='cpp')
	then
		vim.api.nvim_command("!g++ % -std=c++11 -DWA_DEBUG -o %<")
	elseif(type=='python')
	then
		vim.api.nvim_command("!python %")
	end
end

return M
