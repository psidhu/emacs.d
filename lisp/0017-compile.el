;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Changes emacs compile behavior                                            ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20230617                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq compilation-scroll-output t)
;;(setq compilation-scroll-output 'first-error)
(setq compilation-window-height 10)

(defvar my/auto-hide-compile-buffer-delay 2)
(defvar my/compilation-exit-code 0)

(defun my/compilation-exit-message-function (status_ code msg)
  (setq my/compilation-exit-code code)
  (cons msg code))

;; https://stackoverflow.com/questions/11043004/emacs-compile-buffer-auto-close
(defun my/hide-compile-buffer-if-successful (buffer string)
  (unless
      (string= (buffer-name buffer) "*compilation*")
    (error "not compilation buffer, won't auto-close")
    )

  (setq compilation-total-time (time-subtract nil compilation-start-time))
  (setq time-str (concat " (Time: " (format-time-string "%s.%3N" compilation-total-time) "s)"))

  (if
      (with-current-buffer buffer
        (setq warnings (eval compilation-num-warnings-found))
        (setq warnings-str (concat " (Warnings: " (number-to-string warnings) ")"))
        ;; (setq errors (eval compilation-num-errors-found))
	(setq errors my/compilation-exit-code)

        (if (eq errors 0) nil t)
	)

      ;;If Errors then
      (message (concat "Compiled with Errors" " (exit code: " (number-to-string my/compilation-exit-code) ") " time-str))

    ;;If Compiled Successfully or with Warnings then
    (progn
      (bury-buffer buffer)
      (run-with-timer my/auto-hide-compile-buffer-delay nil 'delete-window (get-buffer-window buffer 'visible))
      (message (concat "Compiled Successfully" warnings-str time-str))
      )
    )
  )

(make-variable-buffer-local 'compilation-start-time)

(defun my/compilation-started (proc)
  (setq my/compilation-exit-code "0")
  (setq compilation-start-time (current-time))
  )

(setq compilation-exit-message-function 'my/compilation-exit-message-function)
(add-hook 'compilation-start-hook 'my/compilation-started)
(add-hook 'compilation-finish-functions 'my/hide-compile-buffer-if-successful)
