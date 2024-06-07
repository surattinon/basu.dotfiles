local map = vim.keymap.set
local silent = { noremap = true, silent = true }

-- NOTE: Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>md', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
map('n', '<leader>mq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- NOTE: Exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: echo when use arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- NOTE: Set highlight on search, but clear on pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: SPLIT WINDOW
map('n', 'ss', ':split<CR>', silent)
map('n', 'sv', ':vsplit<CR>', silent)

-- NOTE: RESIZE WINDOW
map('n', '<C-w><C-h>', '10<C-w><')
map('n', '<C-w><C-l>', '10<C-w>>')
map('n', '<C-w><C-j>', '5<C-w>+')
map('n', '<C-w><C-k>', '5<C-w>-')

-- NOTE: Telescope extensions custom keymaps
map('n', '<leader>fp', ':Telescope projects<CR>', { desc = '[F]ind Recent [P]rojects' })
map('n', '<leader>fp', ':Telescope projects<CR>', { desc = '[F]ind Recent [P]rojects' })
