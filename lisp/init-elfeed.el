;;; init-elfeed.el --- Initialize elfeed -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun rp/elfeed-start()
  "Start `elfeed' and call `elfeed-search-update' to bootstrap `elfeed-goodies'."
  (interactive)
  (let ((bookmarks-file "~/org/bookmarks")
        (temp-bookmarks-file "~/org/__bookmarks"))
    (when (file-exists-p bookmarks-file)
      (message "Moving the bookmarks file to avoid elfeed issues.")
      (rename-file bookmarks-file temp-bookmarks-file))
    (elfeed)
    (elfeed-search-update--force)
    (elfeed-search-fetch nil)
    (when (file-exists-p temp-bookmarks-file)
      (message "Restoring the bookmarks file.")
      (rename-file temp-bookmarks-file bookmarks-file))))

(defun rp/elfeed-stop()
  "Stop `elfeed' if it was started previously."
  (interactive)
  (if (featurep 'elfeed)
      (elfeed-search-quit-window)))

(defun rp/elfeed-show-item()
  "Display an `elfeed' item using `olivetti-mode'."
  (if (featurep 'olivetti)
      (olivetti-mode 1)))

(use-package elfeed
  :defer t
  :init
  (require 'rp-rss-utils)
  (setq elfeed-feeds (rp/load-elfeed-feeds)
	elfeed-db-directory "~/org/elfeed/elfeed-db/")
  :bind (:map global-map
	      ("C-c rn" . rp/elfeed-start)
	      :map elfeed-search-mode-map
	      ("/" . elfeed-search-set-filter))
  :hook ((kill-emacs . rp/elfeed-stop)
	 (elfeed-show-mode . rp/elfeed-show-item)))

(defun rp/setup-elfeed-goodies()
  (progn
    (elfeed-goodies/setup)
    (when (and (daemonp) (not (rp/running-on-wsl)))
      (with-current-buffer "*elfeed-search*"
        (setq-local browse-url-browser-function 'eww-browse-url)))))

(use-package elfeed-goodies
  :defer t
  :after (elfeed)
  :config
  (progn
    (elfeed-goodies/setup)
    (setq elfeed-goodies/entry-pane-position :bottom))
  :hook (elfeed-search-mode . rp/setup-elfeed-goodies))

(provide 'init-elfeed)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-elfeed.el ends here
