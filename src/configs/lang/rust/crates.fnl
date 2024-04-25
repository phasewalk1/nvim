(lambda crates-config []
  {:tag :stable
   :config (fn []
             ((. (require :crates) :setup)))})

(crates-config)
