;;  +lsp.el -*- lexical-binding: t; -*-

;; lsp-java
(setq lsp-java-jdt-download-url
      "https://mirrors.tuna.tsinghua.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-0.58.0-202007061255.tar.gz")


(setq lsp-java-jdt-download-url
      "https://mirrors.tuna.tsinghua.edu.cn/eclipse/jdtls/snapshots/jdt-language-server-0.57.0-202006172108.tar.gz")

(setq lsp-java-jdt-download-url
     "https://mirrors.tencent.com/eclipse/jdtls/snapshots/jdt-language-server-latest.tar.gz")

(setq lombok-jar-path (expand-file-name "~/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"))

(setq lsp-java-configuration-runtimes
      '[
        (:name "JavaSE-11"
               ;; :path "/home/chenzaichun/bin/jdk-11.0.8+10/"
               ;; :path "/usr/lib/jvm/java-11-openjdk-amd64"
               :path "/usr/lib/jvm/bellsoft-java11-full-amd64"
               )
        (:name "JavaSE-1.8"
               ;; :path "/home/chenzaichun/bin/jdk-11.0.8+10/"
               ;; :path "/usr/lib/jvm/java-8-openjdk-amd64"
               :path "/usr/lib/jvm/bellsoft-java8-full-amd64"
               :default t)
        ]
      )

(setq lsp-java-java-path "/usr/lib/jvm/bellsoft-java11-full-amd64/bin/java")

(setq lsp-java-vmargs
      '("-noverify" "-Xmx1G"
        "-XX:+UseG1GC"
        "-XX:+UseStringDeduplication"
        ;; , (concat "-javaagent:" lombok-jar-path)
        ;; , (concat "-Xbootclasspath/a:" lombok-jar-path)
        "-javaagent:/home/chenzaichun/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"
        "-Xbootclasspath/a:/home/chenzaichun/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"
        )
      )

(setq lsp-java-format-settings-url "file:///home/chenzaichun/emacsplugin/eclipse-java-google-style.xml")
(setq lsp-java-format-settings-profile "GoogleStyle")
;; use fernflower for decompile
(setq lsp-java-content-provider-preferred "fernflower")
;; (setq lsp-java-format-on-type-enabled t)

;; dont keep workspace alive if project is closed
(setq lsp-keep-workspace-alive nil)


(after! lsp-ui
  (setq
   lsp-ui-doc-border   "orange"
   ;; lsp-ui-doc-border   "green"
   ;; lsp-ui-doc-position 'at-point
   lsp-ui-doc-position 'top
   lsp-ui-sideline-show-code-actions nil
   lsp-ui-sideline-border "orange"
   lsp-ui-doc-max-width 80
   lsp-ui-doc-max-height 16
   lsp-ui-doc-mode t
   lsp-ui-sideline-show-hover nil
   )

  ;; (lsp-ui-doc-mode)
  ;; (lsp-ui-doc-show)
  )

(add-hook 'vue-mode-hook #'lsp!)

(after! projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD")
  )

;; dart
(setq lsp-dart-sdk-dir "/home/chenzaichun/android/flutter/bin/cache/dart-sdk/")
