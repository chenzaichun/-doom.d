;;  +proxy.el -*- lexical-binding: t; -*-

;; set proxy with server port in emacs
(defun proxyfunc(server port)
  (setenv "http_proxy" (concat "http://"server":"port))
  (setenv "https_proxy" (concat "https://"server":"port))
  (setenv "ftp_proxy" (concat "http://"server":"port))

  )

;; turn off proxy in emacs
(defun proxyoff()
  (interactive)
  (setenv "http_proxy" "")
  (setenv "https_proxy" "")
  (setenv "ftp_proxy" "")
  (setq url-using-proxy nil)
  )

(defun proxyrc()
  (interactive)
  (proxyfunc "120.24.91.140" "13720")
  (setq url-using-proxy t)
  (setq url-proxy-services '((concat "http" . "127.0.0.1:8087")))
  )

(defun proxygost()
  (interactive)
  (proxyfunc "127.0.0.1" "7891")
  (setq url-using-proxy t)
  (setq url-proxy-services '((concat "http" . "127.0.0.1:7891")))
  )
