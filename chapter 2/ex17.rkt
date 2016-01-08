#lang scheme
(define ints (list 23 72 149 34))
(define (last-pair items)
  (if (null? (cdr items))
      (cons (car items) '())
      (last-pair (cdr items))))
(last-pair ints)
