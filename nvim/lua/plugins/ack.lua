return {
  "mileszs/ack.vim",
  lazy = true,
  cmd = { "Ack", "AckAdd", "AckFromSearch", "AckHelp" },
  init = function()
    vim.g.ackprg = 'rg --vimgrep --smart-case'
  end,
}
