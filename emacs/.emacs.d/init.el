;; Increase GC threshold on start
(setq gc-cons-threshold (* 128 1024 1024))
;; Then lower the value on normal run
(add-hook 'emacs-startup-hook
	  (lambda()
	    (setq gc-cons-threshold (* 16 1024 1024))))



(when system-type 'darwin
      ;; Set mac command and option modifier
      (setq mac-command-modifier 'super
	    mac-option-modifier 'meta)

      ;; Create natural title bar
      (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
      (add-to-list 'default-frame-alist '(ns-appearance . dark))

      (setq ns-use-proxy-icon nil
	    frame-title-format nil))

;; Keep the UI simple
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode)
;; Don't use ==linum.el==. ==display-line-numbers.el== instead
(global-display-line-numbers-mode)



;; Font
(custom-theme-set-faces 'user
			'(default ((t (:family "Liga SFMono Nerd Font" :height 120 :weight medium))))
			'(fixed-pitch ((t (:family "Liga SFMono Nerd Font" :height 120 :weight medium))))
			'(variable-pitch ((t (:family "SF Pro Text" :height 140 :weight medium)))))



;; Some hooks
(add-hook 'help-mode-hook
	  (lambda()
	    (display-line-numbers-mode 0)))

(add-hook 'org-mode-hook
	  (lambda()
	    (display-line-numbers-mode 0)
	    (variable-pitch-mode)
	    (visual-line-mode)))

(add-hook 'term-mode-hook
	  (lambda()
	    (display-line-numbers-mode 0)))

;; Easy zooming in and out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
