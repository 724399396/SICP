#lang racket
(define (equals? items1 items2)
  (cond ((and (null? items1) (null? items2)) true)
        ((or (not (pair? items1)) (not (pair? items2))) (eq? items1 items2))
        (else (equals? (cdr items1) (cdr items2)))))

(equals? '(this is a list) '(this is a list))

(equals? '(this is a list) '(this (is a) list))