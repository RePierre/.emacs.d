;;; init-tex-mode.el --- Initialize tex-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Use `AUCTeX' for LaTeX editing
;; As described in https://github.com/jwiegley/use-package/issues/379 and
;; also as found in
;; https://www.reddit.com/r/emacs/comments/7ux1qj/using_auctex_mode_to_sync_latex_documents_and/dto2z02/
(use-package tex-mode
  :defer t
  :ensure auctex
  :init (progn
          (setq TeX-auto-save t)
          (setq TeX-parse-self t)
          (setq-default TeX-master nil)
          (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
		TeX-source-correlate-start-server t)
          (add-hook 'LaTeX-mode-hook 'visual-line-mode)
          (add-hook 'LaTeX-mode-hook 'flyspell-mode)
          (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
          (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
          (setq reftex-plug-into-AUCTeX t)))

;; Use `company-auctex' for completion

;; Configure `company-backends'
(defun rp/setup-company-backends ()
  (setq-local company-backends '((company-auctex-labels
                                  company-auctex-bibs
                                  company-auctex-macros
                                  company-auctex-environments
                                  company-auctex-symbols
                                  company-capf))))

;; Configure `company-auctex'
(use-package company-auctex
  :commands (company-auctex
             company-auctext-labels
             company-auctest-bibs
             company-auctex-macros
             company-auctext-symbols
             company-auctext-environments)
  :defer t
  :hook
  (tex-mode . rp/setup-company-backends))

(provide 'init-tex-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-tex-mode.el ends here
