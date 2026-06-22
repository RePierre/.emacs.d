;;; init-po-mode.el --- Initialize po-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; `po-mode' is used to edit translation files
;; To enable `po-mode' the following package needs to be installed:
;; - on systems based on Debian --- `gettext-el'
;; - on systems based on Red Hat --- `emacs-gettext'.

(use-package po-mode
  :mode ("\\.po\\'\\|\\.po\\." . po-mode))

(provide 'init-po-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-po-mode.el ends here
