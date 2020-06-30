(setq gc-cons-threshold 100000000) ;; Garbage collection
(setq inhibit-startup-screen 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "<f5>") 'revert-buffer)
(require 'recentf)
(recentf-mode 1) ;; Remember recently opened files
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(global-visual-line-mode 1) ;; Wrap lines (instead of fill)
(blink-cursor-mode -1) ;; Don't blink the cursor
(show-paren-mode 1) ;; Highlight matching delimiters
(global-hl-line-mode t) ;; Highlight pointer line

(setq-default frame-title-format '("%b [%m]")) ;;Changes the frame name

(setq org-src-window-setup 'split-window-below) ;;Changes where the new window opens for C-c '

;; Backup Control
(setq backup-directory-alist `(("." . "~/.emacs.d/autosaves/"))) ;;Makes a dir for auto-saves to reduce clutter
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t
  backup-by-copying t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'zenburn t)
;(load-theme 'punpun-dark t)
;(load-theme 'solarized-light t)

(use-package zenburn-theme
  :ensure t
  :defer)
(use-package solarized-theme
  :ensure t
  :defer)
(use-package leuven-theme
  :ensure t)

(use-package circadian
  :ensure t
  :config
  (setq circadian-themes '(("7:00" . leuven)
                           ("19:30" . leuven-dark)))
  (circadian-setup))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (require 'smartparens-config))

(autoload 'ibuffer "ibuffer" "List buffers." t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config (which-key-mode 1))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package counsel
  :ensure t
  :diminish counsel-mode
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package avy
  :ensure t
  :bind ("C-:" . avy-goto-char))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq ess-use-flymake nil))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

(use-package ace-jump-mode
  :ensure t
  :diminish ace-jump-mode)

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :diminish undo-tree-mode)

(use-package hungry-delete
  :ensure t
  :diminish hungry-delete-mode
  :config
  (global-hungry-delete-mode))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package pdf-tools
  :ensure t
  :bind ("M-s o" . pdf-occur)
  :config
  (pdf-tools-install)
  (require 'pdf-occur)
  ;(setq pdf-annot-activate-created-annotations t)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))

;C-; to edit all matching text
;M-x narrow-to-region to narrow
;M-x widen to go back to the full text
(use-package iedit
  :ensure t
  :diminish iedit-mode)

(use-package interleave
  :ensure t
  :diminish interleave-mode
  :config
  (global-set-key (kbd "C-c i") 'interleave-mode))

(autoload 'gnugo "gnugo" "GNU Go" t)
(load "~/.emacs.d/elpa/gnugo-3.1.0/newbie-setup.el")

(use-package eyebrowse
  :ensure t
  :custom (eyebrowse-keymap-prefix (kbd "C-x w"))
  :diminish eyebrowse-mode
  :config
  (eyebrowse-mode t))

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 5))

(add-hook 'prog-mode-hook 'nlinum-mode t)

(use-package rainbow-delimiters
  :ensure t
  :diminish rainbow-delimiters-mode
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(setq org-reveal-root "file:///home/jay/reveal.js-3.9.2")

(require 'org)

(custom-set-variables
 '(org-directory "~/Documents/orgfiles")
 '(org-default-notes-file (concat org-directory "/i.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 )

(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)

;; pretty src blocks
(setq org-src-fontify-natively t)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-pomodoro
  :ensure t
  :config
  (global-set-key "\C-cp" 'org-pomodoro)
  (setq org-pomodoro-length 50) ;; 50 minute pomodoros
  (setq org-pomodoro-short-break-length 10)) ;; 10 minute breaks

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "IN-PROGRESS(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("IN-PROGRESS" :foreground "cyan" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold))))

;(use-package org-ac
 ; :ensure t
 ; :init (progn
 ;         (require 'org-ac)
 ;         (org-ac/config-default)
 ;         ))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/Documents/orgfiles/gcal.org"
                             "~/Documents/orgfiles/i.org"
                             "~/Documents/orgfiles/todo.org"
                             "~/Research/hiv/hiv.org"
                             "~/Research/meditation_paper/med_paper.org"
                             "~/Research/AAIC2020/aaic_abstract_2020.org"
                             "~/Research/lab.org"))

(setq org-capture-templates
      '(

        ;; Todo items
        ("t" "To Do Task")

        ("tu" "(u) Unsorted" entry (file+headline "~/Documents/orgfiles/todo.org" "To Be Sorted")
         "* TODO %?\n%U" :prepend t)
        ("th" "(h) HAND Project" entry (file+datetree "~/Research/hiv/hiv.org")
         "* TODO %?\n%U")
        ("tm" "(m) Meditation Project" entry (file+datetree "~/Research/meditation_paper/med_paper.org")
         "* TODO %?\n%U")
        ("ts" "(s) Sleep and VMS" entry (file+datetree "~/Research/AAIC2020/aaic_abstract_2020.org")
         "* TODO %?\n%U")
        ("tc" "(c) Class" entry (file+headline "~/Documents/orgfiles/todo.org" "Class")
         "* TODO %?\n%U" :prepend t)
        ("tp" "(p) Personal" entry (file+headline "~/Documents/orgfiles/todo.org" "Personal")
         "* TODO %?\n%U" :prepend t)

        ;; Daily Scheduling
        ("d" "Daily Plan" entry (file+datetree "~/Documents/orgfiles/todo.org")
         "* TODO %^{Task} %^g\nSCHEDULED: %T \n%?"
         :time-prompt t :unnarrowed t)

        ;; Lab Meeting
        ("m" "Lab Meeting")

        ("mc" "CoNECt Meeting" entry (file+headline "~/Research/lab.org" "CoNECt Meetings")
         "* MEETING with CoNECT Lab (%^{Who is presenting?} presenting) \n %?"
         :prepend t :clock-in t :clock-resume t)
        ("mw" "WMHRG Meeting" entry (file+headline "~/Research/lab.org" "WMHRG Meetings")
         "* MEETING with Maki Group (%^{Purpose?}) \n %?" :prepend t :clock-in t :clock-resume t)
        ("mo" "Other Meeting" entry (file+headline "~/Research/lab.org" "Other Meetings")
         "* MEETING with %^{With whom?} \n %?" :prepend t :clock-in t :clock-resume t)

        ;; Note items
        ("n" "Quick Note" entry (file+headline "~/Documents/orgfiles/i.org" "Notes")
         "* Note %?\n%U")
        ("r" "RPG Session Idea" entry (file+headline "~/Documents/orgfiles/i.org" "Possible Sessions")
         "* %?\n%U" :prepend t)
        ("j" "Journal" entry (file+datetree "~/Documents/orgfiles/journal.org")
         "* On %?\n\nEntered on %U\n %i\n")
        ("w" "Warmachine" entry (file+datetree "~/Documents/orgfiles/wmh.org")
         "* %? %^g\n\nPlayed on %U\n %i\n")
        ("b" "Book Review" entry (file+headline "~/Documents/orgfiles/books.org" "2019")
         "* %^{Title} %^g %^{Author}p %^{Date|%U}p %^{Rating}p \n %?")


        ;; Course items
        ("q" "Course Item")

        ("qj" "Journal Club" entry (file "~/Class/JournalClub/jc.org")
         "* %?\n %^{INTERLEAVE_PDF}p \n \n #+BEGIN_abstract \n \n \n #+END_abstract \n"
         :prepend t :clock-in t :clock-resume t)
        ;;("qd" "Mathematical Foundations of Data Science" entry (file "~/Class/MCS549-DataScience/mcs549.org")
        ;; "* %?\n :PROPERTIES:\n :END: \n" :clock-in t :clock-resume t)
        ;;("qn" "Foundations of Neuroscience I" entry (file "~/Class/NEUS501-Foundations-Neuroscience-I/neus501.org")
        ;;"* %?\n :PROPERTIES: \n :interleave_pdf: ../Neus501/\n :END: \n" :clock-in t :clock-resume t)
        ;;("qs" "Research Design and Analysis (ANOVA)" entry (file "~/Class/Statistics/PSCH543/psch543.org")
        ;; "* %?\n :PROPERTIES: \n :interleave_pdf: ../PSYCH543/\n:END:\n" :clock-in t :clock-resume t)
       ))

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key nil)
;;(setq auto-save-default nil)
;; Auto-saving does not cooperate with org-crypt.el: so you need
;; to turn it off if you plan to use org-crypt.el quite often.
;; Otherwise, you'll get an (annoying) message each time you
;; start Org.
;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-

(require 'org-ref)

(setq reftex-default-bibliography '("~/Documents/library.bib"))

(setq org-ref-bibliography-notes "~/Documents/orgfiles/papers"
      org-ref-default-bibliography '("~/Documents/library.bib")
      org-ref-pdf-directory "~/Documents/Papers/")

(setq org-agenda-include-diary t)

(setq package-check-signature nil)

(setq org-agenda-custom-commands
  '(("P" "Past-due" ((tags "TIMESTAMP<=\"<now>\"")))))

(setq org-agenda-custom-commands
      '(("h" "Agenda and TODO"
         ((agenda "")
          (alltodo)))))

;; Org-gcal
;(use-package org-gcal
;:ensure t
;; :config
;; (setq org-gcal-client-id "897019491321-2ltugf11mtdicqgkq6pburifjfcquske.apps.googleusercontent.com"
;; org-gcal-client-secret "lBu_3ka7X38f2RVTnGjyw5R9"
;; org-gcal-file-alist '(("jay.vandoorn@gmail.com" .  "~/Documents/orgfiles/gcal.org")
;;                       ("s3uuhgh0264nf0jvabqveinid8@group.calendar.google.com" . "~/Documents/orgfiles/research-cal.org")
;;                       ("dflhu7j62feshqn5hmn5m8gk3s@group.calendar.google.com" . "~/Documents/orgfiles/school-cal.org")
;;                       ("akmslm123@gmail.com" . "~/Documents/orgfiles/audra-cal.org"))))

;(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
;(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

;; Set agenda files
(setq org-agenda-files
     (quote
          ("~/Documents/orgfiles/research-cal.org"
           "~/Documents/orgfiles/exercise.org"
           "~/Documents/orgfiles/school-cal.org"
           "~/Documents/orgfiles/todo.org"
           "~/Documents/orgfiles/i.org"
           "~/Documents/orgfiles/gcal.org"
           "~/Research/lab.org"
           "~/Research/meditation_paper/med_paper.org")))

(add-to-list 'org-structure-template-alist '("p" .  "proof"))
(add-to-list 'org-structure-template-alist '("b" .  "abstract"))

;; Spellchecker
  (dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

  (when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))
  (eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

;; easy spell check
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-c s") 'flyspell-buffer)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "C-c n") 'flyspell-check-next-highlighted-word)

(use-package org2blog
  :ensure t)

;; Basic setup
(setq org2blog/wp-blog-alist
      '(("professional"
         :url "https://jlvandoorn.wordpress.com/xmlrpc.php"
         :username "jlvandoorn")))

;; Let Org2blog work from any org buffer with #+ORG2BLOG in the header
(add-hook 'org-mode-hook #'org2blog-maybe-start)

;; Make it easy to open Org2blog from anywhere
(global-set-key (kbd "C-c b") #'org2blog-user-interface)

;; Automatically upload image links
(setq org2blog/wp-image-upload t)

;; Load languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (R . t)
   (emacs-lisp . t)
   (latex . t)
   (matlab . t)
   (octave . t)
   (lisp . t)
   (ipython . t)
   ))


;;; Python command for org-babel
(setq org-babel-python-command "/home/jay/anaconda3/bin/python3")

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq org-latex-create-formula-image-program 'imagemagick)

;; Pretty code blocks
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
      '(("frame" "lines")
        ("breaklines" "true")
        ("linenos=true")))


(setq  org-latex-pdf-process
   '("latexmk -shell-escape -bibtex -pdf %f"))

;; Set ipython minted same as python
(add-to-list 'org-latex-minted-langs '(ipython "python"))

(require 'exwm)
(require 'exwm-config)

;; Set initial workspace number
(setq exwm-workspace-number 4)

;; Set buffer name to class name
(add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))

;; Global keybindings
(setq exwm-input-global-keys
          `(
            ;; 's-r': Reset (to line-mode).
            ([?\s-r] . exwm-reset)
            ;; 's-w': Switch workspace.
            ([?\s-w] . exwm-workspace-switch)
            ;; 's-&': Launch application.
            ([?\s-&] . (lambda (command)
                         (interactive (list (read-shell-command "$ ")))
                         (start-process-shell-command command nil command)))
            ;; 's-x': Close application.
            ;;([?\s-x] . )
            ;; 's-N': Switch to certain workspace.
            ,@(mapcar (lambda (i)
                        `(,(kbd (format "s-%d" i)) .
                          (lambda ()
                            (interactive)
                            (exwm-workspace-switch-create ,i))))
                      (number-sequence 0 9))))

;; Counsel-linux-app (so good)
(exwm-input-set-key (kbd "s-SPC") #'counsel-linux-app)

;; Simulation keys
(setq exwm-input-simulation-keys
      '(
        ;; movement
        ([?\C-b] . [left])
        ([?\C-f] . [right])
        ([?\C-p] . [up])
        ([?\C-n] . [down])
        ([?\C-a] . [home])
        ([?\C-e] . [end])
        ([?\M-v] . [prior])
        ([?\C-v] . [next])
        ([?\C-d] . [delete])
        ([?\C-k] . [S-end delete])
        ;; cut/paste.
        ([?\C-w] . [?\C-x])
        ([?\M-w] . [?\C-c])
        ([?\C-y] . [?\C-v])
        ;; search
        ([?\C-s] . [?\C-f])))

;; Jump to buffers with s-[hjkl]
(exwm-input-set-key (kbd "s-h") #'windmove-left)
(exwm-input-set-key (kbd "s-j") #'windmove-down)
(exwm-input-set-key (kbd "s-k") #'windmove-up)
(exwm-input-set-key (kbd "s-l") #'windmove-right)

;; Swap buffers with C-s-[hjkl]
(exwm-input-set-key
 (kbd "C-s-h")
 (lambda () (interactive) (aw-swap-window (window-in-direction 'left))))
(exwm-input-set-key
 (kbd "C-s-j")
 (lambda () (interactive) (aw-swap-window (window-in-direction 'below))))
(exwm-input-set-key
 (kbd "C-s-k")
 (lambda () (interactive) (aw-swap-window (window-in-direction 'above))))
(exwm-input-set-key
 (kbd "C-s-l")
 (lambda () (interactive) (aw-swap-window (window-in-direction 'right))))

;; Window sizing
(exwm-input-set-key (kbd "s-[") 'shrink-window-horizontally)
(exwm-input-set-key (kbd "s-{") 'shrink-window)
(exwm-input-set-key (kbd "s-]") 'enlarge-window-horizontally)
(exwm-input-set-key (kbd "s-}") 'enlarge-window)

;; System tray
;(require 'exwm-systemtray)
;(setq exwm-systemtray-height 20)
;(exwm-systemtray-enable)

;; Enable EXWM
(exwm-enable)

;; Ido mode stuff
(require 'ido)
(ido-mode 1)
(exwm-config-ido)

(add-to-list 'load-path "~/.emacs.d/lib/desktop-environment/")

(use-package desktop-environment
  :ensure t
  :after exwm
  :diminish desktop-environment-mode
  :config
  (desktop-environment-mode))

(use-package battery
  :config
  (setq battery-mode-line-format "[%b%p%%] ")
  (setq battery-mode-line-limit 99)
  (setq battery-update-interval 180)
  (setq battery-load-low 20)
  (setq battery-load-critical 10)
  (display-battery-mode -1))

(use-package minibuffer-line
  :ensure t
  :config
  (setq minibuffer-line-format '((:eval
                                  (let ((time-info (format-time-string "%k:%M %b %d %a"))
                                        (batt-info (battery-format "[%b%p%%%% (%t)]" (funcall battery-status-function))))
                                    ;; Note, 4 % signs because it is interpreted twice.
                                    (concat (make-string (- (frame-text-cols)
                                                            (+ (string-width time-info)
                                                               (string-width batt-info) 3)) ? )
                                            batt-info " | "
                                            time-info)))))
  (setq minibuffer-line-refresh-interval 10)
  (minibuffer-line-mode))

;;

(require 'reftex-cite)
(setq bibtex-completion-bibliography "~/Documents/library.bib"
      bibtex-completion-notes-path "~/Documents/orgfiles/papers")

(setq bibtex-completion-pdf-field "file")


(global-set-key (kbd "C-c h") 'helm-bibtex)

(use-package ess-r-mode)
(global-set-key (kbd "C-c r") 'ess-request-a-process) ;switch R processes

; Set display to resemble Rstudio
(setq display-buffer-alist
      '(("*R Dired"
          (display-buffer-reuse-window display-buffer-in-side-window)
          (side . right)
          (slot . -1)
          (window-width . 0.33)
          (reusable-frames . nil))
        ("*R"
          (display-buffer-reuse-window display-buffer-at-bottom)
          (window-width . 0.5)
          (reusable-frames . nil))
        ("*Help"
          (display-buffer-reuse-window display-buffer-in-side-window)
          (side . right)
          (slot . 1)
          (window-width . 0.33)
          (reusable-frames . nil))))

(ess-set-style 'RStudio)
(setq ess-offset-arguments 'prev-line)

(require 'ansi-color)
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))
(global-set-key (kbd "C-c d") 'display-ansi-colors)

(use-package slime)
(setq inferior-lisp-program "/usr/bin/clisp")

(add-hook 'slime-mode-hook
          (lambda ()
            (unless (slime-connected-p)
              (save-excursion (slime)))))

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
(use-package markdown-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.Rmd\\'" . markdown-mode)))

(use-package nov
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(setq abbrev-file-name
      "~/.emacs.d/.abbrev_defs")
(setq save-abbrevs 'silent)
(add-hook 'text-mode-hook #'abbrev-mode)

;; Set python to 3.6
(setq python-shell-interpreter "python3")

;; Enable elpy
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Python documentation
(add-to-list 'load-path "~/path/to/pydoc-info")
(require 'pydoc-info)

;; Path stuff
(setenv "PATH" (concat "/home/jay/anaconda3/bin/python3" (getenv "PATH")))
(setenv "PATH" (concat "/home/jay/anaconda3/bin/ipython" (getenv "PATH")))

(setq exec-path (split-string (getenv "PATH") path-separator))
(setq realgud:pdb-command-name "python3 -m pdb")

;; Use python3 with ipython
(setq elpy-rpc-python-command "/home/jay/anaconda3/bin/python3")
(setq elpy-syntax-check-command "/home/jay/anaconda3/bin/flake8")
(setq python-shell-interpreter "/home/jay/anaconda3/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt --pprint")

;; PDB
(setq gud-pdb-command-name "python3 -m pdb")

;; Environment set up (from ipython.org documentation)
(defvar server-buffer-clients)
(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
  (server-start)
  (defun fp-kill-server-with-buffer-routine ()
    (and server-buffer-clients (server-done)))
  (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

(add-hook 'before-save-hook
          (lambda ()
            (when 'elpy-mode
              (delete-trailing-whitespace))))

;; Anaconda3
(require 'conda)
(conda-env-initialize-eshell)

(use-package engine-mode
  :ensure t)

(engine/set-keymap-prefix (kbd "C-c s"))

(engine-mode t)

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

;; ;; Fundamental
;; (setq user-mail-address "jvandoorn@protonmail.com"
;;       user-full-name "Jay van Doorn")

;; ;; News
;; (setq gnus-select-method '(nntp "apnews.com"))
;; (add-to-list 'gnus-secondary-select-methods '(nntp "localhost"))

;; ;; Mail source
;; (setq mail-sources '((pop :server "protonmail.com"
;;                           :user "jvandoorn"
;;                           :password "")))

;; ;; Outgoing
;; (setq send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-smtp-server "protonmail.com")

(require 'diminish)
(eval-after-load "filladapt" '(diminish 'filladapt-mode))

;;; Hide from mode line
(diminish 'yas-minor-mode)
(diminish 'abbrev-mode)
(diminish 'visual-line-mode)
(diminish 'desktop-environment-mode)
(diminish 'org-indent-mode)
(diminish 'flyspell-mode)

(defun jvd-dired-copy-path-at-point ()
    "Yank absolute path to file at point in Dired"
  (interactive)
  (dired-copy-filename-as-kill 0))

(define-key dired-mode-map (kbd "W") 'jvd-dired-copy-path-at-point)

(defun jvd-scroll-other-window ()
    "Move point to the adjacent window and scroll one screen"
    (interactive)
    (other-window 1)
    (pdf-view-scroll-up-or-next-page)
    (other-window 1))

(define-key global-map (kbd "C-c v") 'jvd-scroll-other-window)

(defun jvd-kill-buffer-other-window ()
    "Kill the buffer in adjacent window without leaving current buffer"
  (interactive)
  (other-window 1)
  (kill-buffer)
  (other-window 1))

(define-key global-map (kbd "C-c C-x k") 'jvd-kill-buffer-other-window)

(defun jvd-swap-windows ()
  "Swap the positions of the currently displayed buffers (two windows only)"
  (interactive)
  (let ((w1 (current-buffer))
        (w2 (buffer-name (other-window 1))))
  (switch-to-buffer w1)
  (other-window 1)
  (switch-to-buffer w2)
  (other-window 1)))

(defun jvd-empty-message ()
  (interactive)
  (message nil))

(global-set-key (kbd "C-c e") 'jvd-empty-message)

;; put fortune in scratch buffer
(setq initial-scratch-message
      (format
       ";; %s\n\n"
       (replace-regexp-in-string
        "\n" "\n;; " ; comment each line
        (replace-regexp-in-string
         "\n$" ""    ; remove trailing linebreak
         (shell-command-to-string "fortune")))))
