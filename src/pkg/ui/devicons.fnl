(lambda config []
  {:lazy false
   :config 
   (fn []
     (local devicons (require "nvim-web-devicons"))
     ((. devicons :setup) 
      {:override {"lisp" {:icon ""
                          :color "#A8B9FF"
                          :name "Lisp"}
                  "asd" {:icon ""
                         :color "#A8B9FF"
                         :name "ASD"}}}))})
                          
(config)
