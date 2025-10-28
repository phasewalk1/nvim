{:config (lambda []
  (local conform (require :conform))
  (conform.setup 
    {1 :formatters_by_ft
      {:rust {1 :rustfmt :lsp_format :fallback}}
      {:fennel { 1 :fnlfmt }}}))}
