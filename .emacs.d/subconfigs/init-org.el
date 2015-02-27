(require 'org)
(require 'evil-org)

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

(if (eq system-type 'windows-nt)
	(setq org-agenda-files (list "C:/Users/elais_000/Dropbox/org/work.org"
								 "C:/Users/elais_000/Dropbox/org/school.org" 
								 "C:/Users/elais_000/Dropbox/org/home.org"))
  (setq org-agenda-files (list "~/Dropbox/org/work.org"
                               "~/Dropbox/org/school.org" 
                               "~/Dropbox/org/home.org")))
	 
(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [(control meta ?r)] 'remember)

(custom-set-variables
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-default-notes-file "~/notes.org")
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
	     (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   (("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")))
        
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler))))
 (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("n" "Notes" entry (file+datetree "~/notes.org")
<<<<<<< HEAD
         "* %?\nEntered on %U\n  %i\n  %a")
        ("s" "Novel" entry (file+headline "~/novel.org" "Tasks")
             "* TODO %?\n  %i\n  %a")))
(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)")
              (sequence "REPEAT(r)" "WAIT(w!)" "|" "PAUSED(p@/!)" "CANCELLED(c@/!)" )
              (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
             )))
=======
             "* %?\nEntered on %U\n  %i\n  %a")))
>>>>>>> parent of b516bf0... added logic to save to novel org file
