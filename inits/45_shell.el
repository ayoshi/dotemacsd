;;; 45_shell.el ---

;; shell-commandの補完
(require 'shell-command)
(shell-command-completion-mode)

;; term-mode
(add-hook 'term-mode-hook
          '(lambda ()
             (define-key term-raw-map (kbd "C-j") 'backward-char)
             (define-key term-raw-map (kbd "C-k") 'next-line)
             (define-key term-raw-map (kbd "C-l") 'previous-line)
             (define-key term-raw-map (kbd "C-;") 'forward-char)))

