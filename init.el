
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-refresh-contents)

(package-install 'better-defaults)
(package-install 'clojure-mode)
(package-install 'cider)
(package-install 'paredit)
(package-install 'rainbow-delimiters)
(package-install 'company)
(package-install 'noctilux-theme)

(setq ring-bell-function 'ignore)
(set-frame-parameter nil 'fullscreen 'fullboth)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

(setq make-backup-files nil)
(setq auto-save-default nil)

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (s/fdef 1)))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'after-init-hook 'global-company-mode)

(load-theme 'noctilux t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (noctilux-theme company rainbow-delimiters paredit cider clojure-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
