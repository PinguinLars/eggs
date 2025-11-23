return {
    "anAcc22/sakura.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
        vim.opt.background = "dark" -- or "light"
        vim.cmd('colorscheme sakura') -- sets the colorscheme
    end
}

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- 	-- opts = {
-- 	-- 	transparent = true,
-- 	-- 	styles = {
-- 	-- 		sidebars = "transparent",
-- 	-- 		floats = "transparent",
-- 	-- 	},
-- 	-- },
-- }
-- return {
--  "catppuccin/nvim",
--  name = "catppuccin",
--  priority = 1000,
--  config = function()
--    vim.cmd.colorscheme "catppuccin"
--  end
-- }
