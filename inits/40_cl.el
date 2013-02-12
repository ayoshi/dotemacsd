;;; 40_cl.el

(eval-after-load "slime"
   '(progn
;;     (slime-setup '(slime-fancy slime-banner slime-repl slime-scratch))
     (slime-setup '())
      (setq slime-complete-symbol*-fancy t)
      (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))


(add-hook 'slime-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-mode-hook 'pretty-mode)

(set-language-environment "utf-8")
(setq inferior-lisp-program "/usr/local/bin/ccl64")
(setq slime-net-coding-system 'utf-8-unix)

;; (add-hook 'slime-mode-hook
          ;; (lambda ()
            ;; (require 'ac-slime)
            ;; (set-up-slime-ac)
            ;; (define-key slime-scratch-mode-map (kbd "C-j") nil)
            ;; (define-key slime-mode-map (kbd "M-z") 'slime-selector)))

;;;
(setq slime-repl-history-remove-duplicates t)
(setq slime-repl-history-trim-whitespaces t)

;; pop-win
(push '("*slime-apropos*") popwin:special-display-config)
(push '("*slime-macroexpansion*") popwin:special-display-config)
(push '("*slime-description*") popwin:special-display-config)
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
(push '("*slime-xref*") popwin:special-display-config)
(push '(sldb-mode :stick t) popwin:special-display-config)
(push '(slime-repl-mode) popwin:special-display-config)
(push '(slime-connection-list-mode) popwin:special-display-config)

;;
(when (require 'cl-indent-patches nil t)
  ;; emacs-lisp
  (setq lisp-indent-function
        (lambda (&rest args)
          (apply (if (memq major-mode (emacs-lisp-mode lisp-interaction-mode))
                     'lisp-indent-function
                   'common-lisp-indent-function)
                 args))))
