-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','             -- change leader to a comma

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.ignorecase = true         -- ignore case letters when search

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------

--require("bluloco").setup({
--  style = "auto",               -- "auto" | "dark" | "light"
--  transparent = false,
--  italics = false,
--  terminal = fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
--  guicursor   = true,
--})
opt.termguicolors = true      -- enable 24-bit RGB colors

--vim.cmd('colorscheme bluloco')
