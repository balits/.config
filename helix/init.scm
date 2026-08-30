(require "helix/configuration.scm")

(define-lsp "steel-language-server" 
  (command "steel-language-server") 
  (args '()))

(define-language "scheme"
  (language-servers '("steel-language-server")))

;; forge local dir
;; (load-package "~/.local/share/steel/cogs/helix-ext.scm")
