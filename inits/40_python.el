(elpy-enable)

;; To use the source code checking facilities, both manual and via flymake, you need to set python-check-command to a command you have installed. Both pyflakes and pep8 are useful (see below). To use both, you can just download the python-check.sh from the elpy git repository and use that:
;;
;; wget -O python-check.sh \
;;     https://raw.github.com/jorgenschaefer/elpy/master/python-check.sh
;;
;; Make sure to put that script in your PATH, and add the following to your .emacs to use it:
(setq python-check-command "python-check.sh")

;; If you want to use IPython (make sure it's installed), add:
(elpy-use-ipython)
