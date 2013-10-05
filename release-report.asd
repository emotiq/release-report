;;;; release-report.asd

(asdf:defsystem #:release-report
  :serial t
  :depends-on (#:alexandria)
  :components ((:file "package")
               (:file "release-report")))

