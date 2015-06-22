
;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; enable flyspell-mode and writegood-mode when org-mode is active

;; text wrapping at 80 columns by default (only text)
(visual-line-mode 0)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
