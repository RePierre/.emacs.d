;;; init-org-roam.el --- Initialize org-roam -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Install and configure `org-roam'
(use-package org-roam
  :defer t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (setq org-roam-node-display-template
	(concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

;; Install and configure `org-roam-ui'
(use-package org-roam-ui
  :after org-roam
  :defer t
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start nil))

;; Install and configure `org-roam-bibtex'
(use-package org-roam-bibtex
  :after org-roam
  :config
  (require 'org-ref))

(provide 'init-org-roam)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-org-roam.el ends here
