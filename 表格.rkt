#lang planet neil/sicp
(define (equals? items1 items2)
  (cond ((and (null? items1) (null? items2)) true)
        ((or (not (pair? items1)) (not (pair? items2))) (eq? items1 items2))
        (else (equals? (cdr items1) (cdr items2)))))

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))

(define (assoc key records)
  (cond ((null? records) false)
        ((equals? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table 
                  (cons (cons key value) (cdr table)))))
  'ok)

(define (make-table)
  (list '*table*))