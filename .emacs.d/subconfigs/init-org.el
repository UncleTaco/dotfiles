(require 'org)

(if (eq system-type 'windows-nt)
    (setq org-directory "C:/Users/elais_000/Documents/Dropbox/org")
  (setq org-directory "~/Dropbox/Org"))

(if (eq system-type 'windows-nt)
    (setq org-mobile-directory "C:Users/elais_000/Documents/Dropbox/MobileOrg")
  (setq org-mobile-directory "~/Dropbox/MobileOrg"))

(if (eq system-type 'darwin)
	(setq org-directory "~/Dropbox/org")
  (setq org-directory "~/Dropbox/org"))
  
(setq org-mobile-inbox-for-pull (concat org-directory "/flagged.org"))

(provide 'init-org)
