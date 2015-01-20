#lang racket
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (ref items nums)
  (if (= nums 0)
      (car items)
      (list-ref (cdr items) (- nums 1))))

(define (last-pair items)
  (list-ref items (- (length items) 1)))
 
(last-pair (list 23 72 149 34))