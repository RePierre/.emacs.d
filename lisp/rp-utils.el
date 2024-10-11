;;; rp-utils.el --- Utility functions for my Emacs configuration  -*-coding: utf-8;-*-

;; Keywords: Emacs, utility functions

;; Author (of rp-utils.el): Petru Rebeja <petru.rebeja@gmail.com>

;;; Commentary:

;; This package provides utility functions for my Emacs configuration.

;;; Code:

(require 'org)

(defun rp/running-on-wsl ()
  "Check if the current system is Windows Sunsystem for Linux."
  (if (and (eq system-type 'gnu/linux)
	   (getenv "WSLENV"))
      t
    nil))

(defun rp/set-transparency(arg)
  "Set Emacs frame transparency to the value of ARG.

If ARG is outside the interval [0, 100], then any value of ARG below 0
will be considered 0, and any value above 100 will be considered 100."
  (interactive "nEnter transparency (0 -- 100):")
  (set-frame-parameter (selected-frame)
		       'alpha-background
		       (cond ((< 0 arg) 0)
			     ((> 100 arg) 100)
			     (t (- 100 arg)))))


(defvar org-capture-templates)

(defun rp/add-org-capture-templates(capture-templates)
  "Add the CAPTURE-TEMPLATES to the variable `ORG-CAPTURE-TEMPLATES'.
CAPTURE-TEMPLATES is a list of capture templates."
  (setq org-capture-templates
        (append org-capture-templates
                capture-templates)))

(provide 'rp-utils)
;;; rp-utils.el ends here
