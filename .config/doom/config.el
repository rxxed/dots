;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Raaed Shaikh"
      user-mail-address "rdsh@tutanota.de")

(setq doom-font (font-spec :family "Terminus (TTF)" :size 22 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-theme 'modus-vivendi)

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

;; (use-package org-bullets
;;   :hook (org-mode . org-bullets-mode)
;;   :config
;;   (setq org-bullets-bullet-list '("❂" "☯" "✿" "❁" "❄" "✽")))

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
 :states 'normal
 :keymaps 'override
 "C-." 'evil-window-next)
(general-define-key
 :states 'insert
 :keymaps 'override
 "C-." 'evil-window-next)

(general-define-key
 :states 'normal
 "SPC o F" 'elfeed-update-and-elfeed)

(use-package elfeed
  :config
  (setq elfeed-feeds
    '(("https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" yt linux)
      ("https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA" yt linux)
      ("https://www.youtube.com/feeds/videos.xml?channel_id=UCSHZKyawb77ixDdsGog4iWA" yt podcast)
      ("https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg" yt linux)
      ("https://www.youtube.com/feeds/videos.xml?channel_id=UC0uTPqBCFIpZxlz_Lv1tk_g" yt emacs)
      ("https://mangasee123.com/rss/Hunter-X-Hunter.xml" manga)))
  (setq-default elfeed-search-filter "@2-week-ago "))
