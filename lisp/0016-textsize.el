;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure textsize                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20220805                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'textsize)

;; Configure it
(setq textsize-default-points 13)

;; kbd
(global-set-key (kbd "C-M-=") 'textsize-increment)
(global-set-key (kbd "C-M-+") 'textsize-increment)
(global-set-key (kbd "C-M--") 'textsize-decrement)
(global-set-key (kbd "C-M-0") 'textsize-reset)

;; Use it
(textsize-mode t)
