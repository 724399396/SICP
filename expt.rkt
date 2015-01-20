#lang racket
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(expt 2 8)

(define (expt2 b n)
  (expt2-iter b n 1))
(define (expt2-iter b counter product)
  (if (= counter 0)
      product
      (expt2-iter b (- counter 1) (* b product))))

(expt2 2 8)