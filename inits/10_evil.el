;; 10_evil.el ---

(require 'evil)
(evil-mode 1)

;; Bring back normal cursor
(setq evil-default-cursor t)

(require 'evil-leader)
(evil-leader/set-leader (kbd ";"))

; Defulat  of evil should be on
(setq evil-default-state 'normal)

(setq evil-mode-line-format nil)

;(require 'surround)
;(global-surround-mode 1)

;Disable evil in special buffers
(loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                              (pylookup-mode . emacs)
                              (comint-mode . emacs)
                              (ebib-entry-mode . emacs)
                              (ebib-index-mode . emacs)
                              (ebib-log-mode . emacs)
                              (gtags-select-mode . emacs)
                              (shell-mode . emacs)
                              (term-mode . emacs)
                              (bc-menu-mode . emacs)
                              (magit-branch-manager-mode . emacs)
                              (semantic-symref-results-mode . emacs)
                              (rdictcc-buffer-mode . emacs))
      do (evil-set-initial-state mode state))
