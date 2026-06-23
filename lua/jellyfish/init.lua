-- JellyFish colorscheme for Neovim (Lua)
-- Author: Pawel Borkar
-- Repository: https://github.com/pawelborkar/vscode-jellyfish
-- Installation (lazy.nvim):
--   { "pawelborkar/jellyfish.nvim", config = function() vim.cmd("colorscheme jellyfish") end }

local M = {}

M.palette = {
  bg_deep    = "#00002c",
  bg_darker  = "#0a0025",
  bg_dark    = "#0f0021",
  bg_widget  = "#28002b",
  fg         = "#ffffff",
  fg_muted   = "#9b9b9b",

  cyan       = "#00ffff",
  cyan_alt   = "#00f7ff",
  cyan_link  = "#00d9ff",
  pink       = "#ff0080",
  pink_alt   = "#FA1F6C",
  yellow     = "#ffd900",
  yellow_alt = "#eeff00",
  orange     = "#ff7e34",
  green      = "#00ff55",
  red        = "#ff0000",
  purple     = "#C792EA",

  comment    = "#838383",
  string     = "#eeff00",
  number     = "#ff7e34",
  keyword    = "#ff0062",
  func       = "#00ffff",
  class      = "#FFCB6B",
  type       = "#F0B565",
  variable   = "#EEFFFF",
  attribute  = "#00fff2",
  invalid    = "#FF5370",
  regexp     = "#89DDFF",
  salmon     = "#f07178",
  blue       = "#82AAFF",
  special    = "#fa71ff",
  highlight  = "#fdff82",
  call       = "#20dd20",
}

