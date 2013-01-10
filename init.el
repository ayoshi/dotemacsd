;; -*- coding: utf-8 -*-

(progn
  ;; Emacs configuration skeleton made by some Japaneese dude
  ;; @see http://github.com/elim/dotemacs/blob/master/init.el
  ;; @see http://www.gfd-dennou.org/member/uwabami/cc-env/EmacsBasic.html
  ;; Everything is in Japaneese there- so I can't make out the word
  (defun x->bool (elt) (not (not elt)))
  (defvar emacs22-p (equal emacs-major-version 22))
  (defvar emacs23-p (equal emacs-major-version 23))
  (defvar darwin-p (eq system-type 'darwin))
  (defvar ns-p (featurep 'ns))
  (defvar carbon-p (and (eq window-system 'mac) emacs22-p))
  (defvar mac-p (and (eq window-system 'mac) emacs23-p))
  (defvar linux-p (eq system-type 'gnu/linux))
  (defvar colinux-p (when linux-p
                      (let ((file "/proc/modules"))
                        (and
                         (file-readable-p file)
                         (x->bool
                          (with-temp-buffer
                            (insert-file-contents file)
                            (goto-char (point-min))
                            (re-search-forward "^cofuse\.+" nil t)))))))
  (defvar cygwin-p (eq system-type 'cygwin))
  (defvar nt-p (eq system-type 'windows-nt))
  (defvar meadow-p (featurep 'meadow))
  (defvar windows-p (or cygwin-p nt-p meadow-p))
  )

(progn
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (cond
   (mac-p ; local variables
    (require 'ucs-normalize)
    (setq file-name-coding-system 'utf-8-hfs)
    (setq default-file-name-coding-system 'utf-8-hfs)
    (setq local-coding-system 'utf-8-hfs))
   (windows-p  ; local variables
    (setq local-coding-system 'utf-8))
   (t
    (setq file-name-coding-system 'utf-8)
    (setq default-file-name-coding-system 'utf-8)
  )))

;;; PATH mangling
(defun add-path (dir)
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))
(add-path (expand-file-name "~/.emacs.d/bin"))

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Here the magic starts - we use init-loader, which keeps all init
;; configuration in ordered files, similar to System V init scripts
;; Each one is prefixed by the "[0-99]_" to ensure in-order evaluation
(setq warning-suppress-types nil)
(progn
  (require 'init-loader)
  ;; On error - turn debugging mode on
  (setq init-loader-show-log-after-init (or debug-on-error 'if-error))
  (init-loader-load))

;; Start server, if it's not running already
(progn
  (require 'server)
  (unless (server-running-p)
    (server-start))
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
