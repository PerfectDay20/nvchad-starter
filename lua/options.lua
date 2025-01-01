require "nvchad.options"

-- add yours here!

vim.opt.cursorlineopt = "both" -- to enable cursorline!

-- enable ssh remote copy and paste
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    ["*"] = require("vim.ui.clipboard.osc52").copy "*",
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste "+",
    ["*"] = require("vim.ui.clipboard.osc52").paste "*",
  },
}

-- change cursor color: https://neovim.io/doc/user/faq.html#faq
vim.api.nvim_set_hl(0, "Cursor", { fg = "red", bg = "red" })
vim.opt.guicursor="n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
