;;  +gui.el -*- lexical-binding: t; -*-

;; maximized frame
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))


(when IS-MAC
  (setq insert-directory-program "gls")
  (setq ns-use-thin-smoothing t)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (setq mac-mouse-wheel-smooth-scroll t)
  (setenv "PKG_CONFIG_PATH" (concat (shell-command-to-string "printf %s \"$(brew --prefix libffi)\"") "/lib/pkgconfig/"))
  (unless (boundp 'mac-carbon-version-string) (setq frame-resize-pixelwise t))

  ;; (setq face-font-rescale-alist `(("Kaiti SC" . ,(/ 16.0 13))))
  ;; (set-face-attribute 'default nil :font "Source Code Pro-13")
  ;; (set-fontset-font t 'han      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'kana      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'symbol      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'bopomofo      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'cjk-misc (font-spec :family "Kaiti SC"))
  )

;; (after! doom-themes
;;   (set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
;;   (set-face-attribute 'font-lock-comment-face nil :slant 'italic :foreground "#5B6268")
;; )

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; Needs terminal-notifier (brew install terminal-notifier)
(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message))

(use-package! keycast
  :commands keycast-mode
  :config
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast-mode-line-update t)
          (add-to-list 'global-mode-string '("" mode-line-keycast " ")))
      (remove-hook 'pre-command-hook 'keycast-mode-line-update)
      (setq global-mode-string (remove '("" mode-line-keycast " ") global-mode-string))))
  (custom-set-faces!
    '(keycast-command :inherit doom-modeline-debug
                      :height 0.9)
    '(keycast-key :inherit custom-modified
                  :height 1.1
                  :weight bold)))

;; Emacs rime 配置
(use-package! rime
  :config
  (setq default-input-method "rime")
  (setq rime-librime-root "~/doom-emacs/librime/dist")
  (setq rime-user-data-dir "/home/chenzaichun/RimeEmacs/")
  ;; (setq rime-posframe-properties
  ;;       (list
  ;;        ;; :font "Kaiti SC-16"
  ;;        :background-color "#333333"
  ;;        :foreground-color "#dcdccc"
  ;;        :internal-border-width 10
  ;;        ))

  (setq default-input-method "rime"
        rime-show-candidate 'posframe)
  (setq rime-inline-ascii-trigger 'shift-l)
  (define-key rime-active-mode-map (kbd "M-j") 'rime-inline-ascii)
  )

;; (use-package sis
;;   ;; :hook
;;   ;; enable the /follow context/ and /inline region/ mode for specific buffers
;;   ;; (((text-mode prog-mode) . sis-follow-context-mode)
;;   ;;  ((text-mode prog-mode) . sis-inline-mode))

;;   :config
;;   (sis-ism-lazyman-config nil nil 'fcitx)

;;   ;; enable the /cursor color/ mode
;;   (sis-global-cursor-color-mode t)
;;   ;; enable the /respect/ mode
;;   (sis-global-respect-mode t)
;;   ;; enable the /follow context/ mode for all buffers
;;   ;; (sis-global-follow-context-mode t)
;;   ;; enable the /inline english/ mode for all buffers
;;   (sis-global-inline-mode t)
;;   )

;; (add-hook 'vterm-mode-hook (lambda () (setq evil-default-state 'emacs)))

;; https://www.reddit.com/r/emacs/comments/hz6ibe/how_to_bind_cc_to_send_ctr_c_in_vtermmode_in/ 
;; https://emacs-china.org/t/doom-emacs-vterm/13833/4

;; (after! (vterm evil-collection)
;;   (add-hook!
;;    'vterm-mode-hook
;;    ;; evil-collection for vterm overrided some keymaps defined by tmux-pane
;;    (evil-collection-define-key 'insert 'vterm-mode-map
;;      (kbd "C-h") (lambda () (interactive) (tmux-pane--windmove
;;                                       "left"
;;                                       "tmux select-pane -L"))
;;      (kbd "C-j") (lambda () (interactive) (tmux-pane--windmove
;;                                       "down"
;;                                       "tmux select-pane -D"))
;;      (kbd "C-k") (lambda () (interactive) (tmux-pane--windmove
;;                                       "up"
;;                                       "tmux select-pane -U"))
;;      (kbd "C-l") (lambda () (interactive) (tmux-pane--windmove
;;                                       "right"
;;                                       "tmux select-pane -R")))
;;    ;; change keymap to toggle sending escape to vterm
;;    (evil-collection-define-key '(normal insert) 'vterm-mode-map
;;      (kbd "C-c") 'vterm--self-insert
;;      ;; for CLI emacs
;;      (kbd "ESC <escape>") 'evil-collection-vterm-toggle-send-escape
;;      ;; for GUI emacs
;;      (kbd "M-<escape>") 'evil-collection-vterm-toggle-send-escape)
;;    ;; send escape to vterm by default
;;    (evil-collection-vterm-toggle-send-escape)))

;; (after! (vterm evil-collection)
;;   (add-hook!
;;    'vterm-mode-hook
;;    ;; change keymap to toggle sending escape to vterm
;;    (evil-collection-define-key '(normal insert) 'vterm-mode-map
;;      (kbd "C-c") 'vterm--self-insert
;;      ;; for CLI emacs
;;      (kbd "ESC <escape>") 'evil-collection-vterm-toggle-send-escape
;;      ;; for GUI emacs
;;      (kbd "M-<escape>") 'evil-collection-vterm-toggle-send-escape)
;;    ;; send escape to vterm by default
;;    (evil-collection-vterm-toggle-send-escape)
;;    ))

;; from https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
(setq posframe-arghandler
      (lambda (buffer-or-name key value)
        (or (and (eq key :lines-truncate)
                 (equal ivy-posframe-buffer
                        (if (stringp buffer-or-name)
                            buffer-or-name
                          (buffer-name buffer-or-name)))
                 t)
            value)))


(after! doom-modeline
  (doom-modeline-def-segment buffer-name
    "Display the current buffer's name, without any other information."
    (concat
     (doom-modeline-spc)
     (doom-modeline--buffer-name))
    )
  )

(setq +ivy-project-search-engines '(rg))

(after! ivy-rich
  (setq ivy-rich-display-transformers-list
        '(ivy-switch-buffer
          (:columns
           ((ivy-rich-candidate (:width 30 :face bold))
            (ivy-rich-switch-buffer-size (:width 7 :face font-lock-doc-face))
            (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
            (ivy-rich-switch-buffer-major-mode (:width 18 :face doom-modeline-buffer-major-mode))
            (ivy-rich-switch-buffer-path (:width 50)))
           :predicate
           (lambda (cand) (get-buffer cand)))
          +ivy/switch-workspace-buffer
          (:columns
           ((ivy-rich-candidate (:width 30 :face bold))
            (ivy-rich-switch-buffer-size (:width 7 :face font-lock-doc-face))
            (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
            (ivy-rich-switch-buffer-major-mode (:width 18 :face doom-modeline-buffer-major-mode))
            (ivy-rich-switch-buffer-path (:width 50)))
           :predicate
           (lambda (cand) (get-buffer cand)))
          counsel-M-x
          (:columns
           ((counsel-M-x-transformer (:width 40))
            (ivy-rich-counsel-function-docstring (:face font-lock-doc-face :width 80))))
          counsel-describe-function
          (:columns
           ((counsel-describe-function-transformer (:width 40))
            (ivy-rich-counsel-function-docstring (:face font-lock-doc-face :width 80))))
          counsel-describe-variable
          (:columns
           ((counsel-describe-variable-transformer (:width 40))
            (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face :width 80))))
          counsel-recentf
          (:columns
           ((ivy-rich-candidate (:width 100))
            (ivy-rich-file-last-modified-time (:face font-lock-doc-face)))))))

(after! counsel
  (setq counsel-evil-registers-height 20
        counsel-yank-pop-height 20
        counsel-org-goto-face-style 'org
        counsel-org-headline-display-style 'title
        counsel-org-headline-display-tags t
        counsel-org-headline-display-todo t))

(after! dired-k
  (setq dired-k-human-readable t))
