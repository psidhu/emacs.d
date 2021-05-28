;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize ERC                                                             ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configure ERC directory
(util/mkdir erc-d)

;; You can place multiple of the following types of functions into
;; erc-d/.ercauth.el. Once placed there, you can call them to
;; auto-join channels with your predefined settings.
;;
;; (defun erc/join-example ()
;;   "Join irc.example.com with my personal credentials"
;;   (erc :server "irc.example.com" :port 6667 :nick "User" :password "Pass"))

(if (not (file-exists-p erc-auth-f))
    (message
     (format "%S\n%S"
	     "You can place multiple of the following types of functions into
path erc-d/erc-auth-f. Once placed there, you can call them to
auto-join channels with your predefined settings."

	     "(defun erc/join-example ()
\"Join irc.example.com with my personal credentials\"

(interactive)
(erc-tls :server \"irc.example.com\" :port 6697 :nick \"User\" :password \"Pass\"))"))
  (load erc-auth-f)
  )

;; Configure Logging
(after-load
 'erc
 (util/mkdir erc-logs-d)
 (setq erc-enable-logging t)		      ; Enable logging
 (setq erc-log-channels-directory erc-logs-d) ; Logs dir
 (setq erc-save-buffer-on-part t)	      ; Save on PART
 (setq erc-save-queries-on-quit t)	      ; Save on QUIT
 )
(add-hook 'erc-mode-hook 'erc-log-mode)

;; Configure other settings
(setq erc-max-buffer-size (* 1024 1024)	    ; Set buffer to 1M
      erc-hide-list '("PART" "QUIT" "JOIN") ; Hide PART messages
      )

(setq erc-join-buffer 'bury)		; Bury new buffers

;; Turn on certain modes
(add-hook 'erc-mode-hook 'erc-notifications-mode)
(add-hook 'erc-mode-hook 'erc-truncate-mode)

;; SASL support
(require 'erc-sasl)
(add-to-list 'erc-sasl-server-regexp-list "irc\\.libera\\.chat")

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

;; HACK: Adding the following two function so erc-sasl can work on
;; auto-auth
(defun erc/last-connecting-server-name (server &rest vars)
  "set variable erc/connecting-to-server to SERVER"

  (setq erc/connecting-to-server (prin1-to-string server))
  )
(add-hook 'erc-before-connect 'erc/last-connecting-server-name)

(defun erc-sasl-use-sasl-p ()
  "Used internally to decide whether SASL should be used in the
   current session (PATCHED)"

  (if (eq erc-sasl-use-sasl t)
      (cl-loop for re in erc-sasl-server-regexp-list thereis
	       (integerp (string-match re erc/connecting-to-server)))
    )
  )
