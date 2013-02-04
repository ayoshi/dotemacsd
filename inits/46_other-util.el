;;; 46_other-util.el ---

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 削除ファイルをごみ箱に入れる
(cond
 ;; (linux-p ; linux
 ;;  (load "trash-settings")
 ;;  (setq delete-by-moving-to-trash t)
 ;;  (setq system-trash-exclude-matches '("#[^/]+#$" ".*~$"))
 ;;  (setq system-trash-exclude-paths '("^/tmp"))
 ;;  )
  (t      ; default
   ;; dired-mode でのみゴミ箱に捨てる
   (add-hook 'dired-mode-hook (lambda () (set (make-local-variable 'delete-by-moving-to-trash) t)))
   )
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 選択範囲の情報表示
;; @see: http://murakan.cocolog-nifty.com/blog/2011/06/emacs-e05e.html
(defun count-lines-and-chars ()
  (if mark-active
      (format "[%3d:%4d]"
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;対括弧移動
;(require 'mic-paren)
;(defun my-paren (ARG)
;  (interactive "P")
;  (let ((FOL-CHAR (char-to-string (following-char)))
;        (PRE-CHAR (char-to-string (preceding-char)))
;        (OPEN  "\\s(")
;        (CLOSE "\\s)"))
;    (save-match-data
;      (cond
;       ((and (string-match OPEN FOL-CHAR) (string-match CLOSE PRE-CHAR))
;          (if ARG (mic-paren-forward-sexp) (mic-paren-backward-sexp)))
;       ((string-match OPEN FOL-CHAR)  (mic-paren-forward-sexp))
;       ((string-match CLOSE PRE-CHAR) (mic-paren-backward-sexp))
;       (t (re-search-backward OPEN))))))

;(setq auto-mode-alist (append (list
;                               '(".mybash" . shell-script-mode)
;                               auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 折りたたみの見た目の変更
(progn
  (define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

  (defcustom hs-fringe-face 'hs-fringe-face
    "*Specify face used to highlight the fringe on hidden regions."
    :type 'face
    :group 'hideshow)

  (defface hs-fringe-face
    '((t (:foreground "#888" :box (:line-width 2 :color "grey75" :style released-button))))
    "Face used to highlight the fringe on folded regions"
    :group 'hideshow)

  (defcustom hs-face 'hs-face
    "*Specify the face to to use for the hidden region indicator"
    :type 'face
    :group 'hideshow)

  (defface hs-face
    '((t (:background "#ff8" :box t)))
    "Face to hightlight the ... area of hidden regions"
    :group 'hideshow)

  (defun display-code-line-counts (ov)
    (when (eq 'code (overlay-get ov 'hs))
      (let* ((marker-string "*fringe-dummy*")
             (marker-length (length marker-string))
             (display-string (format " (%d)... " (count-lines (overlay-start ov) (overlay-end ov))))
             )
        (overlay-put ov 'help-echo "Hiddent text. C-c,= to show")
        (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'hs-fringe-face) marker-string)
        (overlay-put ov 'before-string marker-string)
        (put-text-property 0 (length display-string) 'face 'hs-face display-string)
        (overlay-put ov 'display display-string)
        )))

  (setq hs-set-up-overlay 'display-code-line-counts))

;;; tab binding for hs-minor mode
;; called once on a line that contains a hidden block, shows the
;; block; otherwise calls the default action of TAB; called twice on a
;; line that does not contain a hidden block, hide the block from the
;; current position of the cursor
(defun tab-hs-hide ( &optional arg )
  (interactive "P")
  (let ((sl (save-excursion (move-beginning-of-line nil) (point)))
        (el (save-excursion (move-end-of-line nil) (point)))
        obj)
    (catch 'stop
      (dotimes (i (- el sl))
        (mapc
         (lambda (overlay)
           (when (eq 'hs (overlay-get overlay 'invisible))
             (setq obj t)))
         (overlays-at (+ i sl)))
        (and obj (throw 'stop 'stop))))
    (cond ((and (null obj)
                (eq last-command this-command))
           (hs-hide-block))
          (obj
           (progn
             (move-beginning-of-line nil)
             (hs-show-block)))
          (t
           (save-excursion
             (funcall (lookup-key (current-global-map) (kbd "^I")) arg))))))
(eval-after-load "hideshow"
  '(define-key hs-minor-mode-map [tab] 'tab-hs-hide))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs 内でログファイルを tail -f する設定
;; @see: http://d.hatena.ne.jp/kitokitoki/20101211/p1

;; /var/log/ 以下のファイルは自動的に auto-revert-tail-mode マイナーモードで開く
;; バッファ更新時は最新のログを表示するように、ポイントをバッファの末尾に移動させる
(add-hook 'find-file-hook
          '(lambda ()
             (when (string-match "^/var/log/" default-directory)
               (auto-revert-tail-mode t))))
(add-hook 'after-revert-hook
          '(lambda ()
             (when (and (boundp 'auto-revert-tail-mode) auto-revert-tail-mode)
               (end-of-buffer))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 指定したキーワードを目立たせる
;; M-x my-keep-highlight-regexp すれば、対象とする語を指定できます．
;; @see: http://d.hatena.ne.jp/kitokitoki/20101211/p1
;; @see: http://d.hatena.ne.jp/kitokitoki/20100706/p1
(make-face 'my-highlight-face)
(set-face-foreground 'my-highlight-face "black")
(set-face-background 'my-highlight-face "yellow")
(setq my-highlight-face 'my-highlight-face)

(defun my-keep-highlight-regexp (re)
  (interactive "sRegexp: \n")
  (setq my-highlight-keyword re)
  (my-keep-highlight-set-font-lock my-highlight-keyword))

(defun my-keep-highlight-symbole-at-point ()
  (interactive)
  (setq my-highlight-keyword (or (thing-at-point 'symbol) ""))
  (my-keep-highlight-set-font-lock my-highlight-keyword))


(defun my-keep-highlight-set-font-lock (re)
  (font-lock-add-keywords 'nil (list (list re 0 my-highlight-face t)))
  (font-lock-fontify-buffer))

(defun my-cancel-highlight-regexp ()
  (interactive)
  (font-lock-remove-keywords 'nil (list (list my-highlight-keyword 0 my-highlight-face t)))
  (font-lock-fontify-buffer))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; magit
(autoload 'magit-status "magit" nil t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; paredit-mode
(define-key paredit-mode-map (kbd "C-j") nil)
(define-key paredit-mode-map (kbd "C-k") nil)

;;; Add zooming in and out of split
(defun toggle-windows-split()
  "Switch back and forth between one window and whatever split of windows we might have in the frame. The idea is to maximize the current buffer, while being able to go back to the previous split of windows in the frame simply by calling this command again."
  (interactive)
  (if (not(window-minibuffer-p (selected-window)))
      (progn
        (if (< 1 (count-windows))
            (progn
              (window-configuration-to-register ?u)
              (delete-other-windows))
          (jump-to-register ?u))))
  (my-iswitchb-close))

(define-key global-map (kbd "C-+") 'toggle-windows-split)
