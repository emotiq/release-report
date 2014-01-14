;;;; release-report.lisp

(in-package #:release-report)

;;; "release-report" goes here. Hacks and glory await!

(defun paste (file stream)
  (setf file (asdf:system-relative-pathname "release-report" file))
  (with-open-file (input-stream file)
    (alexandria:copy-stream input-stream stream)))

(defun release-report (dist-name output-file)
  (with-open-file (stream output-file :direction :output
                          :if-exists :rename-and-delete)
    (paste "header.html" stream)
    (with-consistent-dists
      (dolist (release (provided-releases (dist dist-name)))
        (format stream "<tr><td valign=top><nobr>~A</nobr></td>"
                (prefix release))
        (format stream "<td>~{~A~^, ~}</td></tr>~%"
                (remove-duplicates
                 (mapcar 'name
                         (provided-systems release))
                 :test 'equalp))))
    (paste "footer.html" stream)))
