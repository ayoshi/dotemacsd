;;; 10_face.el ---

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

(transient-mark-mode t)
(setq show-paren-style 'mixed)

(setq-default indicate-empty-lines 0)
;;(set-face-foreground 'fringe "white")

; text decoration
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)

; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode t)

(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'solarized-dark)

(set-face-attribute 'default nil
                :family "Inconsolata" :height 140 :weight 'normal)
