;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     better-defaults
     clojure
     (git :variables
          git-gutter-use-fringe t)
     github
     latex
     markdown
     org
     org-jira
     osx
     personal
     prose
     python
     slime
     syntax-checking
     themes-megapack
     ruby
     vagrant
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t)
  (setq dotspacemacs-additional-packages '(
                                           basic-theme
                                           tao-theme
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
                         minimal
                         minimal-light
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.3
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
   dotspacemacs-inactive-transparency 90
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
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (setq tab-width 2
        indent-tabs-mode nil)
  ;; Whitespace settings
  (setq whitespace-action '(auto-cleanup))
  (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
  ;; Powerline theme
  (setq visual-line-mode 1)
  (setq-default git-enable-github-support t)



  (defun dotspacemacs/config ()
    "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
    ;; turn off hl-line in org-mode
    ;; better powerline
    ;; org-agenda stuff
    (add-hook 'doc-view-mode-hook 'auto-revert-mode)
    (add-hook 'org-agenda-mode-hook 'custom-org-agenda-mode-defaults 'append)
    (add-hook 'org-mode-hook
              (lambda ()
                (setq fill-column 64)
                (setq visual-line-mode nil)
                (auto-fill-mode t)))

    ;; Org-Settings
    (setq org-directory "~/Dropbox/org/")
    (setq org-agenda-files '("~/Dropbox/org/"
                             "~/Dropbox/org/gtd"
                             "~/Dropbox/org/notes"
                             "~/Dropbox/org/.org-jira"
                             "~/Dropbox/org/writing/project1"
                             ))
    (require 'org-habit)
    (org-babel-load-file "~/.emacs.d/private/personal/Org-Settings.org")
    (add-to-list 'load-path "~/.emacs.d/private/prose/")
    (require 'darkroom)
    (org-babel-load-file "~/.emacs.d/private/prose/README.org")
    ;; active Babel languages
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((R . t)
       (dot . t)
       (haskell . t)
       (java . t)
       (js . t)
       (latex . t)
       (ruby . t)
       (sh . t)
       (emacs-lisp . t)
       (C . t)
       ))
    (setq org-confirm-babel-evaluate nil)
    (setq org-clock-persist 'history)
    (setq  org-clock-idle-time 10)
    (org-clock-persistence-insinuate)
    ;; display teh tags farther right
    (setq org-agenda-tags-column -102)
    ;; display the org-habit graph right of the tags
    (setq org-habit-graph-column 102)
    (setq org-habit-following-days 7)
    (setq org-habit-preceding-days 21)

    (add-to-list 'load-path "~/.emacs.d/private/personal/")

    (require 'org-helpers)

    (setq org-todo-keywords
          (quote ((sequence "TODO(t)"  "NEXT(n)" "STARTED(s)" "APPT(a)" "|" "DONE(d)")
                  (sequence "REPEAT(r)"  "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" )
                  (sequence "IDEA(i)" "MAYBE(y)" "STAGED(s)" "WORKING(k)" "|" "USED(u!/@)")
                  )))


    (setq org-todo-state-tags-triggers
          (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("HOLD" ("WAITING") ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))


    (defun custom-org-agenda-mode-defaults ()
      (org-defkey org-agenda-mode-map "W" 'oh/agenda-remove-restriction)
      (org-defkey org-agenda-mode-map "N" 'oh/agenda-restrict-to-subtree)
      (org-defkey org-agenda-mode-map "P" 'oh/agenda-restrict-to-project)
      (org-defkey org-agenda-mode-map "q" 'bury-buffer)
      (org-defkey org-agenda-mode-map "I" 'org-clock-in)
      (org-defkey org-agenda-mode-map "O" 'org-clock-out)
      )

    (add-hook 'org-agenda-mode-hook 'custom-org-agenda-mode-defaults 'append)

    (setq org-clock-continuously t)
    (setq org-agenda-custom-commands
          '(("a" "Agenda"
             ((agenda "" nil)
              (alltodo ""
                       ((org-agenda-overriding-header "Tasks to Refile")
                        (org-agenda-files '("~/Dropbox/org/inbox.org"))
                        (org-agenda-skip-function
                         '(oh/agenda-skip :headline-if-restricted-and '(todo)))))
              (tags-todo "-CANCELLED/!-HOLD-WAITING"
                         ((org-agenda-overriding-header "Stuck Projects")
                          (org-agenda-skip-function
                           '(oh/agenda-skip :subtree-if '(inactive non-project non-stuck-project habit scheduled deadline)))))
              (tags-todo "-WAITING-CANCELLED/!NEXT"
                         ((org-agenda-overriding-header "Next Tasks")
                          (org-agenda-skip-function
                           '(oh/agenda-skip :subtree-if '(inactive project habit scheduled deadline)))
                          (org-tags-match-list-sublevels t)
                          (org-agenda-sorting-strategy '(todo-state-down effort-up category-keep))))
              (tags-todo "-CANCELLED/!-NEXT-HOLD-WAITING"
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
              (tags-todo "-CANCELLED/!WAITING|HOLD"
                         ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                          (org-agenda-skip-function
                           '(oh/agenda-skip :subtree-if '(project habit))))))
             nil)
            ("r" "Tasks to Refile" alltodo ""
             ((org-agenda-overriding-header "Tasks to Refile")
              (org-agenda-files '("~/Dropbox/org/inbox.org"))))
            ("#" "Stuck Projects" tags-todo "-CANCELLED/!-HOLD-WAITING"
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
            ("R" "Tasks" tags-todo "-CANCELLED/!-NEXT-HOLD-WAITING"
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
            ("w" "Waiting Tasks" tags-todo "-CANCELLED/!WAITING|HOLD"
             ((org-agenda-overriding-header "Waiting and Postponed Tasks")
              (org-agenda-skip-function '(oh/agenda-skip :subtree-if '(project habit)))))))))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ansi-color-names-vector
   ["#C2C2C2" "#161616" "#252525" "#080808" "#0E0E0E" "#161616" "#080808" "#080808"])
 '(custom-safe-themes
   (quote
    ("26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(expand-region-contract-fast-key "V")
 '(expand-region-reset-fast-key "r")
 '(fci-rule-color "#F0F0F0" t)
 '(org-agenda-window-setup (quote current-window))
 '(preview-auto-cache-preamble (quote ask))
 '(ring-bell-function (quote ignore) t)
 '(vc-annotate-background "#D9D9D9")
 '(vc-annotate-color-map
   (quote
    ((20 . "#616161")
     (40 . "#3C3C3C")
     (60 . "#3C3C3C")
     (80 . "#252525")
     (100 . "#252525")
     (120 . "#161616")
     (140 . "#161616")
     (160 . "#0E0E0E")
     (180 . "#0E0E0E")
     (200 . "#0E0E0E")
     (220 . "#080808")
     (240 . "#080808")
     (260 . "#080808")
     (280 . "#080808")
     (300 . "#080808")
     (320 . "#080808")
     (340 . "#080808")
     (360 . "#080808"))))
 '(vc-annotate-very-old-color "#161616"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 141 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(hl-line ((t (:weight extra-bold)))))
