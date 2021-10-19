(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((projectile-project-run-cmd . "JAVA_TOOL_OPTIONS=' -Xms64m -Xmx256m -XX:MaxPermSize=128m ' MAVEN_OPTS='-Xdebug -Xrunjdwp:transport=dt_socket,address=1048,suspend=n,server=y -agentpath:/Users/chenza/jrebel/lib/libjrebel64.dylib ' mvn tomcat7:run")))
 '(warning-suppress-types
   '((emacs)
     (doom-switch-buffer-hook)
     (doom-first-file-hook)
     (doom-first-buffer-hook)
     (lsp-mode-hook)
     (doom-first-buffer-hook)
     (doom-switch-buffer-hook)
     (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:weight bold)))))
