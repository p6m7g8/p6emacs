(package 'hardcore-mode)

(require 'hardcore-mode)
(global-hardcore-mode)

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(provide 'setup-hardcore)
