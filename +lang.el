;;  +lang.el -*- lexical-binding: t; -*-

(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))

(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))

(use-package! poly-ansible)

;; for word selection
;; python word
(after! python
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  )
;; for yaml
(after! yaml
  (add-hook 'yaml-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'yaml-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  )
;; for go
(after! go
  (add-hook 'go-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'go-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  )

(after! cc
  (add-hook 'c-mode-common-hook
            (lambda()
              (google-set-c-style)
              (google-make-newline-indent)
              (setq c-basic-offset 4)
              (setq tab-width 4)
              ))
  )

(after! java
  setq c-basic-offset 4
  setq tab-width 4
  )

;; js warnings
(after! js2
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-missing-semi-one-line-override nil)
  )

;; magit
;; (after! magit-diff
;;   (magit-delta-mode)
;;   )

(add-hook! (gfm-mode markdown-mode) #'mixed-pitch-mode)

;; vue
;; (define-derived-mode vue-mode web-mode "Vue")
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
;; (after! flycheck
;;   (flycheck-add-mode 'javascript-eslint 'vue-mode)
;;   (flycheck-add-mode 'css-stylelint 'vue-mode)
;;   (add-hook 'vue-mode-hook (lambda () (flycheck-add-next-checker 'javascript-eslint)))
;;   (add-hook 'vue-mode-hook (lambda () (flycheck-add-next-checker 'css-stylelint)))
;;   ;; (add-hook 'vue-mode-hook (lambda () (flycheck-add-next-checker 'lsp-ui 'javascript-eslint)))
;;   ;; (add-hook 'vue-mode-hook (lambda () (flycheck-add-next-checker 'javascript-eslint 'css-stylelint)))
;;   )

;; javascript
(use-package! prettier-js
  )


;; (use-package! ejc-sql)

;; (ejc-create-connection
;;  "bg-dev-stage2"
;;  :classpath (concat "~/.m2/repository/mysql/mysql-connector-java/8.0.17"
;;                     "/mysql-connector-java-8.0.17.jar")
;;  :dbtype "mysql"
;;  :dbname "name"
;;  :host "intra.release-bimfoo"
;;  :port "3390"
;;  :user "root"
;;  :password "Bimfoo@20190522"
;;  :separator "</?\.*>")

;; (defun ejc-connect-ivy ()
;;   (interactive)
;;   (let* ((conn-list (mapcar 'car ejc-connections))
;;          (conn-statistics (ejc-load-conn-statistics))
;;          (conn-list-sorted (-sort (lambda (c1 c2)
;;                                     (> (or (lax-plist-get conn-statistics c1) 0)
;;                                        (or (lax-plist-get conn-statistics c2) 0)))
;;                                   conn-list)))
;;     (ivy-read "DataBase connection name: " conn-list-sorted
;;               :keymap ivy-minibuffer-map
;;               :preselect (car conn-list-sorted)
;;               :action #'ejc-connect)))

(add-to-list 'auto-mode-alist '(".*Jenkinsfile\\'" . groovy-mode))
(add-to-list 'auto-mode-alist '(".*wxss\\'" . css-mode))
(add-to-list 'auto-mode-alist '(".*wxml\\'" . web-mode))

(after! js2-mode
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  )

(after! web-mode
  (add-hook 'web-mode-hook 'prettier-js-mode)
  )

(after! 'projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))
