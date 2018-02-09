;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configures packages.                                                      ;;
;;                                                                           ;;
;; Author: Pushpal Sidhu <psidhu.devel@gmail.com>                            ;;
;; Date: 20171128                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Configure Packages
(util/mkdir pkgs-d)
(let ((default-directory pkgs-d))
  (normal-top-level-add-subdirs-to-load-path))
(setq package-user-dir pkgs-d)

;; Use emacs package manager
(require 'package)
(setq url-http-attempt-keepalives nil)

;; Add org
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; Add melpa stable and upstream
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Add gnu elpa
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)

;; Configure it
(setq package-enable-at-startup nil)
(setq package--init-file-ensured t)

;; Run it
(package-initialize)

;; Make sure we at least have one refresh
(when (not package-archive-contents)
  (package-refresh-contents))

;; Provide Functions to manage installed packages
(defun install-pkg (pn &optional min-version refresh)
  "Installs PackageName (PN). Optional MIN-VERSION to specifiy
  what version to install. If REFRESH is t, it will refresh
  package contents in order before installing"

  (if (package-installed-p pn min-version)
      t					; Return t
    (if (eq refresh t)
        (progn
          (package-refresh-contents)
          (install-pkg pn min-version nil))
      (package-install pn nil)
      )
    )
  )

(defun try-install-pkg (pn &optional min-version refresh)
  "Installs PackageName (PN). Optional MIN-VERSION to specifiy
  what version to install. If REFRESH is t, it will refresh
  package contents in order before installing. If failure, return
  will be nil"

  (condition-case err
      (install-pkg pn min-version refresh)
    (error
     (message "Can't install %s: %S" pn err)
     nil				; return nil
     )
    )
  )

(provide 'config-packages)
