#lang racket
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs) 
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)   ; symbol
                               (cadr pair)) ; weight
                    (make-leaf-set (cdr pairs))))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((symbol-in-tree? symbol (left-branch tree))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((symbol-in-tree? symbol (right-branch tree))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else
         (error "This symbo not in tree --ENCODE-SYMBOL" symbol))))

(define (symbol-in-tree? given-symbol tree)
  (define (iter sym syms)
    (cond ((null? syms) false)
          ((eq? (car syms) sym) true)
          (else (iter sym (cdr syms)))))
  (let ((syms (symbols tree)))
    (iter given-symbol syms)))
                                           
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-set)
    (cond ((= 0 (length ordered-set))
            '())
          ((= 1 (length ordered-set))
            (car ordered-set))
          (else
            (let ((new-sub-tree (make-code-tree (car ordered-set)
                                                (cadr ordered-set)))
                  (remained-ordered-set (cddr ordered-set)))
                (successive-merge (adjoin-set new-sub-tree remained-ordered-set))))))

(encode '(GET A JOB) (generate-huffman-tree '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1))))
        