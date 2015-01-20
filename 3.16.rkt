#lang racket
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define three
  (cons (cons 1 '()) (cons 2 '())))

(count-pairs three)

(define four
  (cons (list 1 2) (cdr (list 1 2))))

(count-pairs four)