;;; License: GPLv3

;; ---------------------------------------------------------------------------
;; Prefixes
;; ---------------------------------------------------------------------------

;; We define prefix commands only for the sake of guide-key
(setq spacemacs/key-binding-prefixes '(("a" .  "applications")
                                       ("ai" . "applications-irc")
                                       ("as" . "applications-shells")
                                       ("b" .  "buffers")
                                       ("bm" . "buffers-move")
                                       ("c" .  "compile/comments")
                                       ("C" .  "capture/colors")
                                       ("e" .  "errors")
                                       ("f" .  "files")
                                       ("fe" . "files-emacs/spacemacs")
                                       ("g" .  "git/versions-control")
                                       ("gc" . "smeargle")
                                       ("h" .  "helm/help/highlight")
                                       ("hd" . "help-describe")
                                       ("i" .  "insertion")
                                       ("j" .  "join/split")
                                       ("k" .  "lisp")
                                       ("kd" .  "lisp-delete")
                                       ("kD" .  "lisp-delete-backward")
                                       ("n" .  "narrow/numbers")
                                       ("p" .  "projects")
                                       ("q" .  "quit")
                                       ("r" .  "registers/rings")
                                       ("s" .  "search/symbol")
                                       ("sw" .  "search-web")
                                       ("S" .  "spelling")
                                       ("t" .  "toggles")
                                       ("tC" . "toggles-colors")
                                       ("th" . "toggles-highlight")
                                       ("tm" . "toggles-modeline")
                                       ("T" .  "toggles/themes")
                                       ("w" .  "windows")
                                       ("wp" . "windows-popup")
                                       ("wS" . "windows-size")
                                       ("x" .  "text")
                                       ("xd" . "text-delete")
                                       ("xg" . "text-google-translate")
                                       ("xm" . "text-move")
                                       ("xt" . "text-transpose")
                                       ("xw" . "text-words")
                                       ("z" .  "zoom")))
(mapc (lambda (x) (spacemacs/declare-prefix (car x) (cdr x)))
      spacemacs/key-binding-prefixes)


;; ---------------------------------------------------------------------------
;; Navigation
;; ---------------------------------------------------------------------------

(ido-mode t)
(setq ido-save-directory-list-file (concat spacemacs-cache-directory "ido.last"))
;; enable fuzzy matching ido-enable-flex-matching t)
;; Auto refresh buffers
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)
;; activate winner mode use to undo and redo windows layout
(winner-mode t)
;; no beep pleeeeeease ! (and no visual blinking too please)
(custom-set-variables '(ring-bell-function 'ignore))
(setq visible-bell nil)
;; required for evil folding
(defun spacemacs//enable-hs-minor-mode ()
  "Enable hs-minor-mode for code folding."
  (ignore-errors
    (hs-minor-mode)
    (spacemacs|hide-lighter hs-minor-mode)))
