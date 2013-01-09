;;; 01_keybinds.el ---

;Escape should quit whatever it can
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "M-t") nil)

(global-set-key (kbd "C-=") 'er/expand-region)


(evil-leader/set-key "gs" 'magit-status)
(evil-leader/set-key "u" 'undo-tree-visualize)

(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)

(global-set-key [C-escape] 'delete-window)

; <Leader>b show buffers
(evil-leader/set-key "b" 'ibuffer)

; Leader lb - ido buffers lf - ido files
(evil-leader/set-key "lb" 'ido-switch-buffer)
(evil-leader/set-key "lB" 'helm-list-buffers)

(evil-leader/set-key "lf" 'ido-find-file)
(evil-leader/set-key "lF" 'helm-find-files)

;Use <Leader>' to bring up emacs command mode with helm
;Should replace with single stroke, when I decide on one
(evil-leader/set-key "'" 'helm-M-x)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
