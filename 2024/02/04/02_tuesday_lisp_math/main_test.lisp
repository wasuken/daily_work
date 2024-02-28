(ql:quickload "fiveam")

(defpackage :main-test
  (:use :cl :fiveam)
  (:import-from :main :fib :is-prime))

(in-package :main-test)

(def-suite main-tests :description "Tests for the main package")

(def-test fib-test
    (:suite main-tests)
  (is (= (fib 0) 0))
  (is (= (fib 1) 1))
  (is (= (fib 2) 1))
  (is (= (fib 3) 2))
  (is (= (fib 4) 3))
  (is (= (fib 5) 5)))

(def-test is-prime-test
    (:suite main-tests)
  (is (eql (is-prime 13) t))
  (is (eql (is-prime 12) nil))
  )
