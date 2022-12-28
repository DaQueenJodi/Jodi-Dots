;; UTIL
(defvar jodi/config-home (file-name-directory (or load-file-name (buffer-file-name))))
(defun jodi/load (str)
	(load (concat jodi/config-home str)))

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

(use-package diminish) ;; hide mode on the modeline

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


;; preformance
;; based on lsp-doctor
(setf gc-cons-threshold 100000000) ; 100mb
(setf read-process-output-max (* 1024 1024)) ;; 1mb
(setf lsp-use-plists t)

(use-package glsl-mode)

;; keybindings
(defun jodi/copy-line ()
	"Copy the current line"
	(interactive)
	(kill-ring-save (+ (line-beginning-position) (current-indentation))
									(line-end-position))
	(kill-append "\n" t)) ;; append newline to front

(global-set-key (kbd "C-,") 'jodi/copy-line)

(global-set-key (kbd "C-x c") 'compile)

(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-a") 'move-beginning-of-line)


(global-set-key (kbd "C-x f") 'format-all-buffer)

(eval-after-load "dired"
	'(progn
		 (define-key dired-mode-map (kbd "C") 'dired-do-copy)
		 (define-key dired-mode-map (kbd "c") 'dired-create-empty-file)))

(global-set-key (kbd "C-<tab>") 'company-complete)


(jodi/load "programming.el")

;; modeline
(setq-default mode-line-format
							(list
							 "%b "
							 "%P "
							 mode-line-modes))
