#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
       initial
       (op (car sequence)
           (accumulate op initial (car sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (+ x y)) `() sequence))

(define (append seq1 seq2)
  (accumulate list `() (cons seq1 seq2)))

(append (list 1 2) (list 3 4))