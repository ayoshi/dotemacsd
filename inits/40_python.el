;; ;;; 40_python.el
;; (defadvice run-python (around run-python-no-sit activate)
;;   "Suppress absurd sit-for in run-python of python.el"
;;   (let ((process-launched (or (ad-get-arg 2) ; corresponds to `new`
;;                               (not (comint-check-proc python-buffer)))))
;;     (flet ((sit-for (seconds &optional nodisp)
;;                     (when process-launched
;;                       (accept-process-output (get-buffer-process python-buffer)))))
;;       ad-do-it)))

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
"';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;; Function to set virtualenv PATH
;; (setq python-shell-virtualenv-path "/path/to/env/")

(add-hook 'python-mode-hook 'jedi:setup)
