
(defun open-org-dir ()
  "Opens the org dir"
  (interactive)
  (find-file "~/org/")
  )
(defun gtd-inbox ()
  "Open the gtd inbox"
  (interactive)
  (find-file "~/org/inbox.org")
  )
(defun gtd-inbox-txt ()
  "Open the gtd inbox"
  (interactive)
  (find-file "~/org/inbox.org.txt")
  )
(defun gtd ()
  "Open GTD directory"
  (interactive)
  (find-file "~/org/gtd/main.org")
  )
(defun journal ()
  "Open Journal"
  (interactive)
  (find-file "~/org/journal.org")
  )
(defun notes ()
  "Switch to my work dir."
  (interactive)
  (find-file "~/org/notes/")
  )
(defun groceries ()
  "Edit grocery list"
  (interactive)
  (find-file "~/org/groceries.org")
  )

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file)
  )

(setq org-indirect-buffer-display 'current-window)
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'bh/verify-refile-target)
