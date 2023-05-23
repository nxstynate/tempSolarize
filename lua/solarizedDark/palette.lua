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
      base02 = p.base02,
      base2 = p.base2,
      base0 = p.base0,
      base00 = p.base00,
      base01 = p.base01,
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
      base02 = p.base2,
      base2 = p.base02,
      base0 = p.base0,
      base00 = p.base1,
      base01 = p.base2,
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
    colors[bg].base02 = p[bg .. string.format("0_%s", contrast)]
  end

  return colors[bg]
end

return M
