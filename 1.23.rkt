#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next test-divisor)
  (cond ((= test-divisor 2) 3)
        (else (+ test-divisor 2))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))

(define (search-for-prime product lowbound)
  (if (and (prime? product) (> product lowbound))
      true
      (search-for-prime (+ product 1) lowbound)))

(time (search-for-prime 1 10000))
(time (search-for-prime 1 100000))
(time (search-for-prime 1 1000000))
      