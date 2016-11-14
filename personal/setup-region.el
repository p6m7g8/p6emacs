(package 'expand-region)

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

(global-set-key (kbd "C-@") 'er/expand-region)

(provide 'setup-region)
