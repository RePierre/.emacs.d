;;; init-prog-mode.el --- Initialize prog-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'prog-mode)
(require 'display-line-numbers)
(require 'hl-line)
(require 'subword)
(require 'elec-pair)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)

(provide 'init-prog-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-prog-mode.el ends here
