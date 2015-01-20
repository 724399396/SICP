#lang racket
(define (unique-pairs n)
  (accumulate
   append 
   `() 
   (map (lambda (x)
          (map (lambda (y) 
                 (list x y))
               (enumerate-interval 1 (- x 1))))
        (enumerate-interval 1 n))))
(define (unique-triples n)
  (accumulate 
   append 
   `() 
   (map (lambda (x)
          (map (lambda (y) 
                 (cons x y))
               (unique-pairs (- x 1))))
        (enumerate-interval 1 n))))


(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (filter produce sequence)
  (cond ((null? sequence) `())
        ((produce (car sequence))
         (cons (car sequence)
               (filter produce (cdr sequence))))
        (else (filter produce (cdr sequence)))))

(define (equals? y)
  (lambda (x) (= (+ (car x) (cadr x) (caddr x)) y)))

(define (enumerate-interval i j)
  (if (> i j)
      `()
      (cons i (enumerate-interval (+ i 1) j))))

(define (three-sum-equals n s)
  (filter (equals? s)
         (unique-triples n)))

(three-sum-equals 10 15)
