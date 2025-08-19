return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    keys = {
      -- I use this keymap with mini.files, but snacks explorer was taking over
      -- https://github.com/folke/snacks.nvim/discussions/949
      { '<leader>e', false },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep {
            -- Exclude results from grep picker
            -- I think these have to be specified in gitignore syntax
            -- exclude = { 'dictionaries/words.txt' },
          }
        end,
        desc = '[S]earch by [G]rep',
      },
      -- Open git log in vertical view
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log {
            finder = 'git_log',
            format = 'git_log',
            preview = 'git_show',
            confirm = 'git_checkout',
            layout = 'vertical',
          }
        end,
        desc = 'Search Git [L]og',
      },
      -- -- Iterate through incomplete tasks in Snacks_picker
      -- {
      --   -- -- You can confirm in your teminal lamw26wmal with:
      --   -- -- rg "^\s*-\s\[ \]" test-markdown.md
      --   '<leader>tt',
      --   function()
      --     Snacks.picker.grep {
      --       prompt = ' ',
      --       -- pass your desired search as a static pattern
      --       search = '^\\s*- \\[ \\]',
      --       -- we enable regex so the pattern is interpreted as a regex
      --       regex = true,
      --       -- no “live grep” needed here since we have a fixed pattern
      --       live = false,
      --       -- restrict search to the current working directory
      --       dirs = { vim.fn.getcwd() },
      --       -- include files ignored by .gitignore
      --       args = { '--no-ignore' },
      --       -- Start in normal mode
      --       on_show = function()
      --         vim.cmd.stopinsert()
      --       end,
      --       finder = 'grep',
      --       format = 'file',
      --       show_empty = true,
      --       supports_live = false,
      --       layout = 'ivy',
      --     }
      --   end,
      --   desc = '[P]Search for incomplete tasks',
      -- },
      -- -- Iterate throuth completed tasks in Snacks_picker lamw26wmal
      -- {
      --   '<leader>tc',
      --   function()
      --     Snacks.picker.grep {
      --       prompt = ' ',
      --       -- pass your desired search as a static pattern
      --       search = '^\\s*- \\[x\\] `done:',
      --       -- we enable regex so the pattern is interpreted as a regex
      --       regex = true,
      --       -- no “live grep” needed here since we have a fixed pattern
      --       live = false,
      --       -- restrict search to the current working directory
      --       dirs = { vim.fn.getcwd() },
      --       -- include files ignored by .gitignore
      --       args = { '--no-ignore' },
      --       -- Start in normal mode
      --       on_show = function()
      --         vim.cmd.stopinsert()
      --       end,
      --       finder = 'grep',
      --       format = 'file',
      --       show_empty = true,
      --       supports_live = false,
      --       layout = 'ivy',
      --     }
      --   end,
      --   desc = '[P]Search for complete tasks',
      -- },

      -- List git branches with Snacks_picker to quickly switch to a new branch
      {
        '<leader>gb',
        function()
          Snacks.picker.git_branches {
            layout = 'select',
          }
        end,
        desc = '[S]elect Git [B]ranches',
      },
      -- Search diagnostics
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics {
            -- layout = 'select',
          }
        end,
        desc = '[S]earch [D]iagnostics',
      },
      -- Used in LazyVim to view the different keymaps, this by default is
      -- configured as <leader>sk but I run it too often
      -- Sometimes I need to see if a keymap is already taken or not
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps {
            layout = 'vertical',
          }
        end,
        desc = '[S]earch [K]eymaps',
      },
      -- File picker
      {
        '<leader>sf',
        function()
          Snacks.picker.files {
            finder = 'files',
            format = 'file',
            show_empty = true,
            supports_live = true,
            -- In case you want to override the layout for this keymap
            -- layout = "vscode",
          }
        end,
        desc = '[S]earch [F]iles',
      },
      -- Resume search
      {
        '<leader>sr',
        function()
          Snacks.picker.resume {
            -- layout = 'vertical',
          }
        end,
        desc = '[R]esume [S]earch',
      },
      -- Search help
      {
        '<leader>sh',
        function()
          Snacks.picker.help {
            -- things
          }
        end,
        desc = '[S]earch [H]elp',
      },
      -- Search recent files
      {
        '<leader>s.',
        function()
          Snacks.picker.recent {
            -- things
          }
        end,
        desc = '[S]earch Recent Files',
      },
      -- See last search
      {
        '<leader>ss',
        function()
          Snacks.picker.recent {
            -- things
          }
        end,
        desc = '[S]earch Recent Files',
      },
      -- Search for word
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word {
            -- Exclude results from grep picker
            -- I think these have to be specified in gitignore syntax
            -- exclude = { 'dictionaries/words.txt' },
          }
        end,
        desc = '[S]earch current [W]ord',
      },
      -- Search for pickers
      {
        '<leader>sp',
        function()
          Snacks.picker.pick {
            -- a bunch of nothings
          }
        end,
        desc = '[S]earch [P]ickers',
      },
      -- Navigate my buffers
      {
        '<leader><leader>',
        function()
          Snacks.picker.buffers {
            -- I always want my buffers picker to start in normal mode
            on_show = function()
              vim.cmd.stopinsert()
            end,
            finder = 'buffers',
            format = 'buffer',
            hidden = false,
            unloaded = true,
            current = true,
            sort_lastused = true,
            win = {
              input = {
                keys = {
                  ['d'] = 'bufdelete',
                },
              },
              list = { keys = { ['d'] = 'bufdelete' } },
            },
            -- In case you want to override the layout for this keymap
            -- layout = "ivy",
          }
        end,
        desc = '[ ] Find existinng buffers',
      },
      {
        '\\',
        function()
          Snacks.explorer.open()
        end,
        desc = 'Explorer reveal',
        silent = true,
      },
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = false },
      input = { enabled = true },

      picker = {
        enabled = true,
        prompt = ' ',
        sources = {},
        focus = 'input',
        layout = {
          cycle = true,
          --- Use the default layout or vertical if the window is too narrow
          preset = function()
            return vim.o.columns >= 120 and 'default' or 'vertical'
          end,
        },
        ---@class snacks.picker.matcher.Config
        matcher = {
          fuzzy = true, -- use fuzzy matching
          smartcase = true, -- use smartcase
          ignorecase = true, -- use ignorecase
          sort_empty = false, -- sort results when the search string is empty
          filename_bonus = true, -- give bonus for matching file names (last part of the path)
          file_pos = true, -- support patterns like `file:line:col` and `file:line`
          -- the bonusses below, possibly require string concatenation and path normalization,
          -- so this can have a performance impact for large lists and increase memory usage
          cwd_bonus = false, -- give bonus for matching files in the cwd
          frecency = true, -- frecency bonus
          history_bonus = false, -- give more weight to chronological order
        },
      },

      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
