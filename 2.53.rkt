#lang racket
(define (memq item x)
  (cond ((null? x) false)
        ((eq? (car x) item) x)
        (else (memq item (cdr x)))))


(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2) (y1 y2)))
(cadr '((x1 x2) (y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (bluse socks)))
(memq 'red '(red shoes blue socks))