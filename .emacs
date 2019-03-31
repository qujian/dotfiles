;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
;(set-face-attribute
; 'default nil :font "Consolas-14.5")
; 'default nil :font "Monaco 14")

;; Chinese Font 配制中文字体
(if window-system
    (set-face-attribute 'default nil :font "Consolas-14.5"
;    (set-fontset-font "fontset-default" 'unicode '("WenQuanYi Zen Hei" . "unicode-ttf")
    )
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			(font-spec :family "Consolas" :size 14)
;			(font-spec :family "PingFang SC" :size 14)
       )
     )
)

;; Note: you can chang "PingFang SC" to "Microsoft YaHei" or other fonts

;; Fonts in Mac OS X

;;参考  http://border.iteye.com/blog/119143

(setq default-directory "~/")

(add-to-list 'custom-theme-load-path ".emacs.d/themes/molokai-theme/")
;(setq molokai-theme-kit t)
(load-theme 'molokai t)

;; 去掉toolbar
(if window-system  (tool-bar-mode 0))

;; 显示行号
(global-linum-mode t)

;;显示当前所在的行号和列号
(column-number-mode t)

;;禁用启动信息
(setq inhibit-startup-message t)

;;不产生备份文件
(setq make-backup-files nil)

;;Linux special config to enable Ctrl-Space command
;(global-unset-key (kbd "C-SPC"))
;(global-set-key (kbd "C-c") 'set-mark-command)
;;参考 http://border.iteye.com/blog/119143

;;Load plugins
;(add-to-list 'load-path "~/.emacs.d/plugins")

;;Erlang mode
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-3.0.2/emacs" load-path))
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
(add-to-list 'load-path ".emacs.d/elpa/auto-complete-20150408.1132/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories ".emacs.d/elpa/auto-complete-20150408.1132/ac-dict")
(ac-config-default)


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

;(custom-set-variables
'(ede-project-directories (quote ("/Volumes/MacintoshHD/qujian/user/lkghot/htdocs")))
;)
;(custom-set-faces
; )

;;php-mode-improve
(setq c-default-style "linux")

;;el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


;; Language Server Protocol Tests
(require 'lsp-mode)

;; Enable code completion
(require 'company-lsp)

;; Connect to an already started language server
(lsp-define-tcp-client
 lsp-erlang-mode
 "erlang"
 (lambda () default-directory)
 '("/usr/bin/false")
 "localhost"
 9000)

(add-hook 'erlang-mode-hook 'company-mode)
(add-hook 'erlang-mode-hook (lambda ()
                              (push 'company-lsp company-backends)))
(add-hook 'erlang-mode-hook 'lsp-erlang-mode-enable)

(add-hook 'js2-mode-hook 'ac-js2-mode)
(projectile-mode 1)
(yas-global-mode 1)
