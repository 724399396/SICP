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

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)

((acc 'some-other-password 'deposit) 50)