;; Stuff to be initied immediately after we load all packages

(require 'exec-path-from-shell )
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "PYTHONPATH")
