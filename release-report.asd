;;;; release-report.asd

(asdf:defsystem #:release-report
  :serial t
  :author "Zach Beane <zach@quicklisp.org>"
  :license "BSD"
  :description "Prepare Quicklisp dist release info pages."
  :depends-on (#:alexandria)
  :components ((:file "package")
               (:file "release-report")))

