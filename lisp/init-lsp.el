;;; init-lsp.el --- Initialize lsp -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun rp/setup-lsp-mode()
  (progn
    (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
    (lsp-headerline-breadcrumb-mode)))

(use-package lsp-mode
  :defer t
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . rp/setup-lsp-mode)
  :init (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (setq-default indent-tabs-mode nil)
  (add-to-list 'lsp-language-id-configuration
     	  '(makefile-gmake-mode . "makefile")))

(use-package lsp-ui
  :defer t
  :config
  (setq lsp-ui-doc-max-height 20
        lsp-ui-doc-max-width 50
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-peek-always-show t)
  :commands lsp-ui-mode)

(use-package helm-lsp
  :defer t
  :commands helm-lsp-workspace-symbol)

(use-package lsp-treemacs
  :defer t
  :after (lsp treemacs)
  :hook (treemacs-mode lsp-treemacs-sync-mode)
  :commands lsp-treemacs-errors-list)

(provide 'init-lsp)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-lsp.el ends here
