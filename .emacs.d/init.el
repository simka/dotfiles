;; package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; packages
(defvar my-packages
  '(
    ;; clojure
    paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider

    ;; haskell
    haskell-mode

    ;; general
    smex
    projectile
    ido-ubiquitous
    rainbow-delimiters
    tagedit
    magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; scratch buffer on startup
(setq inhibit-startup-message t)

;; skip lockfiles
(setq create-lockfiles nil)

;; modules
(add-to-list 'load-path "~/.emacs.d/modules")
(add-to-list 'load-path "~/.emacs.d/vendor")

(load "ui.el")
(load "files.el")
(load "editing.el")
(load "keybindings.el")
(load "clojure.el")
(load "tidal.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit tagedit rainbow-delimiters ido-ubiquitous projectile smex cider clojure-mode-extra-font-locking clojure-mode paredit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
