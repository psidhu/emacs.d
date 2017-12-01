;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure org mode                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make sure directory is created
(util/mkdir org-d)

;; Remove from built-in list
(delete (package-installed-p 'org) package--builtins)

;; Install it
(install-pkg 'org)
(install-pkg 'org-beautify-theme)

;; Use it

;; Configure it
;; Use flyspell check in org
(after-load
 'flyspell
 (add-hook 'org-mode-hook 'turn-on-flyspell)
 )

;; Load the proper theme
(after-load
 'org
 (load-theme 'org-beautify)
 )

;; Configure clock-persist
(setq org-clock-persist 'history
      org-clock-persist-file org-clock-f)
(org-clock-persistence-insinuate)

(setq org-src-fontify-natively t)

(provide '0134-org)
