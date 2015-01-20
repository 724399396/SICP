#lang racket
(define x '((a b) c d))
(define y '(e f))


x

(set-mcar! x y)

x