function M.setup()
  local c = M.palette
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.g.colors_name = "jellyfish"
  vim.o.background  = "dark"

  local hl = vim.api.nvim_set_hl

  -- Editor
  hl(0, "Normal",          { fg = c.fg,        bg = c.bg_deep })
  hl(0, "NormalFloat",     { fg = c.fg,        bg = c.bg_widget })
  hl(0, "Cursor",          { fg = c.bg_deep,   bg = c.cyan_alt })
  hl(0, "CursorLine",      { bg = "#160021" })
  hl(0, "CursorLineNr",    { fg = c.fg })
  hl(0, "LineNr",          { fg = "#868686" })
  hl(0, "SignColumn",      { bg = c.bg_deep })
  hl(0, "ColorColumn",     { bg = c.bg_dark })
  hl(0, "Visual",          { bg = "#ff00885d" })
  hl(0, "Search",          { fg = c.bg_deep,   bg = c.yellow })
  hl(0, "IncSearch",       { fg = c.bg_deep,   bg = c.cyan })
  hl(0, "StatusLine",      { fg = c.fg_muted,  bg = c.bg_dark })
  hl(0, "StatusLineNC",    { fg = c.fg_muted,  bg = c.bg_darker })
  hl(0, "VertSplit",       { fg = c.pink })
  hl(0, "WinSeparator",    { fg = c.pink })
  hl(0, "Pmenu",           { fg = c.fg,        bg = c.bg_widget })
  hl(0, "PmenuSel",        { fg = c.yellow,    bg = c.bg_dark,  bold = true })
  hl(0, "PmenuSbar",       { bg = c.bg_dark })
  hl(0, "PmenuThumb",      { bg = c.cyan })
  hl(0, "TabLine",         { fg = c.fg_muted,  bg = "#001621" })
  hl(0, "TabLineSel",      { fg = c.fg,        bg = "#160021", bold = true })
  hl(0, "TabLineFill",     { bg = c.bg_deep })
  hl(0, "Folded",          { fg = c.comment,   bg = c.bg_dark })
  hl(0, "FoldColumn",      { fg = c.comment,   bg = c.bg_deep })
  hl(0, "MatchParen",      { fg = c.cyan,      bold = true, underline = true })
  hl(0, "NonText",         { fg = c.bg_widget })
  hl(0, "SpecialKey",      { fg = c.bg_widget })
  hl(0, "Directory",       { fg = c.cyan })
  hl(0, "Title",           { fg = c.pink,      bold = true })
  hl(0, "ErrorMsg",        { fg = c.invalid })
  hl(0, "WarningMsg",      { fg = c.orange })

  -- Syntax
  hl(0, "Comment",         { fg = c.comment,   italic = true })
  hl(0, "String",          { fg = c.string })
  hl(0, "Number",          { fg = c.number })
  hl(0, "Float",           { fg = c.number })
  hl(0, "Boolean",         { fg = c.number })
  hl(0, "Constant",        { fg = c.number })
  hl(0, "Identifier",      { fg = c.variable })
  hl(0, "Function",        { fg = c.func })
  hl(0, "Keyword",         { fg = c.keyword })
  hl(0, "Conditional",     { fg = c.keyword })
  hl(0, "Repeat",          { fg = c.keyword })
  hl(0, "Exception",       { fg = c.keyword })
  hl(0, "Operator",        { fg = c.fg })
  hl(0, "Statement",       { fg = c.keyword })
  hl(0, "Type",            { fg = c.class })
  hl(0, "StorageClass",    { fg = c.keyword })
  hl(0, "Structure",       { fg = c.class })
  hl(0, "Typedef",         { fg = c.class })
  hl(0, "PreProc",         { fg = c.special })
  hl(0, "Include",         { fg = c.keyword })
  hl(0, "Define",          { fg = c.keyword })
  hl(0, "Macro",           { fg = c.special })
  hl(0, "Special",         { fg = c.special })
  hl(0, "SpecialChar",     { fg = c.regexp })
  hl(0, "Tag",             { fg = c.pink })
  hl(0, "Delimiter",       { fg = c.fg })
  hl(0, "Error",           { fg = c.invalid })
  hl(0, "Todo",            { fg = c.yellow,    bold = true })
  hl(0, "Underlined",      { fg = c.cyan_link, underline = true })

  -- Treesitter (nvim 0.8+ @-prefixed groups)
  hl(0, "@comment",               { link = "Comment" })
  hl(0, "@string",                { link = "String" })
  hl(0, "@string.escape",         { fg = c.regexp })
  hl(0, "@string.special",        { fg = c.special })
  hl(0, "@string.regex",          { fg = c.regexp })
  hl(0, "@number",                { link = "Number" })
  hl(0, "@float",                 { link = "Number" })
  hl(0, "@boolean",               { link = "Boolean" })
  hl(0, "@constant",              { link = "Constant" })
  hl(0, "@constant.builtin",      { fg = c.number })
  hl(0, "@variable",              { fg = c.variable })
  hl(0, "@variable.builtin",      { fg = c.invalid, italic = true })
  hl(0, "@variable.parameter",    { fg = c.number })
  hl(0, "@function",              { fg = c.func })
  hl(0, "@function.call",         { fg = c.call })
  hl(0, "@function.builtin",      { fg = c.func })
  hl(0, "@function.method",       { fg = c.func })
  hl(0, "@function.method.call",  { fg = c.call })
  hl(0, "@constructor",           { fg = c.blue })
  hl(0, "@keyword",               { fg = c.keyword })
  hl(0, "@keyword.return",        { fg = c.keyword })
  hl(0, "@keyword.function",      { fg = c.keyword })
  hl(0, "@keyword.operator",      { fg = c.fg })
  hl(0, "@operator",              { fg = c.fg })
  hl(0, "@punctuation",           { fg = c.fg })
  hl(0, "@punctuation.delimiter", { fg = c.fg })
  hl(0, "@punctuation.bracket",   { fg = c.fg })
  hl(0, "@type",                  { fg = c.class })
  hl(0, "@type.builtin",          { fg = c.type })
  hl(0, "@type.qualifier",        { fg = c.keyword })
  hl(0, "@property",              { fg = c.attribute })
  hl(0, "@attribute",             { fg = c.attribute })
  hl(0, "@tag",                   { fg = c.pink })
  hl(0, "@tag.attribute",         { fg = c.attribute, italic = true })
  hl(0, "@tag.delimiter",         { fg = c.fg })
  hl(0, "@namespace",             { fg = c.class })
  hl(0, "@label",                 { fg = c.pink })
  hl(0, "@text",                  { fg = c.variable })
  hl(0, "@text.title",            { fg = c.keyword, bold = true })
  hl(0, "@text.uri",              { fg = c.cyan_link, underline = true })
  hl(0, "@text.strong",           { fg = "#f49eff", bold = true })
  hl(0, "@text.emphasis",         { fg = c.salmon, italic = true })
  hl(0, "@text.strike",           { strikethrough = true })

  -- Diagnostics
  hl(0, "DiagnosticError",       { fg = c.invalid })
  hl(0, "DiagnosticWarn",        { fg = c.orange })
  hl(0, "DiagnosticInfo",        { fg = c.cyan })
  hl(0, "DiagnosticHint",        { fg = c.comment })
  hl(0, "DiagnosticUnderlineError", { sp = c.invalid, undercurl = true })
  hl(0, "DiagnosticUnderlineWarn",  { sp = c.orange,  undercurl = true })

  -- Git (vim-gitgutter / gitsigns)
  hl(0, "GitSignsAdd",           { fg = c.green })
  hl(0, "GitSignsChange",        { fg = c.yellow })
  hl(0, "GitSignsDelete",        { fg = c.red })
  hl(0, "DiffAdd",               { fg = c.green })
  hl(0, "DiffChange",            { fg = c.yellow })
  hl(0, "DiffDelete",            { fg = c.red })
  hl(0, "DiffText",              { fg = c.yellow, bold = true })

  -- Telescope
  hl(0, "TelescopeBorder",       { fg = c.pink })
  hl(0, "TelescopePromptBorder", { fg = c.cyan })
  hl(0, "TelescopeResultsBorder",{ fg = c.pink })
  hl(0, "TelescopePreviewBorder",{ fg = c.yellow })
  hl(0, "TelescopeSelection",    { fg = c.yellow, bg = c.bg_dark })
  hl(0, "TelescopeMatching",     { fg = c.cyan, bold = true })

  -- NvimTree / Neo-tree
  hl(0, "NvimTreeNormal",        { fg = c.fg_muted, bg = c.bg_darker })
  hl(0, "NvimTreeFolderName",    { fg = c.cyan })
  hl(0, "NvimTreeOpenedFolderName", { fg = c.cyan, bold = true })
  hl(0, "NvimTreeRootFolder",    { fg = c.pink, bold = true })
  hl(0, "NvimTreeGitNew",        { fg = c.green })
  hl(0, "NvimTreeGitDirty",      { fg = c.yellow })
  hl(0, "NvimTreeGitDeleted",    { fg = c.red })

  -- Which-key
  hl(0, "WhichKey",              { fg = c.cyan })
  hl(0, "WhichKeyGroup",         { fg = c.pink })
  hl(0, "WhichKeyDesc",          { fg = c.yellow })
  hl(0, "WhichKeyBorder",        { fg = c.pink })

  -- Indent-blankline
  hl(0, "IndentBlanklineChar",         { fg = "#1a1a3a" })
  hl(0, "IndentBlanklineContextChar",  { fg = c.pink })
end

return M

