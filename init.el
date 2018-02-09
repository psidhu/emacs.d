;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This is my init.el file. Bootstraps rest of my init.                      ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171128                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Check Emacs Version ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst min-emacs-version "25.3")
(when (version< emacs-version min-emacs-version)
  (error "This config requires v%s or higher" min-emacs-version))

;; Config ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defconst init-utils-f (expand-file-name "init-utils.el" user-emacs-directory))
(load init-utils-f)
(require 'init-utils)
(util/lgv)

(util/load-directory config-lisp-d)

;; Create etc dir for
(util/mkdir etc-d)

;; Load rest of init files ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq debug-on-error t)
(util/load-directory site-lisp-d)
(util/load-directory lisp-d)
(setq debug-on-error nil)
