;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilize ido                                                               ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20180209                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use it
;; change location of file
(setq ido-save-directory-list-file ido-f)

(ido-mode t)                            ; Partial Buffer Search

;; Configure searching
(ido-everywhere t)			; Use IDO everywhere
(setq ido-enable-flex-matching t)	; Use fuzzy match
(setq ido-case-fold t)			; Ignore case

;; Use flx-ido for better fuzzy searching
(when (try-install-pkg 'flx-ido)
  (flx-ido-mode t)
  (setq ido-use-faces nil)		; use flx-ido-use-faces instead
  )

;; Use ido-vertical-mode
(when (try-install-pkg 'ido-vertical-mode)
  (ido-vertical-mode t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only) ; change keys
  (setq ido-vertical-show-count t)		    ; Show hits
  )

;; Use ido-ubiquitous-mode
(when (try-install-pkg 'ido-completing-read+)
  (ido-ubiquitous-mode t)
  )

(setq ido-use-virtual-buffers 'auto)	; Auto use virtual buffers
(defun settings/add-to-ido-work-file-list ()
  "https://emacs.stackexchange.com/questions/26812/
   configuring-the-number-of-buffers-saved-by-ido-using
   -ido-use-virtual-buffers"

  (ido-record-work-file (file-name-nondirectory (buffer-file-name)))
  (ido-record-work-directory (file-name-directory (buffer-file-name))))
(add-hook 'find-file-hook 'settings/add-to-ido-work-file-list)
