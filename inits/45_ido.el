;; Enable IDO everyhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(ido-mode 1)
(setq ido-create-new-buffer 'always)

;; Try
(setq ido-use-filename-at-point 'guess)

;; Hide all service buffers
;(add-to-list 'ido-ignore-buffers "^\**\*$")


;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Add Smex
; Call smex-initialize when it's needed
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))
