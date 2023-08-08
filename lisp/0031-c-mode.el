;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize c-mode                                                          ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set default c mode
(add-hook 'c-mode-hook
	  '(lambda()
	     (c-set-style #'linux)
	     (prog/infer-indentation-style)
	     ))

(add-hook 'c-ts-mode-hook
	  '(lambda()
	     (c-ts-mode-set-style #'linux)
	     (prog/infer-indentation-style)
	     ))
