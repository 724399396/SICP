#lang racket
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1)) 
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(define (g n)
  (g-iter 2 1 0 n n))
(define (g-iter a b c counter max-count)
  (cond ((< max-count 3) max-count)
        ((< counter 3) a)
        (else (g-iter (+ a (* 2 b) (* 3 c)) a b (- counter 1) max-count))))

(f 2)
(g 2)