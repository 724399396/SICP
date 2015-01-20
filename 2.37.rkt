#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (car-n seqs)
  (map car seqs))

(define (cdr-n seqs)
  (map cdr seqs))

(define (matrix-*-vector m v)
  (map (lambda (col)
         (dot-product col v))
       m))

(define m (list (list 1 2 3 4)
                      (list 4 5 6 6)
                      (list 6 7 8 9)))

(define v (list 1 2 3 4))

(matrix-*-vector m v) 

(define (accumulate-n op init sequence)
  (if (null? sequence)
      `()
      (cons (accumulate op init (car-n sequence))
            (accumulate op init (cdr-n sequence)))))

(define (transpose mat)
  (accumulate-n cons `() mat))

(transpose m)