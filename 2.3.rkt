#lang racket
(define (make-segment x y)
  (cons x y))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))
(define (x-point po)
  (car po))
(define (y-point po)
  (cdr po))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-rectangle l w)
  (cons l w))
(define (length s)
  (sqrt (+ (square (abs (- (car (car s)) (car (cdr s)))))
     (square (abs (- (cdr (car s)) (cdr (cdr s))))))))
(define (perimeter r)
  (+ (* 2 (length (car r))) (* 2 (length (cdr r)))))
(define (area r)
  (* (length (car r)) (length (cdr r))))

(define (square x)
  (* x x))

(define test-rectangle
  (make-rectangle
   (make-segment (make-point 0 0) (make-point 5 0))
   (make-segment (make-point 5 0) (make-point 5 15))))

(perimeter test-rectangle)
(area test-rectangle)