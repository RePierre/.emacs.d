;;; init-ibuffer.el --- Initialize ibuffer -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Use =ibuffer= for buffer list
;; As specified in the blog post of Mike Zamansky:
;; http://cestlaz.github.io/posts/using-emacs-34-ibuffer-emmet

(defun rp/setup-ibuffer ()
  (progn
    (message "Setting-up Ibuffer.")
    (ibuffer-auto-mode 1)
    (ibuffer-switch-to-saved-filter-groups "default")))

(use-package ibuffer
  :defer t
  :config
  (progn
    (setq ibuffer-saved-filter-groups
          (quote (("default"
                   ("dired" (mode . dired-mode))
                   ("org" (name . "^.*org$"))
                   ("web" (or (mode . web-mode)
                              (mode . js2-mode)))
                   ("shell" (or (mode . eshell-mode)
                                (mode . shell-mode)))
                   ("programming" (or (mode . python-mode)
                                      (mode . lisp-mode)
                                      (mode . csharp-mode)
                                      (mode . js2-mode)))
                   ("doc-view" (mode . doc-view-mode))
                   ("magit" (name . "^magit[:-].*"))
                   ("latex" (or (mode . latex-mode)
                                (mode . bibtex-mode)))
                   ("emacs" (or (name . "^\\*scratch\\*$")
                                (name . "^\\*Messages\\*$")))
                   ("helm" (mode . helm-major-mode))
                   ("powershell" (mode . powershell-mode))
                   ("ledger" (mode . ledger-mode))
                   ("pdf" (mode . pdf-view-mode))
                   ("XML" (mode . nxml-mode))))))
    ;; Don't show filter groups if there are no buffers in that group
    (setq ibuffer-show-empty-filter-groups nil))
  :bind
  (:map global-map
        ("C-x C-b" . ibuffer))
  :hook
  (ibuffer-mode . rp/setup-ibuffer))

(provide 'init-ibuffer)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-ibuffer.el ends here
