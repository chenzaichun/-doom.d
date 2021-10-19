;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zai-Chun Chen"
      user-mail-address "zc.chen@bimfoo.cn")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(setq doom-theme 'doom-one)


;; (after! doom-themes
;;   (set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
;;   (set-face-attribute 'font-lock-comment-face nil :slant 'italic :foreground "#5B6268")
;; )

(custom-set-faces!
 '(font-lock-comment-face :slant italic)
 '(font-lock-keyword-face :weight bold))

  ;; (setq face-font-rescale-alist `(("Kaiti SC" . ,(/ 17.0 14))))
  ;; (setq face-font-rescale-alist `(("Kaiti SC" . 1.3)))
  ;; (set-face-attribute 'default nil :font "SF Mono-14")
  ;; (set-fontset-font t 'han      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'kana      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'symbol      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'bopomofo      (font-spec :family "Kaiti SC"))
  ;; (set-fontset-font t 'cjk-misc (font-spec :family "Kaiti SC"))

(setq doom-font "Sarasa Mono SC Nerd 14")
(setq doom-unicode-font doom-font)
;; (add-hook! 'doom-load-theme-hook
;;            (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
;;            (set-face-attribute 'font-lock-keyword-face nil :slant 'bold))

;; (custom-set-faces!
;;   '(font-lock-comment-face italic)
;;   '(font-lock-keyword-face bold))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(setq prefer-coding-system 'utf-8)
(setq set-default-coding-systems 'utf-8)
(setq set-terminal-coding-system 'utf-8)
(setq set-keyboard-coding-system 'utf-8)

(setq doom-modeline-project-detection 'project)

(setq-default custom-file (expand-file-name ".custom.el" doom-private-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; global visual line, line wrapper
(global-visual-line-mode t)

;; (setq fonts '("Source Code Pro" "Kaiti SC"))
;; (set-face-attribute 'default nil :font
;;                     (format "%s:pixelsize=%d" (car fonts) 13))
;; (setq face-font-rescale-alist '(("Kaiti SC". ,(/ 13.0 16))))

;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font) charset
;;                     (font-spec :family (car (cdr fonts)))))
;;)


(load! "+gui")
(load! "+proxy")
(load! "+org")
(load! "+lang")
(load! "+lsp")
(load! "+personal")
