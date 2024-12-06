;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clang-format                                                              ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20241021                                                            ;;
;;                                                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install clang-format
(install-pkg 'clang-format)

;; Set up clang-format
(add-hook 'prog-mode-hook
	  (lambda ()
	    (clang-format-on-save-mode t)))

(global-set-key [C-M-tab] 'clang-format-region)
