#lang racket
(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))
(define (flatmap proc seq)
  (accumulate append `() (map proc seq)))


(define (filter produce sequence)
  (cond ((null? sequence) `())
        ((produce (car sequence))
         (cons (car sequence)
               (filter produce (cdr sequence))))
        (else (filter produce (cdr sequence)))))

(define empty-board '())

(define (adjoin-postion new-row k rest-of-queens)
        (cons new-row rest-of-queens))

(define (safe? k position)
  (iter-check (car position)
              (cdr position)
              1))

(define (iter-check row-of-new-queen rest-of-queens i)
  (if (null? rest-of-queens) ; 下方所有皇后检查完毕，新皇后完全
      #t
      (let ((row-of-current-queen (car rest-of-queens)))
        (if (or (= row-of-new-queen row-of-current-queen) ;行碰撞
                (= row-of-new-queen (+ i row-of-current-queen)) ;右下方碰撞
                (= row-of-new-queen (- row-of-current-queen i))) ;左下方碰撞
            #f
            (iter-check row-of-new-queen
                        (cdr rest-of-queens)
                        (+ i 1))))))

(define (enumerate-interval n m)
  (if (> n m)
      '()
      (cons n (enumerate-interval (+ n 1) m))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (position) (safe? k position))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-postion new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 8)