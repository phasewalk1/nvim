(lambda expand-path! [path]
  (local pattern "%$(%w+)")
  (local expanded-path (path:gsub pattern 
                          (fn [envar]
                            (or (os.getenv envar)
                                (.. "$" envar)))))
  expanded-path)

(lambda themery-config []
  {:lazy false
   :config (fn []
             ((. (require :themery) :setup) 
              {:themes
                [:oxocarbon
                 :catppuccin
                 :quantum
                 :xcode
                 :xcodedark
                 :xcodedarkhc
                 :doom-one
                 :everblush]
               :default :quantum
               :themeConfigFile (expand-path! "$HOME/.config/nvim/build/theme.lua")
               :livePreview true}))})

(themery-config)
