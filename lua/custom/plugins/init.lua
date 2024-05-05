-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'davidgranstrom/scnvim',
    config = function()
      local scnvim = require 'scnvim'
      scnvim.setup {
        ensure_installed = true,
        sclang = {
          cmd = nil,
          args = {},
        },
        keymaps = {},
        documentation = {
          cmd = nil,
          horizontal = true,
          direction = 'top',
          keymaps = true,
        },
        postwin = {
          highlight = true,
          auto_toggle_error = true,
          scrollback = 5000,
          horizontal = false,
          direction = 'right',
          size = nil,
          fixed_size = nil,
          keymaps = nil,
          float = {
            enabled = false,
            row = 0,
            col = function()
              return vim.o.columns
            end,
            width = 64,
            height = 14,
            config = {
              border = 'single',
            },
            callback = function(id)
              vim.api.nvim_win_set_option(id, 'winblend', 10)
            end,
          },
        },
        editor = {
          force_ft_supercollider = true,
          highlight = {
            color = 'TermCursor',
            type = 'flash',
            flash = {
              duration = 100,
              repeats = 2,
            },
            fade = {
              duration = 375,
            },
          },
          signature = {
            float = true,
            auto = true,
          },
        },
        snippet = {
          engine = {
            name = 'luasnip',
            options = {
              descriptions = true,
            },
          },
        },
        statusline = {
          poll_interval = 1,
        },
        extensions = {},
      }
      require('luasnip').add_snippets('supercollider', require('scnvim/utils').get_snippets())
    end,
  },
}
