---@class me.utils.icons
local M = {}

function M.lsp_kinds()
  return {
    Array = '',
    Boolean = '',
    Class = '',
    Color = '',
    Constant = '',
    Constructor = '',
    Enum = '',
    EnumMember = '',
    Event = '',
    Field = '',
    File = '',
    Folder = '',
    Function = '',
    Interface = '',
    Key = '',
    Keyword = '',
    Method = '',
    Module = '',
    Namespace = '',
    Null = 'ﳠ',
    Number = '',
    Object = '',
    Operator = '',
    Package = '',
    Property = '',
    Reference = '',
    Snippet = '',
    String = '',
    Struct = '',
    Text = '',
    TypeParameter = '',
    Unit = '',
    Value = '',
    Variable = '',
  }
end

function M.lsp_diagnostic()
  return {
    Error = ' ',
    Hint = ' ',
    Info = ' ',
    Warn = ' ',
  }
end

function M.dap()
  return {
    signs = {
      -- 
      breakpoint = '',
      breakpoint_condition = 'ﴫ•',
      breakpoint_rejected = 'ﴫ•',
      log_point = '',
      stopped = '⇥',
    },
    ui = {
      expanded = '▾',
      collapsed = '▸',
      circular = '',
    },
    constrols = {
      pause = '',
      play = '',
      step_into = '',
      step_over = '',
      step_out = '',
      step_back = '',
      run_last = '',
      terminate = '',
    },
  }
end

function M.dadbod()
  return {
    expanded = {
      db = '▾ ',
      buffers = '▾ ',
      saved_queries = '▾ ',
      schemas = '▾ ',
      schema = '▾ פּ',
      tables = '▾ 藺',
      table = '▾ ',
    },
    collapsed = {
      db = '▸ ',
      buffers = '▸ ',
      saved_queries = '▸ ',
      schemas = '▸ ',
      schema = '▸ פּ',
      tables = '▸ 藺',
      table = '▸ ',
    },
    saved_query = '',
    new_query = '璘',
    tables = '離',
    buffers = '﬘',
    add_connection = '',
    connection_ok = '✓',
    connection_error = '✕',
  }
end

function M.all()
  return {
    ui = {
      BigCircle = '',
      BigUnfilledCircle = '',
      BookMark = '',
      Bug = '',
      Calendar = '',
      Check = '',
      ChevronRight = '',
      Circle = '',
      Close = '',
      Code = '',
      Comment = '',
      Dashboard = '',
      Fire = '',
      Gear = '',
      History = '',
      Lightbulb = '',
      List = '',
      Lock = '',
      NewFile = '',
      Note = '',
      Package = '',
      Pencil = '',
      Project = '',
      Search = '',
      SignIn = '',
      Table = '',
      Telescope = '',
    },
    misc = {
      block = '█',
      circle = '●',
      ghost = '',
      github_icon = ' ﯙ ',
      robot = 'ﮧ',
      squirrel = '',
      tag = '',
      watch = '',
    },
    documents = {
      closed_folder = '',
      file = '',
      files = '',
      folder = '',
      open_folder = ' ',
    },
    buftype = {
      neotree = ' ',
      lazy = ' ',
      telescope = ' ',
      aerial = 'Ξ ',
    },
    bar = {
      a = '┃',
      b = '│',
      c = '│',
      d = '▏',
      f = '│',
      g = '¦',
      h = '┊',
      i = '▏',
      j = '│',
    },
  }
end

return M
