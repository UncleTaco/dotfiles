(defun open-org-dir ()
  "Opens the org dir"
  (interactive)
  (find-file "~/Dropbox/org/")
  )
(defun gtd-inbox ()
  "Open the gtd inbox"
  (interactive)
  (find-file "~/Dropbox/org/inbox.org")
  )
(defun gtd-inbox-txt ()
  "Open the gtd inbox"
  (interactive)
  (find-file "~/Dropbox/org/inbox.org.txt")
  )
(defun gtd ()
  "Open GTD directory"
  (interactive)
  (find-file "~/Dropbox/org/gtd/main.org")
  )
(defun journal ()
  "Open Journal"
  (interactive)
  (find-file "~/Dropbox/org/journal.org")
  )
(defun notes ()
  "Switch to my work dir."
  (interactive)
  (find-file "~/Dropbox/org/notes/")
  )
(defun groceries ()
  "Edit grocery list"
  (interactive)
  (find-file "~/Dropbox/org/groceries.org")
  )

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file)
  )



(setq org-capture-templates
      '(("i" "Inbox" entry (file "~/Dropbox/org/inbox.org")
         "** TODO %?\n %i\n %a")
        ("t" "Todo" entry (file+headline "~/Dropbox/org/gtd/private.org" "Tasks")
         "* TODO %?\n %i\n %a")
        ("g" "Groceries" entry (file+headline "~/Dropbox/org/groceries.org" "INBOX")
         "* %?\n %i\n %a")
        ("j" "Journal Entry" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
        )
      )
;; Org settings
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files '("~/Dropbox/org/gtd/main.org" "~/Dropbox/org/groceries.org"))
;; The habit package for org is awesome!
(require 'org-habit)
;; Ifttt auto appends .txt to filenames for dropbox append to file action
(add-to-list 'auto-mode-alist '("\\Dropbox/org/.*\.txt\\'" . org-mode))
;; Quick searches in org mode
(setq org-agenda-custom-commands
      '(("x" agenda)
        ("y" agenda*)
        ("w" todo "WAITING")
        ("W" todo-tree "WAITING")
        ("s" todo "STARTED")
        ("S" todo-tree "STARTED")
        ("c" tags "+COMPUTER")
        )
      )
                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

                                        ; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

                                        ; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

                                        ; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

                                        ; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

                                        ; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

                                        ; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
                                        ; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)
