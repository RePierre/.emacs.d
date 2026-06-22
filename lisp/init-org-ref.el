;;; init-org-ref.el --- Initialize org-ref -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; It seems that `org-ref-export-to-pdf' does a better job of exporting
;; to PDF than the built-in `org-latex-export-to-pdf'; however, it's best
;; to keep them both.
(defun rp/org-ref-export-to-pdf()
  "Export the curent `org-mode' buffer to PDF using `org-ref'."
  (when (equal major-mode 'org-mode)
    (progn
      (message "Automatic export will use org-ref-export-to-pdf.")
      (org-ref-export-to-pdf))))

(defun rp/toggle-org-ref-export-to-pdf-async ()
  "Toggle asynchronous export to PDF of the current `org-mode' buffer using `org-ref'."
  (interactive)
  (if (memq 'rp/org-ref-export-to-pdf after-save-hook)
      (progn
        (remove-hook 'after-save-hook 'rp/org-ref-export-to-pdf t)
        (message "Disabled automatic export to pdf (via org-ref) for current buffer."))
    (add-hook 'after-save-hook 'rp/org-ref-export-to-pdf t t)
    (message "Enabled automatic export to pdf (via org-ref) for current buffer.")))

;; Install and configure `org-ref'.
;; As specified in org-ref manual: https://github.com/jkitchin/org-ref/blob/master/org-ref.org
(use-package helm-bibtex
  :defer t
  :after (helm)
  :init
  (setq bibtex-completion-bibliography '("~/org/bibliography/references.bib")
        bibtex-completion-library-path '("~/org/bibliography/bibtex-pdfs")
        bibtex-completion-notes-path "~/org/bibliography/helm-bibtex-notes"
        bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

        bibtex-completion-additional-search-fields '(keywords)
        bibtex-completion-display-formats
        '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
          (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
          (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
        bibtex-completion-pdf-open-function 'find-file))
(use-package org-ref-helm
  :defer t
  :after (helm)
  :load-path (lambda()(expand-file-name "elpa/org-ref" user-emacs-directory))
  :init (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
              org-ref-insert-cite-function 'org-ref-cite-insert-helm
              org-ref-insert-label-function 'org-ref-insert-label-link
              org-ref-insert-ref-function 'org-ref-insert-ref-link
              org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body))))

(use-package org-ref
  :defer t
  :after (helm-bibtex org-ref-helm)
  :init
  (require 'bibtex)
  (setq bibtex-autokey-year-length 4
        bibtex-autokey-name-year-separator "-"
        bibtex-autokey-year-title-separator "-"
        bibtex-autokey-titleword-separator "-"
        bibtex-autokey-titlewords 2
        bibtex-autokey-titlewords-stretch 1
        bibtex-autokey-titleword-length 5)
  (define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)
  (define-key org-mode-map (kbd "C-c ]") 'org-ref-insert-link)
  (define-key org-mode-map (kbd "s-[") 'org-ref-insert-link-hydra/body)
  (require 'org-ref-helm)
  (require 'org-ref-arxiv)
  (require 'org-ref-scopus)
  (require 'org-ref-wos))

(provide 'init-org-ref)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-org-ref.el ends here
