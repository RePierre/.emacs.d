
(setq inhibit-startup-message t)

(load-theme 'wombat)

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (python . t)
         (gnuplot . t)
         (sh . t)
         (org . t)
         (latex . t))))

(unless (package-installed-p 'magit)
  (package-install 'magit))
(use-package magit
  :bind (("C-x g" . magit-status)))

(unless (package-installed-p 'helm)
  (package-install 'helm))
(use-package helm
  :bind (("M-x" . helm-M-x)))
