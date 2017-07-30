;; Turn off the menu bar and tool bar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; line numbers
(global-linum-mode)

;; hide scroll bar
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode 0)

(setq-default frame-title-format "%b (%f)")

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; font
(set-frame-font "Operator Mono 12" nil t)

;; turn off bell
(setq ring-bell-function 'ignore)