;;; helm-projectile-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (helm-projectile) "helm-projectile" "../../../../../.emacs.d/elpa/helm-projectile-20141124.643/helm-projectile.el"
;;;;;;  "c16986de6694d52cbfeceda897242f77")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-projectile-20141124.643/helm-projectile.el

(autoload 'helm-projectile "helm-projectile" "\
Use projectile with Helm instead of ido.

With a prefix ARG invalidates the cache first.
If invoked outside of a project, displays a list of known projects to jump.

\(fn &optional ARG)" t nil)

(eval-after-load 'projectile '(progn (define-key projectile-command-map (kbd "h") 'helm-projectile)))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/helm-projectile-20141124.643/helm-projectile-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-projectile-20141124.643/helm-projectile.el")
;;;;;;  (21619 23215 909000 0))

;;;***

(provide 'helm-projectile-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; helm-projectile-autoloads.el ends here
