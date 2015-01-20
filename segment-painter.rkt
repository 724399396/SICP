#lang racket
(define (for-each produce items)
  (produce (car items))
  (if (= (length items) 1)
      (newline)
      (for-each produce (cdr items))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
    segment-list)))