(add-hook 'prog-mode-hook 'spacemacs//enable-hs-minor-mode)

;; Hack to fix a bug with tabulated-list.el
;; see: http://redd.it/2dgy52
(defun tabulated-list-revert (&rest ignored)
  "The `revert-buffer-function' for `tabulated-list-mode'.
It runs `tabulated-list-revert-hook', then calls `tabulated-list-print'."
  (interactive)
  (unless (derived-mode-p 'tabulated-list-mode)
    (error "The current buffer is not in Tabulated List mode"))
  (run-hooks 'tabulated-list-revert-hook)
  ;; hack is here
  ;; (tabulated-list-print t)
  (tabulated-list-print))

;; Mouse cursor in terminal mode
(xterm-mouse-mode 1)

;; Highlight and allow to open http link at point in programming buffers
;; goto-address-prog-mode only highlights links in strings and comments
(add-hook 'prog-mode-hook 'goto-address-prog-mode)

;; When point is on paranthesis, highlight the matching one
(show-paren-mode t)

;; ---------------------------------------------------------------------------
;; Edit
;; ---------------------------------------------------------------------------

(spacemacs|defvar-company-backends emacs-lisp-mode)
;; start scratch in text mode (usefull to get a faster Emacs load time
;; because it avoids autoloads of elisp modes)
(setq initial-major-mode 'text-mode)
;; whitespace-mode
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace 1)))

;; use only spaces and no tabs
(setq-default indent-tabs-mode nil
              default-tab-width 2)
;; turn on electric-indent-mode for both 24.3 and 24.4
(electric-indent-mode)
;; Text
(setq longlines-show-hard-newlines t)

;; Use system trash for file deletion
;; should work on Windows and Linux distros
;; on OS X, install `trash' from `homebrew'
(setq delete-by-moving-to-trash t)
(when (system-is-mac)
  ;; use trash if installed
  (if (executable-find "trash")
      (defun system-move-file-to-trash (file)
        "Use `trash' to move FILE to the system trash.
Can be installed with `brew install trash'."
        (call-process (executable-find "trash") nil 0 nil file))
    ;; regular move to trash directory
    (setq trash-directory "~/.Trash/emacs")))

;; auto fill breaks line beyond current-fill-column
(setq-default default-fill-column 80)
(spacemacs|diminish auto-fill-function " Ⓕ" " F")

;; persistent abbreviation file
(setq abbrev-file-name (concat spacemacs-cache-directory "abbrev_defs"))

;; Save clipboard contents into kill-ring before replace them
(setq save-interprogram-paste-before-kill t)
;; ---------------------------------------------------------------------------
;; Org-Mode
;; ---------------------------------------------------------------------------
;; Org settings
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files '("~/Dropbox/org/gtd/main.org" "~/Dropbox/org/groceries.org"))
;; The habit package for org is awesome!
(require 'org-habit)
;; Ifttt auto appends .txt to filenames for dropbox append to file action
;;(add-to-list 'auto-mode-alist '("\\Dropbox/org/.*\.txt\\'" . org-mode))
;; Quick searches in org mode
(setq org-agenda-custom-commands
      '(("x" agenda)
        ("y" agenda*)
        ("w" todo "WAITING")
        ("W" todo-tree "WAITING")
        ("s" todo "STARTED")
        ("S" todo-tree "STARTED")
        ("c" tags "+COMPUTER")
        ("t" tags "+TELEPHONE")
        ("o" . "WORK tag searches") ; description for "o" prefix
        ("oo" tags "+WORK")
        ("op" tags "+WORK+PLANNING")
        ("om" tags "+WORK+REGRESSION")
        ("ol" tags "+WORK+LUNCHTIME")
        ("ot" tags "+WORK+TELEPHONE")
        ("or" tags "+WORK+RETROSPECTIVE")
        ("od" tags "+WORK+DAILYSCRUM")
        ("oa" tags "+WORK+ASAP")
        ("h" . "HOME tag searches") ; description for "h" prefix
        ("hf" tags "+HOME+FINANCES")
        ("hc" tags "+HOME+COMPUTER")
        ("hp" tags "+HOME+TELEPHONE")
        ("hk" tags "+HOME+KAT")
        ("hm" tags "+HOME+MOM")
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
          (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
(custom-set-variables
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t)
 '(org-fast-tag-selection-single-key (quote expert)))
;; add novel specific keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)")
              (sequence "REPEAT(r)" "WAIT(w!)" "|" "PAUSED(p@/!)" "CANCELLED(c@/!)" )
              (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
              )))
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

;; ---------------------------------------------------------------------------
;; UI
;; ---------------------------------------------------------------------------

;; important for golden-ratio to better work
(setq window-combination-resize t)
;; fringes
(setq-default fringe-indicator-alist
              '((truncation . nil) (continuation . nil)))
;; Show column number in mode line
(setq column-number-mode t)
;; line number
(setq linum-format "%4d")
;; highlight current line
(global-hl-line-mode t)
;; no blink
(blink-cursor-mode 0)
;; When emacs asks for "yes" or "no", let "y" or "n" sufficide
(fset 'yes-or-no-p 'y-or-n-p)
;; draw underline lower
(setq x-underline-at-descent-line t)
;; setup right and left margins
;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 0 0)))

;; don't let the cursor go into minibuffer prompt
;; Tip taken from Xah Lee: http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
(setq minibuffer-prompt-properties
      '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))

;; Emacs 24.4 new features
(unless (version< emacs-version "24.4")
  (if dotspacemacs-fullscreen-at-startup
      (spacemacs/toggle-frame-fullscreen)
    (if dotspacemacs-maximized-at-startup
        (add-hook 'window-setup-hook 'toggle-frame-maximized))))

;; ---------------------------------------------------------------------------
;; Session
;; ---------------------------------------------------------------------------

;; save custom variables in ~/.spacemacs
(setq custom-file (dotspacemacs/location))
;; scratch buffer empty
(setq initial-scratch-message nil)
;; don't create backup~ or #auto-save# files
(setq backup-by-copying t
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)
(require 'uniquify)
;; When having windows with repeated filenames, uniquify them
;; by the folder they are in rather those annoying <2>,<3>,.. etc
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      ;; don't screw special buffers
      uniquify-ignore-buffers-re "^\\*")
;; remove annoying ellipsis when printing sexp in message buffer
(setq eval-expression-print-length nil
      eval-expression-print-level nil)
;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t
              save-place-file (concat spacemacs-cache-directory "places"))

;; minibuffer history
(require 'savehist)
(setq savehist-file (concat spacemacs-cache-directory "savehist")
      enable-recursive-minibuffers t ; Allow commands in minibuffers
      history-length 1000
      savehist-additional-variables '(kill-ring mark-ring global-mark-ring search-ring regexp-search-ring extended-command-history)
      savehist-autosave-interval 60)
(savehist-mode +1)

;; auto-save
(let
    ((autosave-dir (expand-file-name (concat spacemacs-cache-directory "autosave"))))
  (unless (file-exists-p autosave-dir)
    (make-directory autosave-dir))
  (setq auto-save-list-file-prefix (concat autosave-dir "/")
        auto-save-file-name-transforms `((".*" ,autosave-dir t))))

;; cache files
;; bookmarks
(setq bookmark-default-file (concat spacemacs-cache-directory "bookmarks")
      ;; save after every change
      bookmark-save-flag 1
      url-configuration-directory (concat spacemacs-cache-directory "url")
      eshell-directory-name (concat spacemacs-cache-directory "eshell" )
      tramp-persistency-file-name (concat spacemacs-cache-directory "tramp"))

;; increase memory threshold for GC
(setq gc-cons-threshold 20000000)

;; seems pointless to warn. There's always undo.
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
;; remove prompt if the file is opened in other clients
(defun server-remove-kill-buffer-hook ()
  (remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function))
(add-hook 'server-visit-hook 'server-remove-kill-buffer-hook)

;; The following code is kept as reference -----------------------------------

;; ;; save a bunch of variables to the desktop file
;; ;; for lists specify the len of the maximal saved data also
;; (setq desktop-globals-to-save
;;       (append '((extended-command-history . 30)
;;                 (file-name-history        . 100)
;;                 (grep-history             . 30)
;;                 (compile-history          . 30)
;;                 (minibuffer-history       . 50)
;;                 (query-replace-history    . 60)
;;                 (read-expression-history  . 60)
;;                 (regexp-history           . 60)
;;                 (regexp-search-ring       . 20)
;;                 (search-ring              . 20)
;;                 (shell-command-history    . 50)
;;                 (evil-ex                  .100)
;;                 tags-file-name
;;                 register-alist)))

;; ;; Make emacs open all files in last emacs session (taken from ergoemacs).

;; ;; This functionality is provided by desktop-save-mode
;; ;; (“feature” name: “desktop”).
;; ;;
;; ;; The mode is not on by default in emacs 23.1, and has a lot options.
;; ;; The following is init settings for the mode for ErgoEmacs.
;; ;; Goal: have emacs always auto open the set of opened files in last session,
;; ;; even if emacs crashed in last session or the OS crashed in last session.
;; ;; Also, don't bother users by asking questions like “do you want to save
;; ;; desktop?” or “do you want to override last session file?”, because these are
;; ;; annoying and terms like “session” or “desktop” are confusing to most users
;; ;; because it can have many meanings.
;; ;;
;; ;; Some tech detail: set the desktop session file 〔.emacs.desktop〕
;; ;; at the variable “user-emacs-directory” (default value is “~/.emacs.d/”).
;; ;; This file is our desktop file. It will be auto created and or over-written.
;; ;; If a emacs expert has other desktop session files elsewhere, he can still use
;; ;; or manage those.

;; (require 'desktop)

;; (defun desktop-settings-setup ()
;;   "Some settings setup for desktop-save-mode."
;;   (interactive)

;;   ;; At this point the desktop.el hook in after-init-hook was
;;   ;; executed, so (desktop-read) is avoided.
;;   (when (not (eq (emacs-pid) (desktop-owner))) ; Check that emacs did not load a desktop yet
;;     ;; Here we activate the desktop mode
;;     (desktop-save-mode 1)
;;     ;; The default desktop is saved always
;;     (setq desktop-save t)
;;     ;; The default desktop is loaded anyway if it is locked
;;     (setq desktop-load-locked-desktop t)
;;     ;; Set the location to save/load default desktop
;;     (setq desktop-dirname user-emacs-directory)
;;     ;; Make sure that even if emacs or OS crashed, emacs
;;     ;; still have last opened files.
;;     (add-hook 'find-file-hook
;;      (lambda ()
;;        (run-with-timer 5 nil
;;           (lambda ()
;;             ;; Reset desktop modification time so the user is not bothered
;;             (setq desktop-file-modtime (nth 5 (file-attributes (desktop-full-file-name))))
;;             (desktop-save user-emacs-directory)))))
;;     ;; Read default desktop
;;     (if (file-exists-p (concat desktop-dirname desktop-base-file-name))
;;         (desktop-read desktop-dirname))
;;     ;; Add a hook when emacs is closed to we reset the desktop
;;     ;; modification time (in this way the user does not get a warning
;;     ;; message about desktop modifications)
;;     (add-hook 'kill-emacs-hook
;;               (lambda ()
;;                 ;; Reset desktop modification time so the user is not bothered
;;                 (setq desktop-file-modtime (nth 5 (file-attributes (desktop-full-file-name))))))
;;     )
;;   )

;; (add-hook 'after-init-hook
;; ;;          'desktop-settings-setup
;;           (lambda ()
;;             ;; No splash screen
;;             (setq inhibit-startup-screen t)
;;             ;; ;; If the *scratch* buffer is the current one, then create a new
;;             ;; ;; empty untitled buffer to hide *scratch*
;;             ;; (if (string= (buffer-name) "*scratch*")
;;             ;;     (new-empty-buffer))
;;             )
;;           t) ;; append this hook to the tail
