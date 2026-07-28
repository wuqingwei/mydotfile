local lualine = require('lualine')


lualine.setup({
options = {
	icons_enabled = true,
	theme = "solarized_dark", --auto allows for theme switching
	component_separators = { left = "", right = "" },
	section_separators = { left = "", right = "" },
	disabled_filetypes = { "alpha", "dashboard" },
	always_divide_middle = true,
	},

sections = {
	lualine_a = { 'mode' },
	lualine_b = { 'branch','diff','diagnostics' },
	lualine_c = { 'filename' },
	lualine_x = { 'encoding', "fileformat", "filetype" },
	lualine_y = { 'progress' },
	lualine_z = { 'location' },
	}
})

-- transparency override if using old pywal, shouldn't be needed with 16
-- vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
-- vim.api.nvim_set_hl(0, "lualine_x_normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "lualine_x_inactive", { bg = "none" })
