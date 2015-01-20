#lang racket
(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? 'real-part op)
           (* r (cos a)))
          ((eq? 'imag-part op)
           (* r (sin a)))
          ((eq? 'magnitude op) r)
          ((eq? 'angle op) a)
          (else
           (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define c (make-from-mag-ang 3 4))

(c 'real-part)