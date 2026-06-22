;;; init-yasnippet.el --- Initialize yasnippet -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'helm)

;; Configure `yasnippet' package
(use-package yasnippet
  :defer t
  :hook
  (after-init . yas-global-mode))

;; Configure the `yasnippet-snippets' package
(use-package yasnippet-snippets
  :defer t
  :after yasnippet)

;; Integrate `yasnippet' with `helm'
(use-package helm-c-yasnippet
  :defer t
  :after (helm yasnippet))

(provide 'init-yasnippet)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-yasnippet.el ends here
