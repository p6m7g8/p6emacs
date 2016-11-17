(package 's)
(package 'dash)

(load "~/.emacs.d/personal/defuns.el")
(add-to-list 'load-path "~/.emacs.d/vendor/")

(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))

(dolist (file (directory-files defuns-dir t "*.el"))
    (load file))

(provide 'setup-defuns)
