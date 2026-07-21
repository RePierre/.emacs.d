;;; init-org-capture.el --- Initialize org-capture -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Important
;; This file needs to be evaluated before configuring the agenda,
;; `org-roam', and `org-ref' because all of the abore rely on the
;; capturing workflow.
(require 'org-capture)
(require 'rp-capture-utils)

(use-package org-cliplink
  :defer t)

;; Having all capture templates in a single place can get messy and makes
;; them hard to understand, so it's better to have them split into
;; categories.

;; Uncategorized templates
;; Templates that do not have a category, i.e. are accessible via a
;; single key.
(rp/add-org-capture-templates
 '(("n" "Note [inbox]"
    entry
    (file+headline "~/org/gtd/inbox.org" "Inbox")
    "* PENDING %i%? \n%U")

   ("t" "Task [GTD]"
    entry
    (file+headline "~/org/gtd/gtd.org" "Sarcini")
    "* TODO %i%? \nSCHEDULED: %t\n%U")

   ("a" "Appointment"
    entry
    (file+headline "~/org/gtd/gtd.org" "Calendar")
    "* APPT %? \n%^{Slot}T")

   ("k" "Org-cliplink capture [inbox]"
    entry
    (file+headline "~/org/gtd/inbox.org" "Inbox")
    "* %(org-cliplink-capture)")

   ("j" "Journal Entry"
    entry
    (file+olp+datetree "~/org/journal.org")
    "* %?"
    :hook rp/setup-long-text-capture)

   ("i" "Idea")

   ("T" "Tickler"
    entry
    (file+headline "~/org/gtd/tickler.org" "Tickler")
    "* %i%? \n%U")))


;; Extra capture templates
(require 'extra-capture-templates)
(require 'daily-routine-capture-templates)

;; Work related templates
;; Templates related to work activities.
(require 'work-capture-templates)

(provide 'init-org-capture)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-org-capture.el ends here
