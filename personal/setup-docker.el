(package 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(put 'dockerfile-image-name 'safe-local-variable #'stringp)

(package 'docker-compose-mode)

(package 'docker)
(setq docker-image-run-arguments '("-i" "-t" "--rm"))

(provide 'setup-docker)
