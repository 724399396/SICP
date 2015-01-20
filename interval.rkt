#lang racket
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (if (< y 0)
                    (error "Cross between0")
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (let ((p1 (- (lower-bound x) (upper-bound y)))
        (p2 (- (lower-bound y) (upper-bound x))))
        (make-interval (min p1 p2)
                       (+ (upper-bound x) (upper-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (percent c p)))
    (make-interval (- c w) (+ c w))))
(define (percent c p)
  (* c p))

(make-center-percent 6.8 0.1)