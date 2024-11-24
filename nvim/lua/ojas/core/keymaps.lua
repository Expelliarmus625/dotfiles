vim.g.mapleader = " "
local keymap = vim.keymap

-- general keymaps

-- keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") --open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tabwew wew
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize and minimize window

-- file-explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- gitsigns
keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>")
keymap.set("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>")
keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
keymap.set("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>")
