(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(package-refresh-contents)
(unless (package-installed-p 'org)
  (package-install 'org))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/emacs-init.org"))
