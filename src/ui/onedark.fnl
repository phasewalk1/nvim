(lambda onedark-setup! []
  {:config (lambda []
	     (local onedark (require :onedark))
	     (onedark.setup {:style :dark}))})

(onedark-setup!)
