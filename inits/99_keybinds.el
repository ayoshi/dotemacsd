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
(evil-leader/set-key "lB" 'helm-for-buffers)

(evil-leader/set-key "lf" 'ido-find-file)
(evil-leader/set-key "lF" 'helm-for-files)

;Use <Leader>' to bring up emacs command mode with helm
;Should replace with single stroke, when I decide on one
(evil-leader/set-key "'" 'helm-M-x)


;Can be used in all modes
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))
(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)


