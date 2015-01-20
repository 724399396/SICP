#lang racket
(define (split op1 op2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((temp (op2 painter painter)))
          (op1 painter (op2 temp temp))))))