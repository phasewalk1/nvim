(lambda wilder-config []
  {:lazy true
   :config (fn []
              ((. (require :wilder) :setup)
               {:modes [":"
                        "/"
                        "?"]}))})

(wilder-config)
