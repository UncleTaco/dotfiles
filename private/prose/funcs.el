
(defcustom prose-margins 'prose-guess-margins
  "Margins to use in `prose-mode'.
Its value can be:
- a floating point value betweeen 0 and 1, specifies percentage of
  window width in columns to use as a margin.
- a cons cell (LEFT RIGHT) specifying the left and right margins
  in columns.
- a function of a single argument, a window, that returns a cons
  cell interpreted like the previous option. An example is
  `prose-guess-margins', which see. Beware that this function
  is called very often, so if it does some non-trivial processing
  on the buffer's text, consider caching that value.
Value is effective when `prose-mode' is toggled."
  :type '(choice float
                 (cons integer integer)
                 (function-item prose-guess-margins :doc "Guess margins")
                 (function prose-guess-margins))
  :group 'prose)

(defcustom prose-text-scale-increase 1
  "Steps to increase text size when in `prose-mode'.
Value is passed to `text-scale-increase'."
  :type 'integer
  :group 'prose)

(defcustom prose-fringes-outside-margins t
  "If non-nil use fringes outside margins for `prose-mode'"
  :type 'boolean
  :group 'prose)

(defcustom prose-margin-increment 0.05
  "Increment to add used in `prose-increase-margins'."
  :type 'float
  :group 'prose)

(defcustom prose-margins-if-failed-guess 0.15
  "Margins when `prose-guess-margins' fails.
If `prose-guess-margins' failed to figure out margins to
center the text, use this percentage of window width for the
symmetical margins."
  :type 'float
  :group 'prose)

(defcustom prose-verbose nil
  "If non-nil, be verbose about prose operations."
  :type 'boolean
  :group 'prose)

(defvar prose--guess-margins-statistics-cache nil
  "Cache used by `prose-guess-margins'.")

;; (defcustom prose-global-effects '(prose-toggle-alpha)
;;   "docstring."
;;  :group 'prose
;;  :type '(set (const :tag "Disable transparency" prose-toggle-alpha)))

(defmacro define-prose-global-effect (fp value)
  "Define a global effect.
The effect is activated by setting frame parameter FP to VALUE.
FP should be an unquoted symbol, the name of a frame parameter;
VALUE must be quoted (unless it is a string or a number, of
course). It can also be an unquoted symbol, in which case it
should be the name of a global variable whose value is then
assigned to FP.
This macro defines a function `prose-toggle-<FP>' that takes
one argument and activates the effect if this argument is t and
deactivates it when it is nil. When the effect is activated,
the original value of frame parameter FP is stored in a frame
parameter `prose-<FP>', so that it can be restored when the
effect is deactivated."
  (declare (indent defun))
  (let ((wfp (intern (format "prose-%s" fp))))
    `(fset (quote ,(intern (format "prose-toggle-%s" fp)))
           (lambda (arg)
             (if arg
                 (progn
                   (set-frame-parameter nil (quote ,wfp) (frame-parameter nil (quote ,fp)))
                   (set-frame-parameter nil (quote ,fp) ,value))
               (set-frame-parameter nil (quote ,fp) (frame-parameter nil (quote ,wfp)))
               (set-frame-parameter nil (quote ,wfp) nil))))))

(define-prose-global-effect alpha '(100 100))

(defun prose--window-width (&optional window)
  "calculate width of window in columns, considering text scaling"
  (when (= (point-min) (point-max))
    (error "Cannot calculate the width of a single character"))
  (let* ((window (or window (selected-window)))
         (scaled-char-width (car (window-text-pixel-size
                                  window
                                  (point-min) (1+ (point-min)))))
         (char-width (frame-char-width))
         (margins (window-margins window)))
    (cons (truncate
           (+ (window-width window 'pixelwise)
              (* char-width (or (car margins) 0))
              (* char-width (or (cdr margins) 0)))
           scaled-char-width)
          scaled-char-width)))

(defun prose-guess-margins (window)
  "Guess suitable margins for 'prose margins'"
  (if (or visual-line-mode
          (and buffer-face-mode
               (eq 'variable-pitch buffer-face-mode-face))
          (= (point-min) (point-max)))
      prose-margins-if-failed-guess
    (let* ((window-width-info (if (integerp window)
                                  window
                                (prose--window-width window)))
           (window-width (car window-width-info))
           (scaled-char-width (cdr window-width-info))
           (top-quartile-avg
            (or prose--guess-margins-statistics-cache
                (set
                 (make-local-variable 'prose--guess-margins-statistics-cache)
                 (let* ((line-widths
                         (save-excursion
                           (goto-char (point-min))
                           (cl-loop for start = (point)
                                    while (search-forward "\n"
                                                          20000
                                                          'no-error)
                                    for width = (truncate
                                                 (car
                                                  (window-text-pixel-size
                                                   window
                                                   start (1- (point))))
                                                 scaled-char-width)
                                    unless (zerop width)
                                    collect width)))
                        (n4 (max 1 (/ (length line-widths) 4))))
                   (/ (apply '+ (cl-subseq (sort line-widths '>) 0 n4)) n4))))))
      (cond
       ((> top-quartile-avg
           window-width)
        (message "long lines detected, consider visual-line-mode")
        prose-margins-if-failed-guess)
       ((> top-quartile-avg (* 0.9 fill-column))
        ;; calculate margins so that 'fill-column' + 1 colmns are
        ;; centered on the window
        (let ((margin (truncate (* (- window-width (1+ fill-column))
                                   (/ (float scaled-char-width)
                                      (frame-char-width)))
                                2)))
          (if prose-verbose
              (message "Choosing %s-wie margins based on fill-column %s"
                       margin fill-column))
          (cons margin margin)))
       (t
        prose-margins-if-failed-guess)))))

(defun prose--compute-margins (window)
  "From \"prose-margins\", computes desired margins for WINDOW."
  (let ((prose-margins
         (if (functionp prose-margins)
             (funcall prose-margins window)
           prose-margins)))
    (cond ((consp prose-margins)
           prose-margins)
          ((and (floatp prose-margins)
                (< prose-margins 1))
           (let ((delta (prose--float-to-columns prose-margins)))
             (cons delta delta)))
          (t
           (error "Illegal value in prose-margins")))))

(defun prose--float-to-columns (f)
  (ceiling (* (let ((edges (window-edges)))
                (- (nth 2 edges) (nth 0 edges)))
              f)))

(defvar prose--margin-factor 1
  "Buffer local factor affecting `prose--set-margins'")

(defun prose--set-margins ()
  "Set prose-mode margins for currently selected window"
  (let* ((window-configuration-change-hook nil)
         (window (selected-window))
         (margins (prose--compute-margins window)))
    ;; See description of
    ;; `fringes-outside-margins' for the reason
    ;; for this apparent noop
    (set-window-buffer window (current-buffer))
    (set-window-margins window
                        (round
                         (* prose--margin-factor
                            (car margins)))
                        (round
                         (* prose--margin-factor
                            (cdr margins))))))

(defun prose--reset-margins ()
  "Reset darkroom margins for currently selected window."
  (set-window-margins (selected-window) 0 0))

(defun prose-increase-margins (increment)
  "Increase darkroom margins by INCREMENT."
  (interactive (list prose-margin-increment))
  (set (make-local-variable 'prose--margin-factor)
       (* prose--margin-factor (+ 1 increment)))
  (mapc #'(lambda (w)
            (with-selected-window w
              (prose--set-margins)))
        (get-buffer-window-list (current-buffer))))

(defun prose-decrease-margins (decrement)
  "Decrease darkroom margins by DECREMENT."
  (interactive (list prose-margin-increment))
  (prose-increase-margins (- decrement)))

(defvar prose-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-M-+") 'prose-increase-margins)
    (define-key map (kbd "C-M--") 'prose-decrease-margins)
    map))

(defconst prose--saved-variables
  '(mode-line-format
    header-line-format
    fringes-outside-margins)
  "Variables saved in `prose--saved-state'")

(defvar prose--saved-state nil
  "Saved state before `prose-mode' is turned on.
Alist of (VARIABLE . BEFORE-VALUE)")

;; (defun prose--activate-global-effects (arg)
;;   "Activate or deactivate global effects.
;; The effects are activated if ARG is non-nil, and deactivated
;; otherwise."
;;   (mapc (lambda (fn)
;;           (funcall fn arg))
;;         prose-global-effects))

(defun prose--enter (&optional just-margins)
  "Save current state and enter prose for the current buffer.
With optional JUST-MARGINS, just set the margins."
  (unless just-margins
    (setq prose--saved-state
          (mapcar #'(lambda (sym)
                      (cons sym (buffer-local-value sym (current-buffer))))
                  prose--saved-variables))
    (setq mode-line-format nil
          header-line-format nil
          fringes-outside-margins prose-fringes-outside-margins)
    (text-scale-increase prose-text-scale-increase))
  (mapc #'(lambda (w)
            (with-selected-window w
              (prose--set-margins)))
        (get-buffer-window-list (current-buffer))))

(defun prose--leave ()
  "Undo the effects of `prose--enter'."
  (mapc #'(lambda (pair)
            (set (make-local-variable (car pair)) (cdr pair)))
        prose--saved-state)
  (setq prose--saved-state nil)
  (text-scale-decrease prose-text-scale-increase)
  (mapc #'(lambda (w)
            (with-selected-window w
              (prose--reset-margins)))
        (get-buffer-window-list (current-buffer))))

(defun prose--enter-or-leave ()
  "Enter or leave prose according to window configuration."
  (cond ((= (count-windows) 1)
         (prose--enter prose--saved-state))
        (prose--saved-state
         (prose--leave))
        (t
         ;; for clarity, don't do anything
         )))
(declare-function prose-tentative-mode "prose" t)

;;;###autoload
(define-minor-mode prose-mode
  "Remove visual distractions and focus on writing. When this
mode is active, everything but the buffer's text is elided from
view. The buffer margins are set so that text is centered on
screen. Text size is increased (display engine allowing) by
`prose-text-scale-increase'." nil nil nil
(when prose-tentative-mode
  (display-warning
   'prose
   (concat "Turning off `prose-tentative-mode' first. "
           "It doesn't go with `prose-mode'.")
   (let ((prose-mode nil))
     (prose-tentative-mode -1))))
(cond (prose-mode
       (prose--enter)
       (add-hook 'window-configuration-change-hook 'prose--set-margins
                 t t))
      (t
       (prose--leave)
       (remove-hook 'window-configuration-change-hook 'prose--set-margins
                    t))))

(define-minor-mode prose-tentative-mode
  "Enters `prose-mode' when all other windows are deleted."
  nil " Room" prose-mode-map
  ;; always begin by removing the hook
  ;; 
  (remove-hook 'window-configuration-change-hook
               'prose--enter-or-leave 'local)
  (when prose-mode
    (display-warning
     'prose
     (concat "Turning off `prose-mode' first. "
             "It doesn't go with `prose-tentative-mode'.")
     (let ((prose-tentative-mode nil))
       (prose-mode -1))))
  ;; turn prose on or off according to window state
  ;; 
  (cond (prose-tentative-mode
         ;; re-add the hook when we are turning ourselves on
         ;;
         (add-hook 'window-configuration-change-hook
                   'prose--enter-or-leave 'append 'local)
         ;; call this right away if we're supposed to turn prose on
         ;; immediately.
         ;; 
         (prose--enter-or-leave))
        (t
         (prose--leave))))

(defun prose/toggle-darkroom-mode ()
  "Toggle extra settings for distraction free writing."
  (interactive)
  (cond ((bound-and-true-p darkroom-mode)
         (widen)
         (setq line-spacing nil)
         (darkroom-mode 0))
        (t
         (outline-mark-subtree)
         (narrow-to-region (region-beginning)(region-end))
         (setq line-spacing 0.5)
         (deactivate-mark)
         (darkroom-mode 1)
         (message "happy writing"))))
(evil-leader/set-key "tW" 'prose/toggle-darkroom-mode)

(defun my/unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text"
  (interactive (progn
                 (barf-if-buffer-read-only)
                 (list t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))
(bind-key "M-Q" 'my/unfill-paragraph)

(defun my/fill-or-unfill-paragraph (&optional unfill region)
  "Fill paragraph (or Region)"
  (interactive (progn
                 (barf-if-buffer-read-only)
                 (list (if current-prefix-arg 'unfill) t)))
  (let ((fill-column (if unfill (point-max) fill-column)))
    (fill-paragraph nil region)))
(bind-key "M-q" 'my/fill-or-unfill-paragraph)
