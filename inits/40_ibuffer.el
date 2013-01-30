;;; 40_ibuffer.el
;; 参考: http://www.emacswiki.org/emacs/IbufferMode
;;     : http://martinowen.net/blog/2010/02/tips-for-emacs-ibuffer.html
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("matlab" (mode . matlab-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("emacs"  (name . "^\\*[^\\*]+\\*$"))
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "default")))

;; Hide empty groups
(setq ibuffer-show-empty-filter-groups nil)

;; Hide special buffers
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(add-hook 'ibuffer-hook
          '(lambda ()
             (local-unset-key (kbd "C-k"))))

;; カーソルの行に色をつける
(require 'hl-line)
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (hl-line-mode t)))

; Integrate VC status
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              (mode 16 16 :left :elide)
              (vc-status 16 16 :left)
              filename-and-process)))

;;Remove title and summary
(defadvice ibuffer-update-title-and-summary (after remove-column-titles)
  (save-excursion
    (set-buffer "*Ibuffer*")
    (toggle-read-only 0)
    (goto-char 1)
    (search-forward "-\n" nil t)
    (delete-region 1 (point))
    (let ((window-min-height 1))
      ;; save a little screen estate
      (shrink-window-if-larger-than-buffer))
    (toggle-read-only)))

(ad-activate 'ibuffer-update-title-and-summary)
