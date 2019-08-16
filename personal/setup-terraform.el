(package 'hcl-mode)
(package 'terraform-mode)
(package 'company-terraform)
(package 'pos-tip)
(package 'company-quickhelp)

(company-terraform-init)
(company-quickhelp-mode)

(custom-set-variables
 '(terraform-indent-level 2))
