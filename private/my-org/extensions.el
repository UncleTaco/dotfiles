;;; extensions.el --- my-org Layer extensions File for Spacemacs
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

(setq my-org-pre-extensions
      '(
        ;; pre extension names go here
        ))

(setq my-org-post-extensions
      '(
        ;; post extension names go here
        ))

;; For each extension, define a function my-org/init-<extension-name>
;;
;; (defun my-org/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
(defun my-org/init-org ()
  "initialize org"
  (use-package org
    :defer t
    :init
    (progn

      (add-hook 'org-mode-hook
                (lambda ()
                  (set-fill-column 72)))
      (setq org-directory "~/org")
      (setq org-agenda-files (directory-files org-directory 'absolute-names ".org$" 'nosort))
      (setq org-startup-indented t)
      (setq org-log-done 'time)
      (setq org-default-notes-file (concat org-directory "/notes.org"))
      (setq org-export-with-toc t)
      (setq org-export-headline-levels 4)
      ;; metadata tags for the task at end
      (setq org-tag-alist '(("clojure"  . ?c)
                            ("dev"      . ?d)
                            ("java"     . ?j)
                            ("TOC"      . ?T)))
      ;; keyword sequence for org-mode
      (setq org-todo-keywords
            ((sequence "TODO(t)" "NEXT(n!)" "PENDING(p@/!)" "|" "DONE(d!)" "STAGED(s)" "DELEGATED(e)" "CANCELLED(c)")))
      (setq org-fontify-done-headline t)
      ;; active Babel languages
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((clojure . t)
         (dot . t)
         (java . t)
         (js . t)
         (latex . t)
         (sh . t)
         (emacs-lisp . t)))

      ;; org variables
      (require 'org-habit)
      (setq org-startup-indented t)
      (setq org-hide-leading-stars t)
      (setq org-odd-level-only nil)
      (setq org-insert-heading-respect-content nil)
      (setq org-startup-align-all-tables nil)
      (setq org-confirm-babel-evaluate nil)
      (setq org-clock-persist 'history)
      (setq org-tags-column 2)
      (setq org-indent-mode-t)
      (setq org-blank-before-new-entry '((heading .
                                                  nil) (plain-list-item . nil)))
      (setq  org-clock-idle-time 10)
      ;; org-clocking
      (org-clock-persistence-insinuate)
      (setq org-clock-history-length 23)
      (setq org-clock-in-resume t)
      (setq org-drawers (quote ("LOGBOOK" "PROPERTIES")))
      (setq org-clock-into-drawer t)
      (setq org-clock-out-remove-zero-time-clocks t)
      (setq org-clock-out-when-done t)
      (setq org-clock-persist t)
      (setq org-clock-persist-query-resume nil)
      (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
      (setq org-clock-report-include-clocking-task t)
      ;; display the org-habit graph right of the tags
      (setq org-habit-following-days 7)
      (setq org-habit-preceding-days 21)
      ;; org-agenda mode settings.
      (setq org-agenda-ndays 7)
      (setq org-deadline-warning-days 14)
      (setq org-agenda-show-all-dates t)
      (setq org-agenda-skip-deadline-if-done t)
      (setq org-agenda-skip-scheduled-if-done t)
      (setq org-agenda-start-on-weekday nil)
      (setq org-reverse-note-order t)
      (global-auto-revert-mode t)
      (setq org-stuck-projects (quote ("" nil nil "")))
      (require 'org-helpers)

      (defun custom-org-agenda-mode-defaults ()
        (org-defkey org-agenda-mode-map "W" 'oh/agenda-remove-restriction)
        (org-defkey org-agenda-mode-map "N" 'oh/agenda-restrict-to-subtree)
        (org-defkey org-agenda-mode-map "P" 'oh/agenda-restrict-to-project)
        (org-defkey org-agenda-mode-map "q" 'bury-buffer)
        (org-defkey org-agenda-mode-map "I" 'org-clock-in)
        (org-defkey org-agenda-mode-map "O" 'org-clock-out))

      (add-hook 'org-agenda-mode-hook 'custom-org-agenda-mode-defaults 'append)
      (setq org-todo-state-tags-triggers
            (quote (("CANCELLED" ("CANCELLED" . t))
                    ("PENDING" ("PENDING" . t))
                    ("HOLD" ("PENDING") ("STAGED" . t))
                    (done ("PENDING") ("STAGED"))
                    ("TODO" ("PENDING") ("CANCELLED") ("STAGED"))
                    ("NEXT" ("PENDING") ("CANCELLED") ("STAGED"))
                    ("DONE" ("PENDING") ("CANCELLED") ("STAGED")))))
      (setq org-clock-continuously t)
      (setq org-bullets-bullet-list '("⬜" "✕" "◯" "▷"))
      (setq org-agenda-custom-commands
            '(("a" "Agenda"
               ((agenda "" nil)
                (alltodo ""
                         ((org-agenda-overriding-header "Tasks to Refile")
                          (org-agenda-files '("~/org/inbox.org"))
                          (org-agenda-skip-function
                           '(oh/agenda-skip :headline-if-restricted-and '(todo)))))
                (tags-todo "-CANCELLED/!-PENDING"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function
                             '(oh/agenda-skip :subtree-if
                                              '(inactive non-project
                                                         non-stuck-project habit scheduled
                                                         deadline)))))
                (tags-todo "-PENDING-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-skip-function
                             '(oh/agenda-skip :subtree-if '(inactive project habit scheduled deadline)))
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy '(todo-state-down effort-up category-keep))))
                (tags-todo "-CANCELLED/!-NEXT-PENDING"
                           ((org-agenda-overriding-header "Available Tasks")
                            (org-agenda-skip-function
                             '(oh/agenda-skip :headline-if '(project)
                                              :subtree-if '(inactive habit scheduled deadline)
                                              :subtree-if-unrestricted-and '(subtask)
                                              :subtree-if-restricted-and '(single-task)))
                            (org-agenda-sorting-strategy '(category-keep))))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Currently Active Projects")
                            (org-agenda-skip-function
                             '(oh/agenda-skip :subtree-if '(non-project stuck-project inactive habit)
                                              :headline-if-unrestricted-and '(subproject)
                                              :headline-if-restricted-and '(top-project)))
                            (org-agenda-sorting-strategy '(category-keep))))
                (tags-todo "-CANCELLED/!PENDING"
                           ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                            (org-agenda-skip-function
                             '(oh/agenda-skip :subtree-if '(project habit))))))
               nil)
              ("r" "Tasks to Refile" alltodo ""
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-agenda-files '("~/org/inbox.org"))))
              ("#" "Stuck Projects" tags-todo "-CANCELLED/!-PENDING"
               ((org-agenda-overriding-header "Stuck Projects")
                (org-agenda-skip-function
                 '(oh/agenda-skip :subtree-if '(inactive non-project non-stuck-project
                                                         habit scheduled deadline)))))
              ("n" "Next Tasks" tags-todo "-PENDING-CANCELLED/!NEXT"
               ((org-agenda-overriding-header "Next Tasks")
                (org-agenda-skip-function
                 '(oh/agenda-skip :subtree-if '(inactive project habit scheduled deadline)))
                (org-tags-match-list-sublevels t)
                (org-agenda-sorting-strategy '(todo-state-down effort-up category-keep))))
              ("R" "Tasks" tags-todo "-CANCELLED/!-NEXT-PENDING"
               ((org-agenda-overriding-header "Available Tasks")
                (org-agenda-skip-function
                 '(oh/agenda-skip :headline-if '(project)
                                  :subtree-if '(inactive habit scheduled deadline)
                                  :subtree-if-unrestricted-and '(subtask)
                                  :subtree-if-restricted-and '(single-task)))
                (org-agenda-sorting-strategy '(category-keep))))
              ("p" "Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Currently Active Projects")
                (org-agenda-skip-function
                 '(oh/agenda-skip :subtree-if '(non-project inactive habit)))
                (org-agenda-sorting-strategy '(category-keep))
                (org-tags-match-list-sublevels 'indented)))
              ("w" "Waiting Tasks" tags-todo "-CANCELLED/!PENDING"
               ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                (org-agenda-skip-function '(oh/agenda-skip :subtree-if '(project habit)))))))
      (setq org-capture-templates
            '(("i" "Inbox" entry (file "~/org/inbox.org")
               "** TODO %?\n %i\n %a")
              ("w" "Work Tasks" entry (file+headline "~/org/work.org" "Refile")
               "* TODO %?\n %i\n %a")
              ("h" "Home Tasks" entry (file+headline "~/org/home.org" "Refile")
               "* TODO %?\n %i\n %a")))

      ;; Use cider as clojure backend
      (setq org-babel-clojure-backend 'cider)
      ;; Let's have pretty source code blocks
      (setq org-edit-src-content-indentation 0
            org-src-tab-acts-natively t
            org-src-fontify-natively t
            org-confirm-babel-evaluate nil))))
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
