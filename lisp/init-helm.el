;;; init-helm.el --- Initialize helm -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Install `helm'
;; A merge of configuration from Sacha Chua ---
;; http://pages.sachachua.com/.emacs.d/Sacha.html and other various
;; sources.
(use-package helm
  :defer t
  :ensure t
  :diminish helm-mode
  :config
  (progn
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq
     ;; Update fast sources immediately (doesn't).
     helm-idle-delay 0.0
     ;; This actually updates things relatively quickly.
     helm-input-idle-delay 0.01
     helm-yas-display-key-on-candidate t
     helm-quick-update t
     helm-M-x-requires-pattern nil
     helm-ff-skip-boring-files t)
    ;; Configuration from
    ;; https://gist.github.com/m3adi3c/66be1c484d2443ff835b0c795d121ee4#org3ac3590
    (setq
     ;; Open helm buffer inside current window, not occupy whole other
     ;; window.
     helm-split-window-in-side-p t
     ;; Move to end or beginning of source when reaching top or bottom of
     ;; source.
     helm-move-to-line-cycle-in-source t
     ;; Search for library in `require' and `declare-function' sexp.
     helm-ff-search-library-in-sexp t
     ;; Scroll 8 lines other window using M-<next>/M-<prior>.
     helm-scroll-amount 8))
    :hook (after-init . helm-mode)
    :bind (:map global-map
		("C-c h" . helm-mini)
		("C-h a" . helm-apropos)
		("C-x b" . helm-buffers-list)
		("M-y" . helm-show-kill-ring)
		("M-x" . helm-M-x)
		("C-x c o" . helm-occur) ; This is the replacement for `helm-swoop'.
		("C-x c y" . helm-yas-complete)
		("C-x c Y" . helm-yas-create-snippet-on-region)
		("C-x c SPC" . helm-all-mark-rings)
		("C-x C-f" . helm-find-files)
	    :map helm-map
		("TAB" . helm-execute-persistent-action)))

(provide 'init-helm)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-helm.el ends here
