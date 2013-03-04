;; ;;; 01_keybinds.el ---

(define-key evil-visual-state-map (kbd ";") evil-leader/map)

;; keybinding to toggle full screen mode
(global-set-key (quote [s-return]) (quote toggle-frame-fullscreen))

; Use Shift-arrows to move around splits
(windmove-default-keybindings)

;Escape should quit whatever it can
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "M-t") nil)

(global-set-key (kbd "C-=") 'er/expand-region)


(evil-leader/set-key "gs" 'magit-status)
(evil-leader/set-key "u" 'undo-tree-visualize)

(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)

(global-set-key [C-escape] 'kill-this-buffer)

; <Leader>b show buffers
(evil-leader/set-key "b" 'ibuffer)

; Leader lb - ido buffers lf - ido files
(evil-leader/set-key "lb" 'ido-switch-buffer)
(evil-leader/set-key "lB" 'helm-buffers-list)

(evil-leader/set-key "lf" 'ido-find-file)
(evil-leader/set-key "lF" 'helm-find-files)

(evil-leader/set-key "lr" 'recentf-ido-find-file)

;Use <Leader>' to bring up emacs command mode with helm
;Should replace with single stroke, when I decide on one
(evil-leader/set-key "'" 'helm-M-x)

(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cc" 'evilnc-comment-or-uncomment-to-the-line )

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-ns-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-completion-map [escape] 'keyboard-quit)

                                        ;(define-key minibuffer-local-must-match-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-isearch-map [escape] 'keyboard-quit)

; Make  <Leader>e prefix for eval commands in all modes
(evil-leader/set-key
  "eb" 'smart-eval-buffer
  "es" 'smart-eval-last-sexp
  "ed" 'smart-eval-defun
  "?" 'smart-doc-symbol-at-point)

(define-key evil-normal-state-map (kbd "?") 'smart-doc-symbol-at-point)

; Use Shift-arrows to move around splits
(windmove-default-keybindings)

;Escape should quit whatever it can
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "M-t") nil)

(global-set-key (kbd "C-=") 'er/expand-region)


(evil-leader/set-key "gs" 'magit-status)
(evil-leader/set-key "u" 'undo-tree-visualize)

(global-set-key [C-tab] 'next-buffer)
(global-set-key [C-S-tab] 'previous-buffer)

(global-set-key [C-escape] 'kill-this-buffer)

; <Leader>b show buffers
(evil-leader/set-key "b" 'ibuffer)

; Leader lb - ido buffers lf - ido files
(evil-leader/set-key "lb" 'ido-switch-buffer)
(evil-leader/set-key "lB" 'helm-buffers-list)

(evil-leader/set-key "lf" 'ido-find-file)
(evil-leader/set-key "lF" 'helm-find-files)

(evil-leader/set-key "lr" 'recentf-ido-find-file)

;Use <Leader>' to bring up emacs command mode with helm
;Should replace with single stroke, when I decide on one
(evil-leader/set-key "'" 'helm-M-x)

(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cc" 'evilnc-comment-or-uncomment-to-the-line )

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-ns-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-completion-map [escape] 'keyboard-quit)

                                        ;(define-key minibuffer-local-must-match-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-isearch-map [escape] 'keyboard-quit)

; Make  <Leader>e prefix for eval commands in all modes
(evil-leader/set-key
  "eb" 'smart-eval-buffer
  "es" 'smart-eval-last-sexp
  "ed" 'smart-eval-defun
  "?" 'smart-doc-symbol-at-point)

(define-key evil-normal-state-map (kbd "?") 'smart-doc-symbol-at-point)


;; Saner paredit keybindings



;; AceJump bindings

(evil-leader/set-key
  "jc" 'evil-ace-jump-char-mode
  "jw" 'evil-ace-jump-word-mode
  "jl" 'evil-ace-jump-line-mode)
