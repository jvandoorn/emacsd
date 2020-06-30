
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server (quote ask))
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "xdg-open")
     (output-html "xdg-open"))))
 '(bubbles-colors (quote ("firebrick" "sea green" "steel blue" "chocolate")))
 '(bubbles-game-theme (quote medium))
 '(bubbles-graphics-theme (quote circles))
 '(bubbles-grid-size (quote (20 . 15)))
 '(calendar-holidays
   (quote
    ((holiday-fixed 1 1 "New Year's Day")
     (holiday-float 1 1 3 "Martin Luther King Day")
     (holiday-fixed 2 2 "Groundhog Day")
     (holiday-fixed 2 14 "Valentine's Day")
     (holiday-float 2 1 3 "President's Day")
     (holiday-fixed 3 17 "St. Patrick's Day")
     (holiday-fixed 4 1 "April Fools' Day")
     (holiday-float 5 0 2 "Mother's Day")
     (holiday-float 5 1 -1 "Memorial Day")
     (holiday-fixed 6 14 "Flag Day")
     (holiday-float 6 0 3 "Father's Day")
     (holiday-fixed 7 4 "Independence Day")
     (holiday-float 9 1 1 "Labor Day")
     (holiday-float 10 1 2 "Columbus Day")
     (holiday-fixed 10 31 "Halloween")
     (holiday-fixed 11 11 "Veteran's Day")
     (holiday-float 11 4 4 "Thanksgiving")
     (solar-equinoxes-solstices)
     (holiday-sexp calendar-daylight-savings-starts
		   (format "Daylight Saving Time Begins %s"
			   (solar-time-string
			    (/ calendar-daylight-savings-starts-time
			       (float 60))
			    calendar-standard-time-zone-name)))
     (holiday-sexp calendar-daylight-savings-ends
		   (format "Daylight Saving Time Ends %s"
			   (solar-time-string
			    (/ calendar-daylight-savings-ends-time
			       (float 60))
			    calendar-daylight-time-zone-name))))))
 '(calendar-mark-holidays-flag t)
 '(custom-safe-themes
   (quote
    ("68d8ceaedfb6bdd2909f34b8b51ceb96d7a43f25310a55c701811f427e9de3a3" "8587afa8626fd22782049193a9e9bcd0463dc0528393bfedd489260519673ead" "3f5f69bfa958dcf04066ab2661eb2698252c0e40b8e61104e3162e341cee1eb9" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "e4486d0ad184fb7511e391b6ecb8c4d7e5ab29e2d33bc65403e2315dbacaa4aa" default)))
 '(desktop-environment-screenshot-directory "~/Pictures/Screenshots")
 '(desktop-environment-volume-set-command "amixer -q -D pulse set Master %s")
 '(desktop-environment-volume-toggle-command "amixer -q -D pulse set Master toggle")
 '(desktop-path (quote ("~/.emacs.d/desktops/" "~")))
 '(diary-show-holidays-flag t)
 '(doc-view-continuous t)
 '(doom-modeline-mode nil)
 '(electric-pair-pairs nil)
 '(ess-startup-directory "~/Documents/R/")
 '(eyebrowse-keymap-prefix "w")
 '(eyebrowse-mode t)
 '(fill-column 85)
 '(gnus-select-method (quote (nnnil "news")))
 '(holiday-bahai-holidays nil)
 '(holiday-christian-holidays nil)
 '(holiday-general-holidays
   (quote
    ((holiday-fixed 1 1 "New Year's Day")
     (holiday-float 1 1 3 "Martin Luther King Day")
     (holiday-fixed 2 14 "Valentine's Day")
     (holiday-float 2 1 3 "President's Day")
     (holiday-fixed 3 17 "St. Patrick's Day")
     (holiday-float 5 0 2 "Mother's Day")
     (holiday-float 5 1 -1 "Memorial Day")
     (holiday-fixed 6 14 "Flag Day")
     (holiday-float 6 0 3 "Father's Day")
     (holiday-fixed 7 4 "Independence Day")
     (holiday-float 9 1 1 "Labor Day")
     (holiday-float 10 1 2 "Columbus Day")
     (holiday-fixed 10 31 "Halloween")
     (holiday-fixed 11 11 "Veteran's Day")
     (holiday-float 11 4 4 "Thanksgiving"))))
 '(holiday-hebrew-holidays nil)
 '(holiday-islamic-holidays nil)
 '(holiday-oriental-holidays nil)
 '(org-ac/ac-trigger-command-keys (quote ("\\" "SPC" ":" "[")))
 '(org-agenda-files
   (quote
    ("~/Class/BIOE422-MRI/mri.org" "~/Documents/orgfiles/todo.org" "~/Documents/orgfiles/school-cal.org" "~/Documents/orgfiles/research-cal.org" "~/Documents/orgfiles/notes.org" "~/Documents/orgfiles/i.org" "~/Documents/orgfiles/gcal.org" "~/Documents/orgfiles/exercise.org" "~/Research/lab.org" "~/Research/AAIC2020/aaic_abstract_2020.org" "~/Research/meditation_paper/med_paper.org")))
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (R . t)
     (lisp . t)
     (matlab . t)
     (octave . t)
     (python . t))))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file (concat org-directory "/i.org"))
 '(org-directory "~/Documents/orgfiles")
 '(org-export-allow-bind-keywords t)
 '(org-export-backends (quote (ascii html icalendar latex md odt org)))
 '(org-export-html-postamble nil)
 '(org-export-with-section-numbers t)
 '(org-file-apps
   (quote
    (("\\.pdf\\'" . emacs)
     (auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default))))
 '(org-format-latex-header
   "\\documentclass{article}
