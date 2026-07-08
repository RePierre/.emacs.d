;;; init-wttrin.el --- Initialize wttrin -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package wttrin
  :defer t
  :config
  (setq wttrin-geolocation-enabled t
	wttrin-default-languages
	'("Accept-Language" . "ro-RO,ro;q=0.8,en-US,en;q=0.6")))

(provide 'init-wttrin)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-wttrin.el ends here
