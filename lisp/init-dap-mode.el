;;; init-dap-mode.el --- Initialize dap-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dap-mode
  :defer t
  :after lsp-mode
  :config (dap-auto-configure-mode))

(provide 'init-dap-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-dap-mode.el ends here
