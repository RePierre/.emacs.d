;;; init-rainbow-delimiters.el --- Initialize rainbow-delimiters -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-rainbow-delimiters)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-rainbow-delimiters.el ends here
