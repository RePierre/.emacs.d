;;; init-csv-mode.el --- Initialize csv-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun rp/setup-csv-mode()
  "Setup `csv-mode'.

When entering `csv-mode' display line numbers and highlight current
line."
  (progn
    (display-line-numbers-mode 1)
    (hl-line-mode)))

(use-package csv-mode
  :defer t
  :hook (csv-mode . rp/setup-csv-mode))

(provide 'init-csv-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-csv-mode.el ends here
