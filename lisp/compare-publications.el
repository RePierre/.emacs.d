;; This is a helper library to ease the workflow of comparing medical publications
;; for my project located at https://github.com/RePierre/metis

(defvar *compare-publications-dir*
  nil
  "The location of files to compare.")

;; https://github.com/chrisdone/elisp-guide
(defun reset-root-dir()
  (interactive)
  (setq *compare-publications-dir* nil))

(defun get-current-line()
  (progn
    (beginning-of-visual-line)
    (let ((start (point)))
      (end-of-visual-line)
      (buffer-substring-no-properties start (point)))))

(defun find-publication(directory file)
  (let* ((file-path (concat directory file)))
    (find-file-read-only file-path)
    (text-scale-increase 1)))

(defun compare-publications()
  (interactive)
  (if (not *compare-publications-dir*)
      (setq *compare-publications-dir* (read-directory-name "Root directory:")))
  (let* ((files (csv-split-string (get-current-line) ","))
	 (file-1 (car files))
	 (file-2 (car (cdr files))))
    (other-window 1)
    (find-publication *compare-publications-dir* file-1)
    (other-window 1)
    (find-publication *compare-publications-dir* file-2)
    (other-window 1)))

(provide 'compare-publications)
