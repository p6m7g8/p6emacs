(package 'flx-ido)
(package 'flx-isearch)
(package 'ido-vertical-mode)
(package 'ido-ubiquitous)
(package 'ido-at-point)

(require 'imenu)
(require 'recentf)
(require 's)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(defvar user-home-directory (concat (expand-file-name "~") "/"))

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)
(ido-at-point-mode)

(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
	(symbol-names '()))
    (flet ((addsymbols (symbol-list)
		       (when (listp symbol-list)
			 (dolist (symbol symbol-list)
			   (let ((name nil) (position nil))
			     (cond
			      ((and (listp symbol) (imenu--subalist-p symbol))
			       (addsymbols symbol))

			      ((listp symbol)
			       (setq name (car symbol))
			       (setq position (cdr symbol)))

			      ((stringp symbol)
			       (setq name symbol)
			       (setq position (get-text-property 1 'org-imenu-marker symbol))))

			     (unless (or (null position) (null name))
			       (add-to-list 'symbol-names name)
			       (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
	(let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
	       (matching-symbols (delq nil (mapcar (lambda (symbol)
						     (if (string-match regexp symbol) symbol))
						   symbol-names))))
	  (when matching-symbols
	    (sort matching-symbols (lambda (a b) (> (length a) (length b))))
	    (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
		  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
	   (position (cdr (assoc selected-symbol name-and-pos))))
      (push-mark (point))
      (goto-char position))))

(defun shorter-file-name (file-name)
  (s-chop-prefix user-home-directory file-name))

(defun recentf--file-cons (file-name)
  (cons (shorter-file-name file-name) file-name))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let* ((recent-files (mapcar 'recentf--file-cons recentf-list))
	 (files (mapcar 'car recent-files))
	 (file (completing-read "Choose recent file: " files)))
    (find-file (cdr (assoc file recent-files)))))

(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-use-faces nil) ; disable ido faces to see flx highlights.
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
