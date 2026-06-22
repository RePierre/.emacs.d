;;; init-git-integration.el --- Initialize git integration packages -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun rp/git-commit-setup()
  "Setup the git commit buffer."
  (progn
    (ispell-change-dictionary "en_US")
    (flyspell-mode 1)))

(use-package magit
  :defer t
  :bind (("C-c g" . magit-status))
  :hook (git-commit-setup . rp/git-commit-setup))

(use-package forge
  :defer t
  :after magit)
;; For some reason, =forge= is unable to generate the token when running
;; under Cygwin. To avoid this issue, just create a =Personal Access
;; Token= in GitHub settings page and store it in the =~/.authinfo= file
;; like this:
;; machine api.github.com login <username>^forge password <personal token>

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))


(provide 'init-git-integration)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-git-integration.el ends here
