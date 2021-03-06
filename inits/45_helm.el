;;; 45_helm.el ---
;; helm 関連の設定

(require 'helm)
(progn
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (define-key helm-map (kbd "C-p") nil)
  (define-key helm-map (kbd "C-n") nil))

(progn
  (defun my-helm-toggle-resplit-window ()
    (interactive)
    (when (helm-window)
      (save-selected-window
        (select-window (helm-window))
        (let ((before-height (window-height)))
          (delete-other-windows)
          (switch-to-buffer helm-current-buffer)
          (if (= (window-height) before-height)
              (split-window-vertically)
            (split-window-horizontally)))
        (select-window (next-window))
        (switch-to-buffer helm-buffer))))
  (define-key helm-map (kbd "C-o") 'my-helm-toggle-resplit-window))
