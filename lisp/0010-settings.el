;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom built-in emacs settings                                            ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171130                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configure custom-file
(util/mkdir custom-d)
(util/touch custom-f)
(setq custom-file custom-f)
(load custom-file)

;; Stop startup screen
(setq inhibit-startup-screen t)

;; Confirm on kill
(setq confirm-kill-emacs 'yes-or-no-p)

;; Configure Title Name
(setq frame-title-format "%b")		; Set to buffer name
(setq icon-title-format "%b")		; Set to buffer name

;; Configure battery indicator
(display-battery-mode t)		; Mostly work on laptops

;; Configure Parens
(show-paren-mode t)
(setq show-paren-delay 0		; Show immediately
      show-paren-style "mixed"		; Mixed view
      )

;; Configure highlight
(global-hl-line-mode t)                 ; Show highlights
(set-face-foreground 'highlight nil)
(set-face-background 'hl-line "#777777")

;; Configure emacs interactive
(fset 'yes-or-no-p 'y-or-n-p)           ; change yes to y and no to n

;; Configure bell
(setq visible-bell t)                   ; Use visible bell

;; Configure default mode
(setq-default major-mode 'text-mode)    ; Set text-mode to default

;; Configure scrolling
(setq scroll-conservatively 101)        ; Stop annoying bounce scrolling

;; Configure grep command
(setq grep-command "grep --color=auto -nHri ") ; General use case grep

;; Configure Mode Line
(line-number-mode t)                    ; Show line numbers
(column-number-mode t)                  ; Show column
(which-function-mode t)                 ; Show function in mode line

;; Configure overwrite
(pending-delete-mode t)                 ; Delete highlighted text with typed

;; Configure menu-bar
(if (eq is-term t)
    (menu-bar-mode -1)			; Turn off if term
  (menu-bar-mode t)                     ; Turn on otherwise
  )

;; Configure tool-bar
(if (eq is-linux t)
    (tool-bar-mode -1)                 ; Turn off tool-bar in linux
  )

;; Configure keystroke freq.
(setq echo-keystrokes 0)		; Set to show immediately

;; Change gc
(setq gc-cons-threshold (* 20 (* 1024 1024)))	; Set GC to 20mb

;; Configure scratch buffer
(setq initial-scratch-message "")	; Remove scratch buffer message

;; Configure Daemon
(setq server-use-tcp t)			; Use multiple daemons

;; Configure Dialog Boxes
(setq use-dialog-box nil)		; Don't use dialog box

;; Configure save-place
(setq save-place-file save-place-f)	; Set saveplace file
(save-place-mode 1)			; Enable save-place

;; Use electric-pair-mode (apparently added in emacs 24.4)
(electric-pair-mode t)

;; Use winner (C-c left and C-c right undoes and redoes window configs)
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; If mac, use option as meta
(if (eq is-macos t)
    (setq mac-option-modifier 'meta))
