-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basics
vim.opt.compatible = false
vim.cmd('filetype plugin indent on')
vim.opt.clipboard = 'unnamed'
vim.opt.mouse = 'a'
vim.opt.exrc = true
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '.vimrc',
  command = 'source <afile>',
})
vim.opt.autoindent = true
vim.opt.autowriteall = true
vim.api.nvim_create_autocmd({ 'FocusLost', 'TabLeave' }, {
  pattern = '*',
  command = 'silent! wa',
})
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.undofile = true
if vim.fn.has('nvim') == 1 then
  vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
else
  vim.opt.undodir = vim.fn.expand('~/.vim/undo')
end

vim.opt.completeopt = { 'menuone', 'longest' }
vim.opt.wildignore:append({ '.git', '*/node_modules/*' })
if vim.fn.has('nvim') == 0 then
  vim.opt.ttymouse = 'xterm2'
end
vim.opt.foldlevel = 9999
vim.opt.spell = true

-- Styling
vim.cmd('syntax on')
vim.opt.background = 'dark'
vim.opt.number = true
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.listchars = { tab = '▸ ', eol = '¬' }
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt.listchars = { tab = '▸ ', eol = '¬' }
  end,
})
vim.opt.colorcolumn = '80'
vim.api.nvim_set_hl(0, 'CursorLine', { cterm = {} })

-- Tabs vs Spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.jsx_ext_required = 0

-- JavaScript
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.js',
  callback = function()
    vim.keymap.set("n", "<Leader><Leader>", ":w<CR>:!node %:p<CR>", { buffer = true })
    vim.keymap.set("n", "<Leader>t", ":w<CR>:!pnpx jest --verbose --findRelatedTests %:p<CR>", { buffer = true })
    vim.keymap.set("n", "<Leader>e", ":w<CR>:!pnpx eslint --fix %:p<CR>:e!<CR>", { buffer = true })
  end,
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.json',
  callback = function() vim.bo.filetype = "json" end,
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.uce',
  callback = function() vim.bo.filetype = "html" end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = "javascript",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

vim.g.node_host_prog = '/usr/local/bin/neovim-node-host'
vim.g.javascript_plugin_jsdoc = 1

-- Switch dark/light mode (optional, uses gsettings)
local function SetBackgroundMode()
  local new_bg = "light"
  local mode = vim.fn.systemlist("gsettings get org.gnome.desktop.interface color-scheme")[1]
  if mode and mode:find("prefer-dark") then
    new_bg = "dark"
  end
  if vim.opt.background:get() ~= new_bg then
    vim.opt.background = new_bg
  end
end
-- Uncomment to enable periodic background mode checking:
-- vim.fn.timer_start(5000, SetBackgroundMode, { ["repeat"] = -1 })
-- SetBackgroundMode()
--

-- Key bindings
vim.keymap.set("n", "<Leader>v", ":e ~/.vimrc<CR>", { desc = "Edit user .vimrc" })
vim.keymap.set("n", "<Leader>V", ":e .vimrc<CR>", { desc = "Edit project .vimrc" })
vim.keymap.set("n", "<Leader>C", ":e .env<CR>", { desc = "Edit project .env" })
vim.keymap.set("n", "<Space>", ":nohlsearch<Bar>:echo<CR>", { silent = true, desc = "Clear search" })
vim.keymap.set("n", "<Leader><Space>", ":!echo -n % | xclip -selection clipboard<CR><CR>", { silent = true, desc = "Copy buffer path" })
vim.keymap.set('n', '<C-Left>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-q>', ':tabc<CR>', { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
