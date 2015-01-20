#lang racket
(define (up-split paintter n)
  (let ((smaller (up-split painter (- n 1))))
    (below painter (besize smaller smaller))))