;; 02
;; 課題1: リストの作成と表示
(defun subject-1-create-list-and-display ()
  (let ((lst '(1 2 3 4 5)))
    (print lst)))

(defun my-lpushnew (lst x)
  (if (> (length lst) 0)
      (cons (car lst) (lpush (cdr lst) x))
      (list x)))
(defun my-pushnew (lst x)
  (cons x lst))
;; 課題2: リストへの要素の追加
(defun subject-2-add-list ()
  (let ((lst '(1 2 3 4 5)))
    (setq lst (my-lpushnew lst 10))
    (print lst)
    (setq lst (my-pushnew lst 0))
    (print lst)))
;; 課題3: リストからの要素の削除
(defun my-del (f lst)
  (if (> (length lst) 0)
      (if (funcall f (car lst))
	  (my-del f (cdr lst))
	  (cons (car lst) (my-del f (cdr lst)))))
  )
(defun subject-3-remove ()
  (my-del #'oddp '(1 2 3 4 5)))
;; 課題4: リストの結合
(defun my-merge (&rest params)
  (let ((lst '()))
    (loop for param in params
	  do (loop for x in param do (setq lst (my-lpushnew lst x))))
    lst))
(defun subject-4-merge ()
  (my-merge '(1 2 3 4 5) '(10 20 30 40 50) '(10 7 43 2 1)))
;; 課題5: リスト内の要素の検索
(defun my-filter-index (f lst n)
  (if (> (length lst) 0)
      (if (funcall f (car lst))
	  (cons n (my-filter-index f (cdr lst) (1+ n)))
	  (my-filter-index f (cdr lst) (1+ n)))))
(defun subject-5-search ()
  (my-filter-index #'oddp '(10 20 21 33 44 55) 0))
;; 課題6: リストの反転
(defun my-rev (lst)
  (if (> (length lst) 1)
      (append (my-rev (cdr lst))
	      (list (car lst)))
      lst
      )
  )
(defun subject-6-reverse ()
  (my-rev '(1 2 3 4 5)))
