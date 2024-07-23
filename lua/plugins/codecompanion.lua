local user_keymap = require('utils.key_mapper').user_keymap

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- Optional
    {
      "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
      opts = {},
    },
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        openai = require("codecompanion.adapters").use("openai", {
          url = "https://api.groq.com/openai/v1/chat/completions",
          schema = {
            model = {
              default = "llama3-70b-8192",
              choices = {
                "llama3-70b-8192",
                "mixtral-8x7b-32768",
              },
            },
          },
        }),
      },
    })
    user_keymap("<leader>l", "<cmd>CodeCompanionActions<cr>", { "n", "v" })
    user_keymap("<C-a>", "<cmd>CodeCompanion<cr>", { "n", "v" })
  end
}

