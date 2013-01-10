;; 90_other-extensions.el ---
;;
;; Here we will set eval commands for all language REPLs to the smart eval
;; commands

;; Reset bidings
(defvar smart-eval-last-exp-command #'undefined)
(defvar smart-eval-defun-command #'undefined)

;; Eval last exp
(defun smart-eval-last-exp ()
  (interactive)
  (call-interactively smart-eval-last-exp-command))

;; Eval defun
(defun smart-eval-defun ()
  (interactive)
  (call-interactively smart-eval-defun-command))

;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'eval-last-sexp)))
(add-hook 'emacs-lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'eval-defun)))

;; Slime  ( CL)
(add-hook 'lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'lisp-eval-last-expression)))
(add-hook 'lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'lisp-eval-defun)))

;; Geiser ( Scheme )
(add-hook 'scheme-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'geiser-eval-last-sexp)))
(add-hook 'scheme-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'geiser-eval-definition)))

