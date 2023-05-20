-- colors.lua

local C = {}

C.tokyonight_storm = function()
  return {
    background = "#24283b",
    other_background = "#1F2335",
    foreground = "#a9b1d6",
    black = "#1a1b26",
    black2 = "#1a1b26",
    red = "#f7768e",
    green = "#9ece6a",
    yellow = "#e0af68",
    orange = "#ff9e64",
    blue = "#7aa2f7",
    magenta = "#bb9af7",
    violet = "#9d7cd8",
    cyan = "#4abaaf",
    white = "#c0caf5",
    lightgrey = "#545c7e",
    darkgrey = "#545c7e",
  }
end

C.tokyonight_night = function()
  return {
    background = "#1A1B26",
    foreground = "#C0CAF5",
    black = "#15161E",
    red = "#F7768E",
    green = "#9ece6a",
    yellow = "#e0af68",
    orange = "#ff9e64",
    blue = "#7aa2f7",
    magenta = "#BB9AF7",
    violet = "#9d7cd8",
    cyan = "#7DCFFF",
    white = "#a9b1d6",
    lightgrey = "#c0caf5",
    darkgrey = "#545c7e",
  }
end

C.gruvbox = function()
  return {
    background = "#282828",
    foreground = "#ebdbb2",
    black = "#282828",
    black2 = "#282828",
    red = "#fb4934",
    green = "#b8bb26",
    yellow = "#fabd2f",
    blue = "#83a598",
    purple = "#8f3f71",
    magenta = "#d3869b",
    orange = "#fe8019",
    cyan = "#8ec07c",
    white = "#ebdbb2",
    lightgrey = "#928374",
    darkgrey = "#a89984",
  }
end

C.gruvbox_material = function()
  return {
    background = "#1d2021",
    foreground = "#d4be98",
    black = "#32302f",
    black2 = "#32302f",
    red = "#ea6962",
    green = "#a9b665",
    yellow = "#e78a4e",
    blue = "#7daea3",
    purple = "#d3869b",
    magenta = "#d3869b",
    orange = "#e78a4e",
    cyan = "#89b482",
    white = "#d4be98",
    lightgrey = "#928374",
    darkgrey = "#a89984",
  }
end

C.catppuccin_macchiato = function()
  return {
    background = "#24273A",
    other_background = "#1F2335",
    foreground = "#CAD3F5",
    black = "#494D64",
    black2 = "#5B6078",
    red = "#ED8796",
    green = "#A6DA95",
    yellow = "#EED49F",
    blue = "#8AADF4",
    purple = "#F5BDE6",
    cyan = "#8BD5CA",
    white = "#B8C0E0",
    lightgrey = "#A5ADCB",
    darkgrey = "#A5ADCB",
  }
end

C.material_deep_ocean = function()
  return {
    background = "#0F111A",
    foreground = "#A6ACCD",
    black = "#000000",
    red = "#F07178",
    green = "#C3E88D",
    yellow = "#FFCB6B",
    orange = "#F78C6C",
    blue = "#82AAFF",
    magenta = "#C792EA",
    violet = "#B480D6",
    cyan = "#4abaaf",
    white = "#EEFFFF",
    grey = "#545c7e",
    darkgrey = "#545c7e",
  }
end

C.vim_nightfly = function()
  return {
    background = "NONE",
    foreground = "#A6ACCD",
    black = "#011627",
    red = "#fc514e",
    green = "#C3E88D",
    yellow = "#e3d18a",
    orange = "#f78c6c",
    blue = "#82aaff",
    magenta = "#C792EA",
    violet = "#B480D6",
    cyan = "#21c7a8",
    white = "#c3ccdc",
    grey = "#acb4c2",
    darkgrey = "#545c7e",
  }
end

C.current = function()
  return C.gruvbox_material()
end

return C
