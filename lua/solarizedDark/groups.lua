local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.base1
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.violet
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("solarizedDark").config
  local colors = require("solarizedDark.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    SolarizedDarkFg0 = { fg = colors.fg0 },
    SolarizedDarkFg1 = { fg = colors.fg1 },
    SolarizedDarkFg2 = { fg = colors.fg2 },
    SolarizedDarkFg3 = { fg = colors.fg3 },
    SolarizedDarkFg4 = { fg = colors.fg4 },
    SolarizedDarkbase1 = { fg = colors.base1 },
    SolarizedDarkBg0 = { fg = colors.bg0 },
    SolarizedDarkBg1 = { fg = colors.bg1 },
    SolarizedDarkBg2 = { fg = colors.bg2 },
    SolarizedDarkBg3 = { fg = colors.bg3 },
    SolarizedDarkBg4 = { fg = colors.bg4 },
    SolarizedRed = { fg = colors.red },
    SolarizedRed = { fg = colors.red, bold = config.bold },
    SolarizedGreen = { fg = colors.green },
    SolarizedGreen = { fg = colors.green, bold = config.bold },
    SolarizedYellow = { fg = colors.yellow },
    SolarizedYellow = { fg = colors.yellow, bold = config.bold },
    SolarizedBlue = { fg = colors.blue },
    SolarizedBlue = { fg = colors.blue, bold = config.bold },
    SolarizedPurple = { fg = colors.purple },
    SolarizedPurple = { fg = colors.purple, bold = config.bold },
    SolarizedAqua = { fg = colors.aqua },
    SolarizedAqua = { fg = colors.aqua, bold = config.bold },
    SolarizedOrange = { fg = colors.orange },
    SolarizedOrange = { fg = colors.orange, bold = config.bold },
    SolarizedRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
      or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
      or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    SolarizedRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    SolarizedGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    SolarizedYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    SolarizedBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    SolarizedPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    SolarizedAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    SolarizedOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "SolarizedDarkBg2" },
    SpecialKey = { link = "SolarizedDarkFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "SolarizedBlue" },
    Title = { link = "SolarizedGreen" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "SolarizedYellow" },
    ModeMsg = { link = "SolarizedYellow" },
    Question = { link = "SolarizedOrange" },
    WarningMsg = { link = "SolarizedRed" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.base1, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.base1, bg = nil } or { fg = colors.base1, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "SolarizedOrange" },
    Comment = { fg = colors.base1, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.bg0, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "SolarizedRed" },
    Conditional = { link = "SolarizedRed" },
    Repeat = { link = "SolarizedRed" },
    Label = { link = "SolarizedRed" },
    Exception = { link = "SolarizedRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "SolarizedRed" },
    Identifier = { link = "SolarizedBlue" },
    Function = { link = "SolarizedGreen" },
    PreProc = { link = "SolarizedAqua" },
    Include = { link = "SolarizedAqua" },
    Define = { link = "SolarizedAqua" },
    Macro = { link = "SolarizedAqua" },
    PreCondit = { link = "SolarizedAqua" },
    Constant = { link = "SolarizedPurple" },
    Character = { link = "SolarizedPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "SolarizedPurple" },
    Number = { link = "SolarizedPurple" },
    Float = { link = "SolarizedPurple" },
    Type = { link = "SolarizedYellow" },
    StorageClass = { link = "SolarizedOrange" },
    Structure = { link = "SolarizedAqua" },
    Typedef = { link = "SolarizedYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "SolarizedBlueUnderline" },
    SpellBad = { link = "SolarizedRedUnderline" },
    SpellLocal = { link = "SolarizedAquaUnderline" },
    SpellRare = { link = "SolarizedPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "SolarizedRed" },
    DiagnosticSignError = { link = "SolarizedRedSign" },
    DiagnosticUnderlineError = { link = "SolarizedRedUnderline" },
    DiagnosticWarn = { link = "SolarizedYellow" },
    DiagnosticSignWarn = { link = "SolarizedYellowSign" },
    DiagnosticUnderlineWarn = { link = "SolarizedYellowUnderline" },
    DiagnosticInfo = { link = "SolarizedBlue" },
    DiagnosticSignInfo = { link = "SolarizedBlueSign" },
    DiagnosticUnderlineInfo = { link = "SolarizedBlueUnderline" },
    DiagnosticHint = { link = "SolarizedAqua" },
    DiagnosticSignHint = { link = "SolarizedAquaSign" },
    DiagnosticUnderlineHint = { link = "SolarizedAquaUnderline" },
    DiagnosticFloatingError = { link = "SolarizedRed" },
    DiagnosticFloatingWarn = { link = "SolarizedOrange" },
    DiagnosticFloatingInfo = { link = "SolarizedBlue" },
    DiagnosticFloatingHint = { link = "SolarizedAqua" },
    DiagnosticVirtualTextError = { link = "SolarizedRed" },
    DiagnosticVirtualTextWarn = { link = "SolarizedYellow" },
    DiagnosticVirtualTextInfo = { link = "SolarizedBlue" },
    DiagnosticVirtualTextHint = { link = "SolarizedAqua" },
    LspReferenceRead = { link = "SolarizedYellow" },
    LspReferenceText = { link = "SolarizedYellow" },
    LspReferenceWrite = { link = "SolarizedOrange" },
    LspCodeLens = { link = "SolarizedDarkbase1" },
    LspSignatureActiveParameter = { link = "Search" },

    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },

    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },

    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },

    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },

    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },

    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },

    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },

    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },

    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "SolarizedRed" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },

    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },

    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },

    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },

    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "SolarizedDarkFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "SolarizedDarkFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "SolarizedDarkFg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },

    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.note.comment     ; XXX in comments
    ["@text.note.comment"] = { fg = colors.purple, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.fg0, bg = colors.red, bold = config.bold },

    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },

    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },

    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },

    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.comment"] = {}, -- do not overwrite comments
    ["@lsp.type.decorator"] = { link = "@parameter" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@constructor" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },

    -- gitcommit
    gitcommitSelectedFile = { link = "SolarizedGreen" },
    gitcommitDiscardedFile = { link = "SolarizedRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "SolarizedGreenSign" },
    GitSignsChange = { link = "SolarizedAquaSign" },
    GitSignsDelete = { link = "SolarizedRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.cyan },
    NvimTreeRootFolder = { fg = colors.violet, bold = true },
    NvimTreeFolderIcon = { fg = colors.blue, bold = true },
    NvimTreeFileIcon = { fg = colors.base0 },
    NvimTreeExecFile = { fg = colors.green, bold = true },
    NvimTreeOpenedFile = { fg = colors.green, bold = true },
    NvimTreeSpecialFile = { fg = colors.yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.violet },
    NvimTreeIndentMarker = { fg = colors.base1 },
    NvimTreeGitDirty = { fg = colors.yellow },
    NvimTreeGitStaged = { fg = colors.yellow },
    NvimTreeGitMerge = { fg = colors.violet },
    NvimTreeGitRenamed = { fg = colors.violet },
    NvimTreeGitNew = { fg = colors.yellow },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeWindowPicker = { bg = colors.cyan },
    -- termdebug
    debugPC = { bg = colors.blue },
    debugBreakpoint = { link = "SolarizedRedSign" },
    -- vim-startify
    StartifyBracket = { link = "SolarizedDarkFg3" },
    StartifyFile = { link = "SolarizedDarkFg1" },
    StartifyNumber = { link = "SolarizedBlue" },
    StartifyPath = { link = "SolarizedDarkbase1" },
    StartifySlash = { link = "SolarizedDarkbase1" },
    StartifySection = { link = "SolarizedYellow" },
    StartifySpecial = { link = "SolarizedDarkBg2" },
    StartifyHeader = { link = "SolarizedOrange" },
    StartifyFooter = { link = "SolarizedDarkBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "SolarizedAqua" },
    DirvishArg = { link = "SolarizedYellow" },
    -- netrw
    netrwDir = { link = "SolarizedAqua" },
    netrwClassify = { link = "SolarizedAqua" },
    netrwLink = { link = "SolarizedDarkbase1" },
    netrwSymLink = { link = "SolarizedDarkFg1" },
    netrwExe = { link = "SolarizedYellow" },
    netrwComment = { link = "SolarizedDarkbase1" },
    netrwList = { link = "SolarizedBlue" },
    netrwHelpCmd = { link = "SolarizedAqua" },
    netrwCmdSep = { link = "SolarizedDarkFg3" },
    netrwVersion = { link = "SolarizedGreen" },
    -- nerdtree
    NERDTreeDir = { link = "SolarizedAqua" },
    NERDTreeDirSlash = { link = "SolarizedAqua" },
    NERDTreeOpenable = { link = "SolarizedOrange" },
    NERDTreeClosable = { link = "SolarizedOrange" },
    NERDTreeFile = { link = "SolarizedDarkFg1" },
    NERDTreeExecFile = { link = "SolarizedYellow" },
    NERDTreeUp = { link = "SolarizedDarkbase1" },
    NERDTreeCWD = { link = "SolarizedGreen" },
    NERDTreeHelp = { link = "SolarizedDarkFg1" },
    NERDTreeToggleOn = { link = "SolarizedGreen" },
    NERDTreeToggleOff = { link = "SolarizedRed" },
    -- coc.nvim
    CocErrorSign = { link = "SolarizedRedSign" },
    CocWarningSign = { link = "SolarizedOrangeSign" },
    CocInfoSign = { link = "SolarizedBlueSign" },
    CocHintSign = { link = "SolarizedAquaSign" },
    CocErrorFloat = { link = "SolarizedRed" },
    CocWarningFloat = { link = "SolarizedOrange" },
    CocInfoFloat = { link = "SolarizedBlue" },
    CocHintFloat = { link = "SolarizedAqua" },
    CocDiagnosticsError = { link = "SolarizedRed" },
    CocDiagnosticsWarning = { link = "SolarizedOrange" },
    CocDiagnosticsInfo = { link = "SolarizedBlue" },
    CocDiagnosticsHint = { link = "SolarizedAqua" },
    CocSelectedText = { link = "SolarizedRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "SolarizedDarkbase1" },
    CocErrorHighlight = { link = "SolarizedRedUnderline" },
    CocWarningHighlight = { link = "SolarizedOrangeUnderline" },
    CocInfoHighlight = { link = "SolarizedBlueUnderline" },
    CocHintHighlight = { link = "SolarizedAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "SolarizedDarkFg1" },
    TelescopeSelection = { link = "SolarizedOrange" },
    TelescopeSelectionCaret = { link = "SolarizedRed" },
    TelescopeMultiSelection = { link = "SolarizedDarkbase1" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "SolarizedBlue" },
    TelescopePromptPrefix = { link = "SolarizedRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "SolarizedDarkFg0" },
    CmpItemAbbrDeprecated = { link = "SolarizedDarkFg1" },
    CmpItemAbbrMatch = { link = "SolarizedBlue" },
    CmpItemAbbrMatchFuzzy = { link = "SolarizedBlueUnderline" },
    CmpItemMenu = { link = "SolarizedDarkbase1" },
    CmpItemKindText = { link = "SolarizedOrange" },
    CmpItemKindVariable = { link = "SolarizedOrange" },
    CmpItemKindMethod = { link = "SolarizedBlue" },
    CmpItemKindFunction = { link = "SolarizedBlue" },
    CmpItemKindConstructor = { link = "SolarizedYellow" },
    CmpItemKindUnit = { link = "SolarizedBlue" },
    CmpItemKindField = { link = "SolarizedBlue" },
    CmpItemKindClass = { link = "SolarizedYellow" },
    CmpItemKindInterface = { link = "SolarizedYellow" },
    CmpItemKindModule = { link = "SolarizedBlue" },
    CmpItemKindProperty = { link = "SolarizedBlue" },
    CmpItemKindValue = { link = "SolarizedOrange" },
    CmpItemKindEnum = { link = "SolarizedYellow" },
    CmpItemKindOperator = { link = "SolarizedYellow" },
    CmpItemKindKeyword = { link = "SolarizedPurple" },
    CmpItemKindEvent = { link = "SolarizedPurple" },
    CmpItemKindReference = { link = "SolarizedPurple" },
    CmpItemKindColor = { link = "SolarizedPurple" },
    CmpItemKindSnippet = { link = "SolarizedGreen" },
    CmpItemKindFile = { link = "SolarizedBlue" },
    CmpItemKindFolder = { link = "SolarizedBlue" },
    CmpItemKindEnumMember = { link = "SolarizedAqua" },
    CmpItemKindConstant = { link = "SolarizedOrange" },
    CmpItemKindStruct = { link = "SolarizedYellow" },
    CmpItemKindTypeParameter = { link = "SolarizedYellow" },
    diffAdded = { link = "SolarizedGreen" },
    diffRemoved = { link = "SolarizedRed" },
    diffChanged = { link = "SolarizedAqua" },
    diffFile = { link = "SolarizedOrange" },
    diffNewFile = { link = "SolarizedYellow" },
    diffOldFile = { link = "SolarizedOrange" },
    diffLine = { link = "SolarizedBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "SolarizedBlue" },
    NavicIconsModule = { link = "SolarizedOrange" },
    NavicIconsNamespace = { link = "SolarizedBlue" },
    NavicIconsPackage = { link = "SolarizedAqua" },
    NavicIconsClass = { link = "SolarizedYellow" },
    NavicIconsMethod = { link = "SolarizedBlue" },
    NavicIconsProperty = { link = "SolarizedAqua" },
    NavicIconsField = { link = "SolarizedPurple" },
    NavicIconsConstructor = { link = "SolarizedBlue" },
    NavicIconsEnum = { link = "SolarizedPurple" },
    NavicIconsInterface = { link = "SolarizedGreen" },
    NavicIconsFunction = { link = "SolarizedBlue" },
    NavicIconsVariable = { link = "SolarizedPurple" },
    NavicIconsConstant = { link = "SolarizedOrange" },
    NavicIconsString = { link = "SolarizedGreen" },
    NavicIconsNumber = { link = "SolarizedOrange" },
    NavicIconsBoolean = { link = "SolarizedOrange" },
    NavicIconsArray = { link = "SolarizedOrange" },
    NavicIconsObject = { link = "SolarizedOrange" },
    NavicIconsKey = { link = "SolarizedAqua" },
    NavicIconsNull = { link = "SolarizedOrange" },
    NavicIconsEnumMember = { link = "SolarizedYellow" },
    NavicIconsStruct = { link = "SolarizedPurple" },
    NavicIconsEvent = { link = "SolarizedYellow" },
    NavicIconsOperator = { link = "SolarizedRed" },
    NavicIconsTypeParameter = { link = "SolarizedRed" },
    NavicText = { link = "SolarizedDarkWhite" },
    NavicSeparator = { link = "SolarizedDarkWhite" },
    -- html
    htmlTag = { link = "SolarizedAqua" },
    htmlEndTag = { link = "SolarizedAqua" },
    htmlTagName = { link = "SolarizedBlue" },
    htmlArg = { link = "SolarizedOrange" },
    htmlTagN = { link = "SolarizedDarkFg1" },
    htmlSpecialTagName = { link = "SolarizedBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "SolarizedRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "SolarizedAqua" },
    xmlEndTag = { link = "SolarizedAqua" },
    xmlTagName = { link = "SolarizedBlue" },
    xmlEqual = { link = "SolarizedBlue" },
    docbkKeyword = { link = "SolarizedAqua" },
    xmlDocTypeDecl = { link = "SolarizedDarkbase1" },
    xmlDocTypeKeyword = { link = "SolarizedPurple" },
    xmlCdataStart = { link = "SolarizedDarkbase1" },
    xmlCdataCdata = { link = "SolarizedPurple" },
    dtdFunction = { link = "SolarizedDarkbase1" },
    dtdTagName = { link = "SolarizedPurple" },
    xmlAttrib = { link = "SolarizedOrange" },
    xmlProcessingDelim = { link = "SolarizedDarkbase1" },
    dtdParamEntityPunct = { link = "SolarizedDarkbase1" },
    dtdParamEntityDPunct = { link = "SolarizedDarkbase1" },
    xmlAttribPunct = { link = "SolarizedDarkbase1" },
    xmlEntity = { link = "SolarizedRed" },
    xmlEntityPunct = { link = "SolarizedRed" },
    -- clojure
    clojureKeyword = { link = "SolarizedBlue" },
    clojureCond = { link = "SolarizedOrange" },
    clojureSpecial = { link = "SolarizedOrange" },
    clojureDefine = { link = "SolarizedOrange" },
    clojureFunc = { link = "SolarizedYellow" },
    clojureRepeat = { link = "SolarizedYellow" },
    clojureCharacter = { link = "SolarizedAqua" },
    clojureStringEscape = { link = "SolarizedAqua" },
    clojureException = { link = "SolarizedRed" },
    clojureRegexp = { link = "SolarizedAqua" },
    clojureRegexpEscape = { link = "SolarizedAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "SolarizedDarkFg3" },
    clojureAnonArg = { link = "SolarizedYellow" },
    clojureVariable = { link = "SolarizedBlue" },
    clojureMacro = { link = "SolarizedOrange" },
    clojureMeta = { link = "SolarizedYellow" },
    clojureDeref = { link = "SolarizedYellow" },
    clojureQuote = { link = "SolarizedYellow" },
    clojureUnquote = { link = "SolarizedYellow" },
    -- C
    cOperator = { link = "SolarizedPurple" },
    cppOperator = { link = "SolarizedPurple" },
    cStructure = { link = "SolarizedOrange" },
    -- python
    pythonBuiltin = { link = "SolarizedOrange" },
    pythonBuiltinObj = { link = "SolarizedOrange" },
    pythonBuiltinFunc = { link = "SolarizedOrange" },
    pythonFunction = { link = "SolarizedAqua" },
    pythonDecorator = { link = "SolarizedRed" },
    pythonInclude = { link = "SolarizedBlue" },
    pythonImport = { link = "SolarizedBlue" },
    pythonRun = { link = "SolarizedBlue" },
    pythonCoding = { link = "SolarizedBlue" },
    pythonOperator = { link = "SolarizedRed" },
    pythonException = { link = "SolarizedRed" },
    pythonExceptions = { link = "SolarizedPurple" },
    pythonBoolean = { link = "SolarizedPurple" },
    pythonDot = { link = "SolarizedDarkFg3" },
    pythonConditional = { link = "SolarizedRed" },
    pythonRepeat = { link = "SolarizedRed" },
    pythonDottedName = { link = "SolarizedGreen" },
    -- CSS
    cssBraces = { link = "SolarizedBlue" },
    cssFunctionName = { link = "SolarizedYellow" },
    cssIdentifier = { link = "SolarizedOrange" },
    cssClassName = { link = "SolarizedGreen" },
    cssColor = { link = "SolarizedBlue" },
    cssSelectorOp = { link = "SolarizedBlue" },
    cssSelectorOp2 = { link = "SolarizedBlue" },
    cssImportant = { link = "SolarizedGreen" },
    cssVendor = { link = "SolarizedDarkFg1" },
    cssTextProp = { link = "SolarizedAqua" },
    cssAnimationProp = { link = "SolarizedAqua" },
    cssUIProp = { link = "SolarizedYellow" },
    cssTransformProp = { link = "SolarizedAqua" },
    cssTransitionProp = { link = "SolarizedAqua" },
    cssPrintProp = { link = "SolarizedAqua" },
    cssPositioningProp = { link = "SolarizedYellow" },
    cssBoxProp = { link = "SolarizedAqua" },
    cssFontDescriptorProp = { link = "SolarizedAqua" },
    cssFlexibleBoxProp = { link = "SolarizedAqua" },
    cssBorderOutlineProp = { link = "SolarizedAqua" },
    cssBackgroundProp = { link = "SolarizedAqua" },
    cssMarginProp = { link = "SolarizedAqua" },
    cssListProp = { link = "SolarizedAqua" },
    cssTableProp = { link = "SolarizedAqua" },
    cssFontProp = { link = "SolarizedAqua" },
    cssPaddingProp = { link = "SolarizedAqua" },
    cssDimensionProp = { link = "SolarizedAqua" },
    cssRenderProp = { link = "SolarizedAqua" },
    cssColorProp = { link = "SolarizedAqua" },
    cssGeneratedContentProp = { link = "SolarizedAqua" },
    -- javascript
    javaScriptBraces = { link = "SolarizedDarkFg1" },
    javaScriptFunction = { link = "SolarizedAqua" },
    javaScriptIdentifier = { link = "SolarizedRed" },
    javaScriptMember = { link = "SolarizedBlue" },
    javaScriptNumber = { link = "SolarizedPurple" },
    javaScriptNull = { link = "SolarizedPurple" },
    javaScriptParens = { link = "SolarizedDarkFg3" },
    -- typescript
    typescriptReserved = { link = "SolarizedAqua" },
    typescriptLabel = { link = "SolarizedAqua" },
    typescriptFuncKeyword = { link = "SolarizedAqua" },
    typescriptIdentifier = { link = "SolarizedOrange" },
    typescriptBraces = { link = "SolarizedDarkFg1" },
    typescriptEndColons = { link = "SolarizedDarkFg1" },
    typescriptDOMObjects = { link = "SolarizedDarkFg1" },
    typescriptAjaxMethods = { link = "SolarizedDarkFg1" },
    typescriptLogicSymbols = { link = "SolarizedDarkFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "SolarizedDarkFg1" },
    typescriptParens = { link = "SolarizedDarkFg3" },
    typescriptOpSymbols = { link = "SolarizedDarkFg3" },
    typescriptHtmlElemProperties = { link = "SolarizedDarkFg1" },
    typescriptNull = { link = "SolarizedPurple" },
    typescriptInterpolationDelimiter = { link = "SolarizedAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "SolarizedAqua" },
    purescriptModuleName = { link = "SolarizedDarkFg1" },
    purescriptWhere = { link = "SolarizedAqua" },
    purescriptDelimiter = { link = "SolarizedDarkFg4" },
    purescriptType = { link = "SolarizedDarkFg1" },
    purescriptImportKeyword = { link = "SolarizedAqua" },
    purescriptHidingKeyword = { link = "SolarizedAqua" },
    purescriptAsKeyword = { link = "SolarizedAqua" },
    purescriptStructure = { link = "SolarizedAqua" },
    purescriptOperator = { link = "SolarizedBlue" },
    purescriptTypeVar = { link = "SolarizedDarkFg1" },
    purescriptConstructor = { link = "SolarizedDarkFg1" },
    purescriptFunction = { link = "SolarizedDarkFg1" },
    purescriptConditional = { link = "SolarizedOrange" },
    purescriptBacktick = { link = "SolarizedOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "SolarizedDarkFg3" },
    coffeeSpecialOp = { link = "SolarizedDarkFg3" },
    coffeeCurly = { link = "SolarizedOrange" },
    coffeeParen = { link = "SolarizedDarkFg3" },
    coffeeBracket = { link = "SolarizedOrange" },
    -- ruby
    rubyStringDelimiter = { link = "SolarizedGreen" },
    rubyInterpolationDelimiter = { link = "SolarizedAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "SolarizedRed" },
    objcDirective = { link = "SolarizedBlue" },
    -- go
    goDirective = { link = "SolarizedAqua" },
    goConstants = { link = "SolarizedPurple" },
    goDeclaration = { link = "SolarizedRed" },
    goDeclType = { link = "SolarizedBlue" },
    goBuiltins = { link = "SolarizedOrange" },
    -- lua
    luaIn = { link = "SolarizedRed" },
    luaFunction = { link = "SolarizedAqua" },
    luaTable = { link = "SolarizedOrange" },
    -- moonscript
    moonSpecialOp = { link = "SolarizedDarkFg3" },
    moonExtendedOp = { link = "SolarizedDarkFg3" },
    moonFunction = { link = "SolarizedDarkFg3" },
    moonObject = { link = "SolarizedYellow" },
    -- java
    javaAnnotation = { link = "SolarizedBlue" },
    javaDocTags = { link = "SolarizedAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "SolarizedDarkFg3" },
    javaParen1 = { link = "SolarizedDarkFg3" },
    javaParen2 = { link = "SolarizedDarkFg3" },
    javaParen3 = { link = "SolarizedDarkFg3" },
    javaParen4 = { link = "SolarizedDarkFg3" },
    javaParen5 = { link = "SolarizedDarkFg3" },
    javaOperator = { link = "SolarizedOrange" },
    javaVarArg = { link = "SolarizedGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "SolarizedGreen" },
    elixirInterpolationDelimiter = { link = "SolarizedAqua" },
    elixirModuleDeclaration = { link = "SolarizedYellow" },
    -- scala
    scalaNameDefinition = { link = "SolarizedDarkFg1" },
    scalaCaseFollowing = { link = "SolarizedDarkFg1" },
    scalaCapitalWord = { link = "SolarizedDarkFg1" },
    scalaTypeExtension = { link = "SolarizedDarkFg1" },
    scalaKeyword = { link = "SolarizedRed" },
    scalaKeywordModifier = { link = "SolarizedRed" },
    scalaSpecial = { link = "SolarizedAqua" },
    scalaOperator = { link = "SolarizedDarkFg1" },
    scalaTypeDeclaration = { link = "SolarizedYellow" },
    scalaTypeTypePostDeclaration = { link = "SolarizedYellow" },
    scalaInstanceDeclaration = { link = "SolarizedDarkFg1" },
    scalaInterpolation = { link = "SolarizedAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "SolarizedGreen" },
    markdownH2 = { link = "SolarizedGreen" },
    markdownH3 = { link = "SolarizedYellow" },
    markdownH4 = { link = "SolarizedYellow" },
    markdownH5 = { link = "SolarizedYellow" },
    markdownH6 = { link = "SolarizedYellow" },
    markdownCode = { link = "SolarizedAqua" },
    markdownCodeBlock = { link = "SolarizedAqua" },
    markdownCodeDelimiter = { link = "SolarizedAqua" },
    markdownBlockquote = { link = "SolarizedDarkbase1" },
    markdownListMarker = { link = "SolarizedDarkbase1" },
    markdownOrderedListMarker = { link = "SolarizedDarkbase1" },
    markdownRule = { link = "SolarizedDarkbase1" },
    markdownHeadingRule = { link = "SolarizedDarkbase1" },
    markdownUrlDelimiter = { link = "SolarizedDarkFg3" },
    markdownLinkDelimiter = { link = "SolarizedDarkFg3" },
    markdownLinkTextDelimiter = { link = "SolarizedDarkFg3" },
    markdownHeadingDelimiter = { link = "SolarizedOrange" },
    markdownUrl = { link = "SolarizedPurple" },
    markdownUrlTitleDelimiter = { link = "SolarizedGreen" },
    markdownLinkText = { fg = colors.base1, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "SolarizedBlue" },
    haskellIdentifier = { link = "SolarizedAqua" },
    haskellSeparator = { link = "SolarizedDarkFg4" },
    haskellDelimiter = { link = "SolarizedOrange" },
    haskellOperators = { link = "SolarizedPurple" },
    haskellBacktick = { link = "SolarizedOrange" },
    haskellStatement = { link = "SolarizedPurple" },
    haskellConditional = { link = "SolarizedPurple" },
    haskellLet = { link = "SolarizedRed" },
    haskellDefault = { link = "SolarizedRed" },
    haskellWhere = { link = "SolarizedRed" },
    haskellBottom = { link = "SolarizedRed" },
    haskellImportKeywords = { link = "SolarizedPurple" },
    haskellDeclKeyword = { link = "SolarizedOrange" },
    haskellDecl = { link = "SolarizedOrange" },
    haskellDeriving = { link = "SolarizedPurple" },
    haskellAssocType = { link = "SolarizedAqua" },
    haskellNumber = { link = "SolarizedAqua" },
    haskellPragma = { link = "SolarizedRed" },
    haskellTH = { link = "SolarizedAqua" },
    haskellForeignKeywords = { link = "SolarizedGreen" },
    haskellKeyword = { link = "SolarizedRed" },
    haskellFloat = { link = "SolarizedAqua" },
    haskellInfix = { link = "SolarizedPurple" },
    haskellQuote = { link = "SolarizedGreen" },
    haskellShebang = { link = "SolarizedYellow" },
    haskellLiquid = { link = "SolarizedPurple" },
    haskellQuasiQuoted = { link = "SolarizedBlue" },
    haskellRecursiveDo = { link = "SolarizedPurple" },
    haskellQuotedType = { link = "SolarizedRed" },
    haskellPreProc = { link = "SolarizedDarkFg4" },
    haskellTypeRoles = { link = "SolarizedRed" },
    haskellTypeForall = { link = "SolarizedRed" },
    haskellPatternKeyword = { link = "SolarizedBlue" },
    -- json
    jsonKeyword = { link = "SolarizedGreen" },
    jsonQuote = { link = "SolarizedGreen" },
    jsonBraces = { link = "SolarizedDarkFg1" },
    jsonString = { link = "SolarizedDarkFg1" },
    -- mail
    mailQuoted1 = { link = "SolarizedAqua" },
    mailQuoted2 = { link = "SolarizedPurple" },
    mailQuoted3 = { link = "SolarizedYellow" },
    mailQuoted4 = { link = "SolarizedGreen" },
    mailQuoted5 = { link = "SolarizedRed" },
    mailQuoted6 = { link = "SolarizedOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "SolarizedDarkFg1" },
    csEndColon = { link = "SolarizedDarkFg1" },
    csLogicSymbols = { link = "SolarizedDarkFg1" },
    csParens = { link = "SolarizedDarkFg3" },
    csOpSymbols = { link = "SolarizedDarkFg3" },
    csInterpolationDelimiter = { link = "SolarizedDarkFg3" },
    csInterpolationAlignDel = { link = "SolarizedAqua" },
    csInterpolationFormat = { link = "SolarizedAqua" },
    csInterpolationFormatDel = { link = "SolarizedAqua" },
    -- rust btw
    rustSigil = { link = "SolarizedOrange" },
    rustEscape = { link = "SolarizedAqua" },
    rustStringContinuation = { link = "SolarizedAqua" },
    rustEnum = { link = "SolarizedAqua" },
    rustStructure = { link = "SolarizedAqua" },
    rustModPathSep = { link = "SolarizedDarkFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "SolarizedAqua" },
    -- ocaml
    ocamlOperator = { link = "SolarizedDarkFg1" },
    ocamlKeyChar = { link = "SolarizedOrange" },
    ocamlArrow = { link = "SolarizedOrange" },
    ocamlInfixOpKeyword = { link = "SolarizedRed" },
    ocamlConstructor = { link = "SolarizedOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "SolarizedDarkFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "SolarizedDarkFg1" },
    LspSagaAutoPreview = { link = "SolarizedOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "SolarizedAqua" },
    LspSagaDefPreviewBorder = { link = "SolarizedBlue" },
    LspSagaHoverBorder = { link = "SolarizedOrange" },
    LspSagaRenameBorder = { link = "SolarizedBlue" },
    LspSagaDiagnosticSource = { link = "SolarizedOrange" },
    LspSagaDiagnosticBorder = { link = "SolarizedPurple" },
    LspSagaDiagnosticHeader = { link = "SolarizedGreen" },
    LspSagaSignatureHelpBorder = { link = "SolarizedGreen" },
    SagaShadow = { link = "SolarizedDarkBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "SolarizedOrange" },
    DashboardHeader = { link = "SolarizedAqua" },
    DashboardCenter = { link = "SolarizedYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "SolarizedAqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "SolarizedDarkFg1" },
    CarbonExe = { link = "SolarizedYellow" },
    CarbonSymlink = { link = "SolarizedAqua" },
    CarbonBrokenSymlink = { link = "SolarizedRed" },
    CarbonIndicator = { link = "SolarizedDarkbase1" },
    CarbonDanger = { link = "SolarizedRed" },
    CarbonPending = { link = "SolarizedYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "SolarizedBlue" },
    NotifyDEBUGIcon = { link = "SolarizedBlue" },
    NotifyDEBUGTitle = { link = "SolarizedBlue" },
    NotifyERRORBorder = { link = "SolarizedRed" },
    NotifyERRORIcon = { link = "SolarizedRed" },
    NotifyERRORTitle = { link = "SolarizedRed" },
    NotifyINFOBorder = { link = "SolarizedAqua" },
    NotifyINFOIcon = { link = "SolarizedAqua" },
    NotifyINFOTitle = { link = "SolarizedAqua" },
    NotifyTRACEBorder = { link = "SolarizedGreen" },
    NotifyTRACEIcon = { link = "SolarizedGreen" },
    NotifyTRACETitle = { link = "SolarizedGreen" },
    NotifyWARNBorder = { link = "SolarizedYellow" },
    NotifyWARNIcon = { link = "SolarizedYellow" },
    NotifyWARNTitle = { link = "SolarizedYellow" },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
