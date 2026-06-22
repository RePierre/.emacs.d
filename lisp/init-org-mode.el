;;; init-org-mode.el --- Initialize org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun rp/configure-org-goto()
  "Configure 'org-goto' function to pick a headline via completion.
Extracted from https://emacs.stackexchange.com/a/32625/14110."
  (progn
    (setq org-goto-interface 'outline-path-completion)
    (setq org-outline-path-complete-in-steps nil)))

(defun is-beamer-presentation()
  "Check if the current buffer is a Beamer presentation."
  (save-excursion
    (goto-char (point-min))
    (search-forward-regexp "#\\+latex_class:[[:blank:]]+beamer")))

(defun beamer-export-to-pdf()
  "Export Beamer presentation to PDF."
  (when (and (equal major-mode 'org-mode)
             (is-beamer-presentation))
    (progn
      (message "Current buffer is beamer presentation. Automatic export will use org-beamer-export-to-pdf.")
      (org-beamer-export-to-pdf t))))

(defun export-to-pdf-async()
  "Asynchronously export the current `org-mode' buffer to PDF."
  (when (equal major-mode 'org-mode)
    (progn
      (message "Automatic export will use org-latex-export-to-pdf.")
      (org-latex-export-to-pdf))))

(defun rp/toggle-export-to-pdf-async ()
  "Toggle asynchronous export to PDF for the current `org-mode' buffer."
  (interactive)
  (if (memq 'export-to-pdf-async after-save-hook)
      (progn
        (remove-hook 'after-save-hook 'export-to-pdf-async t)
        (message "Disabled automatic export to pdf for current buffer."))
    (add-hook 'after-save-hook 'export-to-pdf-async t t)
    (message "Enabled automatic export to pdf for current buffer.")))

(defun rp/export-to-html-async()
  "Export current `org-mode' buffer to HTML."
  (when (equal major-mode 'org-mode)
    (org-html-export-to-html)))

(defun rp/toggle-export-to-html-async()
  "Toggle asynchronous export to HTML of the current `org-mode' buffer."
  (interactive)
  (if (memq 'rp/export-to-html-async after-save-hook)
      (progn
        (remove-hook 'after-save-hook 'rp/export-to-html-async t)
        (message "Disabled automatic export to HTML for current buffer."))
    (progn
      (add-hook 'after-save-hook 'rp/export-to-html-async t t)
      (message "Enabled automatic export to HTML for current buffer."))))

(use-package org
  :ensure org-contrib
  :defer t
  :bind (:map global-map
              ("C-c c" . org-capture)
              ("C-c a" . org-agenda)
              :map org-mode-map
              ("C-c l" . org-store-link)
              :map org-agenda-mode-map
              ("C-c l" . org-store-link))
  :hook (org-mode . org-indent-mode)
  :config (progn
            (require 'ox-extra)
            (ox-extras-activate '(ignore-headlines))

            (require 'org-habit)
            (add-to-list 'org-modules 'org-habit)
            (setq org-todo-keyword-faces
                  '(("TODO" . (:foreground "GoldenRod" :weight bold))
                    ("STARTED" . (:foreground "SteelBlue" :weight bold))
                    ("READING" . (:foreground "SpringGreen4" :weight bold))
                    ("WAITING" . (:foreground "IndianRed1" :weight bold))
                    ("DONE" . (:foreground "LimeGreen" :weight bold))))
            (setq org-adapt-indentation t)
            (setq org-enforce-todo-checkbox-dependencies t)
            (setq org-enforce-todo-dependencies t)
            ;; Leave an empty line before a new heading but not before plain list item.
            (setq org-blank-before-new-entry (quote ((heading . t)
                                                     (plain-list-item . nil))))
            ;; C-a, and C-e will move the cursor to the start, and respectively
            ;; end of the heading.
            (setq org-special-ctrl-a/e t)
            (setq org-auto-align-tags t)
            (setq org-default-notes-file "~/org/notes.org")
	    ;; Include current task in clock reports.
	    (setq org-clock-report-include-clocking-task t)
	    ;; Persist clock history.
	    (setq org-clock-persist t)
	    ;; Clock-out when marking a task as DONE.
	    (setq org-clock-out-when-done t)
	    ;; Resume clocking task on clock-in if the clock is open.
	    (setq org-clock-in-resume t)
	    ;; Resume clocking task when Emacs is restarted.
	    (org-clock-persistence-insinuate)
	    (rp/configure-org-goto)
	    (org-babel-do-load-languages
	     (quote org-babel-load-languages)
	     (quote ((emacs-lisp . t)
		     (dot . t)
		     (python . t)
		     (gnuplot . t)
		     (shell . t)
		     (org . t)
		     (latex . t))))
	    ;; Taken from yet another blog post about ricing Emacs
	    ;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/.
	    (custom-theme-set-faces
	     'user
	     '(org-block ((t (:inherit fixed-pitch))))
	     '(org-code ((t (:inherit (shadow fixed-pitch)))))
	     '(org-document-info ((t (:foreground "dark orange"))))
	     '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
	     '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
	     '(org-link ((t (:foreground "royal blue" :underline t))))
	     '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
	     '(org-property-value ((t (:inherit fixed-pitch))) t)
	     '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
	     '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
	     '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
	     '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
	    ))

(use-package org-bullets
  :defer t
  :after org
  :hook (org-mode . org-bullets-mode))

(provide 'init-org-mode)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-org-mode.el ends here
