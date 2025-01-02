require "nvchad.options"

-- add yours here!

vim.opt.cursorlineopt = "both" -- to enable cursorline!

-- enable ssh remote copy and paste
-- the default conf in the help has issues when paste with 'p'
-- so the below config is from https://github.com/neovim/neovim/discussions/28010#discussioncomment-9877494
vim.o.clipboard = "unnamedplus"

local function paste()
  return {
    vim.fn.split(vim.fn.getreg "", "\n"),
    vim.fn.getregtype "",
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    ["*"] = require("vim.ui.clipboard.osc52").copy "*",
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

-- change cursor color: https://neovim.io/doc/user/faq.html#faq
vim.api.nvim_set_hl(0, "Cursor", { fg = "red", bg = "red" })
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- set relative number line
vim.opt.relativenumber = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
