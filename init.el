(require 'package)

(package-initialize)

(let ((file-name (expand-file-name "config.el" user-emacs-directory)))
  (if (file-exists-p file-name)
      (load-file file-name)))

(org-babel-load-file (expand-file-name "~/.emacs.d/common-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/python-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/js-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/org-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/java-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-init.org"))

(let ((file-name (expand-file-name "after-init.el" user-emacs-directory)))
  (if (file-exists-p file-name)
      (load-file file-name)))
