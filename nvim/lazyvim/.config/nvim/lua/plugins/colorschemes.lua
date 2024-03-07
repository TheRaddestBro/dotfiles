return {
  -- Add colorschemes
  -- Lush is used by several of the below schemes
  { "rktjmp/lush.nvim", lazy = false },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "cryptomilk/nightcity.nvim", lazy = true, version = false },
  { "metalelf0/jellybeans-nvim", lazy = false },
  { "casonadams/walh", lazy = true },
  { "ntk148v/habamax.nvim", lazy = true },
  { "uloco/bluloco.nvim", lazy = true },
  -- These seem to already be included in LazyVim, leaving them here for posterity
  --{ "folke/tokyonight.nvim", lazy = true },
  --{ "catppuccin/nvim" },

  -- Configure default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
