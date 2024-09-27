;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Changes emacs compile behavior                                            ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20230617                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq compilation-scroll-output t)
;;(setq compilation-scroll-output 'first-error)
(setq compilation-window-height 10)

(make-variable-buffer-local 'compilation-start-time)
(make-variable-buffer-local 'compilation-exit-msg)

(defun my/compilation-started (proc)
  (setq compilation-start-time (current-time))
  (message "Compilation started")
  )

(defun my/compilation-finished (buf msg)
  (message (concat "Compilation: " compilation-exit-msg) "")
  )

(add-hook 'compilation-start-hook 'my/compilation-started)
(add-hook 'compilation-finish-functions 'my/compilation-finished)

;; https://stackoverflow.com/questions/17659212/dont-display-compilation-buffer-in-emacs-until-the-process-exits-with-error-o
;; Prevent the compilation buffer from being displayed until the compilation
;; process has finished. After that, ensure that this buffer is visible if and
;; only if the compilation failed.

;; (compile.el displays the buffer with (allow-no-window . t))
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*" (display-buffer-no-window)))
;; After the compilation process is finished:
(setq compilation-exit-message-function
      (lambda (status code msg)
	(setq compilation-total-time (time-subtract nil compilation-start-time))
	(setq time-str (concat "(Time: " (format-time-string "%s.%3N" compilation-total-time) "s)"))

        (let ((compilation-window
               (get-buffer-window "*compilation*")))
          (cond
           ;; If compilation failed and compilation buffer is not visible,
           ((and (eq status 'exit)
                 (not (zerop code))
                 (not compilation-window))
            ;; temporarily allow displaying the buffer,
            (let ((display-buffer-overriding-action
                   '((display-buffer-use-least-recent-window))))
	      (setq compilation-exit-msg (concat "FAILED" " (exit code: " (number-to-string code) ") " time-str))
              ;; and display that buffer.
              (display-buffer "*compilation*")))

           ;; If compilation succeeded and compilation buffer is visible,
           ((and (eq status 'exit)
                 (zerop code))
	    (setq compilation-exit-msg (concat "PASSED " time-str))
	    ;; is it visible
	    (if compilation-window
		(delete-window compilation-window)
	      ))
	   )
	  )
        (cons msg code))) ;; default return value
