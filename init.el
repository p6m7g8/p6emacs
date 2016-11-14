;; setup
;; ---------------------
(setq custom-file "~/.emacs.d/personal/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/personal/defuns")

(add-to-list 'load-path "~/.emacs.d/vendor/")

;; elpa managed
;; ------------------
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

(personal 'setup-ace-windows)
(personal 'setup-ag)
(personal 'setup-auto-complete)
(personal 'setup-buffers)
(personal 'setup-bindings)
(personal 'setup-ffip)
(personal 'setup-flycheck)
(personal 'setup-global)
(personal 'setup-hippie)
(personal 'setup-hs)
(personal 'setup-ido)
(personal 'setup-multiple-cursors)
(personal 'setup-server-mode)
(personal 'setup-smex)
(personal 'setup-region)
(personal 'setup-popup)
(personal 'setup-theme)
(personal 'setup-utf8)

; languages
(personal 'setup-confluence)
(personal 'setup-js)
(personal 'setup-markdown)
(personal 'setup-magit)
(personal 'setup-python)
(personal 'setup-ruby)
(personal 'setup-shell)
(personal 'setup-yaml)
