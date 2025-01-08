return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()

      require('nvim-dap-virtual-text').setup {
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match 'secret' or name:match 'api' or value:match 'secret' or value:match 'api' then
            return '*****'
          end

          if #variable.value > 15 then
            return ' ' .. string.sub(variable.value, 1, 15) .. '... '
          end

          return ' ' .. variable.value
        end,
      }

      vim.keymap.set('n', '<space>b', dap.toggle_breakpoint, { desc = 'Debug. Add breakpoint' })
      vim.keymap.set('n', '<space>gb', dap.run_to_cursor, { desc = 'Debug. Run to cursor' })

      -- Eval var under cursor
      vim.keymap.set('n', '<space>?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<F1>', dap.continue, { desc = 'Debug. Run code' })
      vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug. Step into' })
      vim.keymap.set('n', '<F3>', dap.step_over, { desc = 'Debug. Step over' })
      vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debug. Step out' })
      vim.keymap.set('n', '<F5>', dap.step_back, { desc = 'Debug. Step back' })
      vim.keymap.set('n', '<F13>', dap.restart, { desc = 'Debug. Restart' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
