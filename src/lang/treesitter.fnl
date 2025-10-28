(lambda ts-setup-guts []
  {:ensure_installed [:lua
                      :fennel
                      :rust
                      :c
                      :python
                      :go]
   :highlight {:enable true
               :use_langaugetree true}
   :indent {:enable true}})

(lambda ts-opts []
  {:config (fn []
            (let [ts (require "nvim-treesitter.configs")]
             (ts.setup (ts-setup-guts))))})

(ts-opts)

