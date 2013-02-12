;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Disable fringe indicator of empty lines
(setq-default  indicate-empty-lines nil)

; Disable end-of-buffer indicator
(setq-default  indicate-buffer-boundaries nil)

; Want rainbow delimiters everywhere
(global-rainbow-delimiters-mode t)

; Smooth scolling
(smooth-scroll-mode t)
; On carbon default 2 make scrolling slow
(setq smooth-scroll/vscroll-step-size 4)

;; Represent undo-history as an actual tree
(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

; Uniquify buffer names for same filenames in different subdirs using dir/filename
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
