
(setq org-directory "~/Dropbox/org/")

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
(setq org-agenda-files '("~/Dropbox/org/"
                         "~/Dropbox/org/gtd"
                         "~/Dropbox/org/notes"
                         "~/Dropbox/org/writing"))
;; The habit package for org is awesome!
;; Ifttt auto appends .txt to filenames for dropbox append to file action
(add-to-list 'auto-mode-alist '("\\Dropbox/org/.*\.txt\\'" . org-mode))

(setq org-todo-keywords
      (quote ((sequence "TODO(t!)"  "NEXT(n!)" "STARTED(s!)" "APPT(a!)" "|" "DONE(d!)")
              (sequence "REPEAT(r)"  "WAITING(w!)" "HOLD(h!)" "|"  "PAUSED(p@/!)" "CANCELLED(c@/!)" )
              (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
              )))

;Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

;; Quick searches in org mode
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
