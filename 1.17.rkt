#lang racket
(define (fast* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (cond ((= b 0) 0)
        ((even? b) (fast* (double a) (halve b)))
        (else (+ a (fast* a (- b 1))))))

(fast* 55 21)