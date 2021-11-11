local has_gh, gh = pcall(require, "github-theme")
if not has_gh then return end

gh.setup {theme_style = "dark_default", sidebars = {"qf", "which_key", "toggleterm"}, hide_inactive_statusline = false}

local Color, colors, Group, groups, style = require"colorbuddy".setup()

Color.new("fg", "#c9d1d9")
Color.new("bg", "#0d1117")
Color.new("blue", "#58a6ff")
Color.new("sel", "#163356")
Color.new("gray", "#8b949e")
Color.new("red", "#ff7b72")

Group.new("TelescopeTitle", colors.bg, colors.blue)

Group.new("CmpItemAbbrMatch", colors.blue)
Group.new("CmpItemAbbrDeprecated", colors.red)
Group.new("CmpItemMenu", colors.gray)

Group.new("ElNormal", colors.bg, colors.blue:light(), style.bold)
Group.new("ElInsert", colors.bg, colors.blue:light(), style.bold)
Group.new("ElVisual", colors.bg, colors.blue:light(), style.bold)
Group.new("ElVisualLine", colors.bg, colors.blue:light(), style.bold)
Group.new("ElVisualBlock", colors.bg, colors.blue:light(), style.bold)
Group.new("ElReplace", colors.bg, colors.blue:light(), style.bold)
Group.new("ElSelect", colors.bg, colors.blue:light(), style.bold)
Group.new("ElCommand", colors.bg, colors.blue:light(), style.bold)
Group.new("ElTerm", colors.bg, colors.blue:light(), style.bold)
