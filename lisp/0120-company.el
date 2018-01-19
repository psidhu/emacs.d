;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure company                                                         ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install company
(install-pkg 'company)

;; Use it
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Configure keys
(after-load
 'company
 (define-key company-mode-map (kbd "M-/") 'company-complete)
 (define-key company-active-map (kbd "M-/") 'company-select-next)
 (define-key company-active-map (kbd "C-n") 'company-select-next)
 (define-key company-active-map (kbd "C-p") 'company-select-previous)
 (setq-default company-dabbrev-other-buffers 'all
	       company-tooltip-align-annotations t
	       )
 (add-to-list 'company-backends 'company-yasnippet)
 )

;; Configure and install company add-ons
(when (try-install-pkg 'company-quickhelp) ; quickhelp
  (add-hook 'after-init-hook 'company-quickhelp-mode)
  )

(when (try-install-pkg 'company-auctex) ; auctex
  (after-load
   'company
   (company-auctex-init)
   )
  )

(when (try-install-pkg 'company-c-headers) ; c-headers
  (after-load
   'company
   (add-to-list 'company-backends 'company-c-headers)
   )
  )

(when (try-install-pkg 'company-lua)    ; lua
  (after-load
   'company
   (add-to-list 'company-backends 'company-lua)
   )
  )

(when (try-install-pkg 'company-math)   ; math
  (after-load
   'company
   (add-to-list 'company-backends 'company-math-symbols-unicode)
   )
  )

(when (try-install-pkg 'company-shell)  ; shell
  (after-load
   'company
   (add-to-list 'company-backends 'company-shell)
   )
  )

(when (try-install-pkg 'company-statistics) ; statistics
  (after-load
   'company
   (add-hook 'after-init-hook 'company-statistics-mode)
   )
  )

(when (try-install-pkg 'company-web)    ; web
  (after-load
   'company
   (add-hook 'after-init-hook 'company-web-html)
   )
  )
