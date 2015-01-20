#lang racket
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (car (cdr (cdr frame))))

(origin-frame (make-frame 1 2 3))
(edge1-frame (make-frame 1 2 3))
(edge2-frame (make-frame 1 2 3))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 frame)
  (car frame))
(define (edge1-frame2 frame)
  (cadr frame))
(define (edge2-frame2 frame)
  (cdr (cdr frame)))

(origin-frame2 (make-frame2 1 2 3))
(edge1-frame2 (make-frame2 1 2 3))
(edge2-frame2 (make-frame2 1 2 3))