;;; init-gptel.el --- Initialize gptel -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package gptel
  :defer t
  :custom
  (gptel-model 'mistral-small)
  (gptel-backend
   (gptel-make-openai "Mistral LeChat"
		      :host "api.mistral.ai"
		      :endpoint "/v1/chat/completions"
		      :protocol "https"
		      :key (auth-source-pick-first-password :host "api.mistral.ai")
		      :models '("mistral-small"
				"mistral-medium"
				"mistral-large"
				"mistral-xlarge"))))

(provide 'init-gptel)

;; Local Variables:
;; coding: utf-8
;; End:
;;; init-gptel.el ends here
