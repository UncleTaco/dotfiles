
;; sets the default user's information properly.
(setq user-full-name "elais jackson"
      user-mail-address "elais.player@gmail.com")

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; text wrapping at 80 columns by default (only text)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
          '(lambda() (set-fill-column 80)))
