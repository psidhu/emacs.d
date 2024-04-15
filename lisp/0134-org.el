;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure org mode                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make sure directory is created
(util/mkdir org-d)

;; This _should_ be unnecessary now with package-install-upgrade-built-in
;; Remove from built-in list
;; (delete (package-installed-p 'org) package--builtins)

;; Install it
(install-pkg 'org)
(install-pkg 'org-bullets)

;; Use it
;; Configure it
;; Set agenda directory to org-lyfe if it exists
(if (file-exists-p org-lyfe-d)
    ;; Not recursive
    (setq org-agenda-files `(,org-lyfe-d))
  )

;; Configure clock-persist
(setq org-clock-persist 'history
      org-clock-persist-file org-clock-f)
(org-clock-persistence-insinuate)

(setq org-src-fontify-natively t)
(setq org-return-follows-link t)
(setq org-startup-indented t)
(setq org-indent nil)

;; Local hooks
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)

;; Babel
(setq org-plantuml-jar-path (expand-file-name "/usr/local/bin/plantuml.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
