-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- dont list quickfix buffers
local autocmd = vim.api.nvim_create_autocmd

-- Don't list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Auto close neo-tree if only buffer
autocmd("BufEnter", {
  nested = true,
  callback = function()
    ---@diagnostic disable-next-line
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NeoTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

-- Remove numbers and caps from spell-checking
autocmd("BufEnter", {
  callback = function()
    vim.cmd("syn match myExNonWords +\\<\\p*[^A-Za-z \\t]\\p*\\>+ contains=@NoSpell")
    vim.cmd(":syn match myExCapitalWords +\\<[A-Z]\\w*\\>+ contains=@NoSpell")
  end,
})

-- Disable auto-comment new line
autocmd("BufWinEnter", {
  callback = function()
    vim.cmd("checktime")
    vim.cmd("set formatoptions-=cro")
  end,
})

-- Filetype sh for zsh
autocmd("Filetype", {
  pattern = "zsh",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

-- 70 color column
autocmd("Filetype", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.colorcolumn = "70"
  end,
})

-- Close help pages with q
autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "Markdown",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Disable foldmethod for diff files
autocmd("Filetype", {
  pattern = { "diff", "gitcommit" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.foldmethod = "diff"
    vim.opt.listchars = { tab = "  " }
    vim.cmd("hi DiffAdd guifg=#449dab guibg=NONE")
    vim.cmd("hi DiffDelete guifg=#914c54 guibg=NONE")
    vim.cmd("hi DiffChange guifg=#6183bb guibg=NONE")
  end,
})

-- Auto-close command window
autocmd("CmdWinEnter", {
  callback = function()
    vim.cmd("quit")
  end,
})

-- Auto export png when saving mermaid
autocmd("BufWritePost", {
  pattern = "*.mmd",
  callback = function()
    vim.cmd([[silent! !mmdc -i % -o %:r.png --theme forest -s 2]])
  end,
})
