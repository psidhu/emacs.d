;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize c++-mode                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20201030                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set default c++ mode
(util/add-multi-hook
 '(c++-mode-hook c++-ts-mode-hook)
 '(lambda()
    (c-set-style "ellemtel")
    (setq c-basic-offset 2)
    (setq indent-tabs-mode nil)
    (prog/infer-indentation-style)
    ))
