;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize rich-minority                                                   ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171207                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'rich-minority)

;; Use it
(require 'rich-minority)
(rich-minority-mode t)
(setf rm-blacklist "")

(provide '0152-rich-minority)
