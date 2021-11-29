vim.g.mapleader=' '

--insert
vim.api.nvim_set_keymap('i', 'kj', '<ESC>l',{})
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O',{})

--normal
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG"+y',{silent=true})
vim.api.nvim_set_keymap('n', '<C-h>', ':RnvimrToggle<CR>',{silent=true})
vim.api.nvim_set_keymap('n', '<C-t>', ':vs<CR><C-w>l:terminal<CR>',{})
vim.api.nvim_set_keymap('n', 'nh', ':nohlsearch',{})
vim.api.nvim_set_keymap('n', '<F6>', ':lua require("tools").compile()<CR>',{})

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>',{})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>',{})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>',{})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>',{})

vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
--terminal
vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n><C-w>',{})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n>:RnvimrToggle<CR>',{silent=true})
