;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)

;; Window switching
(global-unset-key (kbd "C-x C-+")) ;; don't zoom like this
(windmove-default-keybindings) ;; Shift+direction

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
	 (message "You can't rotate a single window!"))
	(t
	 (setq i 1)
	 (setq numWindows (count-windows))
	 (while  (< i numWindows)
	   (let* (
		  (w1 (elt (window-list) i))
		  (w2 (elt (window-list) (+ (% i numWindows) 1)))

		  (b1 (window-buffer w1))
		  (b2 (window-buffer w2))

		  (s1 (window-start w1))
		  (s2 (window-start w2))
		  )
	     (set-window-buffer w1  b2)
	     (set-window-buffer w2 b1)
	     (set-window-start w1 s2)
	     (set-window-start w2 s1)
	     (setq i (1+ i)))))))
(global-set-key (kbd "C-x C--") 'rotate-windows)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x -") 'toggle-window-split)

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Window navigation
(windmove-default-keybindings 'meta)

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; Tags
(global-set-key (kbd "M-,") 'pop-tag-mark) ; was tags-loop-continue

;; Toggle quotes
(defun toggle-quotes ()
  (interactive)
  (if (point-is-in-string-p)
      (let ((old-quotes (char-to-string (current-quotes-char)))
	    (new-quotes (char-to-string (alternate-quotes-char)))
	    (start (make-marker))
	    (end (make-marker)))
	(save-excursion
	  (move-point-forward-out-of-string)
	  (backward-delete-char 1)
	  (set-marker end (point))
	  (insert new-quotes)
	  (move-point-backward-out-of-string)
	  (delete-char 1)
	  (insert new-quotes)
	  (set-marker start (point))
	  (replace-string new-quotes (concat "\\" new-quotes) nil start end)
	  (replace-string (concat "\\" old-quotes) old-quotes nil start end)))
    (error "Point isn't in a string")))
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; Line movement

(global-set-key (kbd "<C-S-up>") 'move-text-up)

(global-set-key (kbd "M-j") (lambda (join-line -1)))

;; Goto Line
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
	(linum-mode 1)
	(call-interactively 'goto-line))
    (linum-mode -1)))
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(global-set-key (kbd "M-s l") 'sort-lines)

;; Transpose stuff with M-t
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(defun transpose-params ()
  "Presumes that params are in the form (p, p, p) or {p, p, p} or [p, p, p]"
  (interactive)
  (let* ((end-of-first (cond
			((looking-at ", ") (point))
			((and (looking-back ",") (looking-at " ")) (- (point) 1))
			((looking-back ", ") (- (point) 2))
			(t (error "Place point between params to transpose."))))
	 (start-of-first (save-excursion
			   (goto-char end-of-first)
			   (move-backward-out-of-param)
			   (point)))
	 (start-of-last (+ end-of-first 2))
	 (end-of-last (save-excursion
			(goto-char start-of-last)
			(move-forward-out-of-param)
			(point))))
    (transpose-regions start-of-first end-of-first start-of-last end-of-last)))
(global-set-key (kbd "M-t p") 'transpose-params)

;; Zap to char
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "s-z") (lambda (char) (interactive "cZap up to char backwards: ") (zap-up-to-char -1 char)))

;; Change next underscore with a camel case
(defun replace-next-underscore-with-camel (arg)
  (interactive "p")
  (if (> arg 0)
      (setq arg (1+ arg))) ; 1-based index to get eternal loop with 0
  (let ((case-fold-search nil))
    (while (not (= arg 1))
      (search-forward-regexp "\\b_[a-z]")
      (forward-char -2)
      (delete-char 1)
      (capitalize-word 1)
      (setq arg (1- arg)))))
(global-set-key (kbd "C-c C--") 'replace-next-underscore-with-camel)

(defun snakeify-current-word ()
  (interactive)
  (er/mark-word)
  (let* ((beg (region-beginning))
	 (end (region-end))
	 (current-word (buffer-substring-no-properties beg end))
	 (snakified (snake-case current-word)))
    (replace-string current-word snakified nil beg end)))
(global-set-key (kbd "M-s M--") 'snakeify-current-word)

;; Make shell more convenient, and suspend-frame less
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-x M-z") 'suspend-frame)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Move more quickly
(global-set-key (kbd "C-S-n") (lambda (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (lambda (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (lambda (ignore-errors (backward-char 5))))

;; Should be able to eval-and-replace anywhere.
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
	     (current-buffer))
    (error (message "Invalid expression")
	   (insert (current-kill 0)))))
(global-set-key (kbd "C-c C-e") 'eval-and-replace)
(global-set-key (kbd "M-s-e") 'eval-and-replace)

;; Query replace regex key binding
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Yank selection in isearch
(defun isearch-yank-selection ()
  "Put selection from buffer into search string."
  (interactive)
  (when (region-active-p)
    (deactivate-mark))
  (isearch-yank-internal (lambda () (mark))))
(define-key isearch-mode-map (kbd "C-o") 'isearch-yank-selection)

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")
(global-set-key (kbd "C-x M-j") '(lambda (dired-jump 1)))

(provide 'setup-bindings)
