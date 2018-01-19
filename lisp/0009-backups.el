;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Changes emacs backup setting                                              ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make sure backup directory is created
(util/mkdir backup-d)

;; Backup Settings
(setq backup-directory-alist (list `("" . ,backup-d)))

(setq make-backup-files t               ; Create backups
      backup-by-copying t               ; Hardcopy backup files
      version-control t                 ; Version backups
      vc-make-backup-files t            ; Also backup files in VC dirs (git)
      delete-old-versions t             ; Don't keep old files quietly
      kept-new-versions 10              ; Keep up to 9th newest file backed up
      kept-old-versions 0               ; Keep 6th oldest file backed up in
      auto-save-default t               ; Save every fileh
      auto-save-timeout 30              ; Set idle seconds for autosave to run
      auto-save-interval 150            ; Save every 2.5minutes
      )

;; Create a new sensitive-minor-mode
;; see: http://anirudhsasikumar.net/blog/2005.01.21.html
(define-minor-mode sensitive-mode
  "For sensitive files like password lists.
  It disables backup creation and auto saving.

  With no argument, this command toggles the mode.  Non-null
  prefix argument turns on the mode.  Null prefix argument turns
  off the mode."

  ;; The initial value.
  nil
  ;; The indicator for the mode line.
  " Sensitive"
  ;; The minor mode bindings.
  nil
  (if (symbol-value sensitive-mode)
      (progn
	;; disable backups
	(set (make-local-variable 'backup-inhibited) t)
	;; disable auto-save
	(if auto-save-default
	    (auto-save-mode -1)))
    ;; resort to default value of backup-inhibited
    (kill-local-variable 'backup-inhibited)
    ;; resort to default auto save setting
    (if auto-save-default
	(auto-save-mode 1))))

;; Add some modes to sensitive mode so backups aren't made
(util/hook-ext-to-mode "gpg" 'sensitive-mode)
(util/hook-ext-to-mode "bash_history" 'sensitive-mode)
