;; run code:
;; (load "main.lisp")
;; (load "main_test.lisp")
;; (in-package :main-test)
;; (fiveam:run 'main-tests)


(defpackage :main
  (:use :cl)
  (:export :fib :is-prime))

(in-package :main)

(defparameter *memo* (make-hash-table))
(defun fib (n)
  (if (gethash n *memo*)
      (gethash n *memo*)
      (let ((v (if (< n 2)
		   n
		   (+ (fib (1- n)) (fib (- n 2))))))
	(setf (gethash n *memo*) v))
      )
  )
(defun is-prime (n)
  (if (< n 2)
      nil
      (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))
