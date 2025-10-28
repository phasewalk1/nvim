(lambda vimtex-config! []
  {:lazy false
   :init (lambda []
	   {:vim.g.vimtex_view_method :zathura})})

(vimtex-config!)
