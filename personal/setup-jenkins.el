(package 'jenkins)

(setq jenkins-api-token "<api token can be found on user's configure page>")
(setq jenkins-url "<jenkins url. Example: https://jenkins.company.com/ >")
(setq jenkins-username "<your user name>")
(setq jenkins-viewname "<viewname>") ;; if you're not using views skip this line

(package 'groovy-mode)
(add-to-list 'load-path "~/src/github.com/john2x/jenkinsfile-mode")
(require 'jenkinsfile-mode)

(provide 'setup-jenkins)
