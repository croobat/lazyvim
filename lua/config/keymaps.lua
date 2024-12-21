-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local unmap = vim.keymap.del
local map = vim.keymap.set

-- ## Normal ##
-- insert line
map("n", "<enter>", "o<esc>", opts)
map("n", "<A-enter>", "i<CR><esc>", opts)

-- center screen when jumping to next
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

--quickfix
map("n", "<C-n>", ":cnext<CR>", opts)
map("n", "<C-p>", ":cprevious<CR>", opts)
map("n", "<C-q>", ":copen<CR>", opts)
map("n", "<C-A-q>", ":cclose<CR>", opts)

-- ## Insert ##
-- emacs like keys
map("i", "<C-a>", "<ESC>I", opts)
map("i", "<C-e>", "<ESC>A", opts)
map("i", "<M-f>", "<ESC>lWi", opts)
map("i", "<M-b>", "<ESC>Bi", opts)
map("i", "<M-d>", "<ESC>ciw", opts)

-- ## Visual ##
-- delete without yanking (leader + d)
map("v", "<leader>d", '"_d', opts)

-- ## Terminal ##
-- better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)

-- ## Common ##
map("n", "<leader>S", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { desc = "Search and replace" })
map("n", "<leader>;", "A;<esc>", { desc = "Append semicolon" })
map("n", "<leader>,", "A,<esc>", { desc = "Append comma" })
map("n", "<leader>ff", "<cmd>lua LazyVim.format({force =true})<cr>", { desc = "Format" })

-- ## Toggle ##
map("n", "<leader>zf", "<cmd>set foldmethod=indent<cr>", { desc = "Fold indent" })
map("n", "<leader>zF", "<cmd>set foldmethod=marker<cr>", { desc = "Fold mark" })
map("n", "<leader>zh", "<cmd>lua vim.opt.hlsearch = true<cr>", { desc = "Highlight on" })
map("n", "<leader>zH", "<cmd>nohlsearch<cr>", { desc = "Highlight off" })
map("n", "<leader>zi", "<cmd>setlocal autoindent<cr>", { desc = "Auto-indent on" })
map("n", "<leader>zI", "<cmd>setlocal noautoindent<cr>", { desc = "Auto-indent off" })
map("n", "<leader>zl", "<cmd>set colorcolumn=79<cr>", { desc = "Color column on" })
map("n", "<leader>zL", "<cmd>set colorcolumn=0<cr>", { desc = "Color column off" })
map("n", "<leader>zt", "<cmd>set shiftwidth=2 tabstop=2<cr>", { desc = "Indent 2 spaces" })
map("n", "<leader>zT", "<cmd>set shiftwidth=4 tabstop=4<cr>", { desc = "Indent 4 spaces" })
map("n", "<leader>zc", "<cmd>setlocal formatoptions+=cro<cr>", { desc = "Auto-comment on" })
map("n", "<leader>zC", "<cmd>setlocal formatoptions-=cro<cr>", { desc = "Auto-comment off" })
map("n", "<leader>zs", "<cmd>%s/\\s\\+$//e<cr>", { desc = "Remove traling spaces" })
map("n", "<leader>zw", "<cmd>set wrap<cr>", { desc = "Wrap on" })
map("n", "<leader>zW", "<cmd>set nowrap<cr>", { desc = "Wrap off" })

-- ## Gitsigns ##
map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", { desc = "Git Next Hunk" })
map("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Git Previous Hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Git Reset Hunk" })
map("n", "<leader>ga", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Git Stage Hunk" })

-- ## Search ##
map("n", "<leader>sf", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Search document symbols" })
map("n", "<leader>sF", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Search workspace symbols" })
