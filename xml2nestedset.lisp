;;(ql:quickload "xmls")

;;(defpackage :loadxml (:use :cl :xmls))

;;(in-package :loadxml)

;;(setq *print-pretty* 'nil)

(defvar *start*)

(setq *start* 0)

(defun visit (lft pid node)
       (cond
	 ((atom (third node))
	  (format *standard-output* "~{~A~^,~}~%" (list (first node) (second node) (concatenate 'string "\"" (third node) "\"") lft (+ 1 lft) pid))
	  (+ 2 lft))
	 (t
	  (let ((mylft lft)
		(myrgt (+ 1 lft)))
	    (dolist (x (xmlrep-children node))
	      (setf myrgt (visit myrgt mylft x ))
	      )
	    (format *standard-output* "~{~A~^,~}~%" (list (first node) (second node) "" mylft myrgt pid))
	    (+ 1 myrgt)))))

(with-open-file (outfile "xml2nestedsets.csv" :direction :output :if-exists :supersede)
       (let ((*standard-output* outfile))
	 (with-open-file (infile "listofxmlfiles4nestedset.txt")
       (do ((line (read-line infile nil)
                  (read-line infile nil)))
           ((null line))
         (with-open-file (xmlfile line)
           (setf *start* (visit *start* 0 (parse xmlfile))))))))



