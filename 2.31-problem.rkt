#lang racket
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (merge tree)
  (lambda (s)
    (append tree `())))

(define (subsets s)
  (if (null? s)
      (list `())
      (let ((rest (subsets (cdr s))))
        (cons rest (map (merge s) rest)))))

(subsets (list 1 2 3))