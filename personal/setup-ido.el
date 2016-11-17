(package 'flx-ido)
(package 'flx-isearch)
(package 'ido-vertical-mode)
(package 'ido-ubiquitous)
(package 'ido-at-point)

(require 'imenu)
(require 'recentf)
(require 's)

(recentf-mode 1)
(flx-ido-mode 1)
(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)
(ido-at-point-mode)

(defvar user-home-directory (concat (expand-file-name "~") "/"))

(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-use-faces nil) ; disable ido faces to see flx highlights.
(setq recentf-max-menu-items 25)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)
(global-set-key (kbd "C-x M-p") 'find-or-create-file-at-point-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)

(define-key global-map (kbd "C-x C-n") 'make-frame-command)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; toggle two most recent buffers
(fset 'quick-switch-buffer [?\C-x ?b return])
(global-set-key (kbd "s-b") 'quick-switch-buffer)

(global-set-key (kbd "M-s e") 'sudo-edit)

(provide 'setup-ido)
