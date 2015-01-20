#lang planet neil/sicp
(define (inverter input output)
  (define (inverter-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inveter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-put)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))