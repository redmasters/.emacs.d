;;Arquivo de Configuração do emacs
;;Objetivo: Fazer uma IDE completa like VScode
;;TO-DO:
;;Abas, autocomplete(em todas as linguagens), icones, atalhos amigaveis,
;;Integracao com o github dentre outras necessidades que forem surgindo

;;Remover boas vindas
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



;; MELPA - repositorio
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))



(package-initialize); Iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;Pacote para testar outros pacotes sem instalar
(use-package try
  :ensure t)


;;ATALHOS AMIGAVEIS
(global-set-key (kbd "C-<tab>") 'other-window);Alternar janelas

;;Ergo Emacs - Com os atalhos mais comuns dos editores.
;;CopyPaste, Save, etc
(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)))



;;Gerenciamento de Janelas

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))



;;AUTO-COMPLETE
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;;Gerenciamento de Arquivos/Projetos
(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if(display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle)));;Atalho CTRL + \

;;Temas/Cores/etc
;;Icones
(use-package all-the-icons
  :ensure t)

;;Tema atual
(use-package monokai-theme
  :ensure t
  :config (load-theme 'monokai t))

;;Abas
;;Centaur TABS
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




;;Coisas do MELPA
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ergoemacs-mode ergomacs-mode ace-window all-the-icons neotree try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
