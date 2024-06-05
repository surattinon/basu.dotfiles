local map = vim.keymap.set
local silent = { noremap = true, silent = true }

-- DEFAULT KICKSTART
-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>md', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
map('n', '<leader>mq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

--  See `:help wincmd` for a list of all window commands
-- map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- CUSTOM

-- SPLIT-WINDOW
map('n', 'ss', ':split<CR>', silent)
map('n', 'sv', ':vsplit<CR>', silent)

-- RESIZE-WINDOW
map('n', '<C-w><left>', '6<C-w><')
map('n', '<C-w><right>', '6<C-w>>')
map('n', '<C-w><up>', '3<C-w>+')
map('n', '<C-w><down>', '3<C-w>-')
