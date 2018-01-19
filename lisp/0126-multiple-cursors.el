;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize multiple-cursors                                                ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'multiple-cursors)

;; Custom global key bindings
(global-set-key (kbd "C-c m c g") 'mc/keyboard-quit)
(global-set-key (kbd "C-c m c l") 'mc/edit-lines)
(global-set-key (kbd "C-c m c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m c r") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c m c s") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m c i n") 'mc/insert-numbers)
(global-set-key (kbd "C-c m c i l") 'mc/insert-letters)
