;;; init-gptel.el --- Initialize gptel -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'auth-source)

(defvar rp/gptel-mistral-backend nil
  "Mistral backend used by `gptel'.")

(defvar rp/gptel-copilot-backend nil
  "Copilot backend used by `gptel'.")

(defun rp/gptel-mistral-api-key ()
  "Return the API key for Mistral backend from the `auth-source'."
  (or (auth-source-pick-first-password :host "api.mistral.ai")
      (user-error "No lines with host 'api.mistral.ai' found in auth-source")))

(use-package gptel
  :defer t
  :commands (gptel gptel-menu gptel-send)
  :init
  (defvar-keymap rp/gptel-prefix-map
    :doc "Prefix map for gptel commands."
    "c" #'gptel
    "m" #'gptel-menu
    "s" #'gptel-send)
  :bind-keymap ("C-c m" . rp/gptel-prefix-map)
  :config
  (setq rp/gptel-mistral-backend
	(gptel-make-openai "Mistral LeChat"
	  :host "api.mistral.ai"
	  :endpoint "/v1/chat/completions"
	  :protocol "https"
	  :key (rp/gptel-mistral-api-key))
	rp/gptel-copilot-backend
	(gptel-make-gh-copilot "Copilot"
	  :host "api.business.githubcopilot.com")
	gptel-model 'open-ai-gpt-6.1-sol
	gptel-backend rp/gptel-copilot-backend))

(provide 'init-gptel)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-gptel.el ends here
