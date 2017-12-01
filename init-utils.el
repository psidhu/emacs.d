;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utility functions used across my init files.                              ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171128                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq debug-on-error t)

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

;; Load Global Vars ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun util/lgv ()
  "Load global vars into file"

  (load (expand-file-name "global-vars.el" user-emacs-directory))
  (require 'global-vars)
)

(defun util/load-directory (dir)
  "Loads files in directory DIR"

  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))
                 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(defun util/mkdir (dir)
  "Checks whether directory DIR exists. If not, create it and
  it's parents"

  (if (not (file-exists-p dir))
      (make-directory dir t)
    )
  )

(defun util/touch (file)
  "Checks whether file FILE exists. If not, create it."

  (if (not (file-exists-p file))
      (write-region "" nil file)
    )
  )

(defun util/hook-ext-to-mode (ext md)
  "Hooks an extention (EXT) to a MODE"

  (progn
    (setq tmp (format "\\.%s\\'" ext))
    (add-to-list 'auto-mode-alist `(,tmp . ,md))
    )
  )

(provide 'init-utils)