\\usepackage[usenames]{color}
\\usepackage{amsmath}
[PACKAGES]
[DEFAULT-PACKAGES]
\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")
 '(org-gcal-notify-p nil)
 '(org-hide-leading-stars t)
 '(org-latex-classes
   (quote
    (("elsarticle" "\\documentclass[11pt]{elsarticle}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("apa6" "\\documentclass{apa6}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("thesis" "\\documentclass{book}"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")))))
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil)
     ("" "amsthm" nil nil)
     ("margin=1in" "geometry" nil nil)
     ("" "textgreek" nil nil)
     ("" "booktabs" t nil))))
 '(org-latex-logfiles-extensions
   (quote
    ("aux" "bcf" "blg" "fdb_latexmk" "fls" "figlist" "idx" "log" "nav" "out" "ptc" "run.xml" "snm" "toc" "vrb" "xdv" "bbl")))
 '(org-latex-packages-alist (quote (("" "tabu" nil) ("" "graphicx" nil))))
 '(org-preview-latex-default-process (quote imagemagick))
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(org-structure-template-alist
   (quote
    (("b" . "abstract")
     ("p" . "proof")
     ("a" . "export ascii")
     ("c" . "center")
     ("C" . "comment")
     ("e" . "example")
     ("E" . "export")
     ("h" . "export html")
     ("l" . "export latex")
     ("q" . "quote")
     ("s" . "src")
     ("v" . "verse"))))
 '(package-selected-packages
   (quote
    (magit conda ob-ipython ox-reveal all-the-icons fancy-battery minibuffer-line leuven-theme org2blog gnuplot-mode gnuplot org-plot yasnippet-classic-snippets auto-highlight-symbol pulseaudio-control org desktop-environment xelb exwm solarized-theme rainbow-deliminiters smartparens engine-mode punpun-theme rainbow-delimiters rainbow-deliminaters nlinum r-autoyas yasnippet-snippets smooth-scrolling eyebrowse company company-auctex company-math edit-indirect org-pomodoro pydoc-info blacken elpy wc-mode diminish zotelo markdown-mode gnugo request request-deferred alert org-gcal nov esxml xkcd slime totd helm-bibtex org-ref ansi package-build shut-up epl git commander f dash s cask interleave cdlatex auctex-latexmk auctex yasnippet which-key use-package undo-tree try org-edit-latex org-bullets org-ac noflet malyon magic-latex-buffer latex-unicode-math-mode latex-preview-pane latex-pretty-symbols latex-math-preview latex-extra jedi iedit hungry-delete htmlize flycheck expand-region counsel color-theme auto-org-md aggressive-indent ace-window)))
 '(preview-image-type (quote dvipng)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(require 'latex-pretty-symbols)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
