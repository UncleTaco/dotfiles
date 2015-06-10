;;; packages.el --- prose Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2015 Elais Jackson & Contributors
;;
;; Author: Elais Jackson <elais.player@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq prose-packages
      '(
        ;; major modes
        pandoc-mode

        ;; minor modes
        artbollocks-mode
        cm-mode
        markdown-mode+
        olivetti

        ;; etc
        sentence-navigation
      ;; package proses go here
      ))

;; List of packages to exclude.
(setq prose-excluded-packages '())

;; For each package, define a function prose/init-<package-prose>
;;
;; (defun prose/init-my-package ()
;;   "Initialize my package"
;;   )
(defun prose/init-pandoc-mode ()
  (use-package pandoc-mode
    :defer t))

(defun prose/init-artbollocks-mode ()
  (use-package artbollocks-mode
    :defer t))

(defun prose/init-cm-mode ()
  (use-package cm-mode
    :defer t))

(defun prose/init-olivetti ()
  (use-package olivetti
    :defer t))

(defun prose/init-sentence-navigation ()
  (use-package sentence-navigation
    :defer t))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
