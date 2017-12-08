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
(require 'erc-sasl)
(add-to-list 'erc-sasl-server-regexp-list "irc\\.freenode\\.net")

;; https://github.com/john2x/emacs.d/blob/master/init.org
(defun erc-login ()
  "Perform user authentication at the IRC server. (PATCHED)"
  (erc-log (format "login: nick: %s, user: %s %s %s :%s"
		   (erc-current-nick)
		   (user-login-name)
		   (or erc-system-name (system-name))
		   erc-session-server
		   erc-session-user-full-name))
  (if erc-session-password
      (erc-server-send (format "PASS %s" erc-session-password))
    (message "Logging in without password"))
  (when (and (featurep 'erc-sasl) (erc-sasl-use-sasl-p))
    (erc-server-send "CAP REQ :sasl"))
  (erc-server-send (format "NICK %s" (erc-current-nick)))
  (erc-server-send
   (format "USER %s %s %s :%s"
	   ;; hacked - S.B.
	   (if erc-anonymous-login erc-email-userid (user-login-name))
	   "0" "*"
	   erc-session-user-full-name))
  (erc-update-mode-line))

(provide '0015-erc.el)
