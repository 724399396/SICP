#lang racket
(define (count-pairs x)
  (length (inner x '())))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(define (inner x memo-list)
  (if (and (pair? x)
           (false? (memq x memo-list)))
      (inner (car x)
             (inner (cdr x)
                    (cons x memo-list)))
      memo-list))

(count-pairs (cons (cons 1 2) (cons 3 4)))

(define four
  (cons (list 1 2) (cdr (list 1 2))))

(count-pairs four)