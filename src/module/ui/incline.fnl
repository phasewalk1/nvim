(lambda incline-config []
  {:config (fn []
             (. (require :incline) :setup))
   :event :VeryLazy})

(incline-config)
