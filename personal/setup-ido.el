(package 'flx-ido)
(package 'flx-isearch)
(package 'ido-vertical-mode)
(package 'ido-ubiquitous)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)

(setq ido-use-faces nil) ; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history nil) ; forget latest selected directory names

(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'setup-ido)
