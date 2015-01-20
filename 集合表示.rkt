#lang racket
(define (equals? set1 set2)
  (cond ((and (null? set1) (null? set2)) true)
        ((or (not (pair? set1)) (not (pair? set2))) (eq? set1 set2))
        (else (equals? (cdr set1) (cdr set2)))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equals? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set) 
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (define (help input result)
    (if (null? input)
        (reverse result)
        (let ((current-element (car input))
              (remainder-element (cdr input)))
          (if (element-of-set? current-element result)
              (help remainder-element result)
              (help remainder-element
                    (cons current-element result))))))
  (help (append set1 set2) '()))

(union-set '(1 2 3) '(3 4 5 6))

(intersection-set '(1 2 3) '(3 4 5 6))