;;make ui cleaner
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(setf inhibit-startup-message t)
;; set font
(add-to-list 'default-frame-alist
						 '(font . "Fira Code"))
;; set tab width
(setq-default tab-width 2)
;; package mangement
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;; install use-package if it isn't already installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
;; make sure that all packages declared here are automatically installed
(setf use-package-always-ensure t)
;; auto update packages
(use-package auto-package-update
  :config
  (setf auto-package-update-hide-results t)
  (setf auto-package-delete-old-version t)
  (auto-package-update-maybe))
;; theme
(use-package monokai-theme
  :init
  (load-theme 'monokai t))


;; misc
;; make emacs' weird custom-variable stuff in a seperate file
(setf custom-file "~/.config/emacs/custom.el")
(load custom-file)
;; make backups not annoying
(setf backup-directory-alist '(("." . "~/.emacs_backups")))
;; smoother scrolling (by line instead of by screen)
(setf scroll-step 1)
;;;; programming

;; code completion
(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  :bind
  (:map corfu-map
				("S-<return>" . corfu-insert)
				("RET" . nil) ; dont use enter key
				("TAB" . corfu-next)
				("S-TAB" . corfu-previous)))
(setf )

;; treesitter for better syntax hilighting
(use-package tree-sitter
  :ensure tree-sitter-langs)
;; enable treesitter globally and automatically enable syntax hilighting
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(use-package yaml-mode)
(use-package rust-mode)
(use-package lsp-mode
  :hook ((rust-mode . lsp)
				 (c-mode . lsp)))
;;; language specific
;; lisp
;; use sly as the lisp repl
(use-package sly
	:config
	(setf inferior-lisp-program "sbcl"))
;; use paredit for balancing parantheses
(use-package paredit
  :hook (emacs-lisp-mode lisp-mode sly-editing-mode))
;; add rainbow delimeiters to help keep track of parantheses
(use-package rainbow-delimiters
  :hook prog-mode)
;; misc
;; set up which-key
(use-package which-key
  :init
  (which-key-mode))

(use-package vterm)

;; use magit for git management
(use-package magit)

;; this allows you to format basically all source files
(use-package format-all)
;; this allows you to move text around
(use-package move-text
	:bind (("S-C-N" . move-text-down)
				 ("S-C-P" . move-text-up)))
;; turn off bell
(setf ring-bell-function 'ignore)
;; use projectile for project management
(use-package projectile
	:init
	(projectile-mode)
	:bind
	(:map projectile-mode-map
				("C-c p" . projectile-command-map))
	:config
	(setf projectile-project-search-path '(("~/Documents/Programming" . 5))))

(use-package hl-todo)


(use-package doom-modeline
	:ensure all-the-icons
	:init
	(doom-modeline-mode 1))
