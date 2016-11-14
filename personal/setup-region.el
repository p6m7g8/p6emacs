;; Browse kill ring
(package 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Keep region when undoing in region
(defadvice undo-tree-undo (around keep-region activate)
  (if (use-region-p)
      (let ((m (set-marker (make-marker) (mark)))
	    (p (set-marker (make-marker) (point))))
	ad-do-it
	(goto-char p)
	(set-mark m)
	(set-marker p nil)
	(set-marker m nil))
    ad-do-it))

(global-set-key (kbd "C-w") 'kill-region-or-backward-word)

;; Killing text
(global-set-key (kbd "C-S-k") 'kill-and-retry-line)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

;; Use M-w for copy-line if no active region
(global-set-key (kbd "M-w") 'save-region-or-current-line)
(global-set-key (kbd "s-w") 'save-region-or-current-line)
(global-set-key (kbd "M-W") (lambda (save-region-or-current-line 1)))

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Fold the active region
(package 'fold-this)
(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

;; Expand Region
(package 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(setq expand-region-fast-keys-enabled nil) ;; Don't use expand-region fast keys
(setq er--show-expansion-message t) ;; Show expand-region command used

(provide 'setup-region)
