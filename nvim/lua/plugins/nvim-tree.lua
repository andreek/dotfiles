return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40,
      },
      filters = {
        dotfiles = false,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<F4>", api.node.open.preview, {
          buffer = bufnr, silent = true, desc = "NvimTree Preview"
        })
      end,
    })

    vim.keymap.set("n", "<Leader>n", ":NvimTreeToggle<CR>", { silent = true, desc = "NvimTree Toggle" })
    vim.keymap.set("n", "<Leader>nf", ":NvimTreeFindFile<CR>", { silent = true, desc = "NvimTree Reveal File" })
    vim.keymap.set("n", "<C-p>", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<F3>", ":NvimTreeFindFile<CR>", { silent = true })
  end,
}
