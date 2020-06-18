;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure company                                                         ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install company
(install-pkg 'company)

;; Use it
(company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

;; Configure keys
(after-load 'company
  (define-key company-mode-map (kbd "M-/") 'company-complete)
  (define-key company-active-map (kbd "M-/") 'company-select-next)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq-default company-dabbrev-other-buffers 'all
		company-tooltip-align-annotations t
		company-idle-delay 0
		company-begin-commands '(self-insert-command)
		)

  ;; Hard set default company
  (setq company-backends
	'((company-files company-keywords company-capf company-yasnippet)
	  (company-abbrev company-dabbrev)
	  ))
  )

;; Use company-flx
(when (try-install-pkg 'company-flx)
  (with-eval-after-load 'company
    (company-flx-mode +1))
  )

;; Configure and install company add-ons
(when (try-install-pkg 'company-quickhelp) ; quickhelp
  (add-hook 'after-init-hook 'company-quickhelp-mode)
  (after-load 'company-quickhelp
    (setq company-quickhelp-delay 0.1))
  )

(when (try-install-pkg 'company-statistics) ; statistics
  (after-load 'company
    (setq company-statistics-file company-stat-f)
    (add-hook 'after-init-hook 'company-statistics-mode)
    )
  )

;; Backends
;;
;; Company backends are kind of dumb, IMO. For example,
;; company-anaconda won't automatically load, even if it's in the
;; list, but there's something (e.g. company-clang) in there as well,
;; even if it comes first in the list. I'm just going to force each
;; backend per mode as req'd

;; Use company-irony
(when (try-install-pkg 'company-irony)
  (when (try-install-pkg 'company-irony-c-headers)
    (after-load 'company
      (add-hook 'irony-mode-hook
		(lambda ()
		  (set (make-local-variable 'company-backends)
		       '((company-irony-c-headers company-irony
			  company-yasnippet company-keywords
			  company-gtags)))))
      )
    )
  )

(when (try-install-pkg 'company-auctex) ; auctex
  (after-load 'company
    (add-hook 'tex-mode-hook
	      (lambda ()
		(company-auctex-init)))
    (add-hook 'latex-mode-hook
	      (lambda ()
		(company-auctex-init)))
    (when (try-install-pkg 'company-math)   ; math
      (after-load 'company
	(add-to-list 'company-backends 'company-math-symbols-unicode)
	)
      )
    )
  )

(when (try-install-pkg 'company-lua)    ; lua
  (after-load 'company
    (add-hook 'irony-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-backends)
		     '((company-lua company-yasnippet company-keywords)))))
    )
  )

(when (try-install-pkg 'company-shell)  ; shell
  (after-load 'company
    (add-hook 'sh-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-backends)
		     '(company-shell company-shell-env
		       company-yasnippet company-keywords))))
    (add-hook 'shell-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-backends)
		     '(company-shell company-shell-env))))
    )
  )

(when (try-install-pkg 'company-anaconda)  ; anaconda
  (after-load 'company
    (add-hook 'python-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-backends)
		     '((company-anaconda company-yasnippet company-keywords)))))
    )
  )

(when (try-install-pkg 'company-web)    ; web
  (after-load 'company
    (add-hook 'web-mode-hook
	      (lambda ()
		(set (make-local-variable 'company-backends)
		     '((company-web-html company-yasnippet company-keywords)))))
    )
  )
