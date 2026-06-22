;;; init-sql.el --- Initialize sql -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package sql-mode
  :defer t
  :ensure nil
  :mode "\\.sql\\'")

(use-package sql-indent
  :hook (sql-mode . sqlind-minor-mode))

(provide 'init-sql)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-sql.el ends here
