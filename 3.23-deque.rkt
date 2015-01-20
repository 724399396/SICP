#lang planet neil/sicp
(define make-deque
  (cons `() `()))
(define (front-deque deque) (car deque))
(define (rear-deque deque) (cdr deque))

(define (empty-deque? deque)
  (eq? (front-deque deque) (rear-deque deque)))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (if (empty-deque? deque)
        ((set-car! deque new-pair)
         (set-cdr! deque new-pair))
        ((set-car! (front-deque deque) item)
         deque))
(define (rear-insert-deque! deque item)
  (set-cdr! (rear-deque deque) item)
  deque)

(define (front-delete-deque! deque)
  (if (empty-deque? deque)
      (error "Deque is empty --FRONT-DELETE-DEQUE" deque)
      ((set-cdr! (front-deque deque) (cdr (front-deque deque)))
      deque)))
(define (rear-delete-deque! deque)
  (if (empty-deque? deque)
      (error "Deque is empty --REAR-DELETE-DEQUE" deque)
      ((set-cdr! (rear-deque deque) '())
      deque)))

(define q make-deque)

(front-insert-deque! q 2)
  
