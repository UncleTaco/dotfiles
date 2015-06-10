;; Org-mode keybindings
(evil-leader/set-key "ooo" 'open-org-dir)
(evil-leader/set-key "ooa" 'my-org-archive-done-tasks)
(evil-leader/set-key "oog" 'gtd)
(evil-leader/set-key "ooj" 'journal)
(evil-leader/set-key "oot" 'org-capture)
(evil-leader/set-key "oon" 'notes)
(evil-leader/set-key "ooG" 'groceries)
(evil-leader/set-key "ooi" 'gtd-inbox)
(evil-leader/set-key "ooI" 'gtd-inbox-txt)
(evil-leader/set-key "ooU" 'org-mobile-push)
(evil-leader/set-key "ooD" 'org-mobile-pull)
(evil-leader/set-key "ooek" 'edit-personal-keybindings)
(evil-leader/set-key "ooef" 'edit-personal-funcs)
(evil-leader/set-key "oof" 'ff-find-other-file)
(evil-leader/set-key "*y" 'clipboard-kill-region)
(evil-leader/set-key "*p" 'clipboard-yank)

;; Org-Agenda variables
(custom-set-variables
 '(org-agenda-files (quote ("~/Dropbox/org/gtd/main.org")))
 '(org-default-notes-file "~/Dropbox/org/journal.org")
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-agenda-custom-commands
   (quote (("d" todo "DELEGATED" nil)
	   ("c" todo "DONE|DEFERRED|CANCELLED" nil)
	   ("w" todo "WAITING" nil)
	   ("W" agenda "" ((org-agenda-ndays 21)))
	   ("A" agenda ""
	    ((org-agenda-skip-function
	      (lambda nil
		(org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
	     (org-agenda-ndays 1)
	     (org-agenda-overriding-header "Today's Priority #A tasks: ")))
	   ("u" alltodo ""
	    ((org-agenda-skip-function
	      (lambda nil
		(org-agenda-skip-entry-if (quote scheduled) (quote deadline)
					  (quote regexp) "\n]+>")))
	     (org-agenda-overriding-header "Unscheduled TODO entries: ")))))))
