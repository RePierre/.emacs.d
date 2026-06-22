;;; init-default-input-method.el --- Initialize default-input-method -*- lexical-binding: t -*-
;;; Commentary:
;;; Add =Romanian standard= input method to Emacs.
;;; Emacs comes with two input methods for Romanian: =romanian-alt-prefix=
;;; and =romanian-prefix=. However, I'm more accustomed to Romanian
;;; standard keyboard layout so I created a =quail= package for it. This
;;; will be the default input method.
;;; Code:
(require 'quail-romanian-standard)

(setq default-input-method 'romanian-standard)

(provide 'init-default-input-method)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-default-input-method.el ends here
