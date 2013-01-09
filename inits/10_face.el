;;; 10_face.el ---
;; 見た目に関する設定

(transient-mark-mode t)  ; 選択されたリージョンを色付きにしてわかりやすくする設定
(setq show-paren-style 'mixed) ; 対応する括弧が外にある時は全体を色付きに

;; EOF を分かり易くする
;; @see: http://d.hatena.ne.jp/khiker/20100114/emacs_eof
(setq-default indicate-empty-lines t)
(set-face-foreground 'fringe "white")

;;色の設定
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'forest-monk)

(when window-system
    (if linux-p (add-to-list 'default-frame-alist '(alpha . 90))) ; 透明化
    ;; フォントの設定
    (add-to-list 'default-frame-alist '(font . "Ricty for Powerline-16.5")))
