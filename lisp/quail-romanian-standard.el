;;; quail-romanian-standard.el --- Quail package for inputting Romanian characters -*-coding: utf-8;-*-

;; Keywords: input method, romanian standard

;; Author (of quail-romanian-standard.el):  Petru Rebeja <petru.rebeja@gmail.com>

;;; Commentary:

;; This package provides the rules for Romanian Standard
;; keyboard layout as described here:
;; https://en.wikipedia.org/wiki/Romanian_keyboard_layout

;;; Code:

(require 'quail)

(quail-define-package
 "romanian-standard" "Romanian" "RO" t
 "Romanian Standard input method.
" nil t nil nil nil nil nil nil nil nil t)

(quail-define-rules
 ("|" ?Â)
 ("\\" ?â)
 ("{" ?Ă)
 ("[" ?ă)
 (";" ?ș)
 (":" ?Ș)
 ("'" ?ț)
 ("\"" ?Ț)
 ("}" ?Î)
 ("]" ?î)
 ("<" ?\;)
 (">" ?:)
 ("`" ?„)
 ("~" ?”)
 )


;;; quail-romanian-standard.el ends here
(provide 'quail-romanian-standard)
