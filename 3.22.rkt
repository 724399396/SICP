#lang planet neil/sicp
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?)
      (null? front-ptr))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)
               front-ptr)
              (else
               (set-cdr! rear-ptr item)
               (set! rear-ptr new-pair)
               front-ptr))))
    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue"))
            (else
             (set! front-ptr (cdr front-ptr))
             front-ptr)))
    (define (dispatch input)
      (cond ((eq? input 'insert-queue!)
             insert-queue!)
            ((eq? input 'delete-queue!)
             (delete-queue!))
            ((eq? 'empty-queue?
                  empty-queue?))
             (else
              (error "Unknow operation -- DISPATCH" input))))
    dispatch))

(define q (make-queue))

((q 'insert-queue!) 'a)

((q 'insert-queue!) 'b)

(q 'delete-queue!)
               
    