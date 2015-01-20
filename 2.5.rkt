#lang racket
(define (power a b)
  (if (= b 0)
      1
      (* a (power a (- b 1))))) 
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) (power 2 x))
          ((= m 1) (power 3 y))
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)
(define (car z)
  (z 0))
(define (cdr z)
  (z 1))

(car (cons 5 6))
(cdr (cons 5 6))
    