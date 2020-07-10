;Remover boas vindas
(setq inhibit-startup-message t)

;;Remover Menus
(tool-bar-mode -1)
(menu-bar-mode -1)
;;Remover barra de rolagem
(scroll-bar-mode -1)

;;Linhas numeradas
(global-linum-mode t)

;;Tamanho da fonte
(set-face-attribute 'default nil :height 150)

;;Pacotes
(require 'package)
(setq package-enable-at-startup nil);Desabilitar inicializacao de pacotes

                    ; MELPA - repositorio
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))



(package-initialize); Iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (progn
   (which-key-setup-side-window-right-bottom)
   (which-key-mode)
   ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))


;;Javascript autocomplete
(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
  )

(use-package flex-autopair
  :ensure t)
(flex-autopair-mode 1)



;;centaur TABS
(use-package centaur-tabs
  :ensure t
  :config
  (setq centaur-tabs-set-bar 'over
	centaur-tabs-set-icons t
	centaur-tabs-height 24
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*")
	centaur-tabs-style "box"
  (centaur-tabs-mode t))

;;Checagem de Sintaxe

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t)
  )

;(use-package flycheck-irony
 ; :ensure t
 ; :init (global-flycheck-irony-mode t)
 ; )

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle))); CTRL+\


(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)))

;;YASnippet
(use-package yasnippet
  :ensure t
  :config
  (progn
    (yas-global-mode 1)))

;;html-packs
(use-package markdown-mode
  :hook (markdown-mode . visual-line-mode))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css\\'"   . web-mode)
         ("\\.jsx?\\'"  . web-mode)
         ("\\.tsx?\\'"  . web-mode)
         ("\\.json\\'"  . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2) ; HTML
  (setq web-mode-css-indent-offset 2)    ; CSS
  (setq web-mode-code-indent-offset 2)   ; JS/JSX/TS/TSX
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

;;Efeitos do web-mode
(setq web-mode-folded-face 1)

(use-package impatient-mode
  :ensure t
  :config
  )

(use-package emmet-mode
  :ensure t)

;;Git - Magit
(use-package magit
  :ensure t
  :config
  )
(global-set-key (kbd "C-x g") 'magit-status)

;; Tema

(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))


;;Atalhos
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>")'enlarge-window-horizontally)



;;Coisas do MELPA
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" default)))
 '(package-selected-packages
   (quote
    (js2-mode monokai-themes company-posframe centaur-tabs doom-themes better-defaults Better-Defaults evil org-mode magit yasnippet impatient-mode web-mode flycheck-irony flycheck rebecca-theme molokai-theme ace-window neotree which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
