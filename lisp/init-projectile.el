;;; init-projectile.el --- Initialize projectile -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Configure `projectile' package
;; When on `Cygwin' use `native' indexing for `projectile' as mentioned
;; here:
;; https://www.quora.com/How-do-I-use-helm-projectile-in-Emacs/answer/Chen-Bin-3.
;; It's slower but it does the job.


(use-package projectile
  :defer t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (progn
    (when (eq system-type 'cygwin)
      (setq projectile-indexing-method 'native)))
  :hook (magit-mode . projectile-mode))


;; Use `helm' as the projectile completion system

(use-package helm-projectile
  :defer t
  :hook
  (projectile-mode . helm-projectile-on)
  :config
  (setq projectile-completion-system 'helm))

(provide 'init-projectile)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-projectile.el ends here
