;; ;;; 01_elpa.el ---
;; ;; @see: http://tromey.com/elpa/


;; (require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; ;(package-refresh-contents)
;; ;(package-initialize)

;;  (defvar my-packages '( exec-path-from-shell )
;;   "A list of packages to ensure are installed at launch." )

;; (dolist (p my-packages)
;;     (when (not (package-installed-p p))
;;           (package-install p)))
