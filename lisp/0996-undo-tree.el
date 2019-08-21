;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize undo-tree                                                       ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;; Notes: Load near end of package installs due to undo-tree bug             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'undo-tree)

;; Make sure undo-tree directory is created and used
(util/mkdir undo-tree-d)

;; Use it
(global-undo-tree-mode)			; Replace emacs undo

;; Customize it
;; (after-load 'undo-tree
;;   (setq undo-tree-history-directory-alist (list `("" . ,undo-tree-d)))
;;   (setq-default undo-tree-auto-save-history t
;;   		undo-tree-visualizer-diff t)
;;   )
