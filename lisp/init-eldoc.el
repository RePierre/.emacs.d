;;; init-eldoc.el --- Initialize eldoc -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eldoc
  :defer t
  :hook ((emacs-lisp-mode . eldoc-mode)
         (eval-expression-minibuffer-setup . eldoc-mode)
         (lisp-mode-interactive-mode . eldoc-mode)
         (python-mode . eldoc-mode)
	 (python-ts-mode . eldoc-mode)
         (eshell-mode . eldoc-mode)
         (org-mode . eldoc-mode)))

(provide 'init-eldoc)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-eldoc.el ends here
