;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utilize recentf                                                           ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20180118                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://www.emacswiki.org/emacs/RecentFiles#toc18
;; Note I added this after loading dash as it's required
(after-load
    'dash
  (defvar recentfs-list-on-last-sync nil
    "List of recent files reference point.")

  (defun recentfs-update-sync ()
    "Load saved projects from `recentf-list'."
    (setq recentfs-list-on-last-sync
	  (and (sequencep recentf-list)
	       (copy-sequence recentf-list))))

  (defadvice recentf-load-list (after recentfs-loaded-sync activate)
    (recentfs-update-sync))

  (defadvice recentf-save-list (around recentfs activate)
    (recentfs-merge-lists)
    ad-do-it
    (recentfs-update-sync))

  (defun recentfs-load-list ()
    "Load a previously saved recent list and return it as a value
instead of setting it."
    (let ((file (expand-file-name recentf-save-file))
	  (recentf-filter-changer-current nil) ;; ignored atm
	  (recentf-list nil))
      (when (file-readable-p file)
	(load-file file))
      recentf-list))

  (defun recentfs-merge-lists ()
    "Merge any change from `recentf-list'.

This enables multiple Emacs processes to make changes without
overwriting each other's changes."
    (let* ((known-now recentf-list)
	   (known-on-last-sync recentfs-list-on-last-sync)
	   (known-on-file (recentfs-load-list))
	   (removed-after-sync (-difference known-on-last-sync known-now))
	   (removed-in-other-process
	    (-difference known-on-last-sync known-on-file))
	   (new-in-other-process
	    (-difference
	     known-on-file
	     (-concat removed-after-sync removed-in-other-process known-now)))
	   (result (-distinct
		    (-difference
		     (-concat new-in-other-process known-now)
		     (-concat removed-after-sync removed-in-other-process)))))
      (setq recentf-list result)))


  )

;; Periodically save recent file list
(recentf-mode t)
(setq recentf-max-menu-items (* 1 1024))
(run-at-time nil (* 5 60) 'recentf-save-list)
