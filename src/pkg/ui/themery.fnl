(lambda expand-path! [path]
  (local pattern "%$(%w+)")
  (local expanded-path (path:gsub pattern 
                          (fn [envar]
                            (or (os.getenv envar)
                                (.. "$" envar)))))
  expanded-path)

(lambda themery-config []
  {:lazy false
   :tag :v1.0.0
   :config (fn []
             ((. (require :themery) :setup) 
              {:themes
                [:oxocarbon
                 :quantum
                 :catppuccin
                 :xcode
                 :xcodedark
                 :xcodedarkhc
                 :doom-one
                 :everblush
                 :onedark
                 :github_dark
                 :poimandres]
               :default :oxocarbon
               :themeConfigFile (expand-path! "$HOME/.config/nvim/build/theme.lua")
               :livePreview true}))})

(themery-config)
