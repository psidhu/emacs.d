;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure idle-highlight-mode                                             ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171207                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'idle-highlight-mode)

;; Use it
(define-globalized-minor-mode global-idle-highlight-mode
  idle-highlight-mode idle-highlight-mode)
(global-idle-highlight-mode t)

;; Configure it
(setq idle-highlight-idle-time 0.2)

(provide '0146-idle-highlight-mode)
