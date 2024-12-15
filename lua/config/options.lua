-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Globals
vim.g.loaded_ruby_provider = 0
vim.g.autoformat = false
vim.g.lazyvim_eslint_auto_format = false

-- Commands
-- Move to next line with hjkl
vim.cmd("set whichwrap+=<,>,[,],h,l")
-- Recursive find files
vim.cmd("set path+=**")
-- Include - and _ as part of words
vim.cmd("set iskeyword+=^-,^_")

-- Weird options
-- Disable start screen and certain warnings
opt.shm:append("Ic")
-- Special chars for nbsp, tab and trailing space
opt.listchars = { tab = "│ ", trail = "·", precedes = "<", extends = ">", nbsp = "○" }

local options = {
  -- System
  backup = false, -- System backups
  swapfile = false, -- Swapfile for buffer files
  clipboard = vim.env.SSH_TTY and "" or "unnamedplus", -- System clipboard
  fileencoding = "utf-8", -- Encoding
  mouse = "a", -- Enable mouse
  undofile = true, -- Persistent undo upon exit
  writebackup = false, -- Backup while editing file
  title = true, -- custom title
  autowrite = false, -- Auto write buffer when switching
  confirm = true, -- Confirm to save changes

  -- Tabs
  expandtab = false, -- Turn tabs into spaces
  smarttab = true, -- Detect number of spaces per tab
  tabstop = 2, -- Number of spaces a tab counts for
  softtabstop = 2, -- Number of spaces a tab counts for (editing)
  shiftwidth = 2, -- Number of spaces per auto indent

  -- Indentation
  smartindent = true, -- Sensible indenting
  autoindent = true, -- Tab when jump from indented line
  lisp = false, -- Indent when line breaks
  foldmethod = "marker", -- Folding with {{{}}}
  formatoptions = "jqlnt", -- Autoformat options (remove auto comment)

  -- Interface
  cmdheight = 1, -- Space to show cmd messages
  pumheight = 10, -- Pop-up menu height
  showtabline = 1, -- Show tabs if more than 1
  splitbelow = true, -- Horizontal splits go below window
  splitright = true, -- Vertical splits go to the right of window
  textwidth = 0, -- Character column limit
  wrap = false, -- Start with text wrapped
  scrolloff = 8, -- Min distance from top-down borders
  sidescrolloff = 0, -- Min distance from left-right borders
  colorcolumn = "100", -- Column to show color

  -- Left column
  number = true, -- Numbered lines
  relativenumber = true, -- Numbered line relative to cursor
  numberwidth = 2, -- Column width
  signcolumn = "yes", -- When to show sign columns

  -- Visuals
  showbreak = " .. ", -- Shown when line breaks
  guifont = "Recursive Mono Linear Static:h8", -- Font in graphical applications
  conceallevel = 0, -- Don't hide special text (ie json "")
  showmode = false, -- Mode warnings on interface
  termguicolors = true, -- 24-bit RGB color
  cursorline = true, -- Highlight current line
  list = true, -- Enable listchars

  -- Search
  hlsearch = false, -- Highlighting
  ignorecase = true, -- Case insensitive patterns
  smartcase = true, -- Case sensitive only if there are caps

  -- Completion
  completeopt = "menu,menuone,noselect", -- Completion options
  timeoutlen = 300, -- ms to wait for mapped sequence
  updatetime = 200, -- Faster completion
  wildmode = "longest,full", -- Tab completion behaviour
  spell = false, -- Spelling check
  spelllang = "en,es", -- Spelling check language
}

for k, v in pairs(options) do
  opt[k] = v
end
