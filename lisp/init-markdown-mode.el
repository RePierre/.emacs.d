;;; init-markdown-mode.el --- Initialize markdown-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package markdown-mode
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("LICENSE" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

(use-package gh-md
  :defer t)

(provide 'init-markdown-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-markdown-mode.el ends here
