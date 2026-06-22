;;; init-yaml.el --- Initialize yaml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :hook (yaml-mode . lsp-deferred)
  :mode ("\\.\\(yaml\\|yml\\)\\'"))

(provide 'init-yaml)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-;;yaml.el ends here
