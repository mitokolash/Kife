return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
    	require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '|', right = '|'},
            section_separators = { left = ' ', right = ' '},
            refresh = {
              refresh_time = 16, -- ~60fps
              events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
              },
            }
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {},
            lualine_c = {'filetype', 'filename'},
            lualine_x = {},
            lualine_y = {'diagnostics'},
            lualine_z = {'location'}
          },
        }
    end,
}
