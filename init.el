(set-frame-parameter nil 'fullscreen 'fullboth)

(package-initialize)

(require 'package)

(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-refresh-contents)

(package-install 'better-defaults)
(package-install 'all-the-icons)
(package-install 'clojure-mode)
(package-install 'cider)
(package-install 'paredit)
(package-install 'rainbow-delimiters)
(package-install 'company)
(package-install 'projectile)
(package-install 'neotree)
(package-install 'terraform-mode)
(package-install 'magit)
(package-install 'solarized-theme)
(package-install 'exec-path-from-shell)

(setq ring-bell-function 'ignore)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(setq make-backup-files nil)
(setq auto-save-default nil)

(set-default-font "Monospace-18")

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (s/fdef 1)))

(put 'defcomponent 'clojure-doc-string-elt 2)
(put 'defapi 'clojure-doc-string-elt 2)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook
	  (lambda () (local-set-key (kbd "C-c C-n") (kbd "C-u C-c M-z"))))
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'projectile-global-mode)

(setq cider-repl-pop-to-buffer-on-connect 'display-only)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-toggle-window-keep-p t)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq company-idle-delay nil)
(setq company-require-match 'never)

(global-set-key (kbd "C-x t") 'neotree-toggle)
(global-set-key (kbd "C-x C-t") 'neotree-show)
(global-set-key (kbd "TAB") 'company-indent-or-complete-common)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(load-theme 'solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell solarized-theme magit terraform-mode neotree projectile all-the-icons clojure-mode rainbow-delimiters paredit noctilux-theme company cider better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
