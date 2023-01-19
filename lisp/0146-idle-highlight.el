;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure idle-highlight-mode                                             ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20230119                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'idle-highlight-mode)

;; Use it
(add-hook 'after-init-hook 'idle-highlight-global-mode)

;; Configure it
(after-load 'idle-highlight-mode
  (setq idle-highlight-visible-buffers t)
  (setq idle-highlight-idle-time 0)
  (setq idle-highlight-exclude-point t)
  (set-face-attribute 'idle-highlight nil :foreground "SpringGreen3" :weight 'bold)
  )
