#lang racket
(define rand
  (let ((seed init))
    (lambda (input)
      (cond ((eq? input 'reset) 
             (lambda (new-value)
               (set! seed new-value)))
            ((eq? input 'generate)
             (set! seed (rand-update seed))
             seed)
            (else error "no this mode -- RAND" input)))))