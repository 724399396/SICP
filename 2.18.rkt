#lang racket
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (list-ref items nums)
  (if (= nums 0)
      (car items)
      (list-ref (cdr items) (- nums 1))))


(define (reverse items)
  (reverse-iter items (- (length items) 1)))

(define (reverse-iter items pos)
  (if (= pos 0)
      (list (car items))
      (cons (list-ref items pos) (reverse-iter items (- pos 1)))))
 
(reverse (list 1 4 9 16 25))