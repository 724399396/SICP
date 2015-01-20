#lang racket
(define (tree-map produce tree)
  (map (lambda (sub-tree) 
         (if (not (pair? sub-tree))
             (produce sub-tree)
             (tree-map produce sub-tree)))
       tree))
(define (square x)
  (* x x))
(define (square-tree tree)
  (tree-map square tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))