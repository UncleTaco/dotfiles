
;; sets up toggle-prose-mode
(eval-after-load "prose"
  '(progn
     ;; create a toggle-prose-mode function
     (defun toggle-prose-mode ()
       "Toggle extra settings for distraction free writing."
       (interactive)
       (cond ((bound-and-true-p prose-mode)
              (prose-mode -1))
             (t
              (prose-mode 1))))
     (evil-leader/set-key "tW" 'toggle-prose-mode)))

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
