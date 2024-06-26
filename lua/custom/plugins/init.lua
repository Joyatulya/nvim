-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Autosave Plugins
  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup {
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  },

  -- To resume the session/tabs which were last open
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        -- ⚠️ This will only work if Telescope.nvim is installed
        -- The following are already the default values, no need to provide them if these are already the settings you want.
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }
      vim.keymap.set('n', '<leader>sa', require('auto-session.session-lens').search_session, {
        noremap = true,
      })
    end,
  },
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {}
    end,
  },
  {
    'andrewferrier/debugprint.nvim',
    opts = {
      keymaps = {
        normal = {
          plain_below = '<leader>lp',
          plain_above = '<leader>lP',
          variable_below = '<leader>ll',
          variable_above = '<leader>lL',
          variable_below_alwaysprompt = nil,
          variable_above_alwaysprompt = nil,
          textobj_below = '<leader>lt',
          textobj_above = '<leader>lT',
          toggle_comment_debug_prints = '<leader>lc',
          delete_debug_prints = '<leader>ld',
        },
        visual = {
          variable_below = '<leader>ll',
          variable_above = '<leader>ll',
        },
      },
      commands = {
        toggle_comment_debug_prints = 'ToggleCommentDebugPrints',
        delete_debug_prints = 'DeleteDebugPrints',
      },
    },
    -- The 'keys' and 'cmds' sections of this configuration are only needed if
    -- you want to take advantage of `lazy.nvim` lazy-loading.
    keys = {
      { '<leader>ll', mode = 'n' },
      { '<leader>lL', mode = 'n' },
      { '<leader>lP', mode = 'n' },
      { '<leader>lp', mode = 'n' },
      { '<leader>lt', mode = 'n' },
      { '<leader>lT', mode = 'n' },
      { '<leader>ld', mode = 'n' },
      { '<leader>lc', mode = 'n' },
      { '<leader>ll', mode = 'x' },
      { '<leader>lL', mode = 'x' },
    },
    cmd = {
      'ToggleCommentDebugPrints',
      'DeleteDebugPrints',
    },
    version = '*',
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}
}
