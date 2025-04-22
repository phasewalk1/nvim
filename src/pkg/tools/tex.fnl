(lambda vimcmd! [cmd]
  (vim.cmd cmd))

(lambda configure []
  (vimcmd! "filetype plugin indent on")
  (vimcmd! "syntax enable")

  (set vim.g.vimtex_view_method :skim))

(lambda vimtex-config []
  {:lazy false
   :init (configure)})

(vimtex-config)
