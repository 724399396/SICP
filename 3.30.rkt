#lang racket
(define (ripple-cary-adder list-A list-B list-S C)
  (define (iter A B S value-of-c)
    (if (and (null? A) (null? B) (null? S))
        'ok
        (let ((Sk (car S))
              (Ak (car A))
              (Bk (car B))
              (remain-A (cdr A))
              (remain-B (cdr B))
              (remain-S (cdr S))
              (Ck (make-wire)))
          (set-signal! Ck value-of-c)
          (full-adder Ak Bk Ck Sk C)
          (iter remain-A remain-B remain-S (get-signal C)))))
  (iter list-A list-B list-S (get-signal C)))