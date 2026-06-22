;;; init-csv-mode.el --- Initialize csv-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun rp/setup-csv-mode()
  (progn
    (display-line-numbers-mode)
    (hl-line-mode)))

(use-package csv-mode
  :defer t
  :config
  (rp/setup-csv-mode))

(provide 'init-csv-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-csv-mode.el ends here
