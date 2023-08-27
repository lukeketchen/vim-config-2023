-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
    'lukeketchen/onedark.vim',
    config = function()
      vim.cmd('colorscheme onedark')

      vim.api.nvim_set_hl(0, 'StatusLineNonText', {
        fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
        bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
      })


    end,
  })

  -- Commenting support.
  -- gcc comments out line
  use({
    'tpope/vim-commentary',
    config = function()
      -- Maintain cursor position
      vim.keymap.set('n', 'gcap', 'my<cmd>norm vip<bar>gc<cr>`y')
    end,
  })

  use ({
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  })

  -- Add, change, and delete surrounding text.
  -- cs to select surrounding tag
  use('tpope/vim-surround')

  -- Useful commands like :Rename and :SudoWrite.
  use('tpope/vim-eunuch')

  -- Pairs of handy bracket mappings, like [b and ]b.
  -- open brackets
  use('tpope/vim-unimpaired')

  -- Indent autodetection with editorconfig support.
  use('tpope/vim-sleuth')

  -- Allow plugins to enable repeating of commands.
  use('tpope/vim-repeat')

  -- Navigate seamlessly between Vim windows and Tmux panes.
  use('christoomey/vim-tmux-navigator')

  -- Jump to the last location when opening a file.
  use('farmergreg/vim-lastplace')

  -- Enable * searching with visually selected text.
  use('nelstrom/vim-visual-star-search')

  -- Automatically create parent dirs when saving.
  use('jessarcher/vim-heritage')

-- File tree sidebar
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('ketchlabs/plugins/nvim-tree')
  end,
})

-- A Status line.
use {
  'nvim-lualine/lualine.nvim',
  requires = {
    'kyazdani42/nvim-web-devicons', 
    'arkav/lualine-lsp-progress'
  },
  config = function()
    require('ketchlabs/plugins/lualine')
  end,
}

-- Display buffers as tabs.
use({
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  after = 'onedark.vim',
  config = function()
    require('ketchlabs/plugins/bufferline')
  end,
})

-- Add a dashboard.
use({
  'glepnir/dashboard-nvim',
  config = function()
    require('ketchlabs/plugins/dashboard-nvim')
  end
})

  -- Automatically set the working directory to the project root.
  use({
    'airblade/vim-rooter',
    setup = function()
      -- Instead of this running every time we open a file, we'll just run it once when Vim starts.
      vim.g.rooter_manual_only = 1
      vim.g.rooter_patterns = {'.git', 'composer.json'}
    end,
    config = function()
      vim.cmd('Rooter')
    end,
  })

  -- Automatically add closing brackets, quotes, etc.
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })

  -- Automatically fix indentation when pasting code.
  use({
    'sickill/vim-pasta',
    config = function()
      vim.g.pasta_disabled_filetypes = { 'fugitive' }
    end,
  })

  -- Git integration.
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '⢕' },
          change = { text = '⢕' },
        },
      })
      vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
      vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
      vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
      vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end,
  })

  --- Floating terminal.
use({
  'voldikss/vim-floaterm',
  config = function()
    require('ketchlabs/plugins/floaterm')
  end
})

  -- Git commands.
use({
  'tpope/vim-fugitive',
  requires = 'tpope/vim-rhubarb',
})

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'nvim-treesitter/playground',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('ketchlabs/plugins/treesitter')
  end,
})

  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  -- Language Server Protocol.
use({
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    require('ketchlabs/plugins/lspconfig')
  end,
})

-- Completion
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-copilot',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    require('ketchlabs/plugins/cmp')
  end,
})

-- PHP Refactoring Tools
use({
  'phpactor/phpactor',
  ft = 'php',
  run = 'composer install --no-dev --optimize-autoloader',
  config = function()
    vim.keymap.set('n', '<Leader>pm', ':PhpactorContextMenu<CR>')
  end,
})

  -- Testing helper
use({
  'vim-test/vim-test',
  config = function()
    require('ketchlabs/plugins/vim-test')
  end,
})

end)
