;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (sum-of-big2 x y z)
  (cond ((and (>= x z) (>= y z)) (+ x y))
        ((and (>= x y) (>= z y)) (+ x z))
        ((and (>= y x) (>= z x)) (+ y z))))
(sum-of-big2 5 1 2)