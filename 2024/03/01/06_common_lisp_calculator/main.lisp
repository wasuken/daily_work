(ql:quickload 'cl-ppcre)
(defun num-terms-to-int (terms)
  (mapcar #'(lambda (x)
	      (if (ppcre:scan-to-strings "^[0-9]+$" x)
		  (parse-integer x)
		  x))
	  terms
	  )
  )

(defun str-to-terms (str)
  (mapcar #'parse-integer
	  (remove-if #'(lambda (x) (and (stringp x) (zerop (length x))))
		     (ppcre:split "[( +)|\\+\\-\\*\\/]" str))))

(defun str-to-ops (str)
  (mapcar #'(lambda (x) (intern (string-trim " " x)))
	  (cdr (ppcre:split "[0-9]+" str))))

(defun str-to-calctree (str)
  (append (str-to-ops str) (str-to-terms str)))

(defun evaluate (expr)
  (cond
    ((null expr) (error "Empty expression"))
    ((numberp (car expr)) (car expr))
    (t (let ((op (car expr))
	     (args (mapcar #'evaluate (cdr expr))))
	 (apply (case op
		  (+ #'+)
		  (- #'-)
		  (* #'*)
		  (/ #'/)
		  (otherwise (error "Unknown operator: ~a" op)))
		args)))))

(defun exec (s)
  (evaluate (str-to-calctree s)))
