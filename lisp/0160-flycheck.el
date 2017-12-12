;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure flycheck                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171212                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'flycheck)

;; Install system tools You should have: clang, cppcheck, pylint,
;; eslint installed on the system to make use of these linters. See
;; http://www.flycheck.org/en/latest/languages.html#flycheck-languages

;; Use it
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Configure it
(setq
 ;; parse buffer 3s after a change
 flycheck-check-syntax-automatically '(mode-enabled idle-change)
 flycheck-idle-change-delay '3
 )
