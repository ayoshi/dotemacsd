;; Enable IDO everyhere
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(ido-mode 1)
(setq ido-create-new-buffer 'always)

;; Try
(setq ido-use-filename-at-point 'guess)

;; Hide all service buffers
(add-to-list 'ido-ignore-buffers "^\**\*")
