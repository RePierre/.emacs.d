;;; init-user-info.el --- Initialize user-info -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'rp-user-info)

(custom-set-variables
 '(user-full-name rp/user-full-name)
 '(user-mail-address rp/user-mail-address)
 '(calendar-latitude rp/calendar-latitude)
 '(calendar-longitude rp/calendar-longitude)
 '(calendar-location-name rp/calendar-location-name))

(provide 'init-user-info)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-user-info.el ends here
