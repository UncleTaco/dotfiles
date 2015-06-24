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
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oj" "jira")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "ojp" "projects")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "oji" "issues")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "ojs" "subtasks")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "ojc" "comments")
      ;;(spacemacs/declare-prefix-for-mode 'org-mode "ojt" "todos")
      (evil-leader/set-key "ojpg" 'org-jira-get-projects)
      (evil-leader/set-key "ojib" 'org-jira-browse-issue)
      (evil-leader/set-key "ojig" 'org-jira-get-issues)
      (evil-leader/set-key "ojih" 'org-jira-get-issues-headonly)
      (evil-leader/set-key "ojif" 'org-jira-get-issues-from-filter-headonly)
      (evil-leader/set-key "ojiF" 'org-jira-get-issues-from-filter)
      (evil-leader/set-key "ojiu" 'org-jira-update-issue)
      (evil-leader/set-key "ojiw" 'org-jira-progress-issue)
      (evil-leader/set-key "ojir" 'org-jira-refresh-issue)
      (evil-leader/set-key "ojic" 'org-jira-create-issue)
      (evil-leader/set-key "ojik" 'org-jira-copy-current-issue-key)
      (evil-leader/set-key "ojsc" 'org-jira-create-subtask)
      (evil-leader/set-key "ojsg" 'org-jira-get-subtasks)
      (evil-leader/set-key "ojcu" 'org-jira-update-comment)
      (evil-leader/set-key "ojtj" 'org-jira-todo-to-jira))
    :config
    (setq jiralib-url "https://atlasrfid.atlassian.net:443")
  ))
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
