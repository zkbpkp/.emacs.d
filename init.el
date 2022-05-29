;; Emacs sometimes automatically writes configuration to init.el. This
;; snippet makes it write to custom.el instead.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load functtions.
(load (expand-file-name "functions.el" user-emacs-directory))

;; Package system.
(setq straight-use-package-by-default t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;; Appearance.
(use-package ample-theme
  :config (progn (load-theme 'ample-flat t t)
		 (enable-theme 'ample-flat)))

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 160))

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

(set-cursor-color "grey")
(setq ryo-modal-cursor-color "grey")

(global-hl-line-mode 1)
(setq column-number-mode t)

;; Completion.
(use-package helm
  :config
  (require 'helm-config)
  :init
  (helm-mode 1)
  :bind
  (("M-x" . helm-M-x) ; Evaluate functions
   ("C-x C-f" . helm-find-files) ; Open or create files
   ("C-x b" . helm-mini) ; Select buffers
   ("C-x C-r" . helm-recentf) ; Select recently saved files
   ("C-c i" . helm-imenu) ; Select document heading
   ("M-y" . helm-show-kill-ring) ; Show the kill ring
   :map helm-map
   ("C-z" . helm-select-action)
   ("<tab>" . helm-execute-persistent-action)))

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5
	which-key-idle-secondary-delay 0.5)
  (which-key-setup-side-window-bottom))

;; Org.
(setq org-directory (concat (getenv "HOME") "/Documents/Zettel/"))

(use-package org
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)))

(use-package org-appear
  :hook (org-mode . org-appear-mode))

(setq org-startup-indented t
    ; org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300))

(setq org-hide-emphasis-markers t)
(setq org-image-actual-width 300)

(use-package org-roam
  :after org
  :init (setq org-roam-v2-ack t)

  :custom
  (org-roam-directory (file-truename org-directory))

  :config
  (org-roam-setup)

  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n r" . org-roam-node-random)
	 (:map org-mode-map
	       (("C-c n i" . org-roam-node-insert)
		("C-c n o" . org-id-get-create)
		("C-c n t" . org-roam-tag-add)
		("C-c n a" . org-roam-alias-add)
		("C-c n l" . org-roam-buffer-toggle)))))

(add-hook 'text-mode-hook 'visual-line-mode)
(delete-selection-mode t)

(setq scroll-error-top-bottom t)

(setq sentence-end-double-space nil)

;; RSS.
; TODO.

