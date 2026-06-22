;;; init-dired.el --- Initialize dired -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq
 ;; Try to gues a default target directory (do what I mean)
 dired-dwim-target t
 ;; Display human readable file sizes
 dired-listing-switches "-alh")

(provide 'init-dired)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-dired.el ends here
