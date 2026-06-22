;;; init-use-package.el --- Initialize use-package -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives
	  '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	  '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(provide 'init-use-package)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-use-package.el ends here
