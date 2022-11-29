;; no start message
(setq inhibit-startup-message t)

(scroll-bar-mode -1)  ;; disable visual scrollbar
(tool-bar-mode -1)    ;; disable the toolbar
(tooltip-mode -1)     ;; disable tooltips
(set-fringe-mode 10)  ;; give some breathing room

(menu-bar-mode -1)    ;; disable menu bar

;; package manager
(require 'package)
(package-initialize)

;; set visual bell
(setq visible-bell t)

;; font
(set-face-attribute 'default nil :font "Liga ComicCodeLigatures Nerd Font")

;; make esc quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; theme catppuccin
(use-package autothemer
  :ensure t)
(load-theme 'catppuccin-frappe t)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-modeline use-package counsel command-log-mode catppuccin-theme autothemer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
