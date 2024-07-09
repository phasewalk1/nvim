(lambda config []
  {:config (fn []
            (local autopairs (require "nvim-autopairs"))
            ((. autopairs :setup) {}))})

(config)
