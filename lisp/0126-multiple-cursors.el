;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize multiple-cursors                                                ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'multiple-cursors)

;; Custom global key bindings
(global-set-key (kbd "C-c [") 'mc/edit-lines)
(global-set-key (kbd "C-c ]") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c ;") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c '") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c g") 'mc/keyboard-quit)
(global-set-key (kbd "C-c i") 'mc/insert-numbers)

(provide '0126-multiple-cursors)
