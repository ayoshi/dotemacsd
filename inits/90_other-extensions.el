;;; 90_other-extensions.el ---

;; Expand region
;(require 'expand-region)

; Make Tab a tad smarter
(require 'smart-tab)
(global-smart-tab-mode 1)

;; We'll use ido to complete recent files list too
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
	  (mapcar (lambda (x)
		    (cons (file-name-nondirectory x)
			  x))
		  recentf-list))
	 (filename-list
	  (remove-duplicates (mapcar #'car file-assoc-list)
			     :test #'string=))
	 (filename (ido-completing-read "Choose recent file: "
					filename-list
					nil
					t)))
    (when filename
      (find-file (cdr (assoc filename
			     file-assoc-list))))))

;; Imaxima if installed
(add-to-list 'load-path "/usr/local/Cellar/maxima/5.28.0/share/maxima/5.28.0/emacs")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(setq imaxima-fnt-size "Large")
;(setq imaxima-scale-factor 2)
(require 'maxima nil 'noerror)
