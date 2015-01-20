#lang racket
(define (make-vect x y)
  (list x y))
(define (xcor-vect v)
  (car v))
(define (ycor-vect v)
  (cadr v))

(define (add-vect v1 v2)
  (list (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))
(define (sub-vect v1 v2)
  (list (- (xcor-vect v1) (xcor-vect v2))
        (- (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect a v)
  (list (* a (xcor-vect v))
        (* a (ycor-vect v))))

(add-vect (make-vect 5 0) (make-vect 0 10))