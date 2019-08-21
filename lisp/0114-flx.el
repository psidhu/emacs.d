;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilize ido                                                               ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20180209                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'flx)

;; Use it

;; Use flx isearch and replace built-in regex searching
(when (try-install-pkg 'flx-isearch)
  (global-set-key (kbd "C-M-s") #'flx-isearch-forward)
  (global-set-key (kbd "C-M-r") #'flx-isearch-backward)
  )
