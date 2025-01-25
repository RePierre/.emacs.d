;;; rp-capture-utils.el --- Utility functions for org-mode capture -*-coding: utf-8;-*-

;; Keywords: Emacs, org-mode, org-capture, utility functions

;; Author (of rp-capture-utils.el): Petru Rebeja <petru.rebeja@gmail.com>

;;; Commentary:

;; This package provides utility functions for org-mode capture.

;;; Code:
(require 'org-capture)
(require 'olivetti)

(defun rp/add-org-capture-templates(capture-templates)
  "Add the CAPTURE-TEMPLATES to the variable `ORG-CAPTURE-TEMPLATES'.
CAPTURE-TEMPLATES is a list of capture templates."
  (setq org-capture-templates
        (append org-capture-templates
                capture-templates)))

(defun rp/setup-long-text-capture()
  "Prepare an environment for capturing long texts."
  (progn
    (olivetti-mode)
    (delete-other-windows)))

(provide 'rp-capture-utils)
;;; rp-capture-utils.el ends here
