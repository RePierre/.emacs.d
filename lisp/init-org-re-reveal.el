;;; init-org-re-reveal.el --- Initialize org-re-reveal -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package org-re-reveal
  :defer t
  :config
  (progn
    (setq org-re-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")))

(provide 'init-org-re-reveal)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-org-re-reveal.el ends here
