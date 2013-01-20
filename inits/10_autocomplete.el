;; ;;; 10_autocomplete.el ---

(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;Use tab to autocomplete
(ac-set-trigger-key "TAB")

; Bind Alt-Tab to autocomplete
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
