;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize c++-mode                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20201030                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set default c++ mode
(add-hook 'c++-mode-hook
	  '(lambda()
	     (c-set-style "ellemtel")
	     (setq c-basic-offset 2)
	     (setq indent-tabs-mode nil)
	     (prog/infer-indentation-style)
	     ))
