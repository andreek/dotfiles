return {
  "vim-syntastic/syntastic",
  init = function()
    -- Statusline integration
    -- vim.opt.statusline:append("%#warningmsg#")
    -- vim.opt.statusline:append("%{SyntasticStatuslineFlag()}")
    -- vim.opt.statusline:append("%*")
    vim.opt.laststatus = 2
    vim.opt.showtabline = 2
    vim.opt.showmode = false
    -- Syntastic global options
    vim.g.syntastic_always_populate_loc_list = 1
    vim.g.syntastic_auto_loc_list = 1
    vim.g.syntastic_check_on_open = 1
    vim.g.syntastic_check_on_wq = 1
    vim.g.syntastic_javascript_checkers = { "eslint" }
  end
}
