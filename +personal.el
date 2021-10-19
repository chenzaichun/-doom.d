;;  +personal.el -*- lexical-binding: t; -*-

(use-package! cal-china-x
  :after calendar
  :ensure nil
  :config
  (setq mark-holidays-in-calendar t)
  (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
  (setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
  (setq other-holidays '(
                         (holiday-lunar 1 20 "我的生日")
                         (holiday-lunar 9 25 "妈妈生日")
                         (holiday-lunar 10 25 "爸爸生日")
                         ))
  (setq calendar-holidays
        (append cal-china-x-important-holidays
                cal-china-x-general-holidays
                other-holidays))
  )
