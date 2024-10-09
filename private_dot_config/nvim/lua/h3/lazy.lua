-- Remove any packadd or Packer reference
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Plugin management
  { 'nvim-lua/plenary.nvim' },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Auto pairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  -- Easy commenting
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  -- Snippet engine
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },

  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Harpoon
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Undo functionality
  { "mbbill/undotree" },

  -- Clipboard manager
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- Git plugins
  "tpope/vim-fugitive",
  "sindrets/diffview.nvim",
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  "tpope/vim-rhubarb",

  -- LSP setup
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},

  -- Null-ls setup
  { 'jose-elias-alvarez/null-ls.nvim' },

  -- Icons and other UI enhancements
  { "nvim-tree/nvim-web-devicons" },
--  { "github/copilot.vim" },
  
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Keybindings guide
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        plugins = {
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
        show_help = true,
        show_keys = true,
        triggers = { "<leader>" },
      }
      
      local wk = require("which-key")
      wk.register({
        f = {
          name = "File",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          n = { "<cmd>enew<cr>", "New File" },
        },
        p = {
          name = "Project",
          f = { "<cmd>Telescope live_grep<cr>", "Find in Project" },
        },
        b = {
          name = "Buffer",
          b = { "<cmd>Telescope buffers<cr>", "Switch Buffer" },
          d = { "<cmd>bdelete<cr>", "Delete Buffer" },
        },
      }, { prefix = "<leader>" })
    end
  },

  -- Troubleshooting
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Function signature helper
  { "ray-x/lsp_signature.nvim" },

  -- Debugging setup
  'mfussenegger/nvim-dap',
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',
  'ChristianChiarulli/neovim-codicons',

  -- Go development
  'ray-x/go.nvim',
  'ray-x/guihua.lua',
  {
    'crusj/structrue-go.nvim',
    branch = "main"
  },

  -- Elixir development
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- CSV
  {
    'cameron-wags/rainbow_csv.nvim',
    config = function()
      require 'rainbow_csv'.setup()
    end,
    lazy = true,
    ft = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe', 'rfc_csv', 'rfc_semicolon' },
  },

  -- Indentation guides
  "lukas-reineke/indent-blankline.nvim",

  -- Code preview
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  },

  -- Refactoring
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
  },

  -- Spectre for project-wide search and replace
  'nvim-pack/nvim-spectre',

  -- Outline
  { "hedyhli/outline.nvim" },

  -- Todo comments
  'folke/todo-comments.nvim',

  -- Colorschemes
  'bluz71/vim-nightfly-guicolors',
  'scottmckendry/cyberdream.nvim',
  "lunarvim/synthwave84.nvim",
  { "catppuccin/nvim", as = "catppuccin" },

  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },

  'nvim-treesitter/playground',
  'koenverburg/peepsight.nvim',

  -- Code folding
  'anuvyklack/pretty-fold.nvim',

  -- Barbar for tabs
  'romgrk/barbar.nvim',

  -- mini
  { 'echasnovski/mini.nvim', version = '*' },

  -- Kitty highlighting
  "fladson/vim-kitty",

  -- smart splits
  { 'mrjones2014/smart-splits.nvim' },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- set this if you want to always pull the latest change
      opts = {
        submit_key = "<C-CR>", -- Use Ctrl+Enter to submit
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    }
})

