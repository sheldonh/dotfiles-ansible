(setq inhibit-startup-screen t)

(setq x-select-enable-clipboard t)
(setq inteprogram-paste-function 'x-cut-buffer-or-selection-value)

(add-to-list
 'display-buffer-alist
 '("\\*rspec-compilation\\*" display-buffer-reuse-window (reusable-frames . t)))

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/color-theme-railscasts.el")
(color-theme-railscasts)
(set-face-attribute 'default nil :height 160)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
