local theme = {}

function theme.highlights(colors, config)
  local function remove_background(group)
    group["bg"] = colors.none
  end

  local function load_syntax()
    -- Syntax highlight groups

    local syntax = {
      -- int, long, char, etc.
      Type = { fg = colors.yellow },
      -- static, register, volatile, etc.
      StorageClass = { fg = colors.purple },
      -- struct, union, enum, etc.
      Structure = { fg = colors.purple },
      -- any constant
      Constant = { fg = colors.blue },
      -- any character constant: 'c', '\n'
      Character = { fg = colors.green },
      -- a number constant: 5
      Number = { fg = colors.orange },
      -- a boolean constant: TRUE, false
      Boolean = { fg = colors.orange },
      -- a floating point constant: 2.3e10
      Float = { fg = colors.orange },
      -- any statement
      Statement = { fg = colors.purple },
      -- case, default, etc.
      Label = { fg = colors.purple },
      -- sizeof", "+", "*", etc.
      Operator = { fg = colors.purple },
      -- try, catch, throw
      Exception = { fg = colors.purple },
      -- generic Preprocessor
      PreProc = { fg = colors.purple },
      -- preprocessor #include
      Include = { fg = colors.blue },
      -- preprocessor #define
      Define = { fg = colors.red },
      -- same as Define
      Macro = { fg = colors.red },
      -- A typedef
      Typedef = { fg = colors.purple },
      -- preprocessor #if, #else, #endif, etc.
      PreCondit = { fg = colors.purple },
      -- any special symbol
      Special = { fg = colors.light_red },
      -- special character in a constant
      SpecialChar = { fg = colors.light_red },
      -- you can use CTRL-] on this
      Tag = { fg = colors.green },
      -- character that needs attention like , or .
      Delimiter = { fg = colors.dark_blue },
      -- special things inside a comment
      SpecialComment = { fg = colors.light_gray },
      -- debugging statements
      Debug = { fg = colors.yellow },
      -- text that stands out, HTML links
      Underlined = { fg = colors.green, style = "underline" },
      -- left blank, hidden
      Ignore = { fg = colors.cyan, bg = colors.bg, style = "bold" },
      -- any erroneous construct
      Error = { fg = colors.error, bg = colors.none, style = "bold,underline" },
      -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
      Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
      Comment = { fg = colors.light_gray, style = config.styles.comments }, -- normal comments
      -- normal if, then, else, endif, switch, etc.
      Conditional = { fg = colors.purple, style = config.styles.keywords },
      -- normal for, do, while, etc.
      Keyword = { fg = colors.purple, style = config.styles.keywords },
      -- normal any other keyword
      Repeat = { fg = colors.purple, style = config.styles.keywords },
      -- normal function names
      Function = { fg = colors.blue, style = config.styles.functions },
      -- any variable name
      Identifier = { fg = colors.fg, style = config.styles.variables },
      -- any string
      String = { fg = colors.green, config.styles.strings },

      htmlLink = { fg = colors.green, style = "underline" },
      htmlArg = { fg = colors.blue },
      htmlTag = { fg = colors.blue },
      htmlEndTag = { fg = colors.blue },
      htmlTagN = { fg = colors.yellow },
      htmlTagName = { fg = colors.yellow },
      htmlSpecialTagName = { fg = colors.yellow },
      htmlH1 = { fg = colors.cyan, style = "bold" },
      htmlH2 = { fg = colors.red, style = "bold" },
      htmlH3 = { fg = colors.green, style = "bold" },
      htmlH4 = { fg = colors.yellow, style = "bold" },
      htmlH5 = { fg = colors.purple, style = "bold" },

      cssAttributeSelector = { fg = colors.blue },
      cssSelectorOp = { fg = colors.dark_blue },
      cssTagName = { fg = colors.yellow },

      markdownBlockquote = { fg = colors.light_gray },
      markdownBold = { fg = colors.purple, style = "bold" },
      markdownCode = { fg = colors.green },
      markdownCodeBlock = { fg = colors.green },
      markdownCodeDelimiter = { fg = colors.green },
      markdownH1 = { fg = colors.dark_blue, style = "bold" },
      markdownH2 = { fg = colors.blue, style = "bold" },
      markdownH3 = { fg = colors.cyan, style = "bold" },
      markdownH4 = { fg = colors.light_green },
      markdownH5 = { fg = colors.light_green },
      markdownH6 = { fg = colors.light_green },
      markdownH1Delimiter = { fg = colors.dark_blue },
      markdownH2Delimiter = { fg = colors.blue },
      markdownH3Delimiter = { fg = colors.cyan },
      markdownH4Delimiter = { fg = colors.light_green },
      markdownH5Delimiter = { fg = colors.light_green },
      markdownH6Delimiter = { fg = colors.light_green },
      markdownId = { fg = colors.yellow },
      markdownIdDeclaration = { fg = colors.purple },
      markdownIdDelimiter = { fg = colors.light_gray },
      markdownLinkDelimiter = { fg = colors.light_gray },
      markdownItalic = { fg = colors.yellow, style = "italic" },
      markdownLinkText = { fg = colors.purple },
      markdownListMarker = { fg = colors.red },
      markdownOrderedListMarker = { fg = colors.red },
      markdownRule = { fg = colors.purple },
      markdownUrl = { fg = colors.cyan, style = "underline" },
    }

    return syntax
  end

  local function load_editor()
    -- Editor highlight groups

    local editor = {
      -- normal text and background color for floating windows
      NormalFloat = { fg = colors.fg, bg = colors.active },
      -- floating window border
      FloatBorder = { fg = colors.blue, bg = colors.active },
      -- used for the columns set with 'colorcolumn'
      ColorColumn = { fg = colors.none, bg = colors.float },
      -- placeholder characters substituted for concealed text (see 'conceallevel')
      Conceal = { bg = colors.bg },
      -- the character under the cursor
      Cursor = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- like Cursor, but used when in IME mode
      CursorIM = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- directory names (and other special names in listings)
      Directory = { fg = colors.blue, bg = colors.none },
      -- diff mode: Added line
      DiffAdd = { fg = colors.none, bg = colors.diff_add_bg },
      -- diff mode: Changed line
      DiffChange = { fg = colors.none, bg = colors.diff_change_bg },
      -- diff mode: Deleted line
      DiffDelete = { fg = colors.none, bg = colors.diff_remove_bg },
      -- diff mode: Changed text within a changed line
      DiffText = { fg = colors.none, bg = colors.diff_text_bg },
      -- error messages
      ErrorMsg = { fg = colors.error },
      -- line used for closed folds
      Folded = { fg = colors.dark_blue, bg = colors.none, style = "italic" },
      -- 'foldcolumn'
      FoldColumn = { fg = colors.light_gray },
      -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      IncSearch = { fg = colors.yellow, bg = colors.selection, style = "bold,underline" },
      -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      LineNr = { fg = colors.light_gray },
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      CursorLineNr = { fg = colors.fg },
      -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      MatchParen = { fg = colors.yellow, bg = colors.none, style = "bold" },
      -- 'showmode' message (e.g., "-- INSERT -- ")
      ModeMsg = { fg = colors.blue, style = "bold" },
      -- |more-prompt|
      MoreMsg = { fg = colors.blue, style = "bold" },
      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
      -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      NonText = { fg = colors.gray },
      -- normal item |hl-Pmenu|
      Pmenu = { fg = colors.fg, bg = colors.float },
      -- selected item |hl-PmenuSel|
      PmenuSel = { bg = colors.selection },
      -- scrollbar |hl-PmenuSbar|
      PmenuSbar = { bg = colors.float },
      -- thumb of the scrollbar  |hl-PmenuThumb|
      PmenuThumb = { bg = colors.fg },
      -- matched text in normal item
      PmenuMatch = { fg = colors.blue, bg = colors.float, style = "bold" },
      -- matched text in selected item
      PmenuMatchSel = { fg = colors.blue, bg = colors.selection, style = "bold" },
      -- |hit-enter| prompt and yes/no questions
      Question = { fg = colors.green },
      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      QuickFixLine = { bg = colors.float, style = "bold,italic" },
      -- Line numbers for quickfix lists
      qfLineNr = { fg = colors.purple },
      -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      Search = { fg = colors.blue, bg = colors.selection, style = "bold" },
      -- Unprintable characters: text displayed differently from what it really is.
      -- But not 'listchars' whitespace. |hl-Whitespace|
      SpecialKey = { fg = colors.dark_blue },
      -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellBad = { fg = colors.none, bg = colors.none, style = "italic,undercurl", sp = colors.green },
      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellCap = { fg = colors.none, bg = colors.none, style = "italic,undercurl", sp = colors.yellow },
      -- Word that is recognized by the spellchecker as one that is used in another region.
      -- |spell| Combined with the highlighting used otherwise.
      SpellLocal = { fg = colors.none, bg = colors.none, style = "italic,undercurl", sp = colors.cyan },
      -- Word that is recognized by the spellchecker as one that is hardly ever used.
      -- |spell| Combined with the highlighting used otherwise.
      SpellRare = { fg = colors.none, bg = colors.none, style = "italic,undercurl", sp = colors.purple },
      -- status line of current window
      StatusLine = { fg = colors.fg, bg = colors.active },
      -- status lines of not-current windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineNC = { fg = colors.light_gray, bg = colors.active },
      -- status line of current terminal window
      StatusLineTerm = { fg = colors.fg, bg = colors.active },
      -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineTermNC = { fg = colors.light_gray, bg = colors.active },
      -- tab pages line, where there are no labels
      TabLineFill = { fg = colors.light_gray, bg = colors.active },
      -- tab pages line, active tab page label
      TablineSel = { fg = colors.cyan, bg = colors.bg },
      Tabline = { fg = colors.light_gray, bg = colors.active },
      -- titles for output from ":set all", ":autocmd" etc.
      Title = { fg = colors.green, bg = colors.none, style = "bold" },
      -- Visual mode selection
      Visual = { fg = colors.none, bg = colors.highlight },
      -- Visual mode selection when vim is "Not Owning the Selection".
      VisualNOS = { fg = colors.none, bg = colors.highlight },
      -- warning messages
      WarningMsg = { fg = colors.warn },
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      Whitespace = { fg = colors.gray },
      -- current match in 'wildmenu' completion
      WildMenu = { fg = colors.yellow, bg = colors.none, style = "bold" },
      -- window bar of current window
      WinBar = { fg = colors.fg, bg = colors.bg },
      -- window bar of not-current windows
      WinBarNC = { fg = colors.light_gray, bg = colors.bg },
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorColumn = { fg = colors.none, bg = colors.float },
      -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      CursorLine = { fg = colors.none, bg = colors.active },
      -- Normal mode message in the cmdline
      NormalMode = { fg = colors.cyan, bg = colors.none, style = "reverse" },
      -- Insert mode message in the cmdline
      InsertMode = { fg = colors.green, bg = colors.none, style = "reverse" },
      -- Replace mode message in the cmdline
      ReplacelMode = { fg = colors.red, bg = colors.none, style = "reverse" },
      -- Visual mode message in the cmdline
      VisualMode = { fg = colors.purple, bg = colors.none, style = "reverse" },
      -- Command mode message in the cmdline
      CommandMode = { fg = colors.yellow, bg = colors.none, style = "reverse" },
      Warnings = { fg = colors.warn },

      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.green },
      healthWarning = { fg = colors.warn },

      -- Dashboard
      DashboardShortCut = { fg = colors.cyan },
      DashboardHeader = { fg = colors.blue },
      DashboardCenter = { fg = colors.purple },
      DashboardFooter = { fg = colors.green, style = "italic" },

      -- normal text and background color
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalNC = { bg = colors.bg },
      SignColumn = { fg = colors.fg, bg = colors.none },

      -- the column separating vertically split windows
      VertSplit = { fg = colors.bg },
      WinSeparator = { fg = colors.bg },

      EndOfBuffer = { fg = colors.gray },
    }

    -- Options:

    -- Set non-current background
    if config.fade_nc then
      editor.NormalNC["bg"] = colors.active
      editor.NormalFloat["bg"] = colors.bg
      editor.FloatBorder["bg"] = colors.bg
    end

    -- Set transparent background
    if config.disable.background then
      remove_background(editor.Normal)
      remove_background(editor.NormalNC)
      remove_background(editor.SignColumn)
      remove_background(editor.WinBar)
      remove_background(editor.WinBarNC)
    end

    -- Set transparent float backgrounds
    if config.disable.float_background then
      remove_background(editor.NormalFloat)
      remove_background(editor.FloatBorder)
    end

    -- Set transparent cursorline
    if config.disable.cursorline then
      remove_background(editor.CursorLine)
    end

    -- Set transparent eob lines
    if config.disable.eob_lines then
      editor.EndOfBuffer["fg"] = colors.bg
    end

    -- Inverse highlighting
    if config.inverse.match_paren then
      editor.MatchParen["style"] = "reverse,bold"
    end

    -- Add window split borders
    if config.borders then
      editor.VertSplit["fg"] = colors.selection
      editor.WinSeparator["fg"] = colors.selection
    end

    return editor
  end

  local function load_treesitter()
    -- TreeSitter highlight groups

    local treesitter = {
      -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
      ["@attribute"] = { fg = colors.purple },
      -- Boolean literals: `True` and `False` in Python.
      ["@boolean"] = { fg = colors.orange },
      -- Character literals: `'a'` in C.
      ["@character"] = { fg = colors.green },
      -- Line comments and block comments.
      ["@comment"] = { fg = colors.light_gray, style = config.styles.comments },
      -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
      ["@keyword.conditional"] = { fg = colors.purple, style = config.styles.keywords },
      -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
      ["@constant"] = { fg = colors.cyan },
      -- Built-in constant values: `nil` in Lua.
      ["@constant.builtin"] = { fg = colors.orange },
      -- Constants defined by macros: `NULL` in C.
      ["@constant.macro"] = { fg = colors.red },
      -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
      ["@constructor"] = { fg = colors.yellow },
      -- Syntax/parser errors. This might highlight large sections of code while the user is typing
      -- still incomplete code, use a sensible highlight.
      ["@error"] = { fg = colors.error },
      -- Exception related keywords: `try`, `except`, `finally` in Python.
      ["@keyword.exception"] = { fg = colors.purple },
      -- Object and struct fields.
      ["@variable.member"] = { fg = colors.blue },
      -- Floating-point number literals.
      ["@number.float"] = { fg = colors.orange },
      -- Function calls and definitions.
      ["@function"] = { fg = colors.blue, style = config.styles.functions },
      -- Built-in functions: `print` in Lua.
      ["@function.builtin"] = { fg = colors.cyan, style = config.styles.functions },
      -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
      ["@function.macro"] = { fg = colors.blue },
      -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
      ["@keyword.import"] = { fg = colors.blue },
      -- Keywords that don't fit into other categories.
      ["@keyword"] = { fg = colors.purple, style = config.styles.keywords },
      -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
      ["@keyword.function"] = { fg = colors.purple, style = config.styles.keywords },
      -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
      ["@keyword.operator"] = { fg = colors.purple },
      -- Keywords like `return` and `yield`.
      ["@keyword.return"] = { fg = colors.purple },
      -- GOTO labels: `label:` in C, and `::label::` in Lua.
      ["@label"] = { fg = colors.purple },
      -- Method calls and definitions.
      ["@function.method"] = { fg = colors.blue, style = config.styles.functions },
      -- Identifiers referring to modules and namespaces.
      ["@module"] = { fg = colors.yellow },
      -- Numeric literals that don't fit into other categories.
      ["@number"] = { fg = colors.orange },
      -- Binary or unary operators: `+`, and also `->` and `*` in C.
      ["@operator"] = { fg = colors.purple },
      -- Parameters of a function.
      ["@variable.parameter"] = { fg = colors.red },
      -- References to parameters of a function.
      ["@parameter.reference"] = { fg = colors.red },
      -- Same as `@field`.
      ["@property"] = { fg = colors.blue },
      -- Punctuation delimiters: Periods, commas, semicolons, etc.
      ["@punctuation.delimiter"] = { fg = colors.dark_blue },
      -- Brackets, braces, parentheses, etc.
      ["@punctuation.bracket"] = { fg = colors.dark_blue },
      -- Special punctuation that doesn't fit into the previous categories.
      ["@punctuation.special"] = { fg = colors.dark_blue },
      -- Keywords related to loops: `for`, `while`, etc.
      ["@keyword.repeat"] = { fg = colors.purple, style = config.styles.keywords },
      -- String literals.
      ["@string"] = { fg = colors.green, style = config.styles.strings },
      -- Regular expression literals.
      ["@string.regexp"] = { fg = colors.orange },
      -- Escape characters within a string: `\n`, `\t`, etc.
      ["@string.escape"] = { fg = colors.orange },
      -- Identifiers referring to symbols or atoms.
      ["@string.special.symbol"] = { fg = colors.cyan },
      -- Tags like HTML tag names.
      ["@tag"] = { fg = colors.yellow },
      -- HTML tag attributes.
      ["@tag.attribute"] = { fg = colors.blue },
      -- Tag delimiters like `<` `>` `/`.
      ["@tag.delimiter"] = { fg = colors.dark_blue },
      -- Non-structured text. Like text in a markup language.
      ["@markup"] = { fg = colors.fg },
      -- Text to be represented in bold.
      ["@markup.strong"] = { fg = colors.purple, style = "bold" },
      -- Text to be represented with emphasis.
      ["@markup.italic"] = { fg = colors.yellow, style = "italic" },
      -- Text to be represented with an underline.
      ["@markup.underline"] = { style = "underline" },
      -- Text that is part of a title.
      ["@markup.heading"] = { fg = colors.blue, style = "bold" },
      -- Literal or verbatim text.
      ["@markup.raw"] = { fg = colors.green },
      -- added text (for diff files)
      ["@diff.plus"] = { fg = colors.diff_add },
      -- deleted text (for diff files)
      ["@diff.minus"] = { fg = colors.diff_remove },
      -- URIs like hyperlinks or email addresses.
      ["@markup.link.url"] = { fg = colors.cyan, style = "underline" },
      -- Math environments like LaTeX's `$ ... $`
      ["@markup.math"] = { fg = colors.fg },
      -- Footnotes, text references, citations, etc.
      ["@markup.link"] = { fg = colors.purple },
      -- Text environments of markup languages.
      ["@markup.environment"] = { fg = colors.fg },
      -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
      ["@markup.environment.name"] = { fg = colors.fg },
      -- Checked todo notes.
      ["@markup.list.checked"] = { fg = colors.green },
      -- Unchecked todo notes.
      ["@markup.list.unchecked"] = { fg = colors.dark_blue },
      -- Text TODOS
      ["@comment.todo"] = { fg = colors.yellow },
      -- Text representation of an informational note.
      ["@comment.note"] = { fg = colors.info, style = "bold" },
      -- Text representation of a warning note.
      ["@comment.warning"] = { fg = colors.warn, style = "bold" },
      -- Text representation of a danger note.
      ["@comment.error"] = { fg = colors.error, style = "bold" },
      -- Type (and class) definitions and annotations.
      ["@type"] = { fg = colors.yellow },
      -- Built-in types: `i32` in Rust.
      ["@type.builtin"] = { fg = colors.orange },
      -- Variable names that don't fit into other categories.
      ["@variable"] = { fg = colors.fg, style = config.styles.variables },
      -- Variable names defined by the language: `this` or `self` in Javascript.
      ["@variable.builtin"] = { fg = colors.red, style = config.styles.variables },

      -- Specific to Markdown: different levels of headings
      ["@markup.heading.1.markdown"] = { link = "markdownH1" },
      ["@markup.heading.2.markdown"] = { link = "markdownH2" },
      ["@markup.heading.3.markdown"] = { link = "markdownH3" },
      ["@markup.heading.4.markdown"] = { link = "markdownH4" },
      ["@markup.heading.5.markdown"] = { link = "markdownH5" },
      ["@markup.heading.6.markdown"] = { link = "markdownH6" },
      ["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
      ["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
      ["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
      ["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
      ["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
      ["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

      -- Legacy highlights
      ["@conditional"] = { link = "@keyword.conditional" },
      ["@exception"] = { link = "@keyword.exception" },
      ["@field"] = { link = "@variable.member" },
      ["@float"] = { link = "@number.float" },
      ["@include"] = { link = "@keyword.import" },
      ["@method"] = { link = "@function.method" },
      ["@namespace"] = { link = "@module" },
      ["@parameter"] = { link = "@variable.parameter" },
      ["@repeat"] = { link = "@keyword.repeat" },
      ["@string.regex"] = { link = "@string.regexp" },
      ["@symbol"] = { link = "@string.special.symbol" },
      ["@text"] = { link = "@markup" },
      ["@text.strong"] = { link = "@markup.strong" },
      ["@text.emphasis"] = { link = "@markup.italic" },
      ["@text.underline"] = { link = "@markup.underline" },
      ["@text.title"] = { link = "@markup.heading" },
      ["@text.literal"] = { link = "@markup.raw" },
      ["@text.diff.add"] = { link = "@diff.plus" },
      ["@text.diff.delete"] = { link = "@diff.minus" },
      ["@text.uri"] = { link = "@markup.link.url" },
      ["@text.math"] = { link = "@markup.math" },
      ["@text.reference"] = { link = "@markup.link" },
      ["@text.environment"] = { link = "@markup.environment" },
      ["@text.environment.name"] = { link = "@markup.environment.name" },
      ["@text.todo"] = { link = "@comment.todo" },
      ["@text.warning"] = { link = "@comment.warning" },
      ["@text.note"] = { link = "@comment.note" },
      ["@text.danger"] = { link = "@comment.error" },
    }

    return treesitter
  end

  local function load_lsp()
    -- Lsp highlight groups

    local lsp = {
      -- used for "Error" diagnostic virtual text
      LspDiagnosticsDefaultError = { fg = colors.error },
      -- used for "Error" diagnostic signs in sign column
      LspDiagnosticsSignError = { fg = colors.error },
      -- used for "Error" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingError = { fg = colors.error },
      -- Virtual text "Error"
      LspDiagnosticsVirtualTextError = { fg = colors.error },
      -- used to underline "Error" diagnostics.
      LspDiagnosticsUnderlineError = { style = config.styles.diagnostics, sp = colors.error },
      -- used for "Warning" diagnostic signs in sign column
      LspDiagnosticsDefaultWarning = { fg = colors.warn },
      -- used for "Warning" diagnostic signs in sign column
      LspDiagnosticsSignWarning = { fg = colors.warn },
      -- used for "Warning" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingWarning = { fg = colors.warn },
      -- Virtual text "Warning"
      LspDiagnosticsVirtualTextWarning = { fg = colors.warn },
      -- used to underline "Warning" diagnostics.
      LspDiagnosticsUnderlineWarning = { style = config.styles.diagnostics, sp = colors.warn },
      -- used for "Information" diagnostic virtual text
      LspDiagnosticsDefaultInformation = { fg = colors.info },
      -- used for "Information" diagnostic signs in sign column
      LspDiagnosticsSignInformation = { fg = colors.info },
      -- used for "Information" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingInformation = { fg = colors.info },
      -- Virtual text "Information"
      LspDiagnosticsVirtualTextInformation = { fg = colors.info },
      -- used to underline "Information" diagnostics.
      LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
      -- used for "Hint" diagnostic virtual text
      LspDiagnosticsDefaultHint = { fg = colors.hint },
      -- used for "Hint" diagnostic signs in sign column
      LspDiagnosticsSignHint = { fg = colors.hint },
      -- used for "Hint" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingHint = { fg = colors.hint },
      -- Virtual text "Hint"
      LspDiagnosticsVirtualTextHint = { fg = colors.hint },
      -- used to underline "Hint" diagnostics.
      LspDiagnosticsUnderlineHint = { style = config.styles.diagnostics, sp = colors.hint },
      -- used for highlighting "text" references
      LspReferenceText = { style = "underline", sp = colors.yellow },
      -- used for highlighting "read" references
      LspReferenceRead = { style = "underline", sp = colors.yellow },
      -- used for highlighting "write" references
      LspReferenceWrite = { style = "underline", sp = colors.yellow },

      LspSignatureActiveParameter = { fg = colors.none, bg = colors.highlight_dark, style = "bold" },
      LspCodeLens = { fg = colors.light_gray },
      LspInlayHint = { fg = colors.light_gray, bg = colors.active },

      -- LSP Semantic Token Groups
      ["@lsp.type.namespace"] = { link = "@namespace" },
      ["@lsp.type.type"] = { link = "@type" },
      ["@lsp.type.class"] = { link = "@type" },
      ["@lsp.type.enum"] = { link = "@type" },
      ["@lsp.type.interface"] = { link = "@type" },
      ["@lsp.type.struct"] = { link = "@type" },
      ["@lsp.type.typeParameter"] = { link = "@type" },
      ["@lsp.type.parameter"] = { link = "@parameter" },
      ["@lsp.type.variable"] = { link = "@variable" },
      ["@lsp.type.property"] = { link = "@property" },
      ["@lsp.type.enumMember"] = { link = "@constant" },
      ["@lsp.type.function"] = { link = "@function" },
      ["@lsp.type.method"] = { link = "@method" },
      ["@lsp.type.macro"] = { link = "@constant.macro" },
      ["@lsp.type.keyword"] = { link = "@keyword" },
      ["@lsp.type.comment"] = { link = "@comment" },
      ["@lsp.type.string"] = { link = "@string" },
      ["@lsp.type.number"] = { link = "@number" },
      ["@lsp.type.regexp"] = { link = "@string.regex" },
      ["@lsp.type.operator"] = { link = "@operator" },
      ["@lsp.type.decorator"] = { link = "@function.macro" },
      ["@lsp.mod.deprecated"] = { style = "strikethrough" },
      ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
      ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },

      DiagnosticError = { link = "LspDiagnosticsDefaultError" },
      DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
      DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
      DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
      DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
      DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
      DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
      DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
      DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
      DiagnosticSignError = { link = "LspDiagnosticsSignError" },
      DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
      DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
      DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
      DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
      DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
      DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
      DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
      DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
    }

    return lsp
  end

  local function load_plugins()
    -- Plugins highlight groups

    local plugins = {
      -- Blink completion highlights
      BlinkCmpMenu = { fg = colors.fg, bg = colors.float }, -- completion menu window
      BlinkCmpMenuBorder = { fg = colors.gray, bg = colors.float }, -- completion menu window border
      BlinkCmpMenuSelection = { fg = colors.bg, bg = colors.cyan, bold = true }, -- selected item
      BlinkCmpScrollBarThumb = { fg = colors.gray, bg = colors.bg }, -- scrollbar thumb
      BlinkCmpScrollBarGutter = { fg = colors.bg, bg = colors.gray }, -- scrollbar gutter
      BlinkCmpLabel = { fg = colors.fg, bg = colors.float }, -- label
      BlinkCmpLabelDeprecated = { fg = colors.light_gray, bg = colors.float, italic = true }, -- deprecated label
      BlinkCmpLabelMatch = { fg = colors.purple, bg = colors.float, bold = true }, -- matches query
      BlinkCmpLabelDetail = { fg = colors.blue, bg = colors.float }, -- label description
      BlinkCmpLabelDescription = { fg = colors.cyan, bg = colors.float }, -- label description
      BlinkCmpKind = { fg = colors.orange, bg = colors.float }, -- kind icon/text
      -- For BlinkCmpKind<kind>, you can specialize if needed, e.g.
      BlinkCmpKindFunction = { fg = colors.blue, bg = colors.float },
      BlinkCmpKindVariable = { fg = colors.yellow, bg = colors.float },
      BlinkCmpKindClass = { fg = colors.purple, bg = colors.float },
      BlinkCmpKindInterface = { fg = colors.cyan, bg = colors.float },
      BlinkCmpKindEnum = { fg = colors.orange, bg = colors.float },
      -- Add more BlinkCmpKind<kind> as needed...
      BlinkCmpSource = { fg = colors.light_green, bg = colors.float }, -- source of item
      BlinkCmpGhostText = { fg = colors.gray, bg = colors.bg, italic = true }, -- ghost text preview
      BlinkCmpDoc = { fg = colors.fg, bg = colors.float }, -- documentation window
      BlinkCmpDocBorder = { fg = colors.gray, bg = colors.float }, -- documentation window border
      BlinkCmpDocSeparator = { fg = colors.light_gray, bg = colors.float }, -- doc/detail separator
      BlinkCmpDocCursorLine = { fg = colors.bg, bg = colors.selection }, -- doc window cursor line
      BlinkCmpSignatureHelp = { fg = colors.fg, bg = colors.float }, -- signature help window
      BlinkCmpSignatureHelpBorder = { fg = colors.gray, bg = colors.float }, -- signature help border
      BlinkCmpSignatureHelpActiveParameter = { fg = colors.red, bg = colors.float, bold = true }, -- active parameter

      -- Fzf highlights
      FzfLuaNormal = { fg = colors.fg, bg = colors.bg },
      FzfLuaBorder = { fg = colors.gray, bg = colors.bg },
      FzfLuaTitle = { fg = colors.cyan, bg = colors.bg, bold = true },
      FzfLuaTitleFlags = { fg = colors.orange, bg = colors.bg, bold = true },
      FzfLuaBackdrop = { bg = "#000000" },
      FzfLuaHelpNormal = { fg = colors.fg, bg = colors.bg },
      FzfLuaHelpBorder = { fg = colors.gray, bg = colors.bg },
      FzfLuaPreviewNormal = { fg = colors.fg, bg = colors.bg },
      FzfLuaPreviewBorder = { fg = colors.gray, bg = colors.bg },
      FzfLuaPreviewTitle = { fg = colors.light_green, bg = colors.bg, bold = true },
      FzfLuaCursor = { fg = colors.bg, bg = colors.cyan },
      FzfLuaCursorLine = { bg = colors.selection },
      FzfLuaCursorLineNr = { fg = colors.yellow, bg = colors.selection },
      FzfLuaSearch = { fg = colors.bg, bg = colors.yellow, bold = true },
      FzfLuaScrollBorderEmpty = { fg = colors.gray },
      FzfLuaScrollBorderFull = { fg = colors.gray },
      FzfLuaScrollFloatEmpty = { bg = colors.gray },
      FzfLuaScrollFloatFull = { bg = colors.light_gray },
      FzfLuaDirIcon = { fg = colors.blue },
      FzfLuaDirPart = { fg = colors.gray },
      FzfLuaFilePart = { fg = colors.fg },
      FzfLuaHeaderBind = { fg = colors.green, bold = true },
      FzfLuaHeaderText = { fg = colors.red, bold = true },
      FzfLuaPathColNr = { fg = colors.blue },
      FzfLuaPathLineNr = { fg = colors.light_green },
      FzfLuaLivePrompt = { fg = colors.pink, bold = true },
      FzfLuaLiveSym = { fg = colors.pink, bold = true },
      FzfLuaBufId = { fg = colors.bg, bg = colors.blue },
      FzfLuaBufName = { fg = colors.blue },
      FzfLuaBufLineNr = { fg = colors.light_gray },
      FzfLuaBufNr = { fg = colors.cyan },
      FzfLuaBufFlagCur = { fg = colors.orange },
      FzfLuaBufFlagAlt = { fg = colors.blue },
      FzfLuaTabTitle = { fg = colors.blue, bold = true },
      FzfLuaTabMarker = { fg = colors.green, bold = true },
      -- Fzf terminal highlight groups
      FzfLuaFzfNormal = { fg = colors.fg, bg = colors.bg },
      FzfLuaFzfCursorLine = { bg = colors.selection },
      FzfLuaFzfMatch = { fg = colors.purple, bold = true },
      FzfLuaFzfBorder = { fg = colors.gray, bg = colors.bg },
      FzfLuaFzfScrollbar = { fg = colors.gray },
      FzfLuaFzfSeparator = { fg = colors.gray },
      FzfLuaFzfGutter = { fg = colors.bg },
      FzfLuaFzfHeader = { fg = colors.cyan, bold = true },
      FzfLuaFzfInfo = { fg = colors.gray },
      FzfLuaFzfPointer = { fg = colors.pink, bold = true },
      FzfLuaFzfMarker = { fg = colors.pink },
      FzfLuaFzfSpinner = { fg = colors.pink },
      FzfLuaFzfPrompt = { fg = colors.orange, bold = true },
      FzfLuaFzfQuery = { fg = colors.fg, bg = colors.bg },

      -- Trouble
      TroubleCount = { fg = colors.purple },
      TroubleNormal = { fg = colors.fg },
      TroubleText = { fg = colors.fg },

      -- Diff
      diffAdded = { fg = colors.diff_add },
      diffRemoved = { fg = colors.diff_remove },
      diffChanged = { fg = colors.diff_change },
      diffOldFile = { fg = colors.yellow },
      diffNewFile = { fg = colors.orange },
      diffFile = { fg = colors.blue },
      diffLine = { fg = colors.light_gray },
      diffIndexLine = { fg = colors.purple },

      -- GitSigns
      GitSignsAdd = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsAddNr = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsAddLn = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsChange = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsChangeNr = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsChangeLn = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsDelete = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
      GitSignsDeleteNr = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
      GitSignsDeleteLn = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|

      -- nvim-treesitter-context
      TreesitterContext = { fg = colors.none, bg = colors.active },

      -- Nvim dap
      DapBreakpoint = { fg = colors.red },
      DapStopped = { fg = colors.green },

      -- local plugions of xaaha/dev-env/
      StatusLine = { fg = colors.fg, bg = colors.active, bold = true }, -- Main statusline, clear foreground, active bar background
      GitBranch = { fg = colors.cyan, bg = colors.none, italic = true }, -- Branch info, cyan for git, no background, italic for emphasis
      GitChanges = { fg = colors.yellow, bg = colors.none, bold = true }, -- Git changes, yellow for visibility, no background, bold for emphasis
    }

    return plugins
  end

  function theme.load_terminal()
    -- dark
    vim.g.terminal_color_0 = colors.float
    vim.g.terminal_color_8 = colors.selection

    -- light
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_15 = colors.fg_light

    -- colors
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red

    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green

    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_11 = colors.yellow

    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue

    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_13 = colors.purple

    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_14 = colors.cyan
  end

  return vim.tbl_deep_extend("error", load_syntax(), load_editor(), load_treesitter(), load_lsp(), load_plugins())
end

return theme
