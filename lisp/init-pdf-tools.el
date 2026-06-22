;;; init-pdf-tools.el --- Initialize pdf-tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; The examle of using =use-package= for configuring =pdf-tools= can be
;; found at https://github.com/abo-abo/hydra/wiki/PDF-Tools
(use-package pdf-tools
  :defer t
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  :mode (("\\.pdf" . pdf-view-mode)))

(provide 'init-pdf-tools)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-pdf-tools.el ends here
