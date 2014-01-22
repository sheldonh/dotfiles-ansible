(setq inhibit-startup-screen t)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/color-theme-railscasts.el")
(color-theme-railscasts)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
