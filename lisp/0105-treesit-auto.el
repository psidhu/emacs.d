;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure treesit-auto                                                    ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20230731                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (when (version< emacs-version "29.1")
;;   (error "treesit-auto requires v29.1 or higher"))

;; Install it
(install-pkg 'treesit-auto)

;; Use it
;; treesit-auto doesn't have autoloads so have to require it
(require 'treesit-auto)

(setq treesit-auto-install 'prompt)
;; (global-treesit-auto-mode)
