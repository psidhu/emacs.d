;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rust Mode                                                                 ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20191029                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Install it
(install-pkg 'rust-mode)

;; Use it
(util/hook-ext-to-mode "rs" 'rust-mode)

;; https://github.com/rust-lang/rust-mode#indentation
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
