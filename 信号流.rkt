#lang racket
(define (square x)
  (* x x))

(define (filter predicate sequence)
  (cond ((null? sequence) `())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))

(accumulate * 1 (list 1 2 3 4 5))

(accumulate cons `() (list 1 2 3 4 5))

(define (enumerate-interval low high)
  (if (> low high)
      `()
      (cons low (enumerate-interval (+ low 1) high))))

(enumerate-interval 2 7)

(define (enumerate-tree tree)
  (cond ((null? tree) `())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-tree (list (list 1 2) (list 3 4)))

(define (sum-odd-squares tree)
  (accumulate + 
             0 
             (map square 
                  (filter odd? 
                          (enumerate-tree tree)))))

(sum-odd-squares (list 2 5 8 6 5 4))

(define (fib x)
  (define (fib-iter a b n)
    (if (= n 0)
        b
        (fib-iter (+ a b) a (- n 1))))
  (fib-iter 1 0 x))
        
(define (even-fib n)
  (accumulate cons
              `()
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))

(even-fib 15)

(define (list-fib-square n)
  (accumulate cons
              `()
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))

(list-fib-square 10)

(define (product-of-squares-of-odd-elements sequence)
  (accumulate *
              1
              (map square
                   (filter odd? sequence))))

(product-of-squares-of-odd-elements (list 1 2 3 4 5))