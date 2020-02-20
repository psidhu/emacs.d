;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure idle-highlight-in-visible-buffers                               ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20200218                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'idle-highlight-in-visible-buffers-mode)

;; Use it
;; (add-hook 'after-init-hook 'idle-highlight-in-visible-buffers-mode)
;; (add-hook 'prog-mode-hook 'idle-highlight-in-visible-buffers-mode)

;; Configure it

(after-load 'idle-highlight-in-visible-buffers-mode
  (setq idle-highlight-in-visible-buffers-idle-time 0.2)
  (set-face-attribute 'idle-highlight-in-visible-buffers nil :foreground "SpringGreen3" :weight 'bold)
  )
