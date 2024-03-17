(defun find-empty-cell (grid)
  (dotimes (row 9)
    (dotimes (col 9)
      (when (zerop (aref grid row col))
	(return-from find-empty-cell (cons row col))))))

(defun valid-p (grid row col num)
  (every (lambda (i)
	   (and (/= (aref grid row i) num)
		(/= (aref grid i col) num)
		(/= (aref grid (+ (* (floor row 3) 3) (floor i 3))
				(+ (* (floor col 3) 3) (mod i 3)))
		    num)))
	 '(0 1 2 3 4 5 6 7 8)))

(defun solve-sudoku (grid)
  (let ((cell (find-empty-cell grid)))
    (if cell
	(destructuring-bind (row . col) cell
	  (loop for n from 1 to 9
		when (valid-p grid row col n)
		do (setf (aref grid row col) n)
		   (when (solve-sudoku grid)
		     (return-from solve-sudoku grid))
		   (setf (aref grid row col) 0)))
	grid)))

(defun print-grid (grid)
  (dotimes (row 9)
    (dotimes (col 9)
      (format t "~a " (aref grid row col)))
    (format t "~%")))

(defun main ()
  (let ((grid (make-array '(9 9) :initial-contents
			  '((5 3 0 0 7 0 0 0 0)
			    (6 0 0 1 9 5 0 0 0)
			    (0 9 8 0 0 0 0 6 0)
			    (8 0 0 0 6 0 0 0 3)
			    (4 0 0 8 0 3 0 0 1)
			    (7 0 0 0 2 0 0 0 6)
			    (0 6 0 0 0 0 2 8 0)
			    (0 0 0 4 1 9 0 0 5)
			    (0 0 0 0 8 0 0 7 9)))))
    (print-grid (solve-sudoku grid))))

(main)
