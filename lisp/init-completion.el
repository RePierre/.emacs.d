;;; init-completion.el --- Initialize completion -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Use `company' for completion. Configuration inspired from
;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org.
(use-package company
  :defer t
  :config
  (setq-default
   company-idle-delay .2
   company-minimum-prefix-length 1
   company-require-match nil
   company-tooltip-align-annotations t
   company-show-numbers t
   company-show-quick-access t)
  :hook
  (after-init . global-company-mode))

;; Use `company-quickhelp' for displaying help in popup window
(use-package company-quickhelp
  :defer t
  :after company
  :bind
  (:map company-active-map
        ("C-c h" . company-quickhelp-manual-begin))
  :init (with-eval-after-load 'company
          (company-quickhelp-mode)))

(provide 'init-completion)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-completion.el ends here
