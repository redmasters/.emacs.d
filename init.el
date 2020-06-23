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

;;html-packs
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
	'(("django" . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

  (setq web-mode-enable-auto-closing t))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
;;Efeitos do web-mode
(setq web-mode-folded-face 1)

(use-package impatient-mode
  :ensure t
  :config
  )


;; Tema

(use-package rebecca-theme
  :ensure t
  :config (load-theme 'rebecca t))
  

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
 '(package-selected-packages
   (quote
    (impatient-mode web-mode flycheck-irony flycheck rebecca-theme molokai-theme ace-window neotree which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




