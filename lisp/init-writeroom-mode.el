;;; init-writeroom-mode.el --- Initialize writeroom-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun rp/on-writeroom-mode-start()
  "Configure the environment when entering the `writeroom-mode'."
  (progn
    (message "Entering writeroom mode.")
    (company-mode 0)))

(defun rp/on-writeroom-mode-end()
  "Configure the environment when exiting the `writeroom-mode'."
  (progn
    (message "Exiting writeroom mode.")
    (company-mode 1)))

(use-package writeroom-mode
  :defer t
  :bind (("C-c wr" . writeroom-mode))
  :init (progn
          (add-hook 'writeroom-mode-enable-hook 'rp/on-writeroom-mode-start)
          (add-hook 'writeroom-mode-disable-hook 'rp/on-writeroom-mode-end)))

(provide 'init-writeroom-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-writeroom-mode.el ends here
