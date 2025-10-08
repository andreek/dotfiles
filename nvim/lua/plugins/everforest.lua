return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "medium"
      vim.g.everforest_enable_italic = 0
      vim.g.everforest_better_performance = 0
      vim.g.everforest_dim_inactive_windows = 1

      vim.cmd("colorscheme everforest")
    end
  }
}
