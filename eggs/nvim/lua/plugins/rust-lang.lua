return {
  { "rust-lang/rust.vim" },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
    end,
  },
--  {
--    "mrcjkb/rustaceanvim",
--    version = "^6", -- Recommended
--    lazy = false, -- This plugin is already lazy
--  },
}
