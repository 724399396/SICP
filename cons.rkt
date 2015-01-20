#lang racket
(define x (cons 1 2))
(car x)
(cdr x)

(define y (cons 3 4))
(define z (cons x y))
(car (car z))
(car (cdr z))