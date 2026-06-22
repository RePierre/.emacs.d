;;; init-javascript.el --- Initialize javascript -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rjsx-mode
  :defer t
  :mode "\\.js\\'")

;; Requires `sudo apt install prettier' or `npm install -g prettier'.
(use-package prettier-js
  :defer t
  :after (:any rjsx-mode typescript-ts-mode)
  :hook '((rjsx-mode . prettier-js-mode)
          (typescript-ts-mode . prettier-js-mode)))

(provide 'init-javascript)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-javascript.el ends here
