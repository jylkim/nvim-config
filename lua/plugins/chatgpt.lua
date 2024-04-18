return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup {
      -- api_host_cmd = 'echo https://api.groq.com/openai', -- Groq Cloud OpenAI API compatible URL
      -- api_key_cmd = "gpg --decrypt " .. vim.fn.expand("$HOME") .. "/groq.secret.gpg",
      openai_params = {
        model = "mixtral-8x7b-32768",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 32768,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        model = "mixtral-8x7b-32768",
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      actions_paths = { "~/.config/nvim/lua/plugins/chatgpt-actions.json" },
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
