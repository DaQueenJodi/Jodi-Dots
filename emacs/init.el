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
(setf mouse-wheel-progressive-speed nil)
(setf mouse-wheel-follow-mouse 't)
(setf scroll-conservatively 10000)
(setf auto-window-vscroll nil)

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
				("RET" . nil)										; dont use enter key
				("TAB" . corfu-next)
				("S-TAB" . corfu-previous)))
(setf )

(use-package yaml-mode)
(use-package rust-mode)
(use-package lsp-mode
  :hook ((rust-mode . lsp)
				 (c-mode . lsp)
				 (yaml-mode . lsp)))
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

;; this allows you to format basically all source files
(use-package format-all)
;; this allows you to move text around
(use-package move-text
	:bind (("S-C-N" . move-text-down)
				 ("S-C-P" . move-text-up)))
;; turn off bell
(setf ring-bell-function 'ignore)
;; use projectile for project management
(use-package projectile)
;; use magit and forge for git management
(use-package magit)
(use-package hl-todo
	:init
	(hl-todo-mode))

(use-package doom-modeline
	:ensure all-the-icons
	:init
	(doom-modeline-mode 1))
(use-package ido
	:init (ido-mode))
(use-package smex
	:init
	(smex-initialize)
	:bind
	(("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command)))


(use-package tree-sitter
	:ensure tree-sitter-langs
	:init
	(global-tree-sitter-mode)
	:hook
	(global-tree-sitter-mode . tree-sitter-hl-mode))

;; display line numbers
(display-line-numbers-mode 1)
;; disable line numbers in some modes
(dolist (mode '(compilation-mode-hook
								eshell-mode-hook
								shell-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode 0))))


;; preformance
;; based on lsp-doctor
(setf gc-cons-threshold 100000000) ; 100mb
(setf read-process-output-max (* 1024 1024)) ;; 1mb
(setf lsp-use-plists t)
