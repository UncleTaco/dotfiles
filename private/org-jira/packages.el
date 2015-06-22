;;; packages.el --- org-jira Layer packages File for Spacemacs
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

(defvar org-jira-packages
  '(
    org-jira
    ;; package org-jiras go here
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar org-jira-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function org-jira/init-<package-org-jira>
;;
(defun org-jira/init-org-jira ()
  (use-package org-jira
    :defer t
    :init
    (progn
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oJ" "jira")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oJp" "proJects")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oJi" "issues")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oJs" "subtasks")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oJc" "comments")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oJt" "todos")
      (evil-leader/set-key "oJpg" 'org-jira-get-proJects)
      (evil-leader/set-key "oJib" 'org-jira-browse-issue)
      (evil-leader/set-key "oJig" 'org-jira-get-issues)
      (evil-leader/set-key "oJih" 'org-jira-get-issues-headonly)
      (evil-leader/set-key "oJif" 'org-jira-get-issues-from-filter-headonly)
      (evil-leader/set-key "oJiF" 'org-jira-get-issues-from-filter)
      (evil-leader/set-key "oJiu" 'org-jira-update-issue)
      (evil-leader/set-key "oJiw" 'org-jira-progress-issue)
      (evil-leader/set-key "oJir" 'org-jira-refresh-issue)
      (evil-leader/set-key "oJic" 'org-jira-create-issue)
      (evil-leader/set-key "oJik" 'org-jira-copy-current-issue-key)
      (evil-leader/set-key "oJsc" 'org-jira-create-subtask)
      (evil-leader/set-key "oJsg" 'org-jira-get-subtasks)
      (evil-leader/set-key "oJcu" 'org-jira-update-comment)
      (evil-leader/set-key "oJtj" 'org-jira-todo-to-jira))
      )
    )
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
