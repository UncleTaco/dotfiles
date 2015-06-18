
;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; enable flyspell-mode and writegood-mode when org-mode is active

;; text wrapping at 80 columns by default (only text)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook
          '(lambda () set-fill-column 64))
