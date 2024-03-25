return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  },
  -- https://github.com/noornee/nvim/blob/main/lua/plugins/nvim-cmp.lua
  config = function()
    local cmp = require("cmp")
    local kind_icons = {
      -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
      Text = " ",
      Method = "󰆧",
      Function = "ƒ ",
      Constructor = " ",
      Field = "󰜢 ",
      Variable = " ",
      Constant = " ",
      Class = " ",
      Interface = "󰜰 ",
      Struct = " ",
      Enum = "了 ",
      EnumMember = " ",
      Module = "",
      Property = " ",
      Unit = " ",
      Value = "󰎠 ",
      Keyword = "󰌆 ",
      Snippet = " ",
      File = " ",
      Folder = " ",
      Color = " ",
    }

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          require('snippy').expand_snippet(args.body) -- For `snippy` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          -- Source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
          })[entry.source.name]
          return vim_item
        end,
      }
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end
}
