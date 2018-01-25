;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilize recentf                                                           ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20180118                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install sync-recentf to sync multiple emacs sessions
(install-pkg 'sync-recentf)

;; Periodically save recent file list
(recentf-mode t)
(setq recentf-max-menu-items (* 2 1024))
(run-at-time nil (* 5 60) 'recentf-save-list)

(setq recentf-auto-cleanup (* 1 90))	; Run auto-cleanup every 90s

;; Use sync recentf
(require 'sync-recentf)
