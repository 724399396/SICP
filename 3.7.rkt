#lang racket
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        (display "Insufficient funds")))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (password-match? given-password)
    (eq? given-password password))
  (define (wrong-password-message useless-arg)
    "Incorrect password")
  (define (dispatch given-password mode)
    (if (not (password-match? given-password))
        wrong-password-message
        (cond ((eq? mode 'withdraw) withdraw)
              ((eq? mode 'deposit) deposit)
              (else (error "No match mode --DISPATCH" mode)))))
  dispatch)

(define (makejoin origin-acc origin-password another-password)
  (lambda (given-password mode)
    (if (eq? given-password another-password)
        (origin-acc origin-password mode)
        display-wrong-another-password-message)))

(define (display-wrong-another-password-message useless-arg)
    (display "Incorrect another password"))