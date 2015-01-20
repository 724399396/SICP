#lang racket
(define (interal f a b n)
  (/(* (sum cube a next f1 b 0 n) (h a b n)) 3))

(define (sum term a next modules b m n)
  (if (> a b)
      0
      (+ (* (modules m n) (term a))
         (sum term (next a (h a b n)) next modules b (+ m 1) n))))

(define (next a h)
  (+ a (* 2 h)))

(define (h a b n)
  (/ (- 1 0) n))

(define (f1 m n)
  (cond ((or (= m 0) (= m n)) 1)
        ((even? n) 2)
        (else 4)))
(define (cube x)
  (* x x x))

(interal cube 0 1 1000)
      