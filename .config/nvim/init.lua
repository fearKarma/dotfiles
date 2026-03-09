-- Enable true colors
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- init.lua
vim.api.nvim_set_keymap('n', '<leader>ff',
  "<cmd>lua require('telescope.builtin').find_files()<CR>",
  { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fg',
  "<cmd>lua require('telescope.builtin').live_grep()<CR>",
  { noremap = true, silent = true })


vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Require the plugin manager itself first
local lazy_ok, lazy = pcall(require, "lazy")
if not lazy_ok then
  print("Error: lazy.nvim module not found!")
  return
end

-- Load your plugin table
lazy.setup("config.lazy")
