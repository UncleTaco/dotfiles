
;; sets the default user's information properly.
(add-to-list
 'org-structure-template-alist
 '("c" "#+NAME: ?\n#+BEGIN_SRC emacs-lisp :tangle \"~/\" :noweb \n\n#+END_SRC"))

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; enable flyspell-mode and writegood-mode when org-mode is active
(add-hook 'org-mode-hook
          (lambda()
            (flyspell-mode)))
(add-hook 'org-mode-hook
          (lambda ()
            (artbollocks-mode)))

;; text wrapping at 80 columns by default (only text)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook
          '(lambda() (set-fill-column 80)))
