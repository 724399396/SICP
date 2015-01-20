#lang planet neil/sicp
(define (equals? items1 items2)
  (cond ((and (null? items1) (null? items2)) true)
        ((or (not (pair? items1)) (not (pair? items2))) (eq? items1 items2))
        (else (equals? (cdr items1) (cdr items2)))))

(define (assoc key records)
  (cond ((null? records) false)
        ((equals? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (lookup key-1 key-2 table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record
              (cdr record)
              false))
        false)))

(define (insert! key-1 key-2 value table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
           (if record
               (set-cdr! record value)
               (set-cdr! table
                         (cons (cons key-2 value)
                               (cdr subtable))))))
        (set-cdr! table
                  (cons (list key-1
                              (cons key-2 value))
                        (cdr table))))
  'ok)