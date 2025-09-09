# 🏔️ xaaha/onenord.nvim

Personal colorscheme and/or experiments cloned from `rmehri01/onenord.nvim`

![Screenshot of the onenord theme](https://user-images.githubusercontent.com/52933714/138731499-c4092892-46cf-45e6-8947-edb5dfe32c06.png)

![Screenshot of the onenordlight theme](https://user-images.githubusercontent.com/52933714/144966905-4b17902b-53bb-4de7-8bd8-bb7d72603ca6.png)

## Requirements

- Neovim >= 0.8.0

## Installation

Install via your favourite package manager:

```lua
{
	"xaaha/onenord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("onenord").setup({
			vim.cmd("colorscheme onedark"),
		})
	end,
},
```

## Usage

For the defaults, simply enable the colorscheme:

```vim
" Vim Script
colorscheme onenord
```

```lua
-- Lua
require('onenord').setup()
```

To enable the `onenord` theme for `Lualine`, specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'onenord'
    -- ... your lualine config
  }
}
```

## Configuration

The configuration of different options is done through a setup function which will handle setting the colors, so there's no need to set `colorscheme` yourself! This is an example of the function with the default values:

```lua
require('onenord').setup({
  theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false, -- Disable setting the background color
    float_background = false, -- Disable setting the background color for floating windows
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})
```

Here is an example of overwriting the default highlight groups and colors:

```lua
local colors = require("onenord.colors").load()

require("onenord").setup({
  custom_highlights = {
  ["@constructor"] = { fg = colors.dark_blue, style = 'bold' },
  },
  custom_colors = {
    red = "#ffffff",
  },
})
```

If you use the `light` and `dark` keys, the override will be specific to those themes, otherwise they apply to both:

```lua
local colors = require("onenord.colors").load()

require("onenord").setup({
  custom_highlights = {
    light = {
      ["@constructor"] = { fg = colors.dark_blue, style = 'bold' }, -- only applies in light theme
    },
  },
  custom_colors = {
    blue = "#0000ff", -- applies in both themes
    light = {
      red = "#000000", -- only applies in light theme
    },
    dark = {
      red = "#ffffff", -- only applies in dark theme
    },
  },
})
```

You can also use the OneNord color palette for other plugins using `local colors = require("onenord.colors").load()`!

## Extras

Extra color configs for [Kitty](extras/kitty/), [Alacritty](extras/alacritty/), [iTerm](extras/iterm/), [Warp](extras/warp/), [Xresources](extras/xresources/), [Wezterm](extras/wezterm/), and [Ghostty](extras/ghostty/) can be found in [extras](https://github.com/rmehri01/onenord.nvim/blob/main/extras). To use them, refer to their respective documentation.
