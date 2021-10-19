;;  +org.el -*- lexical-binding: t; -*-

(after! org
        (setq org-startup-truncated nil)

        (setq org-html-htmlize-output-type 'css)
        (setq org-html-htmlize-font-prefix "org-")
        (setq org-src-fontify-natively t)
        (setq org-confirm-babel-evaluate nil)
        (setq org-use-property-inheritance t)

        (add-hook 'org-after-todo-state-change-hook 'wicked/org-clock-in-if-starting)
        (add-hook 'org-after-todo-state-change-hook 'wicked/org-clock-out-if-waiting)
        (setq org-agenda-files '("~/org/"))
        ;; org mode settings
        (setq org-todo-keywords
              '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)")))

        (setq org-todo-keyword-faces
              '(("TODO" . (:foreground "GREEN" :weight bold))
                ("CANCELED" . (:foreground "blue" :weight bold))
                ("STARTED" . (:foreground "RED" :weight bold))
                ("WAITING" . (:foreground "YELLOW" :weight bold))
                ("DONE" . (:foreground "ORANGE" :weight bold))
                ))

        ;; Save clock data and notes in the LOGBOOK drawer
        (setq org-clock-into-drawer t)
        (setq org-agenda-inhibit-startup t)

        (setq org-agenda-files (list "~/org/work.org"
                                     "~/org/projects.org"
                                     "~/org/home.org"
                                     "~/org/idea.org"
                                     "~/org/journal.org"
                                     "~/org/gtd.org"
                                     "~/org/readitlater.org"
                                     "~/org/notes.org"
                                     "~/org/unity.org"
                                     "~/org/deloitte.org"
                                     ;; "~/org/rightcloud.org"
                                     "~/org/bimfoo/bimfoo.org"
                                     ))

        (setq org-capture-templates
              '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
                 "* TODO %?\n %i\n")
                ;; ("w" "RightCloud" entry (file+headline "~/org/rightcloud.org" "Work Tasks")
                ;;  "* TODO %?\n %i\n")
                ("b" "bimfoo" entry (file+headline "~/org/bimfoo/bimfoo.org" "Work Tasks")
                 "* TODO %?\n %i\n")
                ("e" "bimfoo note" entry (file+headline "~/org/bimfoo/bimfoo.org" "Work Tasks")
                 "* NOTE %?\n %i\n")
                ("d" "deloitte" entry (file+headline "~/org/deloitte.org" "Work Tasks")
                 "* TODO %?\n %i\n")
                ("u" "Unity Todo" entry (file+headline "~/org/unity.org" "Unity Tasks")
                 "* TODO %?\n %i\n")
                ("r" "Read It Later" entry (file+headline "~/org/readitlater.org" "Read It Later")
                 "* TODO %?\n %i\n %a")
                ("n" "Note" entry (file+headline "~/org/notes.org" "NOTES")
                 "* %? :NOTE:\n%U\n%a\n")
                ("i" "Idea" entry (file+headline "~/org/idea.org" "Idears")
                 "* %?\nEntered on %U\n %i\n %a")
                ("j" "Journal" entry (file+datetree "~/org/journal.org")
                 "* %?\nEntered on %U\n %i\n %a")))

        (setq org-tag-alist '(("SNMP" . ?s)
                              ("TT" . ?t)
                              ("OIT" . ?o)
                              ("DAILY" . ?d)
                              ("UNITY". ?u)
                              ("WEB". ?w)
                              ("OTHER". ?v)
                              ("RIGHTCLOUD". ?r)
                              ))


        ;; Resume clocking task when emacs is restarted
        (org-clock-persistence-insinuate)
        ;;
        ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
        (setq org-clock-history-length 23)
        ;; Resume clocking task on clock-in if the clock is open
        (setq org-clock-in-resume t)
        ;; Change tasks to NEXT when clocking in
        ;;(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
        ;; Separate drawers for clocking and logs
        (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
        ;; Save clock data and state changes and notes in the LOGBOOK drawer
        (setq org-clock-into-drawer t)
        ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
        (setq org-clock-out-remove-zero-time-clocks t)
        ;; Clock out when moving task to a done state
        (setq org-clock-out-when-done t)
        ;; Save the running clock and all clock history when exiting Emacs, load it on startup
        (setq org-clock-persist t)
        ;; Do not prompt to resume an active clock
        (setq org-clock-persist-query-resume nil)
        ;; Enable auto clock resolution for finding open clocks
        (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
        ;; Include current clocking task in clock reports
        (setq org-clock-report-include-clocking-task t)

        ;; org-pomodoro mode hooks
        (add-hook 'org-pomodoro-finished-hook
                  (lambda ()
                    (notify-osx "Pomodoro completed!" "Time for a break.")))

        (add-hook 'org-pomodoro-break-finished-hook
                  (lambda ()
                    (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))

        (add-hook 'org-pomodoro-long-break-finished-hook
                  (lambda ()
                    (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))

        (add-hook 'org-pomodoro-killed-hook
                  (lambda ()
                    (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

        (setq org-ditaa-jar-path "~/emacsplugin/ditaa.jar")

        ;; lengyueyang
        ;;org-mode export to latex
        (require 'ox-latex)
        (setq org-export-latex-listings t)

        ;;org-mode source code setup in exporting to latex
        (add-to-list 'org-latex-listings '("" "listings"))
        (add-to-list 'org-latex-listings '("" "color"))

        (add-to-list 'org-latex-packages-alist
                     '("" "xcolor" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "listings" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "fontspec" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "indentfirst" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "xunicode" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "geometry"))
        (add-to-list 'org-latex-packages-alist
                     '("" "float"))
        (add-to-list 'org-latex-packages-alist
                     '("" "longtable"))
        (add-to-list 'org-latex-packages-alist
                     '("" "tikz"))
        (add-to-list 'org-latex-packages-alist
                     '("" "fancyhdr"))
        (add-to-list 'org-latex-packages-alist
                     '("" "textcomp"))
        (add-to-list 'org-latex-packages-alist
                     '("" "amsmath"))
        (add-to-list 'org-latex-packages-alist
                     '("" "tabularx" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "booktabs" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "grffile" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "wrapfig" t))
        (add-to-list 'org-latex-packages-alist
                     '("normalem" "ulem" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "amssymb" t))
        (add-to-list 'org-latex-packages-alist
                     '("" "capt-of" t))
        (add-to-list 'org-latex-packages-alist
                     '("figuresright" "rotating" t))
        (add-to-list 'org-latex-packages-alist
                     '("Lenny" "fncychap" t))

        (add-to-list 'org-latex-classes
                     '("lengyue-org-book"
                       "\\documentclass{book}
\\usepackage[slantfont, boldfont]{xeCJK}
% chapter set
\\usepackage{titlesec}
\\usepackage{hyperref}

[NO-DEFAULT-PACKAGES]
[PACKAGES]



\\setCJKmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
\\setCJKsansfont{WenQuanYi Micro Hei}
\\setCJKmonofont{WenQuanYi Micro Hei Mono}

\\setmainfont{DejaVu Sans} % 英文衬线字体
\\setsansfont{DejaVu Serif} % 英文无衬线字体
\\setmonofont{DejaVu Sans Mono}
%\\setmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
%\\setsansfont{WenQuanYi Micro Hei}
%\\setmonofont{WenQuanYi Micro Hei Mono}

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

% 代码设置
\\lstset{numbers=left,
numberstyle= \\tiny,
keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
frame=shadowbox,
breaklines=true,
rulesepcolor= \\color{ red!20!green!20!blue!20}
}

[EXTRA]
"
                       ("\\chapter{%s}" . "\\chapter*{%s}")
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

        (add-to-list 'org-latex-classes
                     '("lengyue-org-article"
                       "\\documentclass{article}
\\usepackage[slantfont, boldfont]{xeCJK}
\\usepackage{titlesec}
\\usepackage{hyperref}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\parindent 2em

\\setCJKmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
\\setCJKsansfont{WenQuanYi Micro Hei}
\\setCJKmonofont{WenQuanYi Micro Hei Mono}

\\setmainfont{DejaVu Sans} % 英文衬线字体
\\setsansfont{DejaVu Serif} % 英文无衬线字体
\\setmonofont{DejaVu Sans Mono}
%\\setmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
%\\setsansfont{WenQuanYi Micro Hei}
%\\setmonofont{WenQuanYi Micro Hei Mono}

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

% 代码设置
\\lstset{numbers=left,
numberstyle= \\tiny,
keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
frame=shadowbox,
breaklines=true,
rulesepcolor= \\color{ red!20!green!20!blue!20}
}

[EXTRA]
"
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

        (add-to-list 'org-latex-classes
                     '("lengyue-org-beamer"
                       "\\documentclass{beamer}
\\usepackage[slantfont, boldfont]{xeCJK}
% beamer set
\\usepackage[none]{hyphenat}
\\usepackage[abs]{overpic}

[NO-DEFAULT-PACKAGES]
[PACKAGES]

\\setCJKmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
\\setCJKsansfont{WenQuanYi Micro Hei}
\\setCJKmonofont{WenQuanYi Micro Hei Mono}

\\setmainfont{DejaVu Sans} % 英文衬线字体
\\setsansfont{DejaVu Serif} % 英文无衬线字体
\\setmonofont{DejaVu Sans Mono}
%\\setmainfont{WenQuanYi Micro Hei} % 设置缺省中文字体
%\\setsansfont{WenQuanYi Micro Hei}
%\\setmonofont{WenQuanYi Micro Hei Mono}

%如果没有它，会有一些 tex 特殊字符无法正常使用，比如连字符。
\\defaultfontfeatures{Mapping=tex-text}

% 中文断行
\\XeTeXlinebreaklocale \"zh\"
\\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt

% 代码设置
\\lstset{numbers=left,
numberstyle= \\tiny,
keywordstyle= \\color{ blue!70},commentstyle=\\color{red!50!green!50!blue!50},
frame=shadowbox,
breaklines=true,
rulesepcolor= \\color{ red!20!green!20!blue!20}
}

[EXTRA]
"
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

        (setq org-latex-pdf-process
              '("xelatex -interaction nonstopmode -output-directory %o %f"
                ;;"biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
                "bibtex %b"
                "xelatex -interaction nonstopmode -output-directory %o %f"
                "xelatex -interaction nonstopmode -output-directory %o %f"))

        (setq org-latex-compiler "xelatex")

        (defun wicked/org-clock-in-if-starting ()
          "Clock in when the task is marked STARTED."
          (message "!!!!!clock in ")
          (when (and (equal (org-get-todo-state) "STARTED")
                     ) 
            (org-clock-in)))

        ;;(defadvice org-clock-in (after wicked activate)
        ;;   "Set this task's status to 'STARTED'."
        ;;   (org-todo "STARTED"))
        (defun wicked/org-clock-out-if-waiting ()
          "Clock out when the task is marked WAITING."
          (when (and (equal (org-get-todo-state) "WAITING")
                     (equal (marker-buffer org-clock-marker) (current-buffer))
                     (< (point) org-clock-marker)
                     (> (save-excursion (outline-next-heading) (point))
                        org-clock-marker)
                     )
            (org-clock-out)))

        (defun my-org-screenshot ()
          "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
          (interactive)
          (org-display-inline-images)
          (setq filename
                (concat
                 (make-temp-name
                  (concat (file-name-nondirectory (buffer-file-name))
                          "_imgs/"
                          (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
          (unless (file-exists-p (file-name-directory filename))
            (make-directory (file-name-directory filename)))
                                        ; take screenshot
          (if (eq system-type 'darwin)
              (progn
	              ;;(call-process-shell-command "screencapture" nil nil nil nil " -s " (concat
	              (call-process-shell-command "pngpaste" nil nil nil nil (concat
									                                                      "\"" filename "\"" ))
	              (call-process-shell-command "convert" nil nil nil nil (concat "\"" filename "\" -resize  \"50%\"" ) (concat "\"" filename "\"" ))
	              ))
          (if (eq system-type 'gnu/linux)
              (call-process "import" nil nil nil filename))
                                        ; insert into file if correctly taken
          (if (file-exists-p filename)
              (insert (concat "#+ATTR_ORG: :width 400/500/600\n[[file:" filename "]]")))
          (org-display-inline-images)
          )

        (global-set-key (kbd "C-c s c") 'my-org-screenshot)

        )

(after! org-re-reveal
        (setq org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))

(setq org-roam-directory (file-truename "~/org/roam"))

(setq org-roam-capture-templates
      '(
        ("d" "default" plain "%?"
         :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+roam_alias:\n#+roam_key:\n#+roam_tags:\n\n")
         :unnarrowed t)
        )
      )

(setq org-roam-capture-ref-templates
      '(
        ("a" "Annotation" plain
         "%U ${body}\n"
         :target (file+head "${slug}.org"
                            "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n#+roam_tags:\n\n")
         ;; :immediate-finish t
         :unnarrowed t
         )
        ("r" "ref" plain ""
         :target (file+head "${slug}.org"
                            "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_alias:\n#+roam_tags:\n\n")
         :unnarrowed t)
        )
      )
