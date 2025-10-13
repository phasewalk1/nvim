(lambda config []
  {:lazy false
   :dependencies [:mawkler/onedark.nvim]
   :init (fn []
           (set vim.opt.termguicolors true)
           (set vim.opt.cursorline true)
           (set vim.opt.number true))
   :config (fn []
             ((. (require :modicator) :setup)))
             
   :opts {:show_warnings true}})

(config)
