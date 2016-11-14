;; Show-hide
(global-set-key (kbd "") 'hs-show-block)
(global-set-key (kbd "") 'hs-show-all)
(global-set-key (kbd "") 'hs-hide-block)
(global-set-key (kbd "") 'hs-hide-all)

(add-hook 'prog-mode-hook #'hs-minor-mode)
