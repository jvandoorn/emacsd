;;; package --- Summary
;;; Commentary:
;; Bind Key to: emacsclient --eval "(my-org-capture)"

;;; Code:
(defun my-org-capture ()
  "Create a new frame and run `org-capture'."
  (interactive)
  (select-frame (make-frame '((my-org-capture . t))))
  (delete-other-windows)
  (cl-letf (((symbol-function 'switch-to-buffer-other-window) #'switch-to-buffer))
    (condition-case err
        (org-capture)
      ;; `org-capture' signals (error "Abort") when "q" is typed, so
      ;; delete the newly-created frame in this scenario.
      (error (when (equal err '(error "Abort"))
               (delete-frame))))))

(defadvice org-capture-finalize (after my-delete-capture-frame activate)
  "Delete the frame after `capture-finalize'."
  (when (frame-parameter nil 'my-org-capture)
    (delete-frame)))

(defadvice org-capture-destroy (after my-delete-capture-frame activate)
  "Delete the frame after `capture-destroy'."
  (when (frame-parameter nil 'my-org-capture)
    (delete-frame)))

  (provide 'globalcapture)
;;; globalcapture.el ends here

