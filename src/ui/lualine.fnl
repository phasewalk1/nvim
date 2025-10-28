(lambda get-colorscheme-bg-color []
  (local hl-group (vim.api.nvim_get_hl 0 {:name :Normal}))
  (if (. hl-group :bg)
    (string.format "#%06x" (. hl-group :bg))
    "#202328"))

(local colors {:bg "#484a49"
               :blue "#51afef"
               :cyan "#008080"
               :darkblue "#081633"
               :fg "#bbc2cf"
               :green "#98be65"
               :magenta "#c678dd"
               :orange "#FF8800"
               :red "#ec5f67"
               :violet "#a9a1e1"
	       :white "#ffffff"
               :yellow "#ECBE7B"})

(local conditions
  {:buffer_not_empty 
    (fn []
      (not= (vim.fn.empty (vim.fn.expand "%:t")) 1))
   :check_git_workspace 
     (fn []
       (local filepath (vim.fn.expand "%:p:h"))
       (local gitdir (vim.fn.finddir :.git (.. filepath ";")))
       (and (and gitdir (> (length gitdir) 0))
         (< (length gitdir) (length filepath))))
   :hide_in_width (fn [] (> (vim.fn.winwidth 0) 80))})

(lambda get-lang-icon [lang-name]
  (local icons (require :ui.lang-icons))
  (local icon (. icons lang-name))
  (if icon icon ""))


(lambda get-buf-ft []
  (vim.api.nvim_get_option_value :filetype {:buf 0}))

(local default-icons
  {:blue-sep "▊"})

(local config {:inactive_sections {:lualine_a {}
                                   :lualine_b {}
                                   :lualine_c {}
                                   :lualine_x {}
                                   :lualine_y {}
                                   :lualine_z {}}
               :options {:component_separators ""
                         :section_separators ""
                         :theme {:inactive {:c {:bg colors.bg :fg colors.fg}}
                                 :normal {:c {:bg colors.bg :fg colors.fg}}}}
               :sections {:lualine_a {}
                          :lualine_b {}
                          :lualine_c {}
                          :lualine_x {}
                          :lualine_y {}
                          :lualine_z {}}})

(lambda insert-left [component] (table.insert config.sections.lualine_c component))
(lambda insert-right [component] (table.insert config.sections.lualine_x component))

(lambda lualine-setup! []
  {
  :config (lambda []
	    (local lualine (require :lualine))

(insert-left {1 (fn [] (. default-icons :blue-sep))
           :color {:fg colors.blue}
           :padding {:left 0 :right 1}})


(insert-left {1 (fn [] (get-lang-icon (get-buf-ft)))
           :color {:fg colors.white}
           :padding {:right 1}})
(insert-left {1 :filesize :cond conditions.buffer_not_empty})
(insert-left {1 :filename
           :color {:fg colors.magenta :gui :bold}
           :cond conditions.buffer_not_empty})
(insert-left [:location])
(insert-left {1 :progress :color {:fg colors.fg :gui :bold}})
(insert-left {1 :diagnostics
           :diagnostics_color {:error {:fg colors.red}
                               :info {:fg colors.cyan}
                               :warn {:fg colors.yellow}}
           :sources [:nvim_diagnostic]
           :symbols {:error " " :info " " :warn " "}})
(insert-left [(fn [] "%=")])
(insert-left {1 (fn []
               (let [msg "No Active Lsp"
                     buf-ft (vim.api.nvim_get_option_value :filetype {:buf 0})
                     clients (vim.lsp.get_clients)]
                 (when (= (next clients) nil) (lua "return msg"))
                 (each [_ client (ipairs clients)]
                   (local filetypes client.config.filetypes)
                   (when (and filetypes
                              (not= (vim.fn.index filetypes buf-ft) (- 1)))
                     (let [___antifnl_rtn_1___ client.name]
                       (lua "return ___antifnl_rtn_1___"))))
                 msg))
           :color {:fg "#ffffff" :gui :bold}
           :icon " LSP:"})
(insert-right {1 "o:encoding"
            :color {:fg colors.green :gui :bold}
            :cond conditions.hide_in_width
            :fmt string.upper})
(insert-right {1 :fileformat
            :color {:fg colors.green :gui :bold}
            :fmt string.upper
            :icons_enabled false})
(insert-right {1 :branch :color {:fg colors.violet :gui :bold} :icon ""})
(insert-right {1 :diff
            :cond conditions.hide_in_width
            :diff_color {:added {:fg colors.green}
                         :modified {:fg colors.orange}
                         :removed {:fg colors.red}}
            :symbols {:added " " :modified "󰝤 " :removed " "}})
(insert-right {1 (fn [] "▊") :color {:fg colors.blue} :padding {:left 1}})
(lualine.setup config)	

(vim.api.nvim_create_autocmd :ColorScheme
  {:callback (lambda []
	       (set colors.bg (get-colorscheme-bg-color))
	       (lualine.setup config))}))})

(lualine-setup!)
