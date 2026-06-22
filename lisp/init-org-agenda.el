;;; init-org-agenda.el --- Initialize org-agenda -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'rp-agenda-utils)
;; Require Google calendar integration library when not running on WSL
(unless (rp/running-on-wsl)
  (require 'rp-org-gcal))

;; Configure agenda
(setq org-agenda-files rp/org-agenda-files
      org-agenda-span 'day)

(defmacro rp/on-days-at(days time-slot)
  `(if (memq (calendar-day-of-week date) ,days)
       (format "%s %s"
               (org-format-time-string "%y-%m-%d" (org-today))
               ,time-slot)))

;; Define macro for displaying timestamps on workdays
;; The following macro will allocate time slots for meetings that are
;; recurring on work days (Monday to Friday).
;; Usage example:
;;  * Some meeting
;; <%%(rp/workdays-at "8:30-9:00")>
(defmacro rp/workdays-at(time-slot)
  `(rp/on-days-at '(1 2 3 4 5) ,time-slot))


;; Customize agenda view
(setq org-agenda-custom-commands rp/org-agenda-custom-commands)

;; Setup `org-refile-targets'
(setq org-refile-targets rp/org-refile-targets)

;; Highlight current line in =org-agenda=
(add-hook 'org-agenda-mode-hook 'hl-line-mode)

;; Apply custom colors for specific agenda entries
(add-hook 'org-agenda-finalize-hook
          (lambda ()
            (save-excursion
              (color-org-header "Zi de naștere:.+" "OrangeRed")
              (color-org-header "Aniversări:.+" "DeepPink"))))

(defun color-org-header (pattern forecolor)
  "Change the foreground of  org header that matches PATTERN to FORECOLOR."
  (goto-char (point-min))
  (while (re-search-forward pattern nil t)
    (add-text-properties (match-beginning 0) (match-end 0)
                         `(face (:foreground, forecolor)))))


;; Define effort estimates
;; Setup effort estimates for tasks
;; https://orgmode.org/manual/Effort-Estimates.html.
;; Adapted from
;; https://writequit.org/denver-emacs/presentations/2017-04-11-time-clocking-with-org.html
(setq org-global-properties
      '(("Effort_ALL" .
         "0:05 0:10 0:15 0:20 0:30 1:00 1:30 2:00 2:30 3:00 4:00 6:00 8:00 0:00")))


(setq org-columns-default-format
      "%ITEM(Details) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")


(provide 'init-org-agenda)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-org-agenda.el ends here
