;;; init-beginend.el --- Initialize beginend -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package beginend
  :defer t
  :hook
  (after-init . beginend-global-mode))

(provide 'init-beginend)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-beginend.el ends here
