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

(setq my-packages
      '(el-get
        undo-tree 
        evil
        evil-leader
        evil-surround
        ;evil-nerd-commenter
        helm
        solarized-theme
        expand-region
        org-mode
        markdown-mode
        yasnippet
        shell-command
        multi-term
        yaml-mode
        geiser
        slime
        ac-slime
        paredit
        pretty-mode
        nyan-mode
        rainbow-delimiters-github
        rinari
        rhtml-mode
        zencoding-mode
        moz-repl
        scss-mode
        ruby-block
        ruby-end
        haskell-mode
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
        anything-config
        ))

(el-get 'sync my-packages)
;;; 02_el-get.el ends here
