(load "~/.emacs.d/personal/defuns.el")
(add-to-list 'load-path "~/.emacs.d/vendor/")

(package 's)
(package 'dash)

(load "~/.emacs.d/defuns/buffer-defuns.el")
(load "~/.emacs.d/defuns/editing-defuns.el")
(load "~/.emacs.d/defuns/file-defuns.el")
(load "~/.emacs.d/defuns/lisp-defuns.el")
(load "~/.emacs.d/defuns/misc-defuns.el")

(provide 'setup-defuns)
