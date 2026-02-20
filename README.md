# nvim-config

My Neovim configuration based on Lua + [lazy.nvim](https://github.com/folke/lazy.nvim).

## Prerequisites

- Neovim 0.9.0+
- [Ripgrep](https://github.com/BurntSushi/ripgrep) (`brew install ripgrep`)
- [Nerd Font](https://www.nerdfonts.com/)

## Structure

```
~/.config/nvim/
├── init.lua                  # Entry point (VSCode / Neovim branch)
└── lua/
    ├── config/
    │   ├── init.lua           # lazy.nvim bootstrap & config loader
    │   ├── globals.lua        # Leader key (Space)
    │   ├── options.lua        # Editor options
    │   ├── keymaps.lua        # Global keymaps
    │   └── commands.lua       # Custom commands
    ├── plugins/               # Plugin configs (auto-loaded by lazy.nvim)
    └── utils/                 # Utility functions
```

## Plugins

| Plugin | Description |
|--------|-------------|
| [onenord.nvim](https://github.com/rmehri01/onenord.nvim) | Color scheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/formatter installer |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatter (stylua, ruff, prettierd) |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics list |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap popup |
| [gitsigns.nvim](https://github.com/lewis6535/gitsigns.nvim) | Git signs |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI enhancements |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comment toggle |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto bracket pairs |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown preview |
| [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) | AI code completion |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |

## Key Bindings

Leader key: `Space`

### General

| Key | Action |
|-----|--------|
| `<leader>e` | Neotree toggle |
| `<leader>h` | Clear search highlights |
| `<leader>s` | Vertical split |
| `<leader>S` | Horizontal split |
| `<C-h/j/k/l>` | Pane navigation |
| `<Tab>` / `<S-Tab>` | Next / Previous tab |

### Find (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover info |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format buffer |
| `<leader>r` | Diagnostic float |
| `<leader>D` | Type definition |
| `<leader>i` | Toggle inlay hints |
| `[d` / `]d` | Previous / Next diagnostic |

### Trouble

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xd` | Buffer diagnostics |
| `<leader>xq` | Quickfix list |

### Claude Code

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude |
| `<leader>ar` | Resume Claude |
| `<leader>as` | Send to Claude (visual) |

## LSP Servers

Auto-installed via mason-lspconfig: `lua_ls`, `ty`, `ruff`, `rust_analyzer`, `jdtls`, `gopls`, `ts_ls`, `eslint`
