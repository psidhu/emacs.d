;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize magit                                                           ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'magit)

;; Configure it
(after-load
 'flyspell
 (add-hook 'magit-commit 'turn-on-flyspell)
 (add-hook 'magit-commit-fixup 'turn-on-flyspell)
 )

(provide '0136-magit)
