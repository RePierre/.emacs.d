;;; init-undo-tree.el --- Initialize undo-tree -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package undo-tree
  :defer t
  :defer t
  :init
  (progn
    (setq undo-tree-history-directory-alist
          `(("." . ,temporary-file-directory)))
    (global-undo-tree-mode)))

(provide 'init-undo-tree)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-undo-tree.el ends here
