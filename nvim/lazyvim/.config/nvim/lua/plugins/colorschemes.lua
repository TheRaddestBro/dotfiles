return {
  -- Add colorschemes
  -- Lush is used by several of the below schemes
  { "rktjmp/lush.nvim", Lazy = false },
  --{ "ellisonleao/gruvbox.nvim" },
  --{ "cryptomilk/nightcity.nvim", version = false },
  { "metalelf0/jellybeans-nvim" },
  --{ "casonadams/walh" },
  --{ "ntk148v/habamax.nvim" },
  --{ "uloco/bluloco.nvim" },
  { "tokyonight/nvim" },
  --{ "catppucin/nvim" },

  -- Configure default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
