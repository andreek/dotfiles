return {
  "preservim/nerdtree",
  init = function()
    -- NERDTree (toggle)
    vim.keymap.set("n", "<Leader>n", ":NERDTreeToggle<CR>", { silent = true, desc = "NERDTree Toggle" })
    -- NERDTree (reveal current file)
    vim.keymap.set("n", "<Leader>f", ":NERDTreeFind<CR>", { silent = true, desc = "NERDTree Reveal File" })
    -- Extra keymaps
    vim.keymap.set("n", "<C-p>", ":NERDTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<F3>", ":NERDTreeFind<CR>", { silent = true })

    -- NERDTree options
    vim.g.NERDTreeQuitOnOpen = 1
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeMapActivateNode = "<F3>"
    vim.g.NERDTreeMapPreview = "<F4>"
    vim.g.NERDTreeWinSize = 40
  end
}
