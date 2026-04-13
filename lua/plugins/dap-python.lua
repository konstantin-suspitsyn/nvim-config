return {
  'mfussenegger/nvim-dap-python',
  config = function()
    --local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
    require('dap-python').setup '/home/konstantin/.pyenv/versions/3.12.7/envs/debugpy3127/bin/python'
  end,
}
