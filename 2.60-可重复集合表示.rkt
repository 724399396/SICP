#lang racket
(define (element-of-set? element set)
  (cond ((null? set) false)
        ((and (not (pair? set)) (eq? element set)) true)
        (else (element-of-set? element (cdr set)))))

(define (adjoin element set)
  (cons element set))

(define (union-set set1 set2)
    (iter (append set1 set2) '()))

(define (iter input result)
    (if (null? input)
        (reverse result)
        (let ((current-element (car input))
              (remain-element (cdr input)))
            (if (element-of-set? current-element result)
                (iter remain-element result)
                (iter remain-element
                      (cons current-element result))))))

(define (intersection set1 another)
  (define (iter set result)
    (if (or (null? set) (null? result))
        (reverse result)
        (let ((current-element (car set))
              (remainder-element (cdr set)))
          (if (and (element-of-set? current-element another)
                   (not (element-of-set current-element result)))
              (iter remain-element
                    (cons current-element result))
              (iter remain-element result)))))
  (iter set '()))
