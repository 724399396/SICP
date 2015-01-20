#lang racket
(define (product n)
  (cond((= n 2) 2)
       ((= n 1) 1)
       (else (* n n (product (- n 2))))))

(define (f n)
  (/ (product n) (product (+ n 1))))

(f 100.0)

             