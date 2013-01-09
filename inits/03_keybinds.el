;;; 01_keybinds.el ---

(global-set-key (kbd "C-x f") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-t") nil)

(progn
  (require 'cc-cmds)
  (global-set-key (kbd "C-<backspace>") 'c-hungry-delete))
(global-set-key (kbd "M-<backspace>") 'delete-region)


(global-set-key (kbd "M-y") 'helm-show-kill-ring)


;;window-sysytem
(cond (window-system
       (global-unset-key (kbd "C-x C-c"))
       (if (equal (lookup-key (current-global-map) (kbd "C-z")) 'suspend-frame)
           (global-unset-key (kbd "C-z")))
       (global-unset-key (kbd "<inseart>"))
       (load "key-context-menu")
       (global-set-key (kbd "<mouse-3>") 'key-context-menu)
       ))
