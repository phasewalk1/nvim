(lambda vimcmd! [cmd]
  (vim.cmd cmd))

(lambda configure []
  (vimcmd! "filetype plugin indent on")
  (vimcmd! "syntax enable")

  (set vim.g.vimtex_view_general_viewer :zathura)
  (set vim.g.vimtex_compiler_method :latexmk))

(lambda vimtex-config []
  {:lazy false
   :init (configure)})

(vimtex-config)
