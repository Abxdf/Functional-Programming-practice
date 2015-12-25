#lang racket

(define (make-rat n d)
  (cond ((and (< n 0) ( < d 0) ) (cons (abs n) (abs d)))
        ((or (< n 0) ( < d 0) ) (cons (-(abs n)) (abs d)))
        (else (cons n d))
      ))
(define (numer z) (car z)); z is a pair make-rat object (cons)
(define (deter z) (cdr z))

(define z (make-rat 2 3))
(numer z)
(deter z)