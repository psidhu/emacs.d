;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Variables used throughout this config.                             ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171128                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configure Directory Paths
;; Default etc directory
(defconst etc-d (expand-file-name "etc" user-emacs-directory))

;; Configuration files directory
(defconst config-lisp-d (expand-file-name "config-lisp" user-emacs-directory))

;; Configuration files directory
(defconst custom-d (expand-file-name "custom" user-emacs-directory))
(defconst custom-f (concat custom-d "/custom.el"))

;; Package download directory
(defconst pkgs-d
  (expand-file-name
   (format "pkgs-%s.%s" emacs-major-version emacs-minor-version)
   user-emacs-directory))

;; Lisp evaluation directory
(defconst lisp-d (expand-file-name "lisp" user-emacs-directory))

;; Site Lisp evaluation directory
(defconst site-lisp-d (expand-file-name "site-lisp" user-emacs-directory))

;; Backup directory
(defconst backup-d (expand-file-name "backups" user-emacs-directory))

;; ERC logs directory
(defconst erc-d (expand-file-name "erc" user-emacs-directory))
(defconst erc-logs-d (concat erc-d "/logs"))
(defconst erc-auth-f (concat erc-d "/.ercauth.el"))

;; Default org directory
(defconst org-d (expand-file-name "org" user-emacs-directory))
(defconst org-clock-f (concat org-d "/org-clock-save.el"))

;; CUSTOM: Change this to your directory of choice for your regular
;; agenda / todo files. I call my repo of org notes / agenda
;; "org-lyfe", hence the var name. Note that my org-lyfe is structured
;; as the following:
;; org-lyfe/
;;   todo.org -> todo/todo.org (SYMLINK)
;;   work-todo.org -> todo/<datecode>_work_todo.org (SYMLINK)
;;   notes/
;;     foo.org
;;     bar.org
(defconst org-lyfe-d (expand-file-name "~/org-lyfe"))

;; save-place file
(defconst save-place-f (concat etc-d "/saveplace"))

;; ido.last
(defconst ido-f (concat etc-d "/ido.last"))

;; recentf files
(defconst recentf-f (concat etc-d "/recentf"))

;; Configure OS vars
(defconst is-linux (eq system-type 'gnu/linux))
(defconst is-cygwin (eq system-type 'cygwin))
(defconst is-windows (memq system-type '(windows-nt ms-dos)))

;; Check whether we're in an xwindow or not
(defconst is-term (eq window-system 'nil))

;; Check whether we have ssl support
(defconst have-ssl (gnutls-available-p))

;; Provide Self
(provide 'global-vars)
