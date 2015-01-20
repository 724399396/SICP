#lang racket
(define (for-each produce items)
  (produce (car items))
  (if (= (length items) 1)
      (newline)
      (for-each produce (cdr items))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

