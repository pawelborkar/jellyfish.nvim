# 🪼 jellyfish.nvim

A vibrant, deep dark colorscheme for Neovim (0.8+) inspired by the VS Code JellyFish theme. It features rich contrast, neon highlights, and out-of-the-box support for modern Neovim plugins, LSP diagnostics, and Tree-sitter.

---

## ✨ Features

- **Rich Contrast:** Deep blue-purple backgrounds with vivid neon highlights.
- **Tree-sitter Support:** Fully integrated highlighting for modern syntax trees.
- **Diagnostics:** Distinct and clear warning/error/info/hint styles.
- **Plugin Integrations:** Native styles for:
  - [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
  - [NvimTree](https://github.com/nvim-tree/nvim-tree.lua) / [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - [Which-Key](https://github.com/folke/which-key.nvim)
  - [GitSigns](https://github.com/lewis6991/gitsigns.nvim) / [Vim-GitGutter](https://github.com/airblade/vim-gitgutter)
  - [Indent Blankline (ibl.nvim)](https://github.com/lukas-reineke/indent-blankline.nvim)

---

## 📦 Installation

Choose your preferred package manager to install `jellyfish.nvim`.

### 1. [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

Add the following to your plugin specification:

```lua
{
  "pawelborkar/jellyfish.nvim",
  lazy = false,
  priority = 1000, -- Load this before other plugins
  config = function()
    vim.cmd([[colorscheme jellyfish]])
  end,
}
```

### 2. [packer.nvim](https://github.com/wbthomason/packer.nvim)

Add the following to your plugin list:

```lua
use {
  "pawelborkar/jellyfish.nvim",
  config = function()
    vim.cmd("colorscheme jellyfish")
  end
}
```

### 3. [vim-plug](https://github.com/junegunn/vim-plug)

Add the plugin to your `init.vim` or `init.lua`:

**Vimscript:**
```vim
Plug 'pawelborkar/jellyfish.nvim'

" After plug#end()
colorscheme jellyfish
```

**Lua:**
```lua
vim.cmd [[ Plug 'pawelborkar/jellyfish.nvim' ]]

-- After plug#end()
vim.cmd("colorscheme jellyfish")
```

---

## 🚀 Integration with Neovim IDEs

Here is how you can set up `jellyfish.nvim` on popular Neovim distributions and IDE configurations.

### 1. [LazyVim](https://lazyvim.org)

To add the theme to LazyVim, create or edit `lua/plugins/colorscheme.lua`:

```lua
return {
  -- Add the colorscheme plugin
  {
    "pawelborkar/jellyfish.nvim",
    lazy = false,
    priority = 1000,
  },
  -- Configure LazyVim to load it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "jellyfish",
    },
  }
}
```

### 2. [NvChad](https://nvchad.com) (v2.5+)

1. Register the plugin by creating/updating `lua/plugins/init.lua`:

```lua
return {
  {
    "pawelborkar/jellyfish.nvim",
    lazy = false,
    priority = 1000,
  },
}
```

2. Force the colorscheme load inside `lua/chadrc.lua` or `lua/custom/init.lua`:

```lua
-- Since NvChad defaults to its own theme manager, you can override it:
vim.api.nvim_create_autocmd("User", {
  pattern = "NvChadInit",
  callback = function()
    vim.cmd("colorscheme jellyfish")
  end,
})
```

### 3. [LunarVim](https://www.lunarvim.org)

Add the colorscheme plugin to `lvim.plugins` and set `lvim.colorscheme` in your `config.lua`:

```lua
-- lvim config.lua

-- 1. Register the plugin
lvim.plugins = {
  {
    "pawelborkar/jellyfish.nvim",
    lazy = false,
    priority = 1000,
  },
}

-- 2. Set the default colorscheme
lvim.colorscheme = "jellyfish"
```

### 4. [AstroNvim](https://astronvim.com) (v4+)

Create a new file `lua/plugins/jellyfish.lua`:

```lua
return {
  {
    "pawelborkar/jellyfish.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "AstroNvim/astronvim",
    opts = {
      colorscheme = "jellyfish",
    },
  }
}
```

---

## 🎨 Customization

`jellyfish.nvim` makes it easy to modify specific palette colors before loading the colorscheme, or customize highlight groups dynamically.

### 1. Overriding the Palette

You can modify the default palette by requiring the module, changing specific colors, and then loading the colorscheme:

```lua
local jellyfish = require("jellyfish")

-- Override colors in the default palette
jellyfish.palette.bg_deep = "#020220"   -- Custom deeper background
jellyfish.palette.cyan    = "#00eedd"   -- Slightly warmer cyan
jellyfish.palette.pink    = "#ff0066"   -- Custom pink highlight

-- Load the colorscheme with the updated palette
vim.cmd("colorscheme jellyfish")
```

#### Default Palette Reference:

| Key | Hex | Purpose |
| --- | --- | --- |
| `bg_deep` | `#00002c` | Main editor background |
| `bg_darker`| `#0a0025` | Sidebar & NvimTree background |
| `bg_dark` | `#0f0021` | Active line / StatusLine background |
| `bg_widget`| `#28002b` | Float and popup widget background |
| `fg` | `#ffffff` | Primary text color |
| `cyan` | `#00ffff` | Functions and interface accents |
| `pink` | `#ff0080` | Keywords and tag attributes |
| `yellow` | `#ffd900` | Strings and alerts |
| `orange` | `#ff7e34` | Numbers and warning diagnostics |
| `green` | `#00ff55` | Git additions |
| `red` | `#ff0000` | Git deletions / critical highlights |
| `purple` | `#C792EA` | Types and structural elements |
| `comment` | `#838383` | Comments |

### 2. Transparent Background

To enable transparency, override the background keys to `"NONE"` before loading the colorscheme:

```lua
local jellyfish = require("jellyfish")

jellyfish.palette.bg_deep   = "NONE"
jellyfish.palette.bg_darker = "NONE"
jellyfish.palette.bg_dark   = "NONE"

vim.cmd("colorscheme jellyfish")
```

### 3. Custom Highlights (Auto-cmd pattern)

If you want to customize specific highlight groups after the colorscheme loads:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "jellyfish",
  callback = function()
    -- Set custom highlight overrides here
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555", bg = "NONE" })
  end,
})

vim.cmd("colorscheme jellyfish")
```

---

## 📄 License

[Apache-2.0](./LICENSE)
