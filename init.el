;(package-initialize)

(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

;; For loading personal configurations
(defun personal (library)
  (load (concat "~/.emacs.d/personal/" (symbol-name library))))

; setup
(personal 'setup-package)
(personal 'setup-defuns)
(personal 'setup-ace-windows)
(personal 'setup-ag)
(personal 'setup-auto-complete)
(personal 'setup-buffers)
(personal 'setup-bindings)
(personal 'setup-ffip)
(personal 'setup-flycheck)
(personal 'setup-global)
(personal 'setup-hardcore)
(personal 'setup-hippie)
(personal 'setup-hs)
(personal 'setup-keys)
(personal 'setup-ido)
(personal 'setup-multiple-cursors)
(personal 'setup-server-mode)
(personal 'setup-smex)
(personal 'setup-region)
(personal 'setup-popup)
(personal 'setup-theme)
(personal 'setup-utf8)
(personal 'setup-w3m)

; languages
(personal 'setup-confluence)
(personal 'setup-js)
(personal 'setup-markdown)
(personal 'setup-magit)
(personal 'setup-python)
(personal 'setup-ruby)
(personal 'setup-shell)
(personal 'setup-yaml)

; cleanup mode-line
(package 'rich-minority)
(rich-minority-mode 1)
(setf rm-blacklist "")

(provide 'init)
