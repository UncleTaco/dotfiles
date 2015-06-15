;;; packages.el --- personal Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq personal-packages
      '(
        org-projectile
        ;;package personals go here
        ))
(defvar personal-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function personal/init-<package-personal>
;;
(defun personal/init-org-projectile ()
  "Initialize my package"
  (use-package org-projectile
    :defer t
    :config
    (progn
      (setq org-projectile:per-repo-filename "my_project.org")
      (append org-agenda-files (org-projectile:todo-files))
      (add-to-list 'org-capture-templates (org-projectile:project-todo-entry "p")))
    :ensure t))

(defun generate-org-settings ()
  "Generate org-mode settings"
  (interactive)
  (find-file "~/.emacs.d/private/personal/Org-Settings.org"))

(defun edit-personal-keybindings ()
  "Edit personal keybindings"
  (interactive)
  (find-file "~/.emacs.d/private/personal/keybindings.el")
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
