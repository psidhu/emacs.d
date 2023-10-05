;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure ggtags                                                          ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20200220                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'ggtags)

;; Use it only if global is installed on system
(if (executable-find "global")
    (util/add-multi-hook '(c-mode-hook c-ts-mode-hook)
	      (lambda ()
		(when (derived-mode-p 'c-ts-mode 'c++-ts-mode
				      'java-ts-mode 'asm-ts-mode
				      'c-mode 'c++-mode
				      'java-mode 'asm-mode)
		  (ggtags-mode 1))))
  )

(after-load 'ggtags
  (setq ggtags-use-idutils t)
  (setq ggtags-sort-by-nearness t)
  (setq ggtags-oversize-limit (* ggtags-oversize-limit 10))
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (setq ggtags-global-window-height 16)
  )
