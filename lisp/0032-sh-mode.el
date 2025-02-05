;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize sh-mode                                                         ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Change style
(setq sh-basic-offset 2)

;; No tabs in sh-mode
(add-hook 'sh-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

;; Turn on sh-mode with certain file extensions
(util/hook-ext-to-mode "bash" 'sh-mode)		; bash
(util/hook-ext-to-mode "bash_aliases" 'sh-mode)	; bash

(util/hook-ext-to-mode "bb" 'sh-mode)	    ; OpenEmbedded
(util/hook-ext-to-mode "bbappend" 'sh-mode) ; OpenEmbedded

;; (add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
