local status, lualine = pcall(require, "lualine")
if not status then
	return
end
-- local lualine_nightfly = require("lualine.themes.nightfly")
local lualine_tokyonight = require("lualine.themes.tokyonight")
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#BB9AF7",
	yellow = "#FF007C",
	black = "#000000",
}
lualine_tokyonight.normal.a.bg = new_colors.blue
lualine_tokyonight.insert.a.bg = new_colors.green
lualine_tokyonight.visual.a.bg = new_colors.violet
lualine_tokyonight.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black,
	},
}
lualine.setup({
	options = {
		-- theme = lualine_nightfly
		theme = lualine_tokyonight,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},

	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
				shorting_target = 40,
			},
		},
	},
})
