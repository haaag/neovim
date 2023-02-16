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
    lightgrey = "#545c7e",
    darkgrey = "#545c7e",
  }
end

C.current = function()
  return C.material_deep_ocean()
end

return C
