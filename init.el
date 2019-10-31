(require 'package)

(package-initialize)

(let ((file-name (expand-file-name "config.el" user-emacs-directory)))
  (if (file-exists-p file-name)
      (load-file file-name)))

(org-babel-load-file (expand-file-name "~/.emacs.d/common-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/python-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-init.org"))
