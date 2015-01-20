#lang racket
(define (fringe tree)
  (cond ((null? tree)
        `())
       ((not (pair? tree))
        (list tree))
       (else
        (append (fringe (car tree))
                (fringe (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate (lambda (current-leave remaind-leave-count)
                (+ 1 remaind-leave-count))
              0
              (fringe tree)))

(define (count-leaves2 tree)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree)
                         (count-leaves2 sub-tree)
                         1))
                   tree)))

(count-leaves (list (list 1 2) (list 3 4)))

(count-leaves (list (list 1 2) (list 3 4)))