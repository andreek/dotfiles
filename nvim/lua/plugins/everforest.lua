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

      local function SetBackgroundMode()
        local new_bg = "light"
        local mode = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme"):gsub("\n", ""):gsub("'", "")
        if mode == "prefer-dark" then
          new_bg = "dark"
        end
        if vim.opt.background:get() ~= new_bg then
          vim.opt.background = new_bg
        end
      end
      vim.fn.timer_start(5000, SetBackgroundMode, { ["repeat"] = -1 })
      SetBackgroundMode()

      vim.cmd("colorscheme everforest")
    end
  }
}
