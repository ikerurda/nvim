local has_gh, gh = pcall(require, "github-theme")
if not has_gh then return end

-- Theme settings
gh.setup {theme_style = "dark_default", hide_inactive_statusline = false}

local Color, colors, Group, groups, style = require"colorbuddy".setup()

-- Colors
Color.new("fg", "#c9d1d9")
Color.new("bg", "#0d1117")
Color.new("blue", "#58a6ff")
Color.new("sel", "#163356")
Color.new("gray", "#8b949e")
Color.new("red", "#ff7b72")

-- Hop
Group.new("HopNextKey", colors.red, colors.bg)
Group.new("HopNextKey1", colors.red, colors.bg)
Group.new("HopNextKey2", colors.blue, colors.bg)
Group.new("HopUnmatched", colors.grey, colors.bg)
Group.new("HopCursor", colors.bg, colors.grey)

-- Completion menu
Group.new("CmpItemAbbrMatch", colors.blue)
Group.new("CmpItemAbbrDeprecated", colors.red)
Group.new("CmpItemMenu", colors.gray)

-- Statusline
Group.new("ElInsertInactive", colors.gray, colors.bg, style.bold)
Group.new("StatusLine", colors.gray, colors.bg:light())
Group.new("ElNormal", colors.gray, colors.bg:light(), style.bold)
Group.new("ElInsert", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElVisual", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElVisualLine", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElVisualBlock", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElReplace", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElSelect", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElCommand", groups.ElNormal, groups.ElNormal, groups.ElNormal)
Group.new("ElTerm", groups.ElNormal, groups.ElNormal, groups.ElNormal)

-- Other
Group.new("VertSplit", colors.bg:light(), colors.bg)
Group.new("EndOfBuffer", colors.gray:dark(), colors.bg)
