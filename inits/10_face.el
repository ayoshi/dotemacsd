;;; 10_face.el ---

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

(transient-mark-mode t)
(setq show-paren-style 'mixed)

(setq-default indicate-empty-lines 0)
(set-face-foreground 'fringe "white")

(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'solarized-light)

(set-face-attribute 'default nil
                :family "Inconsolata" :height 140 :weight 'normal)
