;;; 00_init.el ---

(setq custom-file "~/.emacs.d/customize.el")
(load custom-file t)           

(set-scroll-bar-mode 'right)    
(setq frame-title-format (format "emacs@%s : %%f" (system-name))) 
(tool-bar-mode 0)
(menu-bar-mode 1)
(column-number-mode t) ;
(which-function-mode 1) ;
(setq inhibit-startup-message t) ;
(show-paren-mode t)

(auto-compression-mode t)  ;
(setq kill-whole-line t) ; 
(setq default-tab-width 4)
(setq scroll-step 1)    ; 
(setq bookmark-save-flag 1)     
(setq visible-bell t) 
(setq-default indent-tabs-mode nil)  
(setq require-final-newline t)
(setq redisplay-dont-pause t) 
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

(progn
  (setq make-backup-files t)
  (setq backup-directory-alist
        (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
              backup-directory-alist))
  (setq version-control t)
  (setq kept-new-versions 2) 
  (setq kept-old-versions 2) 
  (setq delete-old-versions t)
  )
(setq auto-save-default t)

;; @see: http://d.hatena.ne.jp/mooz/20110107/p1
(let ((dropbox-directory (expand-file-name "~/Dropbox/"))
      (destination-directory temporary-file-directory))
  (add-to-list 'auto-save-file-name-transforms
               `(,(concat dropbox-directory "\\([^/]*/\\)*\\([^/]*\\)$")
                 ,(concat destination-directory "\\2") t))
  (add-to-list 'backup-directory-alist
               `(,dropbox-directory . ,destination-directory)))

(setq dabbrev-case-fold-search nil)

(if (string< "23.2" emacs-version)
    (set-frame-parameter nil 'fullscreen 'maximized))

(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq save-abbrevs 'silently)
