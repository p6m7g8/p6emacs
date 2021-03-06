;;; package -- Summary
;;; Commentary:

;;; Code:
;(package-initialize)
(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

;; For loading personal configurations
(defun personal (library)
  "Load a personal elisp file.
Return: none.
LIBRARY is ... the library to load"
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
(personal 'setup-ci)
(personal 'setup-utf8)
(personal 'setup-w3m)

; languages
(personal 'setup-confluence)
(personal 'setup-docker)
(personal 'setup-jenkins)
(personal 'setup-golang)
(personal 'setup-js)
(personal 'setup-typescript)
(personal 'setup-markdown)
(personal 'setup-terraform)
(personal 'setup-magit)
(personal 'setup-perl)
(personal 'setup-python)
(personal 'setup-ruby)
(personal 'setup-shell)
(personal 'setup-yaml)

; cleanup mode-line [last]
(personal 'setup-modeline)

(provide 'init)

;;; init.el ends here
