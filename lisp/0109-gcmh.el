;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GCMH                                                                      ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20190503                                                            ;;
;; Notes: This is Koral's garbage collector magic hack                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'gcmh)

;; Use it
(gcmh-mode t)

;; Set limits
(setq gcmh-low-cons-threshold (* 20 (* 1024 1024)))   ;Set it to 20mb
(setq gcmh-high-cons-threshold (* 256 (* 1024 1024))) ;Set it to 256mb
