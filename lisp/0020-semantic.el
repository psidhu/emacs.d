;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure semantic                                                        ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com                             ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use it
(semantic-mode t)

;; Configure it
(global-semantic-idle-breadcrumbs-mode t) ; Takes 4 seconds to init emacs
(global-semanticdb-minor-mode t)          ; global support for Semanticdb
(global-semantic-highlight-func-mode t)   ; global highlight of firstsline for
(global-semantic-idle-scheduler-mode t)	  ; run in idle
(global-semantic-idle-completions-mode t) ; idle parsing of source code
(global-semantic-idle-summary-mode t)     ; display info on current tag while
(global-semantic-decoration-mode t)       ; decorate tags
(global-semantic-stickyfunc-mode t)       ; shows current tag in top buffer

;; Configure kbd
(global-set-key (kbd "C-c j") 'semantic-complete-jump-local)
(global-set-key (kbd "C-c C-j") 'semantic-complete-jump)
(global-set-key (kbd "C-c b") 'pop-global-mark)
