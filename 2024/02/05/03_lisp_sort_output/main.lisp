(defparameter *sample-data* '(89 33 17 51 55 42 82 24 89 92 59 92 13 49 46 7 45 43 8 76 58 15 0 69 76 38 91
			      70 66 77 50 52 11 18 62 39 89 2 48 48 66 73 89 73 26 97 71 1 72 84 40 3 43 12
			      18 9 14 63 8 11 51 24 71 89 17 42 54 39 16 69 51 80 86 33 84 8 67 82 62 99 69
			      35 35 9 39 65 86 15 97 42 52 60 46 27 74 2 4 10 36 74))

(defun my-sort (lst sortf)
  (let ((llst (mapcar #'(lambda (x) x) lst)))
    (stable-sort llst sortf))
  )

;; (mapcar #'write-to-string '(1 2 3 4 5))
(defun join (lst sep)
  (reduce #'(lambda (acm x) (if (string= acm "")
				(concatenate 'string acm x )
				(concatenate 'string acm sep x)))
	  lst
	  :initial-value ""))

(defun my-lst-write (lst filename)
  (with-open-file (s filename :direction :output :if-exists :supersede)
    (format s "~A~%" (join (mapcar #'write-to-string lst) ","))))

(defun sort-write-to-file (lst filename sortf)
  (my-lst-write (my-sort lst sortf) filename))

;; (sort-write-to-file *sample-data* "data.txt" #'<)
