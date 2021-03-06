(package 'js3-mode)
(setq js3-mirror-mode t)
(autoload 'js3-mode "js3-mode" nil t)

(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

(add-hook 'js3-mode-hook
	  (lambda ()
	    (setq js3-indent-level 4)
	    (setq js3-mode-dev-mode-p t)
	    (setq js3-auto-indent-p t)
	    (setq js3-enter-indents-newline t)
	    (setq js3-indent-on-enter-key t)
	    (when (require 'auto-complete nil t)
	      (make-variable-buffer-local 'ac-sources)
	      (add-to-list 'ac-sources 'ac-source-yasnippet)
	      (auto-complete-mode t))
            (imenu-add-menubar-index)))

(provide 'setup-js)
