;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure company                                                         ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install company
(install-pkg 'company)

;; Install company-fuzzy (must load after setting company-backends)
(try-install-pkg 'company-fuzzy)

;; Use it
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
  )

(when (try-install-pkg 'company-box) ; quickhelp
  (add-hook 'company-mode-hook 'company-box-mode)
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
		  (setq-local company-backends
			      '((company-capf
				 company-irony company-irony-c-headers company-clang
				 :with
				 company-dabbrev-code company-gtags company-yasnippet
				 company-dabbrev company-keywords company-files)))
		  )
		)
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
    (add-hook 'lua-mode-hook
	      (lambda ()
		(setq-local company-backends
			    '((company-capf
			       company-lua
			       :with
			       company-dabbrev-code company-gtags company-yasnippet
			       company-dabbrev company-keywords company-files)))
		)
	      )
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
		(setq-local company-backends
			    '((company-capf
			       company-anaconda
			       :with
			       company-dabbrev-code company-gtags company-yasnippet
			       company-dabbrev company-keywords company-files)))
		)
	      )
    )
  )

(when (try-install-pkg 'company-web)    ; web
  (after-load 'company
    (add-hook 'web-mode-hook
	      (lambda ()
		(setq-local company-backends
			    '((company-capf
			       company-web-html
			       :with
			       company-dabbrev-code company-gtags company-yasnippet
			       company-dabbrev company-keywords company-files)))
		)
	      )
    )
  )

(when (try-install-pkg 'company-glsl)    ; glsl
  (after-load 'company
    (add-hook 'glsl-mode-hook
	      (lambda ()
		(setq-local company-backends
			    '((company-capf
			       company-glsl
			       :with
			       company-gtags company-yasnippet
			       company-dabbrev company-keywords company-files)))
		)
	      )
    )
  )

(when (try-install-pkg 'company-org-block)  ; anaconda
  (after-load 'company
    (add-hook 'org-mode-hook
	      (lambda ()
		(setq-local company-backends
			    '((company-capf
			       company-org-block
			       :with
			       company-dabbrev-code company-gtags company-yasnippet
			       company-dabbrev company-keywords company-files)))
		)
	      )
    )
  )
