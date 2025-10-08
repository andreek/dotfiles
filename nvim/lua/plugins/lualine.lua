return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup {
      options = {
        theme = "auto",
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- more options...
      },
      sections = {
        lualine_x = {
          'encoding',
          'fileformat',
          {
            'filetype',
            colored = true,   -- Displays filetype icon in color if set to true
            icon_only = false, -- Display only an icon for filetype
          }
        }
      }
    }
    vim.opt.laststatus = 2
    vim.opt.showtabline = 2
    vim.opt.showmode = false
  end
}
