;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize glsl-mode                                                       ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20220518                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(install-pkg 'glsl-mode)

(util/hook-ext-to-mode "glsl" 'glsl-mode)
(util/hook-ext-to-mode "vert" 'glsl-mode)
(util/hook-ext-to-mode "frag" 'glsl-mode)
(util/hook-ext-to-mode "geom" 'glsl-mode)

(add-hook 'glsl-mode-hook
	  '(lambda()
	     (setq c-basic-offset 2)
	     (setq indent-tabs-mode nil)
	     (prog/infer-indentation-style)
	     ))
