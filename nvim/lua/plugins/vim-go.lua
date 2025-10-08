return {
  "fatih/vim-go",
  ft = "go", -- Only load for Go files
  init = function()
    -- Plugin options
    vim.g.go_fmt_autosave = 1
    vim.g.go_fmt_command = "goimports"
    vim.g.go_highlight_types = 1
    vim.g.go_highlight_fields = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_function_calls = 1
    vim.g.go_highlight_operators = 1
    vim.g.go_highlight_extra_types = 1
    vim.g.go_highlight_build_constraints = 1

    -- Buffer settings for Go files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.shiftwidth = 4
        -- keymaps for Go filetype
        vim.keymap.set("n", "<leader>r", "<Plug>(go-run)", { buffer = true, desc = "Go: Run" })
      end,
    })

    -- BufEnter *.go mappings
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.go",
      callback = function()
        vim.keymap.set("n", "<Leader><Leader>", ":GoRun<CR>", { buffer = true, desc = "Go: Run file" })
        vim.keymap.set("n", "<Leader>l", ":e!<CR>", { buffer = true, desc = "Go: Reload file" })
      end,
    })
  end,
}
