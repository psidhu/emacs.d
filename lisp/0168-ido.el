;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilize ido                                                               ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20180209                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use it
(ido-mode t)                            ; Partial Buffer Search

;; Configure searching
(ido-everywhere t)			; Use IDO everywhere
(setq ido-enable-flex-matching t)	; Use fuzzy match
(setq ido-case-fold t)			; Ignore case

(setq ido-use-virtual-buffers 'auto)	; Auto use virtual buffers
(defun settings/add-to-ido-work-file-list ()
  "https://emacs.stackexchange.com/questions/26812/
   configuring-the-number-of-buffers-saved-by-ido-using
   -ido-use-virtual-buffers"

  (ido-record-work-file (file-name-nondirectory (buffer-file-name)))
  (ido-record-work-directory (file-name-directory (buffer-file-name))))
(add-hook 'find-file-hook 'settings/add-to-ido-work-file-list)
