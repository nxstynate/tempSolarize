-- Solarized Dark
local M = {}

M.colors = {
  base03 = "#002b36",
  base02 = "#073642",
  base01 = "#586e75",
  base00 = "#657b83",
  base0 = "#839496",
  base1 = "#93a1a1",
  base2 = "#eee8d5",
  base3 = "#fdf6e3",
  blue = "#268bd2",
  cyan = "#2aa198",
  green = "#719e07",
  orange = "#cb4b16",
  red = "#dc322f",
  violet = "#6c71c4",
  yellow = "#b58900",
}

M.get_base_colors = function(bg, contrast)
  local config = require("solarizedDark").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.base02,
      bg1 = p.base00,
      bg2 = p.base0,
      bg3 = p.base1,
      bg4 = p.base2,
      fg0 = p.base2,
      fg1 = p.base1,
      fg2 = p.base0,
      fg3 = p.base00,
      fg4 = p.base01,
      purple = p.violet,
      aqua = p.cyan,
      orange = p.orange,
      red = p.red,
      green = p.green,
      yellow = p.yellow,
      blue = p.blue,
      violet = p.violet,
      cyan = p.cyan,
      base1 = p.base1,
    },
    light = {
      bg0 = p.base2,
      bg1 = p.base1,
      bg2 = p.base0,
      bg3 = p.base00,
      bg4 = p.base01,
      fg0 = p.base02,
      fg1 = p.base00,
      fg2 = p.base0,
      fg3 = p.base1,
      fg4 = p.base2,
      purple = p.violet,
      aqua = p.cyan,
      orange = p.orange,
      red = p.red,
      green = p.green,
      yellow = p.yellow,
      blue = p.blue,
      violet = p.violet,
      cyan = p.cyan,
      base1 = p.base1,
    },
  }

  if contrast ~= nil and contrast ~= "" then
    colors[bg].bg0 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
