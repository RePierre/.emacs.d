;;; rp-utils.el --- Utility functions for my Emacs configuration  -*-coding: utf-8;-*-

;; Keywords: Emacs, utility functions

;; Author (of rp-utils.el): Petru Rebeja <petru.rebeja@gmail.com>

;;; Commentary:

;; This package provides utility functions for my Emacs configuration.

;;; Code:

(defun rp/running-on-wsl ()
  "Check if the current system is Windows Sunsystem for Linux."
  (if (and (eq system-type 'gnu/linux)
	   (getenv "WSLENV"))
      t
    nil))

(provide 'rp-utils)
;;; rp-utils.el ends here
