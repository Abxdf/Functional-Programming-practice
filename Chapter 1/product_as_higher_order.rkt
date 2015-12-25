#lang racket
;recursive defination
#|
(define (product term a next b)
  (if (> a b) 1
      (* (term a) (product term (next a) next b))))|#
;iterative defination
(define (product term a next b)
  (define (loop a res)
    (if (> a b) res
        (loop (next a) (* res (term a)))))
  (loop a 1))

(define (identity a ) a)
(define (increment-2 a) (+ a 2))

(define (pi-4 n)
  (*
  (product (lambda (a) (/ a (+ a 1))) 2.0 (lambda (x) (+ x 2)) n)
  (product (lambda (a) (/ a (- a 1))) 4 (lambda (x) (+ x 2)) n)))

(pi-4 10000)


  
  