;;; init-smartparens.el --- Initialize smartparens -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package smartparens
  :defer t
  :diminish smartparens-mode
  :hook (prog-mode . smartparens-mode))

(provide 'init-smartparens)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-smartparens.el ends here
