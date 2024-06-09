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

-- NOTE: Obsidian keymaps
map('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'Obsidian: Create a new Note', silent = true })
map('n', '<leader>oo', ':ObsidianOpen<CR>', { desc = 'Obsidian: Open a note', silent = true })
map('n', '<leader>os', ':ObsidianSearch<CR>', { desc = 'Obsidian: Search notes', silent = true })
map('n', '<leader>ol', ':ObsidianFollowLink<CR>', { desc = 'Obsidian: Follow Url', silent = true })
map('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'Obsidian: Show backlinks', silent = true })
map('n', '<leader>ot', ':ObsidianTags<CR>', { desc = 'Obsidian: Show tags', silent = true })
map('n', '<leader>od', ':ObsidianDailies<CR>', { desc = 'Obsidian: Open daily note', silent = true })

-- NOTE: Navigator keymaps
map('n', ']b', ':bprevious<CR>', { desc = 'Previous buffer' })
map('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })
