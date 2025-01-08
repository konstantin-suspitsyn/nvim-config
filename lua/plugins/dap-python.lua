return {
  'mfussenegger/nvim-dap-python',
  config = function()
    local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
    require('dap-python').setup(mason_path .. 'packages/debubpy/venv/bin/python')
  end,
}
