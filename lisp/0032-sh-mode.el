;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize sh-mode                                                         ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn on sh-mode with certain file extensions
(util/hook-ext-to-mode "bash" 'sh-mode)		; bash
(util/hook-ext-to-mode "bash_aliases" 'sh-mode)	; bash

(util/hook-ext-to-mode "bb" 'sh-mode)	    ; OpenEmbedded
(util/hook-ext-to-mode "bbappend" 'sh-mode) ; OpenEmbedded
