return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup()
  end,
}
