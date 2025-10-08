return {
  "tpope/vim-fugitive",
  init = function()
    vim.keymap.set("n", "<Leader>s", ":tabnew<CR>:G<CR>", { desc = "Fugitive: Git status in new tab" })
    vim.keymap.set("n", "<Leader>d", ":tabe %:p<CR>:Gdiff<CR>", { desc = "Fugitive: Git diff current file in new tab" })
    vim.keymap.set("n", "<Leader>h", ":tabnew<CR>:Gclog<CR>:copen<CR>", { desc = "Fugitive: Git log in new tab" })
    vim.keymap.set("n", "<Leader>l", ":tabe %:p<CR>:Gclog %:p<CR>:copen<CR>", { desc = "Fugitive: Git log for current file in new tab" })
  end
}
