(lambda illuminate-config []
  {:config (fn []
             ((. (require :illuminate) :configure) 
               {:providers 
                 [:lsp
                  :treesitter
                  :regex]
                :under_cursor true
                :delay 100
                :min_count_to_highlight 1}))})

(illuminate-config)
