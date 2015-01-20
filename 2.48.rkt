#lang racket
(define (make-vect x y)
  (list x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cadr v))

(define (make-segment v1 v2)
  (list v1 v2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cadr s))