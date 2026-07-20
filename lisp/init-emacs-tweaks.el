;;; init-emacs-tweaks.el --- Initialize emacs tweaks -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'gnus)
(require 'rp-utils)

(setq-default
 ;; Move generated UI code to a separate file
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 ;; Hide the cursor in inactive windows
 cursor-in-non-selected-windows nil
 ;; Add a margin when scrolling vertically
 scroll-margin 2
 ;; Set bidirectional display to `left-to-right'
 bidi-display-reordering 'left-to-right
 bidi-paragraph-direction 'left-to-right)

(setopt
 ;; Show match numbers in the search prompt (`isearch').
 isearch-lazy-count t)

(setq
 ;; Hide the startup message
 inhibit-startup-message t
 ;; Save contents of clipboard before killing text
 save-interprogram-paste-before-kill t
 ;; Do not save duplicates in the kill ring
 kill-do-not-save-duplicates t
 ;; Remove scratch message
 initial-scratch-message ""
 ;; End sentences with single space
 sentence-end-double-space nil
 ;; Display day, date, and time when calling `M-x display-time'
 display-time-day-and-date t
 ;; Display time in 24 hours format
 display-time-24hr-format t
 ;; Change the location of the default bookmarks file
 bookmark-default-file "~/org/bookmarks"
 ;; Change the location of the `eww' bookmarks
 eww-bookmarks-directory (expand-file-name "org/" gnus-home-directory)
 ;; Turn off the error bell
 ring-bell-function 'ignore
 ;; Set the backup directory to temp directory
 ;; https://old.reddit.com/r/emacs/comments/ym3t77/how_to_delete_auto_save_files_when_quitting_emacs/iv3asi4/
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
 ;; Resize window combinations proportionally
 window-combination-resize t
 ;; Inhibit the Bidirectional Parentheses Algorithm
 bidi-inhibit-bpa t
 ;; Skip sintax highlighting during input
 redisplay-skip-fontification-on-input t)

;; Hide the toolbar
(tool-bar-mode -1)

;; Hide the scroll bar
(scroll-bar-mode -1)

;; Change =yes or no= prompts to =y or n=
(fset 'yes-or-no-p 'y-or-n-p)

;; Bind =F5= key to =revert-buffer=
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Wrap long lines
;; Found on a StackOverflow answer: http://stackoverflow.com/a/3282132/844006.
(global-visual-line-mode t)

;; Replace highlighted text
;; From Emacs manual: https://www.gnu.org/software/emacs/manual/html_node/efaq/Replacing-highlighted-text.html.
(delete-selection-mode 1)

;; Display date and time in mode line
(display-time-mode 1)

;; Unbind =C-z=
(global-unset-key (kbd "C-z"))

;; Set default encoding to `UTF-8'
(set-default-coding-systems 'utf-8)

;; Increase process output buffer
;; The help message for the variable =read-process-output-max= says:
;; "On GNU/Linux systems, the value should not exceed /proc/sys/fs/pipe-max-size."
;; So, instead of setting the variable `read-process-output-max' to some
;; random value, let's set it to `pipe-max-size'.
(let ((max-pipe-size
       (string-to-number (shell-command-to-string "cat /proc/sys/fs/pipe-max-size"))))
  (unless (zerop max-pipe-size)
    (message "Setting `read-process-output-max' to %d bytes" max-pipe-size)
    (setq read-process-output-max max-pipe-size)))

;; Set Garbage Collector threshold to a high value to avoid frequent collections.
(setq gc-cons-threshold (* 128 1024 1024))

;; Ask for confirmation before exiting Emacs
(unless (daemonp)
  (setq confirm-kill-emacs 'y-or-n-p))

;; Use `Zen' as the default browser when running in `Windows Subsystem for Linux'
(defun rp/browse-url-zen-browser(url &rest ARGS)
  "Browse URL using Zen browser from Windows when running under WSL.
  This function calls `shell-command' to pass
  URL to the Firefox browser located at
  `/mnt/c/Program\\ Files/Zen\\ Browser/zen.exe'.

  The second argument ARGS is present to maintain compatibility."
  (progn
    (message "Browsing URL [%s] using Zen browser." url)
    (shell-command
     (concat "/mnt/c/Program\\ Files/Zen\\ Browser/zen.exe "
             url))))

(when (rp/running-on-wsl)
  (progn
    (message "Running under WSL. The browse-url-browser-function will be overwritten.")
    (setq browse-url-browser-function 'rp/browse-url-zen-browser)))

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Start Emacs maximized
(add-to-list 'initial-frame-alist
             '(fullscreen . maximized))


(provide 'init-emacs-tweaks)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-emacs-tweaks.el ends here
