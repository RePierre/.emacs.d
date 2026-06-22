;;; init-treesitter.el --- Initialize treesitter -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (version< "30.0" emacs-version)
  (progn
    (message "Loading tree-sitter.")
    (require 'rp-treesitter)
    (rp/setup-treesitter)))

(provide 'init-treesitter)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-treesitter.el ends here
