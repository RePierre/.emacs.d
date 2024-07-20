;;; init --- Summary
;;; Commentary:
;;; Code:

(require 'package)

(package-initialize)

(let ((file-name (expand-file-name "config.el" user-emacs-directory)))
  (if (file-exists-p file-name)
      (load-file file-name)))

(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-init.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/programming-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/org-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/elfeed-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/writing-config.org"))

(let ((file-name (expand-file-name "after-init.el" user-emacs-directory)))
  (if (file-exists-p file-name)
      (load-file file-name)))

;;; init.el ends here
