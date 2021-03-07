;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Raaed Shaikh"
      user-mail-address "raaed@tuta.io")

(setq doom-font (font-spec :family "VictorMono" :size 16 :weight 'semibold)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'danneskjold)

(setq org-directory "~/docs/org")

(setq display-line-numbers-type 'relative)

(general-define-key
 :states 'normal
 "SPC o e" 'eshell)

(general-define-key
 :states 'insert
 "C-h" 'evil-delete-backward-char)

(general-define-key
 :states 'normal
 :keymaps 'override
 "s" 'evil-substitute)
(general-define-key
 :states 'visual
 :keymaps 'override
 "s" 'evil-substitute)

(general-define-key
 :states 'normal
 "^" 'evil-digit-argument-or-evil-beginning-of-line)

(general-define-key
 :states 'normal
 "0" 'evil-first-non-blank)

(general-define-key
 :states 'normal
 "SPC o t" 'vterm)

(general-define-key
 :states 'normal
 "SPC o c" 'org-capture)

;; (defconst fancy-splash-image "~/pics/work/emacs-gnu.png")

(use-package pdf-tools
  :config
  (pdf-tools-install))

(use-package pdf-view-restore
  :after pdf-tools
  :config
  (add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode))
(add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("♠" "♣" "♥" "♦")))

(use-package org-agenda
  :config
  (setq org-capture-templates
  '(("t" "Add todo item")
    ("ts" "Scheduled todo item" entry
     (file "todo.org")
     "* TODO %?\n%a\nSCHEDULED: %^t\n")
    ("td" "Deadlined todo item" entry
     (file "todo.org")
     "* TODO %?\n%a\nDEADLINE: %^t\n")

    ("h" "Habit" entry
     (file "habits.org")
     "* TODO %?\nSCHEDULED: %^t\n")

    ("b" "Add book")
    ("bt" "To be read" table-line
    (file+headline "books.org" "To be Read")
    "| | %^{Title} | %^{Author} | %u |")
    ("br" "Reading" table-line
    (file+headline "books.org" "Reading")
    "| | %^{Title} | %^{Author} | %u |")
    ("bd" "Done" table-line
    (file+headline "books.org" "Done")
    "| | %^{Title} | %^{Author} | %u |")

    ("j" "Journal entry" entry
     (file+olp+datetree "journal.org")
     "* %U %?"))))

(defun elfeed-update-and-elfeed ()
  (interactive)
  (elfeed-update)
  (elfeed))

(general-define-key
 :states 'normal
 "SPC o t" 'vterm)

(general-define-key
 :states 'insert
 :keymaps 'override
 "M-l" 'evil-window-right)
(general-define-key
 :states 'normal
 :keymaps 'override
 "M-l" 'evil-window-right)

(general-define-key
 :states 'insert
 :keymaps 'override
 "M-h" 'evil-window-left)
(general-define-key
 :states 'normal
 :keymaps 'override
 "M-h" 'evil-window-left)

(general-define-key
 :states 'insert
 :keymaps 'override
 "M-h" 'evil-window-left)
(general-define-key
 :states 'normal
 :keymaps 'override
 "M-h" 'evil-window-left)

(general-define-key
 :states 'insert
 :keymaps 'override
 "M-k" 'evil-window-up)
(general-define-key
 :states 'normal
 :keymaps 'override
 "M-k" 'evil-window-up)

(general-define-key
 :states 'insert
 :keymaps 'override
 "M-j" 'evil-window-down)
(general-define-key
 :states 'normal
 :keymaps 'override
 "M-j" 'evil-window-down)

(general-define-key
 :states 'normal
 "SPC o F" 'elfeed-update-and-elfeed)

(general-define-key
 :states 'insert
 :keymaps 'override
 "C-h" 'evil-delete-backward-char)

(global-display-line-numbers-mode t)

(setq c-default-style "bsd"
      c-basic-offset  8)

; open new buffers in new frames
;; (frames-only-mode t)
;; (setq pop-up-frames t)

(use-package org-wild-notifier
  :ensure t
  :custom
  (alert-default-style 'libnotify)
  (org-wild-notifier-alert-time '(1 10 30))
  (org-wild-notifier-keyword-whitelist nil)
  (org-wild-notifier-notification-title "Org Mode")
  :config
  (org-wild-notifier-mode 1))
