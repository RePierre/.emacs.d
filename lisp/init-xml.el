;;; init-xml.el --- Initialize xml -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; The `nxml-mode' is preinstalled with Emacs; I copied the configuration
;; from
;; https://github.com/rememberYou/.emacs.d/blob/master/config.org#xml.
(use-package nxml-mode
  :defer t
  :ensure nil
  :mode ("\\.\\(xml\\|xsd\\|wsdl\\)\\'"))

(provide 'init-xml)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-xml.el ends here
