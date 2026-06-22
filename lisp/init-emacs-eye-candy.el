;;; init-emacs-eye-candy.el --- Initialize themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'use-package)

;; Use `SanityInc' themes
(use-package color-theme-sanityinc-tomorrow
  :config
  ;; For some reason I can't find right now, specifying the list of
  ;; custom safe themes doesn't work --- when starting the daemon, I get
  ;; a prompt whether to load and treat the theme as safe or not, which
  ;; blocks the startup of the daemon.
  (setq custom-safe-themes
	'(;; sanityinc-tomorrow-day
	  "76ddb2e196c6ba8f380c23d169cf2c8f561fd2013ad54b987c516d3cabc00216"
	  ;; sanityinc-tomorrow-night
          "04aa1c3ccaee1cc2b93b246c6fbcd597f7e6832a97aaeac7e5891e6863236f9f"
	  ;; sanityinc-tomorrow-eighties
          "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1"
          default)))

;; Use `smart-mode-line' to change the looks of the mode-line
(use-package smart-mode-line
  :config
  (setq sml/theme 'respectful
	sml/shorten-directory t
	sml/no-confirm-load-theme t
	sml/shorten-modes t
	sml/mode-width 'full)
  (sml/setup))

;; Use `circadian' to switch between dark and light themes
(use-package circadian
  :after (color-theme-sanityinc-tomorrow)
  :config
  (if (and
       (bound-and-true-p calendar-latitude)
       (bound-and-true-p calendar-longitude))
      (progn
        (message "Latitude and longitude are set; themes will change according to sunset and sunrise.")
        (setq circadian-themes '((:sunrise . sanityinc-tomorrow-day)
                                 (:sunset . (sanityinc-tomorrow-night sanityinc-tomorrow-eighties)))))
    (progn
      (message "Latitude and longitude not set; themes will change at 8:00 and 19:30.")
      (setq circadian-themes '(("8:00" . sanityinc-tomorrow-day)
                               ("19:30" . (sanityinc-tomorrow-night sanityinc-tomorrow-eighties))))))
  ;; (add-hook 'circadian-after-load-theme-hook
  ;;           #'(lambda (theme)
  ;;               (sml/apply-theme 'respectful)))
  (circadian-setup))


;; Use `nyan-mode' for displaying progress in buffer
(use-package nyan-mode
  :config
  (nyan-mode 1))

(provide 'init-emacs-eye-candy)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-emacs-eye-candy.el ends here
