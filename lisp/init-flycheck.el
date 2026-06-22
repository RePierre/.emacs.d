;;; init-flycheck.el --- Initialize flycheck -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode))

(provide 'init-flycheck)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-flycheck.el ends here
