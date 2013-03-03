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

; simulate vim's "nnoremap <space> 10jzz"
(define-key evil-normal-state-map " " (lambda ()
                     (interactive)
                     (next-line 10)
                     (evil-scroll-line-down 10)
                     ))

; simulate vim's "nnoremap <backspace> 10kzz"
(define-key evil-normal-state-map [backspace] (lambda ()
                     (interactive)
                     (previous-line 10)
                     (evil-scroll-line-up 10)
                     ))

; Remove annoying Return inserts
(define-key evil-normal-state-map [return] "")


;AceJump intergation
;; AceJump is a nice addition to evil's standard motions.

;; The following definitions are necessary to define evil motions for ace-jump-mode (version 2).

;; ace-jump is actually a series of commands which makes handling by evil
;; difficult (and with some other things as well), using this macro we let it
;; appear as one.

(defmacro evil-enclose-ace-jump (&rest body)
  `(let ((old-mark (mark)))
     (remove-hook 'pre-command-hook #'evil-visual-pre-command t)
     (remove-hook 'post-command-hook #'evil-visual-post-command t)
     (unwind-protect
         (progn
           ,@body
           (recursive-edit))
       (if (evil-visual-state-p)
           (progn
             (add-hook 'pre-command-hook #'evil-visual-pre-command nil t)
             (add-hook 'post-command-hook #'evil-visual-post-command nil t)
             (set-mark old-mark))
         (push-mark old-mark)))))

(evil-define-motion evil-ace-jump-char-mode (count)
  :type exclusive
  (evil-enclose-ace-jump
   (ace-jump-mode 5)))

(evil-define-motion evil-ace-jump-line-mode (count)
  :type line
  (evil-enclose-ace-jump
   (ace-jump-mode 9)))

(evil-define-motion evil-ace-jump-word-mode (count)
  :type exclusive
  (evil-enclose-ace-jump
   (ace-jump-mode 1)))

(evil-define-motion evil-ace-jump-char-to-mode (count)
  :type exclusive
  (evil-enclose-ace-jump
   (ace-jump-mode 5)
   (forward-char -1)))
