(package 'flx-ido)
(package 'flx-isearch)
(package 'ido-vertical-mode)

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

(ido-everywhere 1)
(flx-ido-mode 1)

;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'setup-ido)
