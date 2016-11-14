;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Tags
(global-set-key (kbd "M-,") 'pop-tag-mark) ; was tags-loop-continue

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; Line movement
(global-set-key (kbd "<C-S-down>") 'move-text-down)
(global-set-key (kbd "<C-S-up>") 'move-text-up)

;; Goto Line
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(global-set-key (kbd "M-s l") 'sort-lines)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Zap to char
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "s-z") (lambda (char) (interactive "cZap up to char backwards: ") (zap-up-to-char -1 char)))

;; Change next underscore with a camel case
(global-set-key (kbd "C-c C--") 'replace-next-underscore-with-camel)
(global-set-key (kbd "M-s M--") 'snakeify-current-word)

;; Mac OS X conventions
(global-set-key (kbd "M-a") 'mark-whole-buffer) ; was backward-sentence.

;; Make shell more convenient, and suspend-frame less
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-x M-z") 'suspend-frame)


(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Window switching
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x -") 'toggle-window-split)
(global-set-key (kbd "C-x C--") 'rotate-windows)
(global-unset-key (kbd "C-x C-+")) ;; don't zoom like this

(global-set-key (kbd "M-j") (lambda (join-line -1)))

;; Move more quickly
(global-set-key (kbd "C-S-n") (lambda (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (lambda (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (lambda (ignore-errors (backward-char 5))))

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)
(global-set-key (kbd "M-s-e") 'eval-and-replace)


;; Query replace regex key binding
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Yank selection in isearch
(define-key isearch-mode-map (kbd "C-o") 'isearch-yank-selection)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Create scratch buffer
(global-set-key (kbd "C-c b") 'create-scratch-buffer)

;; Buffer file functions
(global-set-key (kbd "C-x t") 'touch-buffer-file)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")
(global-set-key (kbd "C-x M-j") '(lambda (dired-jump 1)))

(provide 'setup-bindings)
