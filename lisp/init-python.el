;;; init-python.el --- Initialize python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun rp/try-activate-virtual-environment()
  "Try to activate the virtual environment.
The virtual environment is assumed to be located
in directory .venv under projectile root directory."
  (let* ((project-dir (projectile-project-root))
         (venv-dir (concat project-dir ".venv")))
    (if (file-directory-p venv-dir)
        (progn
          (message (format "Activating virtual environment from %s." venv-dir))
          (pyvenv-activate venv-dir)))))

(use-package pyvenv
  :defer t
  :config
  (add-hook 'pyvenv-post-activate-hooks 'pyvenv-restart-python))

(use-package py-yapf
  :defer t
  :after (:all (:any python-mode python-ts-mode) lsp-mode)
  :commands (py-yapf-buffer py-yapf-enable-on-save))

;; Format python buffers on save
;; For some weird reason `py-yapf-enable-on-save' doesn't get attached to
;; `python-mode-hook' when adding a hook through `use-package' so it has
;; to be explicitly set.
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
(add-hook 'python-ts-mode-hook 'py-yapf-enable-on-save)

(add-hook 'python-mode-hook 'lsp-deferred)
(add-hook 'python-ts-mode-hook 'lsp-deferred)

(add-hook 'projectile-mode-hook 'rp/try-activate-virtual-environment)


(provide 'init-python)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-python.el ends here
