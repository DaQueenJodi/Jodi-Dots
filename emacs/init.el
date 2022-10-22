(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                                           ("org" . "https://orgmode.org/elpa")
                                           ("elpa" . "https://elpa.gnu.org/packages")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq inhibit-startup-message t) ; remove startup message
(scroll-bar-mode -1) ; remove scroll bar
(tool-bar-mode -1) ; remove tool bar 
(tooltip-mode -1) ; remove tooltips
(menu-bar-mode -1) ; remove menu bar

(use-package all-the-icons) ; contains fonts and stuff that doom uses
(use-package doom-themes
  :config
  (setq doom-theme-enable-bold t
        doom-themes-enable-italics t)
  (load-theme 'doom-molokai t)
  (doom-themes-org-config))

(use-package doom-modeline
:init (doom-modeline-mode t)
:custom ((doom-modeline-height 15)))

; default font
(set-face-attribute 'default nil :font "Fira Code Light" :height 125)
; for org documents
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 125 :weight 'regular)
; for code blocks in org documents
(set-face-attribute 'fixed-pitch nil :font "Fira Code Light" :height 125)

(column-number-mode)
(global-display-line-numbers-mode t)

; disable line numbers in some major modes
(dolist (mode '(org-mode-hook
                          term-mode-hook
                          eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq temporary-file-directory "~/.tmp")
  (setq backup-directory-alist `(("." . "~/.saves")))

(setq delete-old-version t
        kept-new-version 6
        kept-old-version 2
        version-contrl t)

(setq custom-file "~/.config/emacs/custom.el")
(load custom-file)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun jodi/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . jodi/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files
        '("~/Documents/Agenda/Tasks.org"
          "~/Documents/Agenda/Birthdays.org")))

(defun jodi/org-mode-visual-fill ()
(setq (visual-fill-collumn-width 100
             visual-fill-column-center-text t)
      (visual-fill-column-mode 1)))
(use-package visual-fill-column
  :hook (org-mode . jodi/org-mode-visual-fill))

(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit 'fixed-pitch)
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number nil :inherit 'fixed-patch)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list'("◉" "○" "●" "○" "●" "○" "●")))

(org-babel-do-load-languages
 'org-babel-load-languages
  '((emacs-lisp . t)))

(setq org-confirm-babel-evaluate nil)

; easy templates for code blocks
(require 'org-tempo)

(add-to-list 'org-structure-template-aliast '("sh" . "src shell"))
(add-to-list 'org-structure-template-aliast '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-aliast '("py" . "src python"))
(add-to-list 'org-structure-template-aliast '("rs" . "src rust"))

;; Automatically tangle our Emacs.org file when we save it
(defun jodi/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/.config/emacs/Emacs.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))
  (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'jodi/org-babel-tangle-config)))

(use-package which-key
:init
(setq which-key-idle-delay 3)
(which-key-mode t))

(use-package counsel
:bind (("M-x" . counsel-M-x)
       ("C-x b" . counsel-ibuffer)
       ("C-x C-f" . counsel-find-file)
       :map minibuffer-local-map
       ("C-r" . 'counsel-minibuffer-history)))

(use-package swiper)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done))
         :config
         (ivy-mode 1))
(use-package ivy-rich
  :init (ivy-rich-mode t))

(use-package helpful
:custom
(counsel-describe-function-function #'helpful-callable)
(counsel-describe-variable-function #'helpful-variable)
:bind
([remap describe-function] . counsel-describe-function)
([remap describe-command] . helpful-command)
([remap describe-variable] . counsel-describe-variable)
([remap describe-key] . helpful-key))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package nix-mode
:mode "\\.nix\\'")
