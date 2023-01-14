
(use-package yaml-mode)
(use-package rust-mode)

(use-package lsp-mode
  :hook ((rust-mode . lsp)
				 ;;				 (c-mode . lsp)
				 (yaml-mode . lsp)))
;;; language specific
;; lisp
;; use sly as the lisp repl
(use-package sly
	:config
	(setf inferior-lisp-program "sbcl"))
;; use paredit for balancing parantheses
(use-package paredit
	:diminish
  :hook (emacs-lisp-mode lisp-mode sly-editing-mode))
;; add rainbow delimeiters to help keep track of parantheses
(use-package rainbow-delimiters
	:diminish
  :hook prog-mode)
;; misc
;; set up which-key
(use-package which-key
	:diminish
  :init
  (which-key-mode))

;; this allows you to format basically all source files
;;(use-package format-all)
;; this allows you to move text around
(use-package move-text
	:bind (("S-C-N" . move-text-down)
				 ("S-C-P" . move-text-up)))
;; turn off bell
(setf ring-bell-function 'ignore)
;; use projectile for project management
(use-package projectile
	:diminish)
;; use magit and forge for git management
(use-package magit)
(use-package hl-todo
	:init
	(hl-todo-mode))

(use-package ido
	:diminish
	:init (ido-mode))
(use-package smex
	:diminish
	:init
	(smex-initialize)
	:bind
	(("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)
	 ("C-c C-c M-x" . execute-extended-command)))


(use-package tree-sitter
	:diminish
	:ensure tree-sitter-langs
	:init
	(global-tree-sitter-mode)
	:hook
	(tree-sitter-after-on-hook . tree-sitter-hl-mode))

;; display line numbers
(global-display-line-numbers-mode)
;; disable line numbers in some modes
(dolist (mode '(compilation-mode-hook
								eshell-mode-hook
								vterm-mode-hook
								shell-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package company
	:config
	(global-company-mode 1)
	(setf company-idle-delay 0.1)
	(setf company-frontends
				'(company-echo-strip-common-frontend))
	(setf company-tooltip-limit 4)
	:bind
	(:map company-active-map
				("<return>" . nil)
				("RET" . nil)
				("C-<return>" . company-complete-selection)
				("C-RET" . company-complete-selection)))
