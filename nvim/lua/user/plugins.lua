-- auto install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- auto command to reload nvim when you save plugins.lua aka :w the file dummy
vim.cmd [[
  augroup lazy_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | Lazy sync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  print("Error calling lazy")
  return
end

-- install plugins here :)
lazy.setup({
  -- my plugins
  "folke/lazy.nvim", -- lazy package manager | self manages
  "folke/which-key.nvim", -- never forget a keybinding again
  { "folke/neoconf.nvim", cmd = "Neoconf" }, -- manage global and project-local settings
  "folke/neodev.nvim", -- setup for init.lua and plugin development
  "nvim-lua/popup.nvim", -- implementation of the popup api from vim in neovim
  "nvim-lua/plenary.nvim", -- useful lua function for many plugins
  { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }, -- view your notes in real time
  {'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' }},
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  "ray-x/web-tools.nvim",
  

  -- productivity
  "folke/twilight.nvim",
  "folke/zen-mode.nvim",
  {
  "pluffie/neoproj",
  cmd = { "ProjectOpen", "ProjectNew" },
  },
   

  -- looks
  "goolord/alpha-nvim", -- dashboard so you can show this on unixporn
  {"nvim-treesitter/nvim-treesitter", run = "TSUpdate"}, -- syntax highlighting baby!!
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
  'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      {'MunifTanjim/nui.nvim'}
    }
  },
  "windwp/windline.nvim",
  {"xiyaowong/transparent.nvim", event = 'VimEnter'},

  -- nvim-tree
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
  },

  -- completeion 
  "hrsh7th/nvim-cmp", -- THE completion plugiin
  "hrsh7th/cmp-buffer", -- buffer completions!
  "hrsh7th/cmp-path", -- path completeions!
  "hrsh7th/cmp-cmdline", -- cmdline completeions!
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",  ------------------------
  "windwp/nvim-autopairs", ------------------------
{
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({})
    end
}, ------------------------
  "JoosepAlviste/nvim-ts-context-commentstring", -- more completion things idk man its 12am and I haven't ate 
  "aca/emmet-ls", 
  -- snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- bunch of dependencies for something
  'kevinhwang91/nvim-fundo', 
  {'kevinhwang91/promise-async', run = function() require('fundo').install() end},
  -- lsp 
  "neovim/nvim-lspconfig",
  "williamboman/nvim-lsp-installer",
  { "williamboman/mason.nvim", 
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  
})


