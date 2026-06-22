;;; init-ace-window.el --- Initialize ace-window -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package ace-window
  :defer t
  :bind
  (:map global-map
        ("C-x o" . ace-window))
  :config
  (progn
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))))

(provide 'init-ace-window)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-ace-window.el ends here
