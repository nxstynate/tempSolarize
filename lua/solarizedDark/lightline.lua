-- lightline support
local theme = require("solarizedDark.groups").setup()

local base02 = theme.SolarizedDarkbase02.fg
local base00 = theme.SolarizedDarkbase00.fg
local base0 = theme.SolarizedDarkbase0.fg
local base2 = theme.SolarizedDarkbase2.fg
local base0 = theme.SolarizedDarkbase0.fg
local base01 = theme.SolarizedDarkbase01.fg

local yellow = theme.SolarizedYellow.fg
local blue = theme.SolarizedBlue.fg
local cyan = theme.SolarizedCyan.fg
local orange = theme.SolarizedOrange.fg
local red = theme.SolarizedRed.fg
local green = theme.SolarizedGreen.fg

local lightline_theme = {
  normal = {
    left = { { base02, base01, "bold" }, { base01, base0 } },
    middle = { { base01, base00 } },
    right = { { base02, base01 }, { base01, base0 } },
    error = { { base02, red } },
    warning = { { base02, yellow } },
  },
  insert = {
    left = { { base02, blue, "bold" }, { base0, base0 } },
    middle = { { base01, base00 } },
    right = { { base02, blue }, { base0, base0 } },
  },
  inactive = {
    left = { { base2, base00 } },
    middle = { { base2, base00 } },
    right = { { base2, base00 }, { base2, base00 } },
  },
  terminal = {
    left = { { base02, green, "bold" }, { base0, base0 } },
    middle = { { base01, base00 } },
    right = { { base02, green }, { base0, base0 } },
  },
  replace = {
    left = { { base02, cyan, "bold" }, { base0, base0 } },
    middle = { { base01, base00 } },
    right = { { base02, cyan }, { base0, base0 } },
  },
  visual = {
    left = { { base02, orange, "bold" }, { base02, base2 } },
    middle = { { base01, base00 } },
    right = { { base02, orange }, { base02, base2 } },
  },
  tabline = {
    left = { { base01, base0 } },
    middle = { { base02, base2 } },
    right = { { base02, orange } },
    tabsel = { { base02, base01 } },
  },
}
return lightline_theme
