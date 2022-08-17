;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure smart-mode-line                                                 ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20190821                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'smart-mode-line)

;; Customize it
(setq sml/shorten-directory t)
(setq sml/name-width '(1 . 44))
(setq sml/mode-width 'full)

(setq sml/show-client t)
(setq sml/vc-mode-show-backend t)

;; Use it
(sml/setup)

;; Customize it some more
(add-to-list 'sml/replacer-regexp-list '("^~/src/" ":SRC:") t)
