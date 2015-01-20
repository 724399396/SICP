#lang racket
(define (same-pority x . y)
  (same-pority-help x y))
(define (same-pority-help x y)
  (if (= (length y) 0)
      (list)
      (let ((value (car y)))
        (if (or (and (even? x) (even? value))
                (and (not (even? x)) (not (even? value))))
            (cons value (same-pority-help x (cdr y)))
            (same-pority-help x (cdr y))))))

(same-pority 2 3 4 5 6 7)
(same-pority 1 2 3 4 5 6 7)