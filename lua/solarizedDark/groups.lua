local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.base02
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
  vim.g.terminal_color_13 = colors.violet
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_7 = colors.base01
  vim.g.terminal_color_15 = colors.base0
end

M.setup = function()
  local config = require("solarizedDark").config
  local colors = require("solarizedDark.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    SolarizedDarkbase01 = { fg = colors.base01 },
    SolarizedDarkbase02 = { fg = colors.base02 },
    SolarizedDarkbase00 = { fg = colors.base00 },
    SolarizedDarkbase0 = { fg = colors.base0 },
    SolarizedDarkbase1 = { fg = colors.base1 },
    SolarizedDarkbase2 = { fg = colors.base2 },
    SolarizedRed = { fg = colors.red, bold = config.bold },
    SolarizedGreen = { fg = colors.green, bold = config.bold },
    SolarizedYellow = { fg = colors.yellow, bold = config.bold },
    SolarizedBlue = { fg = colors.blue, bold = config.bold },
    SolarizedViolet = { fg = colors.violet, bold = config.bold },
    SolarizedCyan = { fg = colors.cyan, bold = config.bold },
    SolarizedOrange = { fg = colors.orange, bold = config.bold },
    SolarizedRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
      or { fg = colors.red, bg = colors.base00, reverse = config.invert_signs },
    SolarizedGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
      or { fg = colors.green, bg = colors.base00, reverse = config.invert_signs },
    SolarizedYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
      or { fg = colors.yellow, bg = colors.base00, reverse = config.invert_signs },
    SolarizedBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
      or { fg = colors.blue, bg = colors.base00, reverse = config.invert_signs },
    SolarizedVioletSign = config.transparent_mode and { fg = colors.violet, reverse = config.invert_signs }
      or { fg = colors.violet, bg = colors.base00, reverse = config.invert_signs },
    SolarizedCyanSign = config.transparent_mode and { fg = colors.cyan, reverse = config.invert_signs }
      or { fg = colors.cyan, bg = colors.base00, reverse = config.invert_signs },
    SolarizedOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
      or { fg = colors.orange, bg = colors.base00, reverse = config.invert_signs },
    SolarizedRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    SolarizedGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    SolarizedYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    SolarizedBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    SolarizedVioletUnderline = { undercurl = config.undercurl, sp = colors.violet },
    SolarizedCyanUnderline = { undercurl = config.undercurl, sp = colors.cyan },
    SolarizedOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.base0, bg = nil } or { fg = colors.base0, bg = colors.base02 },
    NormalFloat = config.transparent_mode and { fg = colors.base0, bg = nil }
      or { fg = colors.base0, bg = colors.base00 },
    NormalNC = config.dim_inactive and { fg = colors.base2, bg = colors.base00 } or { link = "Normal" },
    CursorLine = { bg = colors.base00 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.base2, bg = colors.base00, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.base00, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.base1, bold = config.bold },
    ColorColumn = { bg = colors.base00 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.base00 },
    NonText = { link = "SolarizedDarkbase0" },
    SpecialKey = { link = "SolarizedBlue" },
    Visual = { bg = colors.base1, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.base02, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.base02, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.base02, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.base0, bg = colors.base0, reverse = config.inverse },
    StatusLineNC = { fg = colors.base00, bg = colors.base01, reverse = config.inverse },
    WinBar = { fg = colors.base01, bg = colors.base02 },
    WinBarNC = { fg = colors.base00, bg = colors.base00 },
    WinSeparator = config.transparent_mode and { fg = colors.base1, bg = nil }
      or { fg = colors.base1, bg = colors.base02 },
    WildMenu = { fg = colors.blue, bg = colors.base0, bold = config.bold },
    Directory = { link = "SolarizedBlue" },
    Title = { link = "SolarizedGreen" },
    ErrorMsg = { fg = colors.base02, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "SolarizedYellow" },
    ModeMsg = { link = "SolarizedYellow" },
    Question = { link = "SolarizedOrange" },
    WarningMsg = { link = "SolarizedRed" },
    LineNr = { fg = colors.base2 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.base00 },
    Folded = { fg = colors.base1, bg = colors.base00, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.base1, bg = nil }
      or { fg = colors.base1, bg = colors.base00 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "SolarizedOrange" },
    Comment = { fg = colors.base1, italic = config.italic.comments },
    -- Todo         anything that needs extra attention; mostly the
    --              keywords TODO FIXME and XXX
    Todo = { fg = colors.base02, bg = colors.yellow, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "SolarizedRed" },
    Conditional = { link = "SolarizedRed" },
    Repeat = { link = "SolarizedRed" },
    Label = { link = "SolarizedRed" },
    Exception = { link = "SolarizedRed" },
    Operator = { fg = colors.green, italic = config.italic.operators },
    Keyword = { link = "SolarizedGreen" },
    Identifier = { link = "SolarizedBlue" },
    Function = { link = "SolarizedBlue" },
    PreProc = { link = "SolarizedCyan" },
    Include = { link = "SolarizedCyan" },
    Define = { link = "SolarizedCyan" },
    Macro = { link = "SolarizedCyan" },
    PreCondit = { link = "SolarizedCyan" },
    Constant = { link = "SolarizedViolet" },
    Character = { link = "SolarizedViolet" },
    String = { fg = colors.cyan, italic = config.italic.strings },
    Boolean = { link = "SolarizedCyan" },
    Number = { link = "SolarizedViolet" },
    Float = { link = "SolarizedViolet" },
    Type = { link = "SolarizedYellow" },
    StorageClass = { link = "SolarizedOrange" },
    Structure = { link = "SolarizedCyan" },
    Typedef = { link = "SolarizedYellow" },
    Pmenu = { fg = colors.base0, bg = colors.base0 },
    PmenuSel = { fg = colors.base0, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.base0 },
    PmenuThumb = { bg = colors.base2 },
    DiffDelete = { fg = colors.red, bg = colors.base02, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.base02, reverse = config.inverse },
    DiffChange = { fg = colors.cyan, bg = colors.base02, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.base02, reverse = config.inverse },
    SpellCap = { link = "SolarizedBlueUnderline" },
    SpellBad = { link = "SolarizedRedUnderline" },
    SpellLocal = { link = "SolarizedCyanUnderline" },
    SpellRare = { link = "SolarizedVioletUnderline" },
    Whitespace = { fg = colors.base0 },
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
    DiagnosticHint = { link = "SolarizedCyan" },
    DiagnosticSignHint = { link = "SolarizedCyanSign" },
    DiagnosticUnderlineHint = { link = "SolarizedCyanUnderline" },
    DiagnosticFloatingError = { link = "SolarizedRed" },
    DiagnosticFloatingWarn = { link = "SolarizedOrange" },
    DiagnosticFloatingInfo = { link = "SolarizedBlue" },
    DiagnosticFloatingHint = { link = "SolarizedCyan" },
    DiagnosticVirtualTextError = { link = "SolarizedRed" },
    DiagnosticVirtualTextWarn = { link = "SolarizedYellow" },
    DiagnosticVirtualTextInfo = { link = "SolarizedBlue" },
    DiagnosticVirtualTextHint = { link = "SolarizedCyan" },
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
    ["@variable"] = { link = "SolarizedDarkbase0" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },

    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },

    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "SolarizedDarkbase0" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },

    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "SolarizedDarkbase0" },
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
    ["@text.note.comment"] = { fg = colors.violet, bold = config.bold },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.danger.comment   ; FIXME in comments
    ["@text.danger.comment"] = { fg = colors.base2, bg = colors.red, bold = config.bold },

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
    GitSignsChange = { link = "SolarizedCyanSign" },
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
    StartifyBracket = { link = "SolarizedDarkbase00" },
    StartifyFile = { link = "SolarizedDarkbase0" },
    StartifyNumber = { link = "SolarizedBlue" },
    StartifyPath = { link = "SolarizedDarkbase1" },
    StartifySlash = { link = "SolarizedDarkbase1" },
    StartifySection = { link = "SolarizedYellow" },
    StartifySpecial = { link = "SolarizedDarkbase0" },
    StartifyHeader = { link = "SolarizedOrange" },
    StartifyFooter = { link = "SolarizedDarkbase0" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "SolarizedCyan" },
    DirvishArg = { link = "SolarizedYellow" },
    -- netrw
    netrwDir = { link = "SolarizedCyan" },
    netrwClassify = { link = "SolarizedCyan" },
    netrwLink = { link = "SolarizedDarkbase1" },
    netrwSymLink = { link = "SolarizedDarkbase0" },
    netrwExe = { link = "SolarizedYellow" },
    netrwComment = { link = "SolarizedDarkbase1" },
    netrwList = { link = "SolarizedBlue" },
    netrwHelpCmd = { link = "SolarizedCyan" },
    netrwCmdSep = { link = "SolarizedDarkbase00" },
    netrwVersion = { link = "SolarizedGreen" },
    -- nerdtree
    NERDTreeDir = { link = "SolarizedCyan" },
    NERDTreeDirSlash = { link = "SolarizedCyan" },
    NERDTreeOpenable = { link = "SolarizedOrange" },
    NERDTreeClosable = { link = "SolarizedOrange" },
    NERDTreeFile = { link = "SolarizedDarkbase0" },
    NERDTreeExecFile = { link = "SolarizedYellow" },
    NERDTreeUp = { link = "SolarizedDarkbase1" },
    NERDTreeCWD = { link = "SolarizedGreen" },
    NERDTreeHelp = { link = "SolarizedDarkbase0" },
    NERDTreeToggleOn = { link = "SolarizedGreen" },
    NERDTreeToggleOff = { link = "SolarizedRed" },
    -- coc.nvim
    CocErrorSign = { link = "SolarizedRedSign" },
    CocWarningSign = { link = "SolarizedOrangeSign" },
    CocInfoSign = { link = "SolarizedBlueSign" },
    CocHintSign = { link = "SolarizedCyanSign" },
    CocErrorFloat = { link = "SolarizedRed" },
    CocWarningFloat = { link = "SolarizedOrange" },
    CocInfoFloat = { link = "SolarizedBlue" },
    CocHintFloat = { link = "SolarizedCyan" },
    CocDiagnosticsError = { link = "SolarizedRed" },
    CocDiagnosticsWarning = { link = "SolarizedOrange" },
    CocDiagnosticsInfo = { link = "SolarizedBlue" },
    CocDiagnosticsHint = { link = "SolarizedCyan" },
    CocSelectedText = { link = "SolarizedRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "SolarizedDarkbase1" },
    CocErrorHighlight = { link = "SolarizedRedUnderline" },
    CocWarningHighlight = { link = "SolarizedOrangeUnderline" },
    CocInfoHighlight = { link = "SolarizedBlueUnderline" },
    CocHintHighlight = { link = "SolarizedCyanUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "SolarizedDarkbase0" },
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
    CmpItemAbbr = { link = "SolarizedDarkbase2" },
    CmpItemAbbrDeprecated = { link = "SolarizedDarkbase0" },
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
    CmpItemKindKeyword = { link = "SolarizedViolet" },
    CmpItemKindEvent = { link = "SolarizedViolet" },
    CmpItemKindReference = { link = "SolarizedViolet" },
    CmpItemKindColor = { link = "SolarizedViolet" },
    CmpItemKindSnippet = { link = "SolarizedGreen" },
    CmpItemKindFile = { link = "SolarizedBlue" },
    CmpItemKindFolder = { link = "SolarizedBlue" },
    CmpItemKindEnumMember = { link = "SolarizedCyan" },
    CmpItemKindConstant = { link = "SolarizedOrange" },
    CmpItemKindStruct = { link = "SolarizedYellow" },
    CmpItemKindTypeParameter = { link = "SolarizedYellow" },
    diffAdded = { link = "SolarizedGreen" },
    diffRemoved = { link = "SolarizedRed" },
    diffChanged = { link = "SolarizedCyan" },
    diffFile = { link = "SolarizedOrange" },
    diffNewFile = { link = "SolarizedYellow" },
    diffOldFile = { link = "SolarizedOrange" },
    diffLine = { link = "SolarizedBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "SolarizedBlue" },
    NavicIconsModule = { link = "SolarizedOrange" },
    NavicIconsNamespace = { link = "SolarizedBlue" },
    NavicIconsPackage = { link = "SolarizedCyan" },
    NavicIconsClass = { link = "SolarizedYellow" },
    NavicIconsMethod = { link = "SolarizedBlue" },
    NavicIconsProperty = { link = "SolarizedCyan" },
    NavicIconsField = { link = "SolarizedViolet" },
    NavicIconsConstructor = { link = "SolarizedBlue" },
    NavicIconsEnum = { link = "SolarizedViolet" },
    NavicIconsInterface = { link = "SolarizedGreen" },
    NavicIconsFunction = { link = "SolarizedBlue" },
    NavicIconsVariable = { link = "SolarizedViolet" },
    NavicIconsConstant = { link = "SolarizedOrange" },
    NavicIconsString = { link = "SolarizedGreen" },
    NavicIconsNumber = { link = "SolarizedOrange" },
    NavicIconsBoolean = { link = "SolarizedOrange" },
    NavicIconsArray = { link = "SolarizedOrange" },
    NavicIconsObject = { link = "SolarizedOrange" },
    NavicIconsKey = { link = "SolarizedCyan" },
    NavicIconsNull = { link = "SolarizedOrange" },
    NavicIconsEnumMember = { link = "SolarizedYellow" },
    NavicIconsStruct = { link = "SolarizedViolet" },
    NavicIconsEvent = { link = "SolarizedYellow" },
    NavicIconsOperator = { link = "SolarizedRed" },
    NavicIconsTypeParameter = { link = "SolarizedRed" },
    NavicText = { link = "SolarizedDarkWhite" },
    NavicSeparator = { link = "SolarizedDarkWhite" },
    -- html
    htmlTag = { link = "SolarizedCyan" },
    htmlEndTag = { link = "SolarizedCyan" },
    htmlTagName = { link = "SolarizedBlue" },
    htmlArg = { link = "SolarizedOrange" },
    htmlTagN = { link = "SolarizedDarkbase0" },
    htmlSpecialTagName = { link = "SolarizedBlue" },
    htmlLink = { fg = colors.base01, underline = config.underline },
    htmlSpecialChar = { link = "SolarizedRed" },
    htmlBold = { fg = colors.base2, bg = colors.base02, bold = config.bold },
    htmlBoldUnderline = { fg = colors.base2, bg = colors.base02, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.base2, bg = colors.base02, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.base2,
      bg = colors.base02,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.base2, bg = colors.base02, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.base2,
      bg = colors.base02,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.base2, bg = colors.base02, italic = true },
    -- xml
    xmlTag = { link = "SolarizedCyan" },
    xmlEndTag = { link = "SolarizedCyan" },
    xmlTagName = { link = "SolarizedBlue" },
    xmlEqual = { link = "SolarizedBlue" },
    docbkKeyword = { link = "SolarizedCyan" },
    xmlDocTypeDecl = { link = "SolarizedDarkbase1" },
    xmlDocTypeKeyword = { link = "SolarizedViolet" },
    xmlCdataStart = { link = "SolarizedDarkbase1" },
    xmlCdataCdata = { link = "SolarizedViolet" },
    dtdFunction = { link = "SolarizedDarkbase1" },
    dtdTagName = { link = "SolarizedViolet" },
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
    clojureCharacter = { link = "SolarizedCyan" },
    clojureStringEscape = { link = "SolarizedCyan" },
    clojureException = { link = "SolarizedRed" },
    clojureRegexp = { link = "SolarizedCyan" },
    clojureRegexpEscape = { link = "SolarizedCyan" },
    clojureRegexpCharClass = { fg = colors.base00, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "SolarizedDarkbase00" },
    clojureAnonArg = { link = "SolarizedYellow" },
    clojureVariable = { link = "SolarizedBlue" },
    clojureMacro = { link = "SolarizedOrange" },
    clojureMeta = { link = "SolarizedYellow" },
    clojureDeref = { link = "SolarizedYellow" },
    clojureQuote = { link = "SolarizedYellow" },
    clojureUnquote = { link = "SolarizedYellow" },
    -- C
    cOperator = { link = "SolarizedViolet" },
    cppOperator = { link = "SolarizedViolet" },
    cStructure = { link = "SolarizedOrange" },
    -- python
    pythonBuiltin = { link = "SolarizedOrange" },
    pythonBuiltinObj = { link = "SolarizedOrange" },
    pythonBuiltinFunc = { link = "SolarizedOrange" },
    pythonFunction = { link = "SolarizedCyan" },
    pythonDecorator = { link = "SolarizedRed" },
    pythonInclude = { link = "SolarizedBlue" },
    pythonImport = { link = "SolarizedBlue" },
    pythonRun = { link = "SolarizedBlue" },
    pythonCoding = { link = "SolarizedBlue" },
    pythonOperator = { link = "SolarizedRed" },
    pythonException = { link = "SolarizedRed" },
    pythonExceptions = { link = "SolarizedViolet" },
    pythonBoolean = { link = "SolarizedViolet" },
    pythonDot = { link = "SolarizedDarkbase00" },
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
    cssVendor = { link = "SolarizedDarkbase0" },
    cssTextProp = { link = "SolarizedCyan" },
    cssAnimationProp = { link = "SolarizedCyan" },
    cssUIProp = { link = "SolarizedYellow" },
    cssTransformProp = { link = "SolarizedCyan" },
    cssTransitionProp = { link = "SolarizedCyan" },
    cssPrintProp = { link = "SolarizedCyan" },
    cssPositioningProp = { link = "SolarizedYellow" },
    cssBoxProp = { link = "SolarizedCyan" },
    cssFontDescriptorProp = { link = "SolarizedCyan" },
    cssFlexibleBoxProp = { link = "SolarizedCyan" },
    cssBorderOutlineProp = { link = "SolarizedCyan" },
    cssBackgroundProp = { link = "SolarizedCyan" },
    cssMarginProp = { link = "SolarizedCyan" },
    cssListProp = { link = "SolarizedCyan" },
    cssTableProp = { link = "SolarizedCyan" },
    cssFontProp = { link = "SolarizedCyan" },
    cssPaddingProp = { link = "SolarizedCyan" },
    cssDimensionProp = { link = "SolarizedCyan" },
    cssRenderProp = { link = "SolarizedCyan" },
    cssColorProp = { link = "SolarizedCyan" },
    cssGeneratedContentProp = { link = "SolarizedCyan" },
    -- javascript
    javaScriptBraces = { link = "SolarizedDarkbase0" },
    javaScriptFunction = { link = "SolarizedCyan" },
    javaScriptIdentifier = { link = "SolarizedRed" },
    javaScriptMember = { link = "SolarizedBlue" },
    javaScriptNumber = { link = "SolarizedViolet" },
    javaScriptNull = { link = "SolarizedViolet" },
    javaScriptParens = { link = "SolarizedDarkbase00" },
    -- typescript
    typescriptReserved = { link = "SolarizedCyan" },
    typescriptLabel = { link = "SolarizedCyan" },
    typescriptFuncKeyword = { link = "SolarizedCyan" },
    typescriptIdentifier = { link = "SolarizedOrange" },
    typescriptBraces = { link = "SolarizedDarkbase0" },
    typescriptEndColons = { link = "SolarizedDarkbase0" },
    typescriptDOMObjects = { link = "SolarizedDarkbase0" },
    typescriptAjaxMethods = { link = "SolarizedDarkbase0" },
    typescriptLogicSymbols = { link = "SolarizedDarkbase0" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "SolarizedDarkbase0" },
    typescriptParens = { link = "SolarizedDarkbase00" },
    typescriptOpSymbols = { link = "SolarizedDarkbase00" },
    typescriptHtmlElemProperties = { link = "SolarizedDarkbase0" },
    typescriptNull = { link = "SolarizedViolet" },
    typescriptInterpolationDelimiter = { link = "SolarizedCyan" },
    -- purescript
    purescriptModuleKeyword = { link = "SolarizedCyan" },
    purescriptModuleName = { link = "SolarizedDarkbase0" },
    purescriptWhere = { link = "SolarizedCyan" },
    purescriptDelimiter = { link = "SolarizedDarkbase01" },
    purescriptType = { link = "SolarizedDarkbase0" },
    purescriptImportKeyword = { link = "SolarizedCyan" },
    purescriptHidingKeyword = { link = "SolarizedCyan" },
    purescriptAsKeyword = { link = "SolarizedCyan" },
    purescriptStructure = { link = "SolarizedCyan" },
    purescriptOperator = { link = "SolarizedBlue" },
    purescriptTypeVar = { link = "SolarizedDarkbase0" },
    purescriptConstructor = { link = "SolarizedDarkbase0" },
    purescriptFunction = { link = "SolarizedDarkbase0" },
    purescriptConditional = { link = "SolarizedOrange" },
    purescriptBacktick = { link = "SolarizedOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "SolarizedDarkbase00" },
    coffeeSpecialOp = { link = "SolarizedDarkbase00" },
    coffeeCurly = { link = "SolarizedOrange" },
    coffeeParen = { link = "SolarizedDarkbase00" },
    coffeeBracket = { link = "SolarizedOrange" },
    -- ruby
    rubyStringDelimiter = { link = "SolarizedGreen" },
    rubyInterpolationDelimiter = { link = "SolarizedCyan" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "SolarizedRed" },
    objcDirective = { link = "SolarizedBlue" },
    -- go
    goDirective = { link = "SolarizedCyan" },
    goConstants = { link = "SolarizedViolet" },
    goDeclaration = { link = "SolarizedRed" },
    goDeclType = { link = "SolarizedBlue" },
    goBuiltins = { link = "SolarizedOrange" },
    -- lua
    luaIn = { link = "SolarizedRed" },
    luaFunction = { link = "SolarizedCyan" },
    luaTable = { link = "SolarizedOrange" },
    -- moonscript
    moonSpecialOp = { link = "SolarizedDarkbase00" },
    moonExtendedOp = { link = "SolarizedDarkbase00" },
    moonFunction = { link = "SolarizedDarkbase00" },
    moonObject = { link = "SolarizedYellow" },
    -- java
    javaAnnotation = { link = "SolarizedBlue" },
    javaDocTags = { link = "SolarizedCyan" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "SolarizedDarkbase00" },
    javaParen1 = { link = "SolarizedDarkbase00" },
    javaParen2 = { link = "SolarizedDarkbase00" },
    javaParen3 = { link = "SolarizedDarkbase00" },
    javaParen4 = { link = "SolarizedDarkbase00" },
    javaParen5 = { link = "SolarizedDarkbase00" },
    javaOperator = { link = "SolarizedOrange" },
    javaVarArg = { link = "SolarizedGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "SolarizedGreen" },
    elixirInterpolationDelimiter = { link = "SolarizedCyan" },
    elixirModuleDeclaration = { link = "SolarizedYellow" },
    -- scala
    scalaNameDefinition = { link = "SolarizedDarkbase0" },
    scalaCaseFollowing = { link = "SolarizedDarkbase0" },
    scalaCapitalWord = { link = "SolarizedDarkbase0" },
    scalaTypeExtension = { link = "SolarizedDarkbase0" },
    scalaKeyword = { link = "SolarizedRed" },
    scalaKeywordModifier = { link = "SolarizedRed" },
    scalaSpecial = { link = "SolarizedCyan" },
    scalaOperator = { link = "SolarizedDarkbase0" },
    scalaTypeDeclaration = { link = "SolarizedYellow" },
    scalaTypeTypePostDeclaration = { link = "SolarizedYellow" },
    scalaInstanceDeclaration = { link = "SolarizedDarkbase0" },
    scalaInterpolation = { link = "SolarizedCyan" },
    -- markdown
    markdownItalic = { fg = colors.base00, italic = true },
    markdownBold = { fg = colors.base00, bold = config.bold },
    markdownBoldItalic = { fg = colors.base00, bold = config.bold, italic = true },
    markdownH1 = { link = "SolarizedGreen" },
    markdownH2 = { link = "SolarizedGreen" },
    markdownH3 = { link = "SolarizedYellow" },
    markdownH4 = { link = "SolarizedYellow" },
    markdownH5 = { link = "SolarizedYellow" },
    markdownH6 = { link = "SolarizedYellow" },
    markdownCode = { link = "SolarizedCyan" },
    markdownCodeBlock = { link = "SolarizedCyan" },
    markdownCodeDelimiter = { link = "SolarizedCyan" },
    markdownBlockquote = { link = "SolarizedDarkbase1" },
    markdownListMarker = { link = "SolarizedDarkbase1" },
    markdownOrderedListMarker = { link = "SolarizedDarkbase1" },
    markdownRule = { link = "SolarizedDarkbase1" },
    markdownHeadingRule = { link = "SolarizedDarkbase1" },
    markdownUrlDelimiter = { link = "SolarizedDarkbase00" },
    markdownLinkDelimiter = { link = "SolarizedDarkbase00" },
    markdownLinkTextDelimiter = { link = "SolarizedDarkbase00" },
    markdownHeadingDelimiter = { link = "SolarizedOrange" },
    markdownUrl = { link = "SolarizedViolet" },
    markdownUrlTitleDelimiter = { link = "SolarizedGreen" },
    markdownLinkText = { fg = colors.base1, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "SolarizedBlue" },
    haskellIdentifier = { link = "SolarizedCyan" },
    haskellSeparator = { link = "SolarizedDarkbase01" },
    haskellDelimiter = { link = "SolarizedOrange" },
    haskellOperators = { link = "SolarizedViolet" },
    haskellBacktick = { link = "SolarizedOrange" },
    haskellStatement = { link = "SolarizedViolet" },
    haskellConditional = { link = "SolarizedViolet" },
    haskellLet = { link = "SolarizedRed" },
    haskellDefault = { link = "SolarizedRed" },
    haskellWhere = { link = "SolarizedRed" },
    haskellBottom = { link = "SolarizedRed" },
    haskellImportKeywords = { link = "SolarizedViolet" },
    haskellDeclKeyword = { link = "SolarizedOrange" },
    haskellDecl = { link = "SolarizedOrange" },
    haskellDeriving = { link = "SolarizedViolet" },
    haskellAssocType = { link = "SolarizedCyan" },
    haskellNumber = { link = "SolarizedCyan" },
    haskellPragma = { link = "SolarizedRed" },
    haskellTH = { link = "SolarizedCyan" },
    haskellForeignKeywords = { link = "SolarizedGreen" },
    haskellKeyword = { link = "SolarizedRed" },
    haskellFloat = { link = "SolarizedCyan" },
    haskellInfix = { link = "SolarizedViolet" },
    haskellQuote = { link = "SolarizedGreen" },
    haskellShebang = { link = "SolarizedYellow" },
    haskellLiquid = { link = "SolarizedViolet" },
    haskellQuasiQuoted = { link = "SolarizedBlue" },
    haskellRecursiveDo = { link = "SolarizedViolet" },
    haskellQuotedType = { link = "SolarizedRed" },
    haskellPreProc = { link = "SolarizedDarkbase01" },
    haskellTypeRoles = { link = "SolarizedRed" },
    haskellTypeForall = { link = "SolarizedRed" },
    haskellPatternKeyword = { link = "SolarizedBlue" },
    -- json
    jsonKeyword = { link = "SolarizedGreen" },
    jsonQuote = { link = "SolarizedGreen" },
    jsonBraces = { link = "SolarizedDarkbase0" },
    jsonString = { link = "SolarizedDarkbase0" },
    -- mail
    mailQuoted1 = { link = "SolarizedCyan" },
    mailQuoted2 = { link = "SolarizedViolet" },
    mailQuoted3 = { link = "SolarizedYellow" },
    mailQuoted4 = { link = "SolarizedGreen" },
    mailQuoted5 = { link = "SolarizedRed" },
    mailQuoted6 = { link = "SolarizedOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "SolarizedDarkbase0" },
    csEndColon = { link = "SolarizedDarkbase0" },
    csLogicSymbols = { link = "SolarizedDarkbase0" },
    csParens = { link = "SolarizedDarkbase00" },
    csOpSymbols = { link = "SolarizedDarkbase00" },
    csInterpolationDelimiter = { link = "SolarizedDarkbase00" },
    csInterpolationAlignDel = { link = "SolarizedCyan" },
    csInterpolationFormat = { link = "SolarizedCyan" },
    csInterpolationFormatDel = { link = "SolarizedCyan" },
    -- rust btw
    rustSigil = { link = "SolarizedOrange" },
    rustEscape = { link = "SolarizedCyan" },
    rustStringContinuation = { link = "SolarizedCyan" },
    rustEnum = { link = "SolarizedCyan" },
    rustStructure = { link = "SolarizedCyan" },
    rustModPathSep = { link = "SolarizedDarkbase0" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "SolarizedCyan" },
    -- ocaml
    ocamlOperator = { link = "SolarizedDarkbase0" },
    ocamlKeyChar = { link = "SolarizedOrange" },
    ocamlArrow = { link = "SolarizedOrange" },
    ocamlInfixOpKeyword = { link = "SolarizedRed" },
    ocamlConstructor = { link = "SolarizedOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "SolarizedDarkbase0" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "SolarizedDarkbase0" },
    LspSagaAutoPreview = { link = "SolarizedOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "SolarizedCyan" },
    LspSagaDefPreviewBorder = { link = "SolarizedBlue" },
    LspSagaHoverBorder = { link = "SolarizedOrange" },
    LspSagaRenameBorder = { link = "SolarizedBlue" },
    LspSagaDiagnosticSource = { link = "SolarizedOrange" },
    LspSagaDiagnosticBorder = { link = "SolarizedViolet" },
    LspSagaDiagnosticHeader = { link = "SolarizedGreen" },
    LspSagaSignatureHelpBorder = { link = "SolarizedGreen" },
    SagaShadow = { link = "SolarizedDarkbase02" },

    -- dashboard-nvim
    DashboardShortCut = { link = "SolarizedOrange" },
    DashboardHeader = { link = "SolarizedCyan" },
    DashboardCenter = { link = "SolarizedYellow" },
    DashboardFooter = { fg = colors.violet, italic = true },
    -- mason
    MasonHighlight = { link = "SolarizedCyan" },
    MasonHighlightBlock = { fg = colors.base02, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.base02, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.base02, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.base02, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.base01 },
    MasonMutedBlock = { fg = colors.base02, bg = colors.base01 },
    MasonMutedBlockBold = { fg = colors.base02, bg = colors.base01, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "SolarizedDarkbase0" },
    CarbonExe = { link = "SolarizedYellow" },
    CarbonSymlink = { link = "SolarizedCyan" },
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
    NotifyINFOBorder = { link = "SolarizedCyan" },
    NotifyINFOIcon = { link = "SolarizedCyan" },
    NotifyINFOTitle = { link = "SolarizedCyan" },
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
    TSRainbowViolet = { fg = colors.violet },
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
