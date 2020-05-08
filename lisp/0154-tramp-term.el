;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure tramp-term                                                      ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171207                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'tramp-term)

;; Custom config
;; https://emacs.stackexchange.com/questions/17725/how-to-sudo-save-file-in-tramp-mode
(defun tramp-sudo-find-file (file)
    "Opens repote FILE with root privileges."
    (interactive "FFind file: ")
    (setq begin (replace-regexp-in-string  "scp" "ssh" (car (split-string file ":/"))))
    (setq end (car (cdr (split-string file "@"))))
    (set-buffer
     (find-file (format "%s" (concat begin "|sudo:root@" end)))))
