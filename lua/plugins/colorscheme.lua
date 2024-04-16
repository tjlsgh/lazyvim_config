return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim", lazy = false },
  { "catppuccin/nvim", lazy = false, name = "catppuccin", priority = 1000 },
  {
    "sainnhe/everforest",
    lazy = false,
  },
  { "shaunsingh/nord.nvim", lazy = false },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require("nordic").load()
    -- end,
  },

  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      })
    end,

    -- -- optionally set the colorscheme within lazy config
    -- init = function()
    --   vim.cmd("colorscheme poimandres")
    -- end,
  },
  {
    "rktjmp/lush.nvim",
    lazy = false,
  },

  {
    "tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "everforest",
      -- colorscheme = "nordic",
    },
  },
}
