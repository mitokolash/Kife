local tlc = ":Telescope "
local map = vim.keymap.set
local default = { noremap = true, silent = true }

map('n', '<space>f', tlc .. 'find_files<CR>', default)
map('n', '<space>t', tlc .. 'buffers<CR>', default)

map('n', '<space><space>', ':Oil<CR>', default)

map('n', '<space>', ':', default)

map('n', 'gl', '$', default)
map('n', 'gh', '0', default)
map('n', 'ge', 'G', default)
