;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure evil-numbers                                                   ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'evil-numbers)

;; Use it
(global-set-key (kbd "C-c p") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c m") 'evil-numbers/dec-at-pt)

(provide '0140-evil-numbers)
