;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default                         ;
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')

   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     ;;agenda
     auto-completion
     better-defaults
     clojure
     emacs-lisp
     git
     github
     ;;ipython-notebook
     java
     ;;markdown
     org
     ;;org-jira
     ;;osx
     ;;personal
     ;;prose
     ;;python
     ;;react
     ;;slime
     syntax-checking
     ;;themes-megapack
     ruby
     ;;vagrant
     version-control
     my-org
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t)
  (setq dotspacemacs-additional-packages '(
                                           minimal-theme
                                           olivetti
                                           org-wunderlist
                                           tao-theme
                                           toc-org
                                           visual-fill-column
                                           )))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         tao-yin
                         tao-yang
                         )

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("InputMono"
                               :size 13
                               :weight Regular
                               :powerline-scale 1.0
                               )
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 50
   ;; If non nil unicode symbols are displayed in the mode line.

   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package. Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; magit status fullscreen
  (setq-default git-magit-status-fullscreen t)
  ;; User initialization goes here
  (load-file "~/.emacs.d/private/personal/org-helpers.el")
  (defun dotspacemacs/user-config ()
    "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
    ;; omnisharp server stuff
    (setq tab-width 2 indent-tabs-mode nil)

    ;; make tao-yang background white instead of gray
    ;; Whitespace settings
    (setq whitespace-action '(auto-cleanup))
    (setq whitespace-style '(trailing space-before-tab indentation
                                      empty space-after-tab))

    (defun my/frame-toggle (frame)
      "Custom behaviour for new frames"
      (with-selected-frame frame
        (unless (display-graphic-p)
          (set-background-color nil))))
    (my/frame-toggle (selected-frame))
    ;; Fix indentation for anonymous classes
    (c-set-offset 'substatement-open 0)
    (if (assoc 'inexpr-class c-offsets-alist)
        (c-set-offset 'inexpr-class 0))
    ;; eclim for my evim
    (require 'company-emacs-eclim)
    (defun my/eclim-setup ()
      (message "starting eclim setup")
      (setq
       eclim-eclipse-dirs '("~/eclipse")
       eclim-executable (expand-file-name "~/eclipse/eclim")
       eclim-auto-save nil)
      (company-emacs-eclim-setup)
      (global-eclim-mode)
      (message "... finished setup"))
    (add-hook 'java-mode-hook 'my/eclim-setup)
    ;; Functions
    (defun my/buffer-face-mode-fixed ()
      "Sets the olivetti font to a light version"
      (interactive)
      (setq buffer-face-mode-face '(:weight Light))
      (buffer-face-mode))

    (defun my/fill-or-unfill-paragraph (&optional unfill region)
      "Fill paragraph (or REGION).
  With the prefix argument UNFILL, unfill it instead."
      (interactive (progn
                     (barf-if-buffer-read-only)
                     (list (if current-prefix-arg 'unfill) t)))
      (let ((fill-column (if unfill (point-max) fill-column)))
        (fill-paragraph nil region)))
    (bind-key "M-q" 'my/fill-or-unfill-paragraph)
    ;; spacemacs-theme stuff
    ;; debug stuff
    (setq debug-on-error t)
    ;; Show highlighted buffer id as decoration
    ;; Resize titles
    (setq-default auto-fill-function 'do-auto-fill)
    ;; elisp indentation
    (add-hook 'emacs-lisp-mode-hook
              (lambda ()
                (set-fill-column 79)))

    ;; IPython settings
    (setq ein:use-auto-complete t)
    (setq ein:use-smartrep t)
    ;; prose writing mode toggle
    (defun my/toggle-writing-mode ()
      "Toggle a distraction-free environment for writing"
      (interactive)
      (cond ((bound-and-true-p olivetti-mode)
             (olivetti-toggle-hide-modeline)
             (text-scale-set 0)
             (menu-bar-mode 1)
             (hl-line-mode 1)
             (olivetti-mode -1)
             (widen)
             )
            (t
             (outline-mark-subtree)
             (deactivate-mark)
             (hl-line-mode -1)
             (narrow-to-region (region-beginning)(region-end))
             (text-scale-set 1)
             (olivetti-mode 1)
             (olivetti-toggle-hide-modeline)
             (menu-bar-mode -1))))
    (evil-leader/set-key "tW" 'my/toggle-writing-mode)
    (add-hook 'doc-view-mode-hook 'auto-revert-mode)

    ;; Quick searches in org mode
    (add-to-list 'auto-mode-alist '("\\.org$\\'" . org-mode))

    (add-hook 'org-mode-hook
              (lambda ()
                (set-fill-column 72)))
    (setq org-directory "~/org/")
    (setq org-agenda-files '("~/org/"
                             "~/org/gtd"
                             "~/org/notes"))
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
          '((sequence "TODO(t)" "NEXT(n!)" "|" "DONE(d!)")
            (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"
              "PHONE" "MEETING")))

    (setq org-todo-state-tags-triggers
          (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("HOLD" ("WAITING") ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

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
    (setq org-src-window-setup 'current-window)
    (setq org-startup-indented t)
    (setq org-hide-leading-stars nil)
    (setq org-odd-level-only nil)
    (setq org-insert-heading-respect-content nil)
    (setq org-startup-align-all-tables nil)
    (setq org-confirm-babel-evaluate nil)
    (setq org-clock-persist 'history)
    (setq org-tags-column 2)
    (setq org-indent-mode-t)
    (setq org-blank-before-new-entry '((heading . nil)
                                       (plain-list-item . nil)))
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
    (setq org-agenda-window-setup 'current-window)
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
              (tags-todo "-CANCELLED/!-WAITING"
                         ((org-agenda-overriding-header "Stuck Projects")
                          (org-agenda-skip-function
                           '(oh/agenda-skip :subtree-if
                                            '(inactive non-project
                                                       non-stuck-project habit scheduled
                                                       deadline)))))
              (tags-todo "-WAITING-CANCELLED/!NEXT"
                         ((org-agenda-overriding-header "Next Tasks")
                          (org-agenda-skip-function
                           '(oh/agenda-skip :subtree-if '(inactive project habit scheduled deadline)))
                          (org-tags-match-list-sublevels t)
                          (org-agenda-sorting-strategy '(todo-state-down effort-up category-keep))))
              (tags-todo "-CANCELLED/!-NEXT-WAITING"
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
              (tags-todo "-CANCELLED/!WAITING"
                         ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                          (org-agenda-skip-function
                           '(oh/agenda-skip :subtree-if '(project habit))))))
             nil)
            ("r" "Tasks to Refile" alltodo ""
             ((org-agenda-overriding-header "Tasks to Refile")
              (org-agenda-files '("~/org/inbox.org"))))
            ("#" "Stuck Projects" tags-todo "-CANCELLED/!-WAITING"
             ((org-agenda-overriding-header "Stuck Projects")
              (org-agenda-skip-function
               '(oh/agenda-skip :subtree-if '(inactive non-project non-stuck-project
                                                       habit scheduled deadline)))))
            ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!NEXT"
             ((org-agenda-overriding-header "Next Tasks")
              (org-agenda-skip-function
               '(oh/agenda-skip :subtree-if '(inactive project habit scheduled deadline)))
              (org-tags-match-list-sublevels t)
              (org-agenda-sorting-strategy '(todo-state-down effort-up category-keep))))
            ("R" "Tasks" tags-todo "-CANCELLED/!-NEXT-WAITING"
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
            ("w" "Waiting Tasks" tags-todo "-CANCELLED/!WAITING"
             ((org-agenda-overriding-header "Waiting and Postponed Tasks")
              (org-agenda-skip-function '(oh/agenda-skip :subtree-if '(project habit)))))))
    (setq org-capture-templates
          '(("i" "Inbox" entry (file "~/org/inbox.org")
             "* TODO %?\n %i\n %a")
            ("w" "McLeod Tasks" entry (file+headline "~/org/gtd/mcleod.org" "Refile")
             "* TODO %?\n %i\n %a")
            ("h" "Home Tasks" entry (file+headline "~/org/gtd/private.org" "Refile")
             "* TODO %?\n %i\n %a")))

    ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
    (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                     (org-agenda-files :maxlevel . 9))))
    ;; Use full outline paths for refile targets - we file directly with IDO
    (setq org-refile-use-outline-path t)

    ;; Targets complete directly with IDO
    (setq org-outline-path-complete-in-steps nil)

    ;; Allow refile to create parent tasks with confirmation
    (setq org-refile-allow-creating-parent-nodes (quote confirm))

    ;; Use cider as clojure backend
    (setq org-babel-clojure-backend 'cider)
    ;; Let's have pretty source code blocks
    (setq org-edit-src-content-indentation 0
          org-src-tab-acts-natively t
          org-src-fontify-natively t
          org-confirm-babel-evaluate nil)

    ;; org wunderlist
    (require 'org-wunderlist)
    (setq org-wunderlist-client-id "a4056caecfee66d3e883"
          org-wunderlist-token "24c195054c92bbdf0fb03951e138ef8a1e78a1ce98741673f538dd39f2fd"
          org-wunderlist-file "~/org/Wunderlist.org"
          org-wunderlist-dir "~/org/org-wunderlist/")
    ;; Cider configuration
    (setq clojure-defun-style-default-indent t)
    (setq nrepl-hide-special-buffers t
          cider-repl-pop-to-buffer-on-connect nil
          cider-popup-stacktraces nil
          cider-repl-popup-stacktraces t)))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-safe-themes
   (quote
    ("2718ddd12fd4fbe5e8cbe965b53228e303a1a3ee2817037ff2e54b66b598fc72" "c18172c869f8ad26927f43b558606298b249aa5b2512537faf3290327a87fbf0" "695299c113f708f3db2476158eb02e94e55daa836c72febf5307d04257f30616" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" default)))
 '(expand-region-reset-fast-key "r")
 '(fci-rule-color "#F0F0F0" t)
 '(preview-auto-cache-preamble (quote ask))
 '(ring-bell-function (quote ignore))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
