;;; 02_el-get.el ---

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
     "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
      (lambda (s)
           (let (el-get-master-branch)
                  (goto-char (point-max))
                       (eval-print-last-sexp)))))

(add-to-list 'el-get-recipe-path
             "~/.emacs.d/el-get-local-recipes")

(setq base-packages
      '(
        el-get
        evil
        evil-leader
        evil-surround
        evil-nerd-commenter
        ))

(setq lang-mode-packages
      '(
        markdown-mode
        yaml-mode
        clojure-mode
        rhtml-mode
        scss-mode
        haskell-mode
        js2-mode
        clojure-mode
        ))

(setq theme-packages
      '(
        solarized-theme
        twilight-bright-theme
        twilight-anti-bright-theme
        base16-theme
        ))

(setq my-packages
      '(
        undo-tree
        pretty-mode
        fringe-helper
        helm
        expand-region
        ;;org-mode
        yasnippet
        multi-term
        geiser
        ;; slime - should be installed by quicklisp
        ac-slime
        paredit
        shell-command
        ;;nyan-mode
        rainbow-delimiters-github
        rainbow-mode
        rinari
        ;;ruby-dev
        zencoding-mode
        ;;moz-repl
        smart-tab
        ibuffer-vc
        ruby-block
        ruby-end
        hideshowvis
        popwin
        anything-replace-string
        magit
        magithub
        emacs-git-gutter
        dired-sort
        auto-complete
        multiple-cursors
        anything
        smex
        anything-config
        smooth-scroll
        ;;python
        exec-path-from-shell
        ;;virtualenv
        ;;elpy
        ace-jump-mode
        ;;ack-el
        ))

(el-get 'sync base-packages lang-mode-packages theme-packages my-packages)

;;; 02_el-get.el ends here
