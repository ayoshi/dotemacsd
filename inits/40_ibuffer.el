;;; 40_ibuffer.el
;;  : Http://www.emacswiki.org/emacs/IbufferMode
;;  : http://martinowen.net/blog/2010/02/tips-for-emacs-ibuffer.html
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
      '((mark modified read-only
              (vc-status-mini 2 2 :left :elide) " "
              (name 30 30 :left :elide) " "
              (vc-status 16 9 :right) " "
              (mode 16 -1 :left :elide) " "
              filename-and-process)
        (mark modified read-only
              (vc-status-mini 2 2 :left :elide) " "
              (name 45 -1 :left) " "
              filename-and-process)
        (mark modified read-only
              (vc-status-mini 2 2 :left :elide) " "
              filename-and-process)))

;Remove title and summary
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

;Some colorization
(setq ibuffer-dired-buffer-face 'font-lock-function-name-face)
(setq ibuffer-help-buffer-face 'font-lock-comment-face)
(setq ibuffer-hidden-buffer-face 'font-lock-warning-face)
(setq ibuffer-occur-match-face 'font-lock-warning-face)
(setq ibuffer-read-only-buffer-face 'font-lock-type-face)
(setq ibuffer-special-buffer-face 'font-lock-keyword-face)
(setq ibuffer-title-face 'font-lock-warning-face)
(setq ibuffer-filter-group-name-face 'font-lock-function-name-face)