;; Modal editing.
;; NOTE: Don't put this section before (use-package org).
(use-package ryo-modal
  :commands ryo-modal-mode
  :bind ("C-SPC" . donya/normal-mode)
  
  :init
  (add-hook 'ryo-modal-mode-hook
            (lambda ()
              (if ryo-modal-mode
        	(setq cursor-type 'hbar)
        	(setq cursor-type 'bar))))

  :config

  ;; Simple keys (without modifier).
  (ryo-modal-keys
   
   ;; Ignore everything first.
   ("a" ignore)
   ("b" ignore)
   ("c" ignore)
   ("d" ignore)
   ("e" ignore)
   ("f" ignore)
   ("g" ignore)
   ("h" ignore)
   ("i" ignore)
   ("j" ignore)
   ("k" ignore)
   ("l" ignore)
   ("m" ignore)
   ("n" ignore)
   ("o" ignore)
   ("p" ignore)
   ("q" ignore)
   ("r" ignore)
   ("s" ignore)
   ("t" ignore)
   ("u" ignore)
   ("v" ignore)
   ("w" ignore)
   ("x" ignore)
   ("y" ignore)
   ("z" ignore)

   ("A" ignore)
   ("B" ignore)
   ("C" ignore)
   ("D" ignore)
   ("E" ignore)
   ("F" ignore)
   ("G" ignore)
   ("H" ignore)
   ("I" ignore)
   ("J" ignore)
   ("K" ignore)
   ("L" ignore)
   ("M" ignore)
   ("N" ignore)
   ("O" ignore)
   ("P" ignore)
   ("Q" ignore)
   ("R" ignore)
   ("S" ignore)
   ("T" ignore)
   ("U" ignore)
   ("V" ignore)
   ("W" ignore)
   ("X" ignore)
   ("Y" ignore)
   ("Z" ignore)

   ("," ignore)
   ("<" ignore)
   ("." ignore)
   (">" ignore)
   ("/" ignore)
   ("?" ignore)
   ("[" ignore)
   ("{" ignore)
   ("]" ignore)
   ("}" ignore)
   ("\\" ignore)
   ("|" ignore)
   (";" ignore)
   (":" ignore)
   ("'" ignore)
   ("\"" ignore)
   ("`" ignore)
   ("~" ignore)
   ("!" ignore)
   ("@" ignore)
   ("#" ignore)
   ("$" ignore)
   ("%" ignore)
   ("^" ignore)
   ("&" ignore)
   ("*" ignore)
   ("(" ignore)
   (")" ignore)
   ("-" ignore)
   ("_" ignore)
   ("=" ignore)
   ("+" ignore)

   ; ("SPC" ignore)
   ("<return>" ignore)
   ("<backspace>" ignore)
   
   ;; Text editing.
   ("i" ignore :name "Insert" :exit t)
   ("o" ignore :exit t)
   ("O" ignore :exit t)

   ;; Text selection.
   ("v" set-mark-command "Select")
   
   ;; Text navigation.
   ("h" backward-char)
   ("H" beginning-of-line)
   ("l" forward-char)
   ("L" end-of-line)
   ("k" previous-line)
   ("K" beginning-of-buffer)
   ("j" next-line)
   ("<return>" next-line)
   ("J" end-of-buffer)
   ("b" backward-word)
   ("f" forward-word)
   ("B" backward-sentence)
   ("F" forward-sentence)
   ("[" backward-paragraph)
   ("]" forward-paragraph)
   ("{" donya/scroll-down-half)
   ("}" donya/scroll-up-half)
   ("/" isearch-forward)
   ("?" isearch-forward-regexp)
   ("n" isearch-repeat-forward)
   ("p" isearch-repeat-backward)
   )

  ;; Repeat arguments.
  (ryo-modal-keys
   (:norepeat t)
   ("0" "M-0")
   ("1" "M-1")
   ("2" "M-2")
   ("3" "M-3")
   ("4" "M-4")
   ("5" "M-5")
   ("6" "M-6")
   ("7" "M-7")
   ("8" "M-8")
   ("9" "M-9"))
  
  ;; Complex keys (with space modifier).
  (ryo-modal-key "SPC"
    '(("SPC" helm-M-x)

      ;; Help.
      ("h h" help-for-help)
      ("h f" describe-function)
      ("h k" describe-key)
      ("h v" describe-variable)
      ("h m" describe-mode)

      ;; File.
      ("f s" save-buffer)
      ("f o" helm-find-files)
      ("f l" helm-mini)

      ;; Configuration.
      (". o" donya/open-init-file)

      ;; Window.
      ("w c" delete-window)
      ("w C" delete-other-windows)
      ("w s" split-window-below)
      ("w v" split-window-right)

      ;; Org.

      ;; Browsing (WWW, RSS).
      ("b w" eww) ; TODO invoke different stuff depending on the mode.
      ; ("b [" eww-back-url)
      ; ("b ]" eww-forward-url)
      )
    )
  )

;; Text selection.
(global-set-key (kbd "C-v") 'rectangle-mark-mode)

;; Text navigation.
(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-S-h") 'beginning-of-line)
(global-set-key (kbd "C-l") 'forward-char)
(global-set-key (kbd "C-S-l") 'end-of-line)
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-S-k") 'beginning-of-buffer)
(global-set-key (kbd "C-j") 'next-line)
(global-set-key (kbd "C-S-j") 'end-of-buffer)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "C-/") 'isearch-forward)
(global-set-key (kbd "C-?") 'isearch-forward-regexp)
(global-set-key (kbd "C-n") 'isearch-repeat-forward)
(global-set-key (kbd "C-p") 'isearch-repeat-backward)

(add-hook 'prog-mode-hook 'ryo-modal-mode)
(add-hook 'eww-mode-hook 'ryo-modal-mode)
(add-hook 'fundamental-mode-hook 'ryo-modal-mode)
(add-hook 'helm-mode-hook 'ryo-modal-mode)
