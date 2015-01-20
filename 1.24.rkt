#lang racket
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
(define (square x)
  (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n time)
  (cond ((= time 0) true)
        ((fermat-test n) (fast-prime? n (- time 1)))
        (else false)))

(define (search-for-prime product lowbound)
  (if (and (fast-prime? product 2) (> product lowbound))
      true
      (search-for-prime (+ product 1) lowbound)))

(time (search-for-prime 2 10000))
(time (search-for-prime 2 100000))
(time (search-for-prime 2 1000000))
