;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize ERC                                                             ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configure ERC directory
(util/mkdir erc-logs-d)

;; Configure Logging
(setq erc-log-channels t                    ; Enable logging
      erc-log-channels-directory erc-logs-d ; Logs dir
      )

;; Configure other settings
(setq erc-max-buffer-size 60000         ; Set buffer to 60k
      erc-hide-list '("PART")           ; Hide PART messages
      )

;; Turn on certain modes
(add-hook 'erc-mode-hook 'erc-notifications-mode)
(add-hook 'erc-mode-hook 'erc-truncate-mode)

(after-load
 'flyspell
 (erc-spelling-enable t)
 )

;; SASL support

(provide '0015-erc.el)
