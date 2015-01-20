#lang planet neil/sicp
(define (equals? items1 items2)
  (cond ((and (null? items1) (null? items2)) true)
        ((or (not (pair? items1)) (not (pair? items2))) (eq? items1 items2))
        (else (equals? (cdr items1) (cdr items2)))))

(define (assoc key records judge?)
  (cond ((null? records) false)
        ((judge? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table) same-key?)))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable) same-key?)))
              (if record
                  (car record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table) same-key?)))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable) same-key?)))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable 
                            (cons (cons key-2 value) (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table equals?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))