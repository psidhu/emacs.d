;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilize recentf                                                           ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20180118                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install sync-recentf to sync multiple emacs sessions
(install-pkg 'sync-recentf)

;; Periodically save recent file list
(recentf-mode t)
(setq
 recentf-save-file recentf-f
 recentf-max-menu-items 255
 recentf-max-saved-items nil
 recentf-auto-cleanup 'never
 )

;; Use sync recentf
(require 'sync-recentf)

;; Inhibit recentf-save-list spanning my messages
(run-at-time 0 (* 1 60)
             (lambda ()
               (let ((inhibit-message t))
                 (recentf-cleanup))))
