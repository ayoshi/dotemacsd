;;; 00_init.el ---

(setq dotfiles-dir "~/.emacs.d/")

(setq custom-file (concat dotfiles-dir "customize.el"))
(load custom-file t)

(setq inhibit-startup-message t) ;
(tool-bar-mode 0)
(menu-bar-mode 0)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (add-hook 'before-make-frame-hook 'turn-off-tool-bar)
  (tooltip-mode -1)
  (menu-bar-mode 1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(set-scroll-bar-mode 'right)
(column-number-mode t) ;
(which-function-mode 1) ;
(show-paren-mode t)
(scroll-bar-mode -1)

(auto-compression-mode t)  ;
(setq kill-whole-line t) ;
(setq default-tab-width 4)
(setq scroll-step 1)    ;
(setq bookmark-save-flag 1)
(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(setq redisplay-dont-pause t)

;Disable useleess annoyng beeps on scroll
(setq ring-bell-function 'ignore)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

(progn
  (setq make-backup-files t)
  ;; Don't clutter up directories with files~
  (setq backup-directory-alist `(("." . ,(expand-file-name
                                          (concat dotfiles-dir "backups")))))

  ;; Don't clutter with #files either
  (setq auto-save-file-name-transforms
        `((".*" ,(expand-file-name (concat dotfiles-dir "backups")))))
  (setq version-control t)
  (setq kept-new-versions 2)
  (setq kept-old-versions 2)
  (setq delete-old-versions t)
  )

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)



;; @see: http://d.hatena.ne.jp/mooz/20110107/p1
(let ((dropbox-directory (expand-file-name "~/Dropbox/"))
      (destination-directory temporary-file-directory))
  (add-to-list 'auto-save-file-name-transforms
               `(,(concat dropbox-directory "\\([^/]*/\\)*\\([^/]*\\)$")
                 ,(concat destination-directory "\\2") t))
  (add-to-list 'backup-directory-alist
               `(,dropbox-directory . ,destination-directory)))

(setq dabbrev-case-fold-search nil)

;(if (string< "23.2" emacs-version)
    ;(set-frame-parameter nil 'fullscreen 'maximized))

(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq save-abbrevs 'silently)

;; Save a list of recent files visited.
(recentf-mode 1)
