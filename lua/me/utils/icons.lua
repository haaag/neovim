---@class me.utils.icons
local M = {}

-- stylua: ignore
M.lsp = {
  kinds = {
    Array         = ' ',
    Boolean       = '󰨙 ',
    Class         = ' ',
    Codeium       = '󰘦 ',
    Color         = ' ',
    Control       = ' ',
    Collapsed     = ' ',
    Constant      = '󰏿 ',
    Constructor   = ' ',
    Enum          = ' ',
    EnumMember    = ' ',
    Event         = ' ',
    Field         = ' ',
    File          = ' ',
    Folder        = ' ',
    Function      = '󰊕 ',
    Interface     = ' ',
    Key           = ' ',
    Keyword       = ' ',
    Method        = '󰊕 ',
    Module        = ' ',
    Namespace     = '󰦮 ',
    Null          = ' ',
    Number        = '󰎠 ',
    Object        = ' ',
    Operator      = ' ',
    Package       = ' ',
    Property      = ' ',
    Reference     = ' ',
    Snippet       = ' ',
    String        = ' ',
    Struct        = '󰆼 ',
    TabNine       = '󰏚 ',
    Text          = ' ',
    TypeParameter = ' ',
    Unit          = ' ',
    Value         = ' ',
    Variable      = '󰀫 ',
  },
  diagnostics = {
    Error         = ' ',
    Hint          = ' ',
    Info          = ' ',
    Warn          = ' ',
  },
}

-- stylua: ignore
M.dap = {
  signs = {
    breakpoint    = '', -- 
    breakpoint_condition = 'ﴫ•',
    breakpoint_rejected = 'ﴫ•',
    log_point     = '.>',
    stopped       = '⇥',
  },
  ui = {
    expanded      = '▾',
    collapsed     = '▸',
    circular      = '',
  },
  constrols       = {
    pause         = '',
    play          = '',
    step_into     = '',
    step_over     = '',
    step_out      = '',
    step_back     = '',
    run_last      = '',
    terminate     = '',
  },
}

M.dadbod = {
  {
    expanded = {
      db = '▾ 󰆼',
      buffers = '▾ ',
      saved_queries = '▾ ',
      schemas = '▾ ',
      schema = '▾ ',
      tables = '▾ 藺',
      table = '▾ ',
    },
    collapsed = {
      db = '▸ ',
      buffers = '▸ ',
      saved_queries = '▸ ',
      schemas = '▸ ',
      schema = '▸ ',
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
  },
}

function M.all()
  -- stylua: ignore
  return {
    ui = {
      BigCircle         = '',
      BigUnfilledCircle = '',
      BookMark          = '',
      Bug               = '',
      Calendar          = '',
      Check             = '',
      ChevronRight      = '',
      Circle            = '',
      Close             = '',
      Code              = '',
      Comment           = '',
      Dashboard         = '',
      Fire              = '',
      Gear              = '',
      History           = '',
      Lightbulb         = '',
      List              = '',
      Lock              = '',
      NewFile           = '',
      Note              = '',
      Package           = '',
      Pencil            = '',
      Project           = '',
      Search            = '',
      SignIn            = '',
      Table             = '',
      Telescope         = '',
    },
    misc = {
      block             = '█',
      circle            = '●',
      ghost             = '',
      github            = '',
      robot             = 'ﮧ',
      squirrel          = '',
      tag               = '',
      watch             = '',
    },
    documents = {
      closed_folder     = '',
      file              = '',
      files             = '',
      folder            = '',
      open_folder       = ' ',
    },
    buftype = {
      oil               = ' ',
      lazy              = ' ',
      telescope         = ' ',
      aerial            = 'Ξ ',
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
