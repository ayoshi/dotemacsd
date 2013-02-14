;; 90_other-extensions.el ---
;;
;; Here we will set eval commands for all language REPLs to the smart eval
;; commands
;; We will also unify other commands - like doc-symbol

;; Reset bidings
(defvar smart-eval-last-exp-command #'undefined)
(defvar smart-eval-defun-command #'undefined)
(defvar smart-eval-buffer-command #'undefined)
(defvar smart-eval-file-command #'undefined)
(defvar smart-eval-region-command #'undefined)
(defvar smart-doc-symbol-at-point #'undefined)

;;;;;;;;;;;;; Define types of commands

;; Eval last exp
(defun smart-eval-last-exp ()
  (interactive)
  (call-interactively smart-eval-last-exp-command))

;; Eval defun
(defun smart-eval-defun ()
  (interactive)
  (call-interactively smart-eval-defun-command))

;; Eval buffer
(defun smart-eval-buffer ()
  (interactive)
  (call-interactively smart-eval-buffer-command))

;; Eval file
(defun smart-eval-file ()
  (interactive)
  (call-interactively smart-eval-file-command))

(defun smart-eval-region ()
  (interactive)
  (call-interactively smart-eval-region-command))

;; Show doc on symbol at point
(defun smart-doc-symbol-at-point ()
  (interactive)
  (call-interactively smart-doc-symbol-at-point-command))

;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'eval-last-sexp)))
(add-hook 'emacs-lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'eval-defun)))
(add-hook 'emacs-lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-buffer-command) #'eval-buffer)))

;; Slime  ( CL)
(add-hook 'lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'lisp-eval-last-expression)))
(add-hook 'lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'lisp-eval-defun)))
(add-hook 'lisp-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-buffer-command) #'lisp-eval-buffer)))

;; Geiser ( Scheme )
(add-hook 'scheme-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'geiser-eval-last-sexp)))
(add-hook 'scheme-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'geiser-eval-definition)))
(add-hook 'scheme-mode-hook
          (lambda () (set (make-local-variable 'smart-doc-symbol-at-point-command) #'geiser-doc-symbol-at-point)))

;; python.el ( Python )

(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-last-exp-command) #'python-shell-send-string)))
(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-defun-command) #'python-shell-send-defun)))
(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-buffer-command) #'python-shell-send-buffer)))
(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'smart-eval-region-command) #'python-shell-send-region)))
(add-hook 'python-mode-hook
          (lambda () (set (make-local-variable 'smart-doc-symbol-at-point-command) #'jedi:show-doc)))
