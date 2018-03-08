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

(put 'defcomponent 'clojure-doc-string-elt 2)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'after-init-hook 'global-company-mode)

(load-theme 'noctilux t)
