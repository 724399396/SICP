#lang racket
(define (make-segment x y)
  (cons x y))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))
(define (x-point po)
  (car po))
(define (y-point po)
  (cdr po))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point (/ (+ (car (car s)) (car (cdr s))) 2)
              (/ (+ (cdr (car s)) (cdr (cdr s))) 2)))

(print-point (midpoint-segment
              (make-segment
               (make-point 2 5)
               (make-point 8 15))))