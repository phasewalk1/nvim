(lambda expand-path! [path]
  (local pattern "%$(%w+)")
  (local expanded-path (path:gsub pattern 
                          (fn [envar]
                            (or (os.getenv envar)
                                (.. "$" envar)))))
  expanded-path)

(lambda themery-config []
  {:lazy nil
   :tag :v1.0.0
   :config (fn []
             ((. (require :themery) :setup) 
              {:themes
                [:carbonfox
		 :doom-one
		 :duskfox
		 :nightfox
		 :nordfox
		 :onedark
		 :oxocarbon
		 :shado
		 :terafox]
               :default :doom-one
               :themeConfigFile (expand-path! "$HOME/.config/nvim/build/theme.lua")
               :livePreview true}))})

(themery-config)

