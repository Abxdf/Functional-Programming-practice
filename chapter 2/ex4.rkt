#lang racket
;given
(define (cons x y)
(lambda (m) (m x y))) ; returns a procedure which is again a procedure which accepts two arguments
(define (car z)
(z (lambda (p q) p))) ; returns the first argument of the procedure
;cdr function
(define (cdr z)
  (z (lambda(p q) q))) ;returns the first argument of the procedure
(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))