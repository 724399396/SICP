#lang racket
(define (sum term a next b)
  (define (iter a result) 
    (if (> a b)
        result
        (iter (next a) (term a result))))
  (iter a 0))

(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(define (cube a result)
  (+ result (* a a a)))
(sum-cubes 1 10)

(define (sum-term a b)
  (+ a b))
(define (sum-next a)
  (+ a 1))
(sum sum-term 1 sum-next 10)