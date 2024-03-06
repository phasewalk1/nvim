(lambda global-settings []
  (set vim.g.mapleader " ")
  (set vim.g.maplocalleader ",")
  (set vim.opt.expandtab true)
  (set vim.opt.autoindent true)

  (set vim.opt.laststatus 3)
  (set vim.opt.showmode false)
  (set vim.opt.termguicolors true)

  (set vim.opt.tabstop 4)
  (set vim.opt.laststatus 3)
  (set vim.opt.softtabstop 4)
  (set vim.opt.shiftwidth 4)
  (set vim.opt.number true)
  (set vim.opt.numberwidth 2))

(global-settings)
