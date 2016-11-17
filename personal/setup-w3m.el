(package 'w3m)

(setq w3m-use-cookies t)
(setq browse-url-browser-function 'w3m-browse-url)

(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

(global-set-key (kbd "C-c C-b") 'browse-url-at-point)

(provide 'setup-w3m)


http://elpa.gnu.org/packages/
