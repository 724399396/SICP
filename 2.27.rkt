#lang racket
(define (reverse items)
  (reverse-iter items (- (length items) 1)))

(define (reverse-iter items pos)
  (if (= pos 0)
      (list (car items))
      (cons (list-ref items pos) (reverse-iter items (- pos 1)))))

(define (deep-reverse items)
  (deep-reverse-iter items (- (length items) 1)))

(define (deep-reverse-iter items pos)
 (if (= pos 0)
      (list (pre-process(car items)))
      (cons (pre-process (list-ref items pos)) 
            (pre-process (deep-reverse-iter items (- pos 1))))))

(define (pre-process x)
  (if (pair? x)
      (reverse x)
      x))

(define x (list (list 1 2) (list 3 4)))

x

(reverse x)

(deep-reverse x)