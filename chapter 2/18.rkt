#lang racket


(define (append lista listb)
  (if (null? lista) listb
      (cons (car lista) (append (cdr lista) listb))))


(define (reverse items)
  (if (null? items) items
      (append (reverse (cdr items)) (cons (car items) '()))))

(reverse (list 1 2 3 4 5))
  
