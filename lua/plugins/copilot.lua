return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<tab>",
          accept_word = "<D-l>",
          next = "<D-]>",
          prev = "<D-[>",
          dismiss = "<D-]>",
        }
      }
    })
  end,
}
