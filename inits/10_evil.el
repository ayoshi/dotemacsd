;; 10_evil.el ---

(require 'evil)
(evil-mode 1)

;; Bring back normal cursor
(setq evil-default-cursor t)

(require 'evil-leader)
(evil-leader/set-leader (kbd ";"))


(setq evil-mode-line-format nil)

;(require 'surround)
;(global-surround-mode 1)
