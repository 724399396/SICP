#lang racket
(define (square-list items)
  (define (iter things answer)
    (newline) (newline)
    (display answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (list (square (car things)))))))
  (iter items `()))
(define (square x)
  (* x x))

(square-list (list 1 2 3 4))

(cons `() 1)