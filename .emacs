;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
(set-face-attribute 'default nil :font "SF Mono 14")
; "Consolas-14.5"
; "Monaco 14"

(setq default-directory "~/")

;; 去掉toolbar
(if window-system  (tool-bar-mode 0))
;; 用空格替代Tab
(setq-default indent-tabs-mode nil);
;; 显示行号
(global-linum-mode t)

;;显示当前所在的行号和列号
(column-number-mode t)

;;禁用启动信息
(setq inhibit-startup-message t)

;;不产生备份文件
(setq make-backup-files nil)

;;隐藏scroll-bar
(setq scroll-bar-mode nil)
;;Linux special config to enable Ctrl-Space command
;(global-unset-key (kbd "C-SPC"))
;(global-set-key (kbd "C-c") 'set-mark-command)
;;参考 http://border.iteye.com/blog/119143


;;Load plugins
;(add-to-list 'load-path "~/.emacs.d/plugins")

;;Erlang mode
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-3.1/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

;;PHP mode
;(add-to-list 'load-path ".emacs.d/plugins/php-mode-1.5.0")
;(require 'php-mode)

;(autoload 'asp-mode "asp-mode")
;(setq auto-mode-alist 
;  (cons '("\\.asp\\'" . asp-mode) auto-mode-alist))

;;Markdown mode
;(add-to-list 'load-path ".emacs.d/plugins/markdown-mode")
;(require 'markdown-mode)

;(autoload 'markdown-mode "markdown-mode"
;   "Major mode for editing Markdown files" t)
;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; MELPA repository - http://melpa.org
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line

;;auto-complete
;(add-to-list 'load-path ".emacs.d/elpa/auto-complete-20150408.1132/")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories ".emacs.d/elpa/auto-complete-20150408.1132/ac-dict")
;(ac-config-default)


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (add-to-list 'package-archives'
	       ("elpa" . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives'
	       ("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives'
	       ("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize))

;;php-mode-improve
(setq c-default-style "linux")

;; Language Server Protocol Tests
(require 'lsp-mode)

;; Enable code completion
;(require 'company-lsp)

;; Connect to an already started language server
;(lsp-define-tcp-client
; lsp-erlang-mode
; "erlang"
; (lambda () default-directory)
; '("/usr/bin/false")
; "localhost"
; 9000)

;(add-hook 'erlang-mode-hook 'company-mode)
;(add-hook 'erlang-mode-hook (lambda ()
;                              (push 'company-lsp company-backends)))
;(add-hook 'erlang-mode-hook 'lsp-erlang-mode-enable)

;(add-hook 'js2-mode-hook 'ac-js2-mode)
;(projectile-mode 1)
                                        ;(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(package-selected-packages (quote (lsp-mode color-theme-solarized))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path "~/.emacs/elpa/color-theme-solarized-20171024.1525/")
(load-theme 'solarized t)
