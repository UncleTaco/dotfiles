
;; keybindings for artbollocks mode
(evil-leader/set-key-for-mode 'artbollocks-mode
  "mmw" 'artbollocks-word-count
  "mms" 'artbollocks-sentence-count
  "mmr" 'artbollocks-readability-index
  "mme" 'artbollocks-reading-ease
  "mmg" 'artbollocks-grade-level)

;; keybindings for sentence navigation
(define-key evil-normal-state-map ")" 'sn/evil-forward-sentence)
(define-key evil-normal-state-map "(" 'sn/evil-backward-sentence)
(define-key evil-normal-state-map "g)" 'sn/evil-forward-sentence-end)
(define-key evil-normal-state-map "g(" 'sn/evil-backward-sentence-end)
(define-key evil-outer-text-objects-map "S" 'sn/evil-outer-sentence)
(define-key evil-inner-text-objects-map "S" 'sn/evil-inner-sentence)
