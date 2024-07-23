return {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        log_level = "off",
        disable_inline_completion = true
      })
      vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", {fg ="#6CC644"})
    end,
}
