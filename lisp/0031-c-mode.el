;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize c-mode                                                          ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set default c mode
(add-hook 'c-mode-hook
	  '(lambda()
	     (c-set-style "linux")
	     (setq c-basic-offset 2)
	     (prog/infer-indentation-style)
	     ))

;; (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
