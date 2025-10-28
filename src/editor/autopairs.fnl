(lambda autopairs-setup! []
  {:config (fn []
            (local autopairs (require "nvim-autopairs"))
            ((. autopairs :setup) {}))})

(autopairs-setup!)
