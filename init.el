(setq visible-bell t)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(tool-bar-mode -1)
;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes
   '(doom-material-dark doom-gruvbox-light doom-dark+ doom-xcode modus-vivendi-deuteranopia))
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "7887cf8b470098657395502e16809523b629249060d61607c2225d2ef2ad59f5" "01ca8e215adc3a3221b42db10218dd181244e2971071207a384daeb9cbf31e58" "cca1d386d4a3f645c2f8c49266e3eb9ee14cf69939141e3deb9dfd50ccaada79" default))
 '(global-evil-surround-mode t)
 '(org-agenda-files
   '("C:/Users/pghole/OneDrive - Horizon Global/Documents/Projects/Plan/Agenda.org"))
 '(package-selected-packages
   '(ox-reveal reveal-in-osx-finder ob-mermaid mermaid-mode company plantuml-mode magit which-key-posframe evil-surround ox-hugo dracula-theme vertico org-roam evil modus-themes doom-modeline ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

(load-theme 'dracula t)
;; set evil mode
(require 'evil)
(evil-mode 1)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Line number
(global-display-line-numbers-mode 1)

;;Org agenda

;;Org hugo
(with-eval-after-load 'ox
  (require 'ox-hugo))
;; Which key

(which-key-mode)

;;org roam
(setq org-roam-directory "D:/Prasad/org-roam")
(org-roam-db-autosync-mode)
(setq org-roam-node-display-template
      (concat "${title:*} "
	      (propertize "${tags:10}" 'face 'org-tag)))

;; Completion
(use-package vertico
  :ensure t
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("C-f" . vertico-exit)
	      :map minibuffer_kill-word)
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

;; mermaid
(setq ob-mermaid-cli-path "d:/Software/scoop/apps/nodejs18/18.18.1/bin/mmdc") 
;; Completion

;; Spell check
(require 'flyspell)
(flyspell-mode t)
;; IDE features

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;;UI and themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Programming
(setq org-plantuml-jar-path (expand-file-name "~/plantuml.jar"))
(setq plantuml-default-exec-mode 'library)
(setq org-confirm-bable-evaluate nil)
(setq org-display-inline-image t)
(org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (plantuml . t)
  ))
;; Show org agenda on every starup
;; https://stackoverflow.com/questions/2010539/how-can-i-show-the-org-mode-agenda-on-emacs-start-up
(defun show-org-agenda ()
  (interactive)
  (org-agenda nil "a")
  (delete-other-windows)
  )
;;(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'show-org-agenda)


;;emacs reveal.js
(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "http://cd.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjx t)
(use-package htmlize
  :ensure t)
