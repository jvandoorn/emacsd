;;; newbie-setup.el
;;; $Revision: 1.2 $

;;; Commentary:

;; This file provides some customizations geared towards
;; first-time gnugo.el users.  To use, read the comments
;; first, then save somewhere (say "/tmp/newbie-setup.el")
;; and add to ~/.emacs or ~/.emacs.d/init.el the line:
;;
;;  (load-file "/tmp/newbie-setup.el")
;;
;; and evaluate the line (with ‘C-x C-e’) or restart Emacs.
;; Please post problems/suggestions/accolades :-D to the
;; help-gnu-emacs mailing list (at gnu dot org).

;;; Code:

(setq gnugo-option-history (list "--komi 5.5 --boardsize 19 --chinese-rules --level 1"))
;; This is an example of the kinds of options that
;; can be specified at the "GNU Go options" prompt.
;; Type ‘M-! gnugo --help RET’ to see the full list.
;; (NB: It's best to do that before ‘M-x gnugo RET’.)

(setq gnugo-xpms 'gnugo-imgen-create-xpms)
;; This is the standard way to display the Go Board graphically.
;; You can change
;;   'gnugo-imgen-create-xpms
;; to
;;   nil
;; if you want to stick to textual display.

(add-hook 'gnugo-start-game-hook 'gnugo-image-display-mode)
;; The display can be toggled between textual and graphical.
;; It normally starts as textual.  This arranges to toggle it
;; for you at the beginning of the game.

;;; newbie-setup.el ends here
