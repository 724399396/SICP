#lang racket
(define (append! x y)
  (set-mcdr! (list-pair x) y)
  x)

(define (list-pair x)
  (if (null? (cdr x))
      x
      (list-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z
'(a b c d)

(cdr x)