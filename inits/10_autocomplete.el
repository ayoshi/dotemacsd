;; ;;; 10_autocomplete.el ---

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;Use tab to autocomplete
(ac-set-trigger-key "TAB")

; Bind Alt-Tab to autocomplete
